---
layout: post
title: "Drupal 8 - Controller Dependency Injection"
date: 2016-03-15
---
Drupal controllers can implement services via dependency injection. This is the preferred way to use the service 
container in controllers. The key is the `create()` method in the controller class, rather than directly using 
`\Drupal::service()`.

Here is a brief example of a controller class:

{% highlight php %}
<?php

/**
 * @file
 */

namespace Drupal\my_module\Controller;

use Drupal\Core\Controller\ControllerBase;
use Drupal\my_module\MyService;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Controller.
 */
class MyModuleController extends ControllerBase {

  /**
   * The injected service.
   */
  protected $myService;

  /**
   * Constructor.
   * 
   * @see create().
   */
  public function __construct(MyService $my_service) {
    // Set $myService property from injected service.
    $this->myService = $my_service;
  }

  /**
   * Route output.
   */
  public function my_page() {
    // Example of service usage.
    $my_service_method = $this->myService->my_method();
  }

  /**
   * Implement `create` method.
   */
  public static function create(ContainerInterface $container) {
    // Return a new instance of our controller.
    return new static($container->get('my.service'));
  }

}
{% endhighlight %}

The `create()` method is inherited from the extended `ControllerBase` class. It changes the way that the controller class is instantiated, allowing you to pass parameters to the `__construct()` method.

The `return new static()` line of the `create()` method simply returns a new instance of the class it belongs to.

## Useful Reading

* [Drupal 8 Dependency Injection - Aquia](https://docs.acquia.com/articles/drupal-8-dependency-injection-and-controllers)
* [PluginTypeExampleController - Drupal 8 Examples](https://api.drupal.org/api/examples/plugin_type_example%21src%21Controller%21PluginTypeExampleController.php/8)

