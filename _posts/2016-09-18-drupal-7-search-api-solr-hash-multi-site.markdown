---
layout: post
title: "Drupal 7 - Search API Solr - The Hash & Multi-site"
date: 2016-09-18
---
When creating new multi-site instances on an existing code base, the
usual approach is to clone an already existing instance (including 
the database). I recently ran into an issue where I had created a new
instance with the above approach, however I was using the [`search_api_solr`](https://www.drupal.org/project/search_api_solr)
module to implement [Apache Solr](https://lucene.apache.org/solr/). 

## The Issues

A few baffling (at the time) symptoms included:

* Wrong item count on views
* Wrong item count on pagers
* Indexed content from the 'Other Multi-site Instance' displayed

## The Discovery

After a few hours of crawling through issues and attempted Googling, I
was completely stumped. I had no idea why this was happening. It wasn't
until a colleague asked:

> How does the Search API module separate indexed content from each
> multi-site instance?

We knew that they were separated by a hash by reading issue queues,
however we didn't know <strong>how they were hashed</strong>.

Sure enough, we found a clue in the `README`:

```
search_api_solr_site_hash (default: random)
A unique hash specific to the local site, created the first time it is needed.
Only change this if you want to display another server's results and you know
what you are doing. Old indexed items will be lost when the hash is changed
and all items will have to be reindexed. Can only contain alphanumeric
characters.
```

Which led me to find the following code:

{% highlight php %}
<?php

/**
 * Returns a unique hash for the current site.
 *
 * This is used to identify Solr documents from different sites within a single
 * Solr server.
 *
 * @return string
 *   A unique site hash, containing only alphanumeric characters.
 */
function search_api_solr_site_hash() {
  // Copied from apachesolr_site_hash().
  if (!($hash = variable_get('search_api_solr_site_hash', FALSE))) {
    global $base_url;
    $hash = substr(base_convert(sha1(uniqid($base_url, TRUE)), 16, 36), 0, 6);
    variable_set('search_api_solr_site_hash', $hash);
  }
  return $hash;
}
{% endhighlight %}

This meant that when the multi-site's database was cloned, the
`search_api_solr_site_hash` variable was cloned with it. The problem was
that when a new site is created, the hash is not recreated, the same one
was used. So now both multi-site instances shared the same index.

## The Fix

The fix was fairly simple, we just needed to recreate the hash. This
was implemented by a [`drush`](http://www.drush.org/en/master/) command:

{% highlight php %}
<?php

/**
 * Implements hook_drush_command().
 */
function my_module_drush_command() {
  if (function_exists('search_api_solr_site_hash')) {
    $items['my-module-search-api-solr-hash-reset'] = array(
      'description' => t('Reset the Search API\'s Apache Solr hash.')
    );
  }
  return $items;
}

/**
 * Callback for 'my-module-search-api-solr-hash-reset' command.
 */
function drush_my_module_search_api_solr_hash_reset() {
  drupal_set_message(t('Resetting Search API\'s Apache Solr hash'));
  drupal_set_message(t('Old indexed items will be lost and all items for `!site` will have to be reindexed.',
    array('!site' => conf_path()))
  );
  // Clear the old hash.
  variable_set('search_api_solr_site_hash', FALSE);
  // Set the new hash.
  $hash = search_api_solr_site_hash();
  drupal_set_message(t('Hash set to \'!hash\'', array('!hash' => $hash)));
}
{% endhighlight %}

The only thing left to do was run the command on the new multi-site
instance:

{% highlight shell %}
drush my-module-search-api-solr-hash-reset
{% endhighlight %}

## What Did I Learn

* You shouldn't assume that things are done 'magically', in this instance
I assumed the `search_api` module 'magically' could tell the different
between two sites
* [RTFD](http://www.urbandictionary.com/define.php?term=rtfd&defid=2281638) -
I could have just read the modules `README` and saved myself hours of
pain instead of crawling through issues queues
* Next time, let's try that [rubber duck debugging](https://en.wikipedia.org/wiki/Rubber_duck_debugging)
method every one keeps talking about.
