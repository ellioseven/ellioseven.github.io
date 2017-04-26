---
layout: post
title: "Drupal 7 - Entity Preprocess from a Module"
---
https://drupal.stackexchange.com/questions/64751/how-to-define-entity-preprocess-function
```
/**
 * Implements hook_preprocess().
 *
 * @param $variables
 * @param $hook
 */
function my_module_preprocess(&$variables, $hook) {
  if (isset($variables['elements']['#entity_type'])) {
    // Invokes my_module_preprocess_ENTITY
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
function my_module_preprocess_donation_form(&$variables) {}
```
