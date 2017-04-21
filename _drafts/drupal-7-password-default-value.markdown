---
layout: post
title: "Drupal 7 - Password Default Value"
---
Using the Drupal Form API, you might decide to use the 'password' form
item. Sooner or later, you might also find that the original form value
will be removed.

After a form submit, the password default value is null. If no value
was specified, then your previous value will be removed.

I stumbled upon a great solution at. [StackExchange](https://drupal.stackexchange.com/questions/38770/giving-a-default-value-to-a-password-element-in-d7-form-api).
To prevent the default value being overridden, we need to check for a
null value and an existing value:

{% highlight php %}
<?php

**
 * Build form.
 *
 * @param $form
 * @param $form_state
 */
function my_module_form(&$form, &$form_state) {
  $password = variable_get('my_password');
  $form_item['my_password'] = array(
    '#type' => 'password',
    '#title' => t('My Password Field'),
    '#description' => t('Secret password. Will appear blank.'),
    '#default_value' => $password ? $password : ''
  );

  // Add 'my_module_form_submit' form submit callback.
  $form['#submit'] = array_merge(
    array('my_module_form_submit'),
    (array) $form['#submit']
  );
}

/**
 * Form submit callback.
 *
 * @param $form
 * @param $form_state
 */
function my_module_form_submit($form, &$form_state) {
  // Get original password value.
  $password = variable_get('my_password');

  // Has original password value but no new password value.
  if ($password && !$form_state['values']['my_password']) {
    // Set password value to form state.
    $form_state['values']['my_password'] = $password;
  }
}
{% endhighlight %}

@todo Explanation
