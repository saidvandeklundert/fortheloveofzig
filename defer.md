---
layout: default
title: Defer
nav_order: 9
permalink: /Defer
---

You use a defer statement to indicate something needs to be executed at the end of the current scope.


Example:
```
{
    defer print("executes at the end of the scope\n", .{});
    print("Hello world!\n", .{});
}
```

This will output:
```
Hello world!
executes at the end of the scope
```


Defer can be useful to clean up resources at the end of a function:
```zig
fn deferring_something() void {
    defer print("clean up some resources\n", .{});
    print("this runs prior to the defer statement\n", .{});
}
```

Running this function outputs:

```
this runs prior to the defer statement
clean up some resources
```

You can also stack defer statements. When defer statements are stacked, they are executed in reverse order when the scope ends:

```
fn stacked_defers() void {
    defer print("deferred 1\n", .{});
    defer print("deferred 2\n", .{});
    defer print("deferred 3\n", .{});
    print("The last defer statement is executed first\n", .{});
}
```

When we run the above function, we get the following output:

```
The last defer statement is executed first
deferred 3
deferred 2
deferred 1
```


A common pattern in Zig is using defer to ensure memory is freed. Here is an example function that allocates 100 bytes and then ensures the memory is freed using defer:

```zig
fn allocate_and_free_memory() !void {
    const allocator = std.heap.page_allocator;

    const hundred_bytes = try allocator.alloc(u8, 100);
    defer allocator.free(hundred_bytes);
    print("Use the hundred_bytes while relying on defer to clean up.\n", .{});
}
```

This outputs:

```
Use the hundred_bytes while relying on defer to clean up.
```


Full code is [here](https://github.com/saidvandeklundert/fortheloveofzig/blob/dev/src/defer.zig).