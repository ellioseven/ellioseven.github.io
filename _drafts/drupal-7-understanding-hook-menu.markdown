---
layout: post
title: "Drupal 7 - Understanding hook-menu"
---
Clarification of the hook menu system.

```
MENU_NORMAL_ITEM: Normal menu items show up in the menu tree and can be moved/hidden by the administrator.
MENU_CALLBACK: Callbacks simply register a path so that the correct information is generated when the path is accessed.
MENU_SUGGESTED_ITEM: Modules may "suggest" menu items that the administrator may enable.
MENU_LOCAL_ACTION: Local actions are menu items that describe actions on the parent item such as adding a new user or block, and are rendered in the action-links list in your theme.
MENU_LOCAL_TASK: Local tasks are menu items that describe different displays of data, and are generally rendered as tabs.
MENU_DEFAULT_LOCAL_TASK: Every set of local tasks should provide one "default" task, which should display the same page as the parent item.
```
