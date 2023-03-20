---
layout: default
title: Debugging
nav_order: 3
permalink: /debugging
---


Debugging Zig code using log statements:

```zig
const std = @import("std");

pub fn main() void {
    
    var string = "world";    
    std.log.debug("string variable is of the type: {}", .{@TypeOf(string)});
}
```

The previous code inspects the type of the variable and logs it to console:

```
zig run .\debugging.zig
debug: string variable is of the type: *const [5:0]u8
```


Instead of logging, you can also leverage the print statement. 


```zig
// zig run .\debugging.zig
const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    var string = "world";    
    debugPrinter(string);
}


fn debugPrinter(data: anytype) void {
    const T = @TypeOf(data);
    print("{}\n", .{T});
}
```

The `debugPrinter` function is a generic function that accepts any type of data. The `@TypeOf` builtin function returns the type of the data passed to it. The `print` function is used to print the type to console:

```
zig run .\debugging.zig
*const [5:0]u8
```

We can also print information about structs:

```zig
// zig run .\debugging.zig
const std = @import("std");
const print = std.debug.print;

pub fn main() void {

    const Point = struct {
        x: i32,
        y: i32,
    };
    const some_point = Point{
        .x = 7,
        .y = 77,
    };    

    debugStructPrinter(some_point);  
       
    
}

fn debugStructPrinter(data: anytype) void {
    const T = @TypeOf(data);
    print("type:\n\t{}\n", .{T});
    inline for (@typeInfo(T).Struct.fields) | field|{
        print("\tfield name: {s} value: {any}\n", 
            .{field.name,@field(data, field.name)});        
    }
}
```

The previous will not only print the type of a struct, but also the name and value of each field:

```
zig run .\debugging.zig
type:
        debugging.main.Point
        field name: x value: 7
        field name: y value: 77
```

[index](index.md)