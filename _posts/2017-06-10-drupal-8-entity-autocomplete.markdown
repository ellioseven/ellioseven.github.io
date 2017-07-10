---
layout: post
title: "Drupal 8 - Entity Autocomplete"
date: 2017-06-10
---
Drupal 8 has included an Entity Autocomplete element, which can be extremely
useful when referencing entities within a form.

## Render Array

The basic render array syntax is as follows:

{% highlight php %}
<?php

$form['my_entity_autocomplete'] = array(
  '#type' => 'entity_autocomplete',
  '#target_type' => 'node'
);
{% endhighlight %}

This will simply display a text field which will autocomplete after a certain
amount of characters are entered.

## Targeting Entities

You can target different entities with `#target_type`, like so:

{% highlight php %}
<?php

$entity = 'node';

$form['my_entity_autocomplete'] = array(
  '#type' => 'entity_autocomplete',
  '#target_type' => $entity
);
{% endhighlight %}

## Targeting Bundles

You can target different bundles with `target_bundles`, like so:

{% highlight php %}
<?php

$entity = 'node';
$bundles = ['page'];

$form['my_entity_autocomplete'] = array(
  '#type' => 'entity_autocomplete',
  '#target_type' => $entity,
  '#selection_settings' => [
    'target_bundles' => $bundles
  ]
);
{% endhighlight %}

## Default Values

To display the default value, you will need to assign the loaded entity:

{% highlight php %}
<?php

$nid = $config->get('my_entity_autocomplete');
$node = \Drupal\node\Entity\Node::load($nid);

$form['my_entity_autocomplete'] = array(
  '#type' => 'entity_autocomplete',
  '#target_type' => 'node',
  '#default_value' => $node
);
{% endhighlight %}

## Further Reading

You can find more information on Drupal.org.

* [New 'entity_autocomplete' form element added - Drupal.org](https://www.drupal.org/node/2418529)
* [class EntityAutocomplete - Drupal.org](https://api.drupal.org/api/drupal/core%21lib%21Drupal%21Core%21Entity%21Element%21EntityAutocomplete.php/class/EntityAutocomplete/8.3.x)
