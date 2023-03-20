---
layout: default
title: Hello world
nav_order: 1
permalink: /hello-world
---


```zig
const std = @import("std");

pub fn main() void {
    std.debug.print("Hello, {s}!\n", .{"World"});
}
```

Outputs:

```
Hello, World!
```