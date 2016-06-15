---
layout: post
title: "Drupal 8 - Remove Libraries via Theme"
date: 2016-06-15
---
Extending Drupal 8's 'Classy' theme is a great way to bootstrap your theme. However, specifying a parent theme in your `theme.info.yml` will also include its libraries.

An easy way to remove included libraries from your child theme is to use `libraries-override`, like so:

{% highlight yaml %}
# theme.info.yml
# ...
libraries-override:
  classy/base: false
{% endhighlight %} 

This will stop the `classy.base` library from being included in your theme. 

You can also override a library, changing which resources gets loaded:

{% highlight yaml %}
# theme.info.yml
# ...
libraries-override:
  classy/base: my_theme/base
  classy/dialog:
    css:
      component:
        css/components/dialog.css: css/dialog.css
{% endhighlight %}

This will replace the `classy.base` library with `my_theme.base` library, and replace `dialog.css` from the `classy/dialog` library with your own `dialog.css` file.

## Further Reading

- [Libraries can now be overridden and extended by themes - Drupal.org](https://www.drupal.org/node/2497313)
