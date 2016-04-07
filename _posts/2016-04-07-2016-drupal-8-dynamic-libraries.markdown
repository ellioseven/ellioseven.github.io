---
layout: post
title: "Drupal 8 - Dynamic Libraries"
date: 2016-04-07
---
I found it a little tricky to register dynamic libraries for my Drupal 8 module, and the API documentation didn't seem very clear. After struggling for a few hours, I came up with this:

{% highlight php %}
<?php

/**
 * Implements hook_library_info_build().a
 * 
 * @return array
 */
function my_module_library_info_build() {
  $libraries = [];
  // Declare empty library.
  $libraries['my_library/my-component'] = [
    'css' => []
  ];
  return $libraries;
}

/**
 * Implements hook_library_info_alter().
 * 
 * @param $libraries
 * @param $extension
 */
function my_module_library_info_alter(&$libraries, $extension) {
  // Register library paths.
  if ('my_library' == $extension) {
    // Path is relative to Drupal root if begins with '/'.
    // Otherwise relative from module/theme root.
    $libraries['my-component'] = [
      'css' => [
        'base' => '/path/to/css',
      ]
    ];
  }
}

/**
 * Implements hook_page_attachments().
 * 
 * @param array $attachments
 */
function my_module_page_attachments(array &$attachments){
  // Attach library to page.
  $attachments['#attached']['library'][] = 'my_module/my-component';
}
{% endhighlight %}

I found that declaring libraries via `hook_library_info_build()` and specifying the asset paths via `hook_library_info_alter()` was the way to go.

By using `hook_page_attachments()`, the library will be used for each page. However you should [take a look at the docs](https://www.drupal.org/developing/api/8/assets) if you are looking at attaching libraries for specific context.