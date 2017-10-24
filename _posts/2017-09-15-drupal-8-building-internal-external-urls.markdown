---
layout: post
title: "Drupal 8 - Building Internal & External URLs"
date: 2017-09-15
---
I recently ran into an issue where I needed to build a URL from user input.
The problem is that the input could refer to either an internation URL (eg:
`node/94`) or an external URL (eg: `https://example.com`).

## The URL Object

The `\Drupal\Core\Url` object will do most of the heavy lifting for us, we just
need to provide the correct URI.

To do that, we need to detect if the link is internal or external.

This is pretty simple:

{% highlight php %}
$uri = "/node/94";
$uri_parts = parse_url($uri);
// Check if URI has a scheme. If not, we set it to internal.
if (empty($uri_parts['scheme'])) {
  $uri = "internal:" . $uri;
}
{% endhighlight %}

If `$uri` doesn't have an exisiting scheme (http, etc.), we can assume it's
internal. We prepend $uri with `"internal:"`.

We can now pass `$uri` to the `\Drupal\Core\Url` object:

{% highlight php %}
// Build URL object.
$url = Url::fromUri($uri);
{% endhighlight %}
