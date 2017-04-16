---
layout: post
title: "Drupal - Development Configuration"
date: 2017-04-16
---
I usually need to set default configuration for developing Drupal sites
on my local environment. Here are some quick bash scripts to enable
"development mode" by disabling caches, etc.

## Drupal 7

This requires [Drush](http://www.drush.org/en/master/):

```
#!/usr/bin/env bash

# Enable development mode.

# Exit on first error
set -e

echo "Enable Drupal development mode."
read -p "Press [ENTER] to continue: "

function _disable () {
  drush vset $1 0
}

echo "Disabling caches..."
_disable cache && \
  _disable block_cache && \
  _disable page_compression && \
  _disable preprocess_css && \
  _disable preprocess_js
```

## Drupal 8

This requires [Drupal Console](https://drupalconsole.com/):

```
#!/usr/bin/env bash

# Enable development mode.

# Exit on first error
set -e

echo "Enable Drupal development mode."
read -p "Press [ENTER] to continue: "

drupal site:mode dev
```