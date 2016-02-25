---
layout: post
title: "Better Like Intend Format"
date: 2013-08-22
excerpt: An introduction into the ways of Markdown and your sanity. Learn how to create semantic documents easily in markdown, and have fun.
---
Readability, however, is emphasized above all else. A Markdown-formatted document should be publishable as-is, as plain text, without looking like it’s been marked up with tags or formatting instructions.

While Markdown’s syntax has been influenced by several existing text-to-HTML filters — including Setext, atx, Textile, reStructuredText, Grutatext, and EtText — the single biggest source of inspiration for Markdown’s syntax is the format of plain text email.

<div class="info">
<p>Optionally, you may “close” atx-style headers. This is purely cosmetic <a href="http://www.google.com">you can use this</a> if you think it looks better.</p>
</div>

## Comprised Entirely of Punctuation Characters 

To this end, Markdown’s syntax is comprised entirely of punctuation characters [an inline link](http://www.google.com), *which punctuation characters* have been carefully chosen so as to look like what they mean. E.g., asterisks around a word actually look like *emphasis*. Markdown lists look like, well, lists. Even blockquotes **look like quoted passages** of text, assuming you’ve ever used email.

### The Purpose

Markdown’s syntax is intended for one purpose: to be used as a format for writing for the web.

Senectus `et_netus()` malesuada.

<figure>
  <img src="http://placekitten.com/768/400" />
  <figcaption>The intended purpose actual numbers you use to mark the list have no effect on the HTML output Markdown produces.</figcaption>
</figure>

Any decent text editor should make email-style quoting easy. For example, with BBEdit, you can make a selection and choose Increase Quote Level from the Text menu.

```
if(data['results']):
        results = []
        for location in data['results']:
            print '[%s]' % len(results), location['formatted_address']
            results.append(location['geometry']['location'])
```

Markdown is not a replacement for HTML, or even close to it. Its syntax is very small, corresponding only to a very small subset of HTML tags. *The idea is not to create a syntax that makes it easier to insert HTML tags*. In my opinion, **HTML tags are already easy** to insert. The idea for Markdown is to make it easy to read, write, and edit prose. HTML is a publishing format; Markdown is a writing format. Thus, Markdown’s formatting syntax only addresses issues that can be conveyed in plain text.

> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.

> Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.

#### Syntax

For any markup that is not covered by Markdown’s syntax, you simply use HTML itself. There’s no need to preface it or delimit it to indicate that you’re switching from Markdown to HTML; you just use the tags.

- Markdown allows you to use these characters naturally
- Taking care of all the necessary escaping for you
	- If you use an ampersand as part of an HTML entity
		- It remains unchanged
		- Otherwise it will be translated

It’s important to note that the actual numbers you use to mark the list have no effect on the HTML output Markdown produces. The HTML Markdown produces from the above list is:

If you do use lazy list numbering, however, you should still start the list.

1. At some point in `the_future()`
2. Markdown may support starting ordered lists at an arbitrary number.

##### Format Note

Note that Markdown formatting syntax is not processed within block-level HTML tags. E.g., you can’t use Markdown-style *emphasis* inside an HTML block.

1. There are two characters that demand special treatmentt
2. Ampersands in particular are bedeviling for web writers
	1. You even need to escape ampersands within URLs
	2. Needless to say, this is easy to forget

A paragraph is simply one or more consecutive lines of text.

```
# Tabled Code
def ask_locations():
	# Make sure the "from" location request is valid
	while True:
		location = raw_input('Specify your "from" location: ')
		location = request_location(location_from)
```

Separated by one or more blank lines. A blank line is any line that looks like a blank line — a line containing nothing but spaces or tabs is considered blank.

## Something Worth Mentioning

Normal paragraphs should not be indented with spaces or tabs.

###### Remember

Unlike block-level HTML tags, Markdown syntax is processed within span-level tags.

<dl>
	<dt>Lower cost</dt>
	<dd>The new version of this product costs significantly less than the previous one!</dd>
	<dt>Easier to use</dt>
	<dd>We've changed the product so that it's much easier to use!</dd>
	<dt>Safe for kids</dt>
	<dd>You can leave your kids alone in a room with this product and they won't get hurt (not a guarantee).</dd>
</dl>

However, inside Markdown code spans and blocks, angle brackets and ampersands are always encoded automatically. This makes it easy to use Markdown to write about HTML code.

(As opposed to raw HTML, which is a terrible format for writing about HTML syntax, because every single < and & in your example code needs to be escaped.)