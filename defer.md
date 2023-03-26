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


A defer statement is used for executing code just before transferring program control outside of the scope that the defer statement appears in. 
defer will execute an expression at the end of the current scope.

Full code is [here](https://github.com/saidvandeklundert/fortheloveofzig/blob/dev/src/defer.zig).