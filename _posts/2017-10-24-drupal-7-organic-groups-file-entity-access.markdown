---
layout: post
title: "Drupal 7 - Organic Groups & File Entity Access"
date: 2017-09-15
---
I recently ran into an issue were private file access needed to be granted for
certain groups, on a per entity basis.

## Build Details:

* Groups are being managed by [Organic Groups](https://www.drupal.org/project/og)
* [File Entity](https://www.drupal.org/project/file_entity) is also installed.

## Implementation

A 'Groups Audience' field was added to each file bundle (eg: Document, Video,
etc) on the 'OG field settings' configuration (`admin/config/group/fields`).

File entity access is then checked against the groups on the current user:

```
/**
 * Implements hook_file_entity_access().
 */
function my_module_file_entity_access($op, $file, $account) {
  if ($op !== 'view') {
    // We only want to alter the 'view' operation.
    return FILE_ENTITY_ACCESS_IGNORE;
  }

  // Load groups from file entity.
  $file_groups = og_get_entity_groups('file', $file);

  // Ignore if file entity has no groups.
  if (empty($file_groups)) {
    return FILE_ENTITY_ACCESS_IGNORE;
  }

  foreach ($file_groups as $file_group_type => $file_gids) {
    foreach ($file_gids as $file_gid) {
      // Check if user belongs to group on file entity.
      if (og_is_member($file_group_type, $file_gid, 'user', $account)) {
        return FILE_ENTITY_ACCESS_ALLOW;
      }
    }
  }

  return FILE_ENTITY_ACCESS_IGNORE;
}
```

When the private file is accessed and a group on the file entity matches with
a group on the current user, access is granted.
