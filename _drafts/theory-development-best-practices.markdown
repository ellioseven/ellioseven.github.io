---
layout: post
title: "Theory - Development Best Practices"
---
A living article devoted to my development best practices interpretation:

## Do not repeat yourself

This means placing duplicated code in functions or referring to original source
of documentation

## Document your code

Write descriptive inline documentation. Keep an updated README as you develop.
Document any important documentation (that doesn't belong in the code) in a
central location.

## Don't rush

## Quality over quantity

Resist the pressure to merge a branch or deploy a feature because you
"need it now"

## Do your research

If you have a problem, find out if some one has already solved it. Don't
write your own recursive utility function when `get_nested_array()` already
exists.

## Plan

Before writing a whole bunch of code, find out exactly what you are trying to
achieve and visualise an overview of how you are going to do it. Resist the
temptation to dump straight into your IDE.

## Keep it simple

Don't make something more complex than it needs to be. Focus on readability
and flexibility when writing code.

## Keep it modular

Follow the UNIX philosophy, a program should do one thing and do it well. Write
programs in small separate parts that work together.

## Test first

Programs should be tested before each commit.

## Keep a change log

Keep a log of all the changes in your code base.

## Keep it clean

Check you code against linters and follow style guides.
