---
layout: post
title: "Simple Docker Livereload"
date: 2017-10-31
---
I implement extensive use of [Docker](https://www.docker.com/) containers in
my development workflow. I also develop with [livereload](https://www.npmjs.com/package/livereload)
to avoid spamming the refresh button after altering stylesheets.

Trying to implement livereload into a containerised solution can be a little
tricky as you might find yourself having to install browser extensions or
playing around with `iptables` to configure ports. Running multiple livereload
servers can be a little bit of a problem as browser extensions like to look for
`localhost:35729`. Fortunetly, we can skip all that.

Require the livereload package, then configure and run the livereload server.
I use Gulp as my task runner, however you can supplement your own method
of excution.

## Step 1 - Require the Package

Require the livereload package. I also use the [ip](https://www.npmjs.com/package/ip)
package to get the address of the container.

```
npm install --save-dev livereload ip
```

## Step 2 - Start the Server

Configure your task runner (Gulp in my case):

``` js
var gulp = require('gulp');
var livereload = require('livereload');
var ip = require('ip');

gulp.task('livereload', function () {
  // Start livereload server.
  var server = livereload.createServer();

  // Build a simple message to display livereload instructions.
  var msg = [
    'Paste the following into a browser console to activate livereload:',
    'var script = document.createElement(\'script\');',
    'script.type = \'text/javascript\';',
    'script.src = \'http://' + ip.address() + ':35729/livereload.js\';',
    'document.head.appendChild(script);'
  ];

  // Watch './css for changes'.
  server.watch(__dirname + '/css');

  // Print message.
  console.log(msg.join('\n'));
});
```

You may want to configure your own watch path:

``` js
server.watch(__dirname + '/css');
```

You can then start the livereload task to start the server:

```
gulp livereload
```

Optionally, you can configure Gulp to start the livereload server on other
tasks:

``` js
gulp.task('my-task', function () {
  gulp.start('livereload');
  // ...
});
```

```
gulp my-task
```

## Step 3 - Inject the Browser With the Livereload Client.

Insert the following into the browser console, replacing `<ip>` with the IP of
the corresponding container.

``` js
var script = document.createElement('script');
script.type = 'text/javascript';
script.src = 'http://<ip>:35729/livereload.js';
document.head.appendChild(script);
```

You can test if the livereload container is running properly by trying to access
`http://<ip>:35729/livereload.js` in the browser.

When any file changes occur under `/path/to/watch/path/css`, the browser should
automatically reload.
