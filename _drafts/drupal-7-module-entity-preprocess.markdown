---
layout: post
title: "Drupal 7 - Entity Preprocess from a Module"
---
```
function my_module_preprocess(&$variables, $hook) {
  if (isset($variables['elements']['#entity_type'])) {
    // Implements my_module_preprocess_ENTITY
    $function = __FUNCTION__ . '_' . $variables['elements']['#entity_type'];
    if (function_exists($function)) {
      $function($variables, $hook);
    }
  }
}

function my_module_preprocess_entity(&$variables) {}
```
