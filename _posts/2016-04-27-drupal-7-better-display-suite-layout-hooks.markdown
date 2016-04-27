---
layout: post
title: "Drupal 7 - Better Display Suite Layout with Alter Hooks"
date: 2016-04-26
---
I admit, using `hook_ds_pre_render_alter()` to alter [Display Suite](https://www.drupal.org/project/ds) layouts can be
a little bit tricky to work with. A much easier way to alter them is to register
your own alter hook. 

## Registering the Drupal Alter Hook

The idea for this solution is to register an alter hook with [`drupal_alter()`](https://api.drupal.org/api/drupal/includes!module.inc/function/drupal_alter/7.x)
so other modules can alter the render array by entity.

### my_module.module

{% highlight php %}
<?php

/**
 * Extends hook_ds_pre_render_alter().
 *
 * Creates the ability to alter items in the DS layout render array by entity.
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
function my_module_ds_pre_render_alter(&$layout_render_array, $context, &$vars) {
  foreach ($layout_render_array as $region_key => &$region) {
    foreach ($region as $layout_render_item_key => &$layout_render_item) {
      $hook = 'ds_pre_render_' . $context['entity_type'];
      drupal_alter(
        $hook,
        $layout_render_item,
        $region_key,
        $context,
        $vars
      );
    }
  }
}
{% endhighlight %}

This is going to loop through all the items in each region that belong to the
layout. The item is then passed to an alter hook. The alter hook will depend on
the layout's entity. For example, a layout that belongs to a `node` would be 
called by `hook_ds_pre_render_node_alter()`, and you would use `my_module_ds_pre_render_node_alter()`
to alter that items render array.

With each item the hook will be called with the `$layout_render_item`
(which is the render array), `$region_key`, `$context`, and `$vars` parameters. 
The `$layout_render_item` argument is important, as this is the render array you
should alter to manipulate the layout output. You can change the hook however to
pass in any arguments you do or don't need.

## Using the Drupal Alter Hook

Here is an example of how you would use the hook. This example will check for
the title of a blog post and change it.

### my_theme.template.php

{% highlight php %}
<?php

/**
 * Implements hook_ds_pre_render_node_alter().
 *
 * @param $layout_render_item
 * @param $region_key
 * @param $context
 * @param $vars
 */
function my_module_ds_pre_render_node_alter(&$layout_render_item, $region_key, $context, &$vars) {
  if ('blog_post' == $context['bundle']) {
    if (isset($layout_render_item['#field_name']) && 'title' == $layout_render_item['#field_name']) {
      $layout_render_item[0]['#markup'] = t('My New Title');
    }
  }
}
{% endhighlight %}

Obviously this example may not be a very idealistic use case, but it's simple
enough for you to get the idea of what it does.