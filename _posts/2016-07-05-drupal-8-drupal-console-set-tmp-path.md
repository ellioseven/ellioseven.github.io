---
layout: post
title: "Drupal 8 - Drupal Console - Setting Temporary Path"
date: 2016-07-05
---
Sometimes you might install a brand new Drupal 8 instance, only to find that everything looks completely broken. 

A common problem is an incorrectly set temporary path. 

You can head to ``my-site.dev/admin/config/media/file-system`` and change the value from there. But that's no fun...

Or, you can use Drupal Console! Jump into your console:

{% highlight bash %}
cd /path/to/drupal
drupal config:override system.file path.temporary /tmp
{% endhighlight %}

This will set ``system.file`` ``path.temporary`` in your active configuration to point to ``/tmp``.

That's a lot more fun!

## Further Reading

* [Drupal Console](https://drupalconsole.com/)
