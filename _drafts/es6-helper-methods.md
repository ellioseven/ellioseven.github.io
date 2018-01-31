---
layout: "post"
title: "ES6 - Array Helper Methods"
lede: "ES6 has introduced new array helper methods you will probably use every
day. Let's take a gander at what they are, some examples and how we would use
them."
---
ES6 array helper methods are similar to utlility functions in libraries such
as [lodash](https://github.com/lodash/lodash) and [underscore.js](http://underscorejs.org/).
They provide general purpose functionality for **processing array data**. So
now we have 7 new glorious array methods:

* `forEach()`
* `map()`
* `filter()`
* `find()`
* `every()`
* `some()`
* `reduce()`

How do we benefit from these additions? They help create **expressive** code.
For example, instead of writing some code such as:

``` js
// Double each number in numbers.
var numbers = [10, 30, 20];
var double = [];
for (var i = 0; i < numbers.length; i++) {
	 double[i] = numbers[i] * 2;
}
```

We can create the same logic with less code:

```
// Double each number in numbers.
const numbers = [10, 30, 20]
const double = numbers.map(number => number * 2)
```

If you haven't seen anything like this before, you might think:

> Yeah great it's shorter, but I have no idea what is going on! Where is the
return statement? Why are you making my life so difficult?

It's perfectly natural to think at first, in fact I had the same thought process.
Once you start getting used to array helper functions, they will actually make
your life easier.

Remember, the idea is to create **expressive** code, not to try and reduce
every to an unreadable mess.

Let's take a look at these bad boys.

## `forEach()`

> `@todo` Add a definition here.

First up is `forEach()`. I will be honest and say that you can pretty much
implement the rest of the helper methods with this guy.

## Thoughts

- Should be using these constantly in your JS development
- Checkout lodash or underscore.js if you enjoy utility functions

