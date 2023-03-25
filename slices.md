---
layout: default
title: Slices
nav_order: 7
permalink: /slices
---


Like an array, the slice is a contiguous sequence of elements. However, they are not the same. The slice is a view into a number of elements of an array. The slice itself consists of a pointer and a length. The pointer is pointing to one of the elements in an array. The length indicates the number of elements in the slice.

The slice pointer does not need to point to the first element of the array. 

In the context of a slice, I always imagine the slice being backed by a backing array where the bbacking array is the array that the slice is pointing to:

```
backing array [ ] [ ] [x] [x] [x] [ ] 
                       ^
                       |
slice pointer ----------
slice length: 3    
```


The previous shows the backing array with 6 elements. The slice pointer points to the third element in the array. Since the length of the slice is 3, the slice will contain the third, fourth and fifth elements of the array.

Slices can grow and shrink in size. The room the slice has to grow is determined by the backing array. In Zig, slices have array bounds checking. When the slice attempts to grow beyond the bounds of the backing array, the program will panic:
```
backing array [ ] [ ] [x] [x] [x] [x] `x` <---`panic!!`
                       ^               
                       |
slice pointer ----------
slice length: 4 
```

To define the backing array and the slice that we laid out in the above examples, we can use the following code:

```zig
var backing_array = [6]i32{ 1, 2, 3, 4, 5, 6 };
var slice = backing_array[2..5];
```

Same as with an array, accessing an element and grabbing the length can be done as follows:

```zig
print("element 1: {d}\n", .{slice[0]});
print("slice length: {d}\n", .{slice.len});
```

This will print the following to console:

```
slice length: 3
element 1: 3
```

Stepping through a slice can be done using a for loop:

```zig
    for (slice) |element| {
        print("element: {}\n", .{element});
    }
```

This gives us:

```
element: 3
element: 4
element: 5
```

The entire source code is [here](https://github.com/saidvandeklundert/fortheloveofzig/blob/dev/src/slice.zig).