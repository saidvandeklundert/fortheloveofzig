---
layout: default
title: if
nav_order: 5
permalink: /if
---

Here is a basic example where `if` is used to test for a boolean condition:

```zig
const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const number:i32 =123;
    
    if (number == 1) {
        print("The number is 1!\n", .{});

    } else if (isNumber2(number)) {
        print("The number is 2!\n", .{});

    } else {
        print("The number is something else: {}\n", .{number});
    }
}

fn isNumber2(number:i32) bool {
    return number == 2;
}
```

The `if` statement can be used with or without any `else` clause. The boolean condition you are testing for can make use of a comparison operator or a function call.


The example outputs the following:
```
zig run .\if.zig
The number is something else: 123
```
[index](index.md)