---
layout: default
title: For
nav_order: 10
permalink: /for
---

You can iterate slices and arrays in Zig using the for statement. A basic example is the following:

```
const array = [_]u8{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

for (array) |element| {
    print("{d} ", .{element});
}


var slice_end: usize = 4;
var slice = array[1..slice_end];

for (slice) |element| {
    print("{d} ", .{element});
}
```


Running this code produces the following output:

```
1 2 3 4 5 6 7 8 9 10 
2 3 4
```

When iterating over a n array or slice, Zig offers easy access to the index of the element:

```zig
for (array, 0..) |element, index| {
    print("{d} is at index {d}\n", .{ element, index });
}
```
The above prints the following to console:

```
1 is at index 0
2 is at index 1
3 is at index 2
...
..
.
```

If we are interested in the index only, we store the element in the `_` variable:

```zig
for (array, 0..) |_, index| {
    print("{d} ", .{index});
}
```

Inside a for loop, we can use `continue` to skip to the next iteration and we can use `break` to exit the loop.

```zig
for (array) |element| {
    if (element % 2 == 0) {
        continue;
    } else if (element >= 6) {
        break;
    }
    print("{d} ", .{element});
}
```
The above prints the following to console:

```
1 3 5
```
Full code is [here](https://github.com/saidvandeklundert/fortheloveofzig/blob/dev/src/for.zig).