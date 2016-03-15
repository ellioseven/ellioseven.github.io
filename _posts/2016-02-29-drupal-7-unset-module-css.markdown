---
layout: post
title: "Drupal 7 - Unset Module CSS"
date: 2016-02-29
---
Drupal 7 modules can hook their own stylesheets into the DOM, which can be really frustrating for themers. Instead of applying more reset CSS, just unhook the stylesheets.

{% highlight php %}
<?php

/**
 * Implements hook_css_alter().
 *
 * @param $css
 */
function hook_css_alter(&$css) {

  // Build array of css to unset.
  $unset = array(
    'module' => array(
      'views' => array('css/views.css')
    )
  );

  // Loop through module css unset.
  foreach ($unset['module'] as $module => $module_paths) {
    // Get module path.
    $path = drupal_get_path('module', $module);
    // Loop through module css.
    foreach($module_paths as $module_path) {
      if (isset($css[$path . '/' . $module_path])) {
        unset($css[$path . '/' . $module_path]);
      }
    }
  }

}
{% endhighlight %}

## Usage

Add the module name to the `$unset` array as an arrey key, followed by the css paths you would like to unhook.