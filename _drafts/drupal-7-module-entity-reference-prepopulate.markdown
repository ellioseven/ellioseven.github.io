---
layout: post
title: "Drupal 7 - Module - Entity Reference Prepopulate"
---
> Allow prepopulating any Entity reference field via URL.

[View the Module](https://www.drupal.org/project/entityreference_prepopulate)

## Summary

Extends the [Entity reference](https://www.drupal.org/project/entityreference)
module to allow Entity Reference fields to be prepopulated by a URL.

## Use Case

This module is great when you need to dynamically provide default values for
entity references.

## Usage

We are going to set up an "Article" entity reference field on the "Basic Page"
content type. We want to prepopulate the field with an existing "Article".

### 1. Create Entity Reference Field

1. Add a new field on the "Page" content type: `admin/structure/types/manage/page/fields`
    * Field Type: `Entity Reference`
    * Label: `My Article`
    * Machine Name: `field_article`
2. Edit the new field:
    * Additional Behaviors: Check `Entity reference prepopulate`
    
<a href="{{ site.url }}/files/drupal-7-module-entity-reference-prepopulate/field-edit.jpg">![Field edit page]({{ site.url }}/files/drupal-7-module-entity-reference-prepopulate/field-edit.jpg)</a>

### 2. Create an Article

1. Create a new "Article": `node/add/article`
    * Title: `My Prepopulated Article`

### 3. Create a Page

This is where the magic happens.

Create a new "Page": `node/add/page?field_article=<node_id>` (replace `<node_id>`)
with the `nid` of the new article.

You will see our new `My Article` field gets prepopualted with an article.

<a href="{{ site.url }}/files/drupal-7-module-entity-reference-prepopulate/prepopulated.jpg">![Prepopulated "Article" field on a "Page" content type]({{ site.url }}/files/drupal-7-module-entity-reference-prepopulate/prepopulated.jpg)</a>
