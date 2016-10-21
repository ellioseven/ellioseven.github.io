---
layout: post
title: "Drupal 7 - The Psuedo Field"
date: 2016-10-18
---
Psuedo fields are a great way to display dynamic content to fieldable
entities. The idea is simple, register the field with `hook_field_extra_fields()`
and build the field display with `hook_entity_view()`.

## Register the Field

This will simply register a pseudo field called `example_field` that will
 only be applicable for pages. Simple stuff.
 
{% highlight php %}
<?php

/**
 * Implements hook_field_extra_fields().
 *
 * @return mixed
 */
function my_module_field_extra_fields() {
  $extra['node']['page'] = array(
    'display' => array(
      'example_field' => array(
        'label' => t('Example field'),
        'description' => t('Display Example Field.'),
        'weight' => 0,
      ),
    )
  );
  return $extra;
}
{% endhighlight %}

## Build the Field Display

You will need to hook into `hook_entity_view()` to build the field
display. Here is a contrived 'Hello World' example:

{% highlight php %}
<?php

/**
 * Implements hook_entity_view().
 *
 * @param $entity
 * @param $type
 * @param $view_mode
 * @param $langcode
 */
function my_module_entity_view($entity, $type, $view_mode, $langcode) {
  if ('node' == $type) {
    // Load extra fields from entity.
    $extra_fields = field_info_extra_fields($type, $entity->bundle, 'display');
    switch ($entity->bundle) {
      case 'page':
        $field = 'example_field';
        // Check if field exists against entity.
        if (isset($extra_fields[$field])
              && isset($extra_fields[$field]['visible'])
              && $extra_fields[$field]['visible']) {
          // Build the field display and add to entity.
          $entity->content[$field] = _my_module_field_view_example_field(
            $entity,
            $type,
            $view_mode,
            $langcode
          );
          break;
        }
    }
  }
}
{% endhighlight %}

## Field Display Callback

Personally, I like to create a separate function to handle the field
display responsibility:

{% highlight php %}
<?php

/**
 * Render 'example_field' psuedo field.
 *
 * @param $field
 * @param $entity
 * @param $type
 * @param $view_mode
 * @param $langcode
 * @return array|string
 */
function _my_module_field_view_example_field($field, $entity, $type, $view_mode, $langcode) {
  $output['#markup'] = t('Hello World!');
  return $output;
}
{% endhighlight %}

## Caveats

I am still trying to find a graceful way to add configurable settings
for pseudo fields (manage display). This is a bit of draw back because
you may want to contextually alter a field's configuration without hard
coding values.

## Further Reading

* [Drupal.org - hook_field_extra_fields](https://api.drupal.org/api/drupal/modules!field!field.api.php/function/hook_field_extra_fields/7.x)
