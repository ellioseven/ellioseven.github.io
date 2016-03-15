---
layout: post
title: ".vimrc Per Project"
date: 2016-03-05
---
I am starting to get acquainted with vim. One of the things I wanted was to load a .vimrc file automatically depending on what directory I was in.

I stumbled upon a [unique solution)](http://stackoverflow.com/a/1889646/1029575) which loads a .vim.custom file in your project root directory. 

## Instructions

Place this in your `$HOME/.vimrc` file:

{% highlight bash %}
# $HOME/.vimrc
if filereadable(".vim.custom")
    so .vim.custom
endif
{% endhighlight %}

## Note

Your shell must be inside the project project for your `.vim.custom` file to be loaded.

{% highlight bash %}
cd /path/to/project
vim ./somefile
{% endhighlight %}
