---
layout: post
title: "Drupal 7 - Password Default Value"
date: 2017-04-30
---
Using the Drupal Form API, you might decide to use the 'password' form
item. Sooner or later, you might also find that the default value
eventually get's deleted.

After a form submit, any previously existing value will not be passed
into the form state values. So if you leave the form item blank, your
previously existing value will be deleted.

I stumbled upon a great solution on [StackExchange](https://drupal.stackexchange.com/questions/38770/giving-a-default-value-to-a-password-element-in-d7-form-api).
To prevent a previously existing value from being deleted, we check for
a blank form item.

{% highlight php %}
<?php

/**
 * Build form.
 *
 * @param $form
 * @param $form_state
 */
function my_module_form(&$form, &$form_state) {
  $password = variable_get('my_module_password');
  $form_item['my_module_password'] = array(
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
  $password = variable_get('my_module_password');

  // Has previously existing value and form item is blank.
  if ($password && !$form_state['values']['my_module_password']) {
    // Set password value to form state.
    $form_state['values']['my_module_password'] = $password;
  }
}
{% endhighlight %}
