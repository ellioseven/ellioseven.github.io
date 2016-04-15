---
layout: post
title: "Drupal 8 - Dialogs"
date: 2016-04-15
---
Drupal has bundled jQuery UI in core for a while, and implements dialogs for
multiple modules such as Views and Block UI. Using it in your own module is 
pretty simple.

## Routing

The first step is to create a route:

### my_module.routing.yml

{% highlight yaml %}
my_module.dialog_page:
  path: '/dialog'
  defaults:
    _title: 'Dialog Example'
    _controller: '\Drupal\my_module\Controller\DialogController::page'
  requirements:
    _permission: 'access content'
my_module.dialog_show:
  path: '/dialog/show'
  defaults:
    _title: Dialog
    _controller: '\Drupal\my_module\Controller\DialogController::show'
  requirements:
    _permission: 'access content'
{% endhighlight %}

This simply creates two routes `/dialog` and `/dialog/show`. They both use a
controller class, `DialogController`. Which is the second step:

### src/Controller/DialogController.php

{% highlight php %}
<?php

namespace Drupal\my_module\Controller;

use Drupal\Component\Serialization\Json;
use Drupal\Core\Controller\ControllerBase;
use Drupal\Core\Url;

class DialogController extends ControllerBase {

  public function page() {
    $build['dialog'] = [
      '#title' => $this->t('Show Dialog'),
      '#type' => 'link',
      '#attributes' => array(
        'class' => ['use-ajax'],
        'data-dialog-type' => 'modal',
        'data-dialog-options' => Json::encode([
          'width' => 700,
        ]),
      ),
      '#url' => Url::fromRoute('my_module.dialog_show')
    ];
    return $build;
  }

  public function show() {
    return array(
      '#type' => 'markup',
      '#markup' => t('Dialog content.')
    );
  }

}
{% endhighlight %}

The `page()` method simply returns a build array with a link to the `my_module.dialog_show`
route. The key here is to define an attributes array with a `use-ajax` class and
a `data-dialog-type` data attribute. You can also send options with the
`data-dialog-options` data attribute. For a list of options, see the 
[jQuery UI docs](http://api.jqueryui.com/dialog/).

The `show()` method returns a markup build array, but can be replaced with a
variety of different things to suit your needs.
