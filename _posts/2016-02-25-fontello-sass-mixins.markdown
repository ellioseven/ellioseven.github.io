---
layout: post
title: "Fontello Sass Mixins"
date: 2016-02-25
---
Unless you're still using sprite sheets, you've heard of Fontello. You know you can create font icons from your designer's crazy ass .svg's. Here are some mixins that are going to save you some time.

## Output Icon

Simply outputs a fontello icon. This must be used on pseudo element (:before or :after) for this to work.

### Usage:

```
.my-element:before {
  @include fontello($icon-star);
}
```

### Source:

```
// Output icon.
@mixin fontello($icon) {
  @include fontello-base;
  content: $icon;
  height: 1em;
  width: 1em;
  display: inline-block;
  line-height: 1em;
  text-align: center;
}

// Output base styles for a fontello icon.
@mixin fontello-base {
  font-family: "fontello";
  font-style: normal;
  font-weight: normal;
  speak: none;
  text-decoration: inherit;
  font-variant: normal;
  text-transform: none;
  vertical-align: middle;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
```

## Replace With Icon

This will replace an element's text with an icon. Handy for accessibility.

### Usage:

```
.my-accordion-toggle {
  @include fontello-replace-with-icon($icon-arrow-down);
}
```

### Source:

*This mixin depends on `fontello()`.*

```
@mixin fontello-replace-with-icon($icon: "", $height: false, $width: false, $inline: true) {
  @include fontello-replace-with-icon-content($icon);
  line-height: 0;
  vertical-align: middle;
  text-indent: -119988px;
  @include fontello-replace-with-icon-size($height, $width);

  @if inline {
    display: inline-block;
  }

  @else {
    display: block;
  }

  &:after {
    @include fontello-base;
    height: 100%;
    width: 100%;
    display: block;
    text-align: center;
    text-indent: 0;
    vertical-align: middle;
  }
}

@mixin fontello-replace-with-icon-content($icon) {
  &:after {
    content: $icon;
  }
}

@mixin fontello-replace-with-icon-size($height: false, $width: false){
  @if $height {
    height: $height;
  }

  @if $width {
    width: $width;
  }

  &:after {
    @if $height {
      line-height: $height;
    } @else {
      line-height: 1;
    }
  }
}
```

