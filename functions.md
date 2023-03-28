---
layout: default
title: Functions
nav_order: 13
permalink: /functions
---

Here is a function that takes 2 ints and returns their sum as an int:

```zig
fn addNumbers(a: i32, b: i32) i32 {
    return a + b;
}
```

We call a function just as expected:

```zig
var result = addNumbers(1, 2);
print("{d}\n", .{result});
```

In Zig, it is mandatory that you specify the return type of a function. If we want a function to return nothing, we specify that using the `void` keyword. 

```zig
pub fn example() void {
    print("we can import this function into another file.\n", .{});
}
```

Notice that the previous function was prefixes with `pub`. This will allow us to use the function after we import the file that contains it. Functions (and structs) that are not prefixed with `pub` are private to the file they are defined in.


We can make a function work with any type (that supports the operations in the function body):

```zig
fn addAndDouble(x: anytype, y: anytype) @TypeOf(x) {
    const z = x + y;
    return z * 2;
}

const x: u8 = 1;
const y: u8 = 2;
result = addAndDouble(x, y);
print("{d}\n", .{result});

const xx: i32 = 1000;
const yy: i32 = 2000;
result = addAndDouble(xx, yy);
```

Running this code gives us the following:

```
6
6000
```

Another useful thing to know about functions in Zig is that Zig is pass by value for all primitive types. This means that the parameters are copied as they are passed to a function. 

For other types, like structs or arrays, it can sometimes be more efficient to pass them by reference. For instance, when the array is very large, passing a pointer to the function is far more efficient versus copying the entire array. In Zig, the compiler will decide what will be passed to the function. So, you may specify to pass by value, but the compiler may 'optimize' and pass by reference.

However, if you define a function to take a pointer, the argument type will not be up for debate. The function will expect a pointer to the type, not the type itself.



In Zig, we are allowed to pass functions to other functions. We can do this by passing around function pointers or by using the `comptime` known value:

```zig
fn takesAFunction(comptime func: fn (i32, i32) i32, x: i32, y: i32) void {
    const result = func(x, y);
    print("result of the function: {d}\n", .{result});
}

fn takesAFunctionPointer(func: *const fn (i32, i32) i32, x: i32, y: i32) void {
    const result = func(x, y);
    print("result of the function: {d}\n", .{result});
}

takesAFunction(addNumbers, 10, 10);
takesAFunctionPointer(&addNumbers, 10, 10);
```

This will give us:

```
result of the function: 20
result of the function: 20
```


The entire source code is [here](https://github.com/saidvandeklundert/fortheloveofzig/blob/dev/src/functions.zig).