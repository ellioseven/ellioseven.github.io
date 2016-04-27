---
layout: post
title: "Drupal 7 - Preprocess Display Suite Layouts"
date: 2016-03-31
---
## Note

I have covered a more verbose way of manipulating display suite layouts with
hooks. [View the post]({% post_url 2016-04-27-drupal-7-better-display-suite-layout-hooks %})

---

I use the [Display Suite](https://www.drupal.org/project/ds) module to render
content for most of my Drupal builds. Sometimes I get into a situation where
I need to hide certain fields from a Display Suite layout. 

{% highlight php %}
<?php

/**
 * Implements hook_ds_pre_render_alter().
 *
 * @param $layout_render_array
 *   The render array
 * @param $context
 *   An array with the context that is being rendered. Available keys are
 *   - entity
 *   - entity_type
 *   - bundle
 *   - view_mode
 * @param array $vars
 *   All variables available for render. You can use this to add css classes.
 */
function my_theme_ds_pre_render_alter(&$layout_render_array, $context, &$vars) {
  
  // Check node type.
  if ('my_content_type' == $context['bundle'] && 'node' == $context['entity_type'])  {
    // Check for field.
    if (!isset($vars['field_my_field'][0]) || !$vars['field_my_field'][0]['value']) {
      // Loop through DS layouts to find field.
      foreach ($layout_render_array as $region_key => $region_values) {
        foreach ($region_values as $item_key => $item_value) {
          // Unset field if found.
          if (isset($item_value['#field_name']) && 'field_my_field' == $item_value['#field_name']) {
            unset($layout_render_array[$region_key][$item_key]);
          }
        }
      }
    }
    
  }

{% endhighlight %}

In this example, the code will simply hook into `hook_ds_pre_render_alter()` and
unset the 'field_my_field' from any region in a 'my_content_type' node.