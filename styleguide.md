---
layout: page
hide-title: true
title:
permalink: /styleguide
---
# Consectetuer incidunt, maiores occaecat laboris, hic error reprehenderit architecto minima diamlorem aliquid eu, faucibus! Malesuada veniam, iste aliqua voluptates bibendum.
## Pharetra venenatis voluptas egestas dis aliquam phasellus ridiculus neque culpa, facilisi natoque elementum temporibus dolor natoque iusto laboris blandit consectetuer.
### Proin sollicitudin dis magnam senectus placeat neque, commodo nulla, nostrud. Semper scelerisque, auctor expedita facilisis magna natoque eleifend, lorem, eligendi.
#### Saepe curae inventore, soluta, risus dolore, dignissim a ut adipisci gravida veritatis, placeat sociosqu nemo metus! Nihil nam! Irure nostra.
##### Placeat enim praesentium neque adipisicing torquent dolore congue sapiente vero qui quibusdam? Sunt accusantium rhoncus eros vero aspernatur, taciti facilisi.
###### Aspernatur facilisis. Fugiat sapiente pariatur, laboris facilisis excepturi, proin ullamco praesentium aperiam, praesent, quam dapibus? Nisi. Augue rutrum? Nostra fugiat.

Ligula soluta irure lacus! Sapien conubia ipsam ratione sem blandit neque, luctus reiciendis netus similique! Minus. Laboriosam occaecati dicta wisi lorem voluptatum penatibus mi fuga perspiciatis eius, suspendisse, ab pellentesque magni primis nostrud vulputate diamlorem id, eligendi nemo potenti odit ipsum facilisi bibendum cursus tincidunt, impedit voluptatem pulvinar? Reprehenderit ligula malesuada facere natoque etiam fuga primis praesent occaecat dolorum iusto.

Aperiam viverra consectetur felis, voluptate minima nobis quisquam cursus dictumst, do nisl dignissimos luctus similique laoreet fringilla eget, quidem amet lobortis! Earum fugiat tortor! Mollit unde conubia laoreet, quidem. Ad eligendi eveniet, nascetur. Mollitia sequi tellus animi eveniet aliquip elementum ut saepe facilisis volutpat dictum incidunt, hendrerit quam, bibendum optio! Architecto? Accusantium incidunt hac, unde omnis. Doloribus ridiculus adipiscing debitis.

* Ornare taciti? Proin cupiditate, aute, pellentesque purus malesuada. Praesent incididunt, cupiditate voluptate cillum cumque! Phasellus taciti iusto vehicula lorem felis.
* Vivamus delectus varius recusandae blanditiis fames nisi earum nisi tristique beatae fringilla laudantium cursus earum asperiores at iaculis netus tempore.
* Amet rerum asperiores nihil, ipsam eu praesentium cupiditate, corporis, phasellus repellat quos blandit luctus temporibus fermentum reprehenderit quo? Lacinia reprehenderit.

1. Ornare taciti? Proin cupiditate, aute, pellentesque purus malesuada. Praesent incididunt, cupiditate voluptate cillum cumque! Phasellus taciti iusto vehicula lorem felis.
2. Vivamus delectus varius recusandae blanditiis fames nisi earum nisi tristique beatae fringilla laudantium cursus earum asperiores at iaculis netus tempore.
3. Amet rerum asperiores nihil, ipsam eu praesentium cupiditate, corporis, phasellus repellat quos

```
#include <bson.h>

#include "mongoc-async-private.h"
#include "mongoc-async-cmd-private.h"
#include "utlist.h"
#include "mongoc.h"

#undef MONGOC_LOG_DOMAIN
#define MONGOC_LOG_DOMAIN "async"


mongoc_async_t *
mongoc_async_new ()
{
   mongoc_async_t *async = (mongoc_async_t *) bson_malloc0 (sizeof (*async));
   return async;
}
```