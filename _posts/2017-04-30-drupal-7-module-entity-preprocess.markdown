---
layout: post
title: "Drupal 7 - Entity Preprocess from a Module"
date: 2017-04-30
---
I recently ran into an issue where I needed to preprocess an entity
from my module. In my particular scenario, I didn't want to depend on
a theme to implement functionality.

Unfortunately a `hook_preprocess_my_entity` doesn't exist, so we have
to make one. However, we can do that with `hook_preprocess`.

```
/**
 * Implements hook_preprocess().
 *
 * @param $variables
 * @param $hook
 */
function my_module_preprocess(&$variables, $hook) {
  if (isset($variables['elements']['#entity_type'])) {
    // Invokes my_module_preprocess_ENTITY_TYPE().
    $function = __FUNCTION__ . '_' . $variables['elements']['#entity_type'];
    if (function_exists($function)) {
      $function($variables, $hook);
    }
  }
}

/**
 * Entity preprocess callback.
 *
 * @param $variables
 */
function my_module_preprocess_my_entity(&$variables) {}
```

The above code simply registers a `my_module_preprocess_ENTITY_TYPE()`
callback, allowing you to preprocess different entity types. We have
ao registered `my_module_preprocess_my_entity`, which allows us to
preprocess the `my_entity` entity type.
