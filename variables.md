---
layout: default
title: Variables
nav_order: 2
permalink: /variables
---


Declaring variables is done using the `var` or `const` keyword. With `var`, you declare a mutable variable, with `const` you declare an immutable variable.

```zig
const std = @import("std");
const print = std.debug.print;


pub fn main() void {
    const immutable_number: i32 = 5;  
    var mutable_number: u32 = 5; 
    mutable_number +=1;
    print("{d} {d}\n", .{immutable_number, mutable_number});
    
    var boolean: bool = true; 
    print("{}\n", .{boolean});
    
    const float: f32 = 3.14; 
    print("{d}\n", .{float});
    
    var msg = "string literal"; 
    print("{s}\n", .{msg});
}
```

Notice how the type of the last variable was inferred. 

Running the program gives the following output:

```
$ zig run .\variables.zig
5 5001
true
3.140000104904175
string literal
```