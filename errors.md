---
layout: default
title: Errors
nav_order: 13
permalink: /errors
---


In Zig, errors are values. There are no exceptions in Zig. 

Defining an error is done with the error keyword:

```zig
error.NotEven
```

A type can be prefixed with the `!` operator to indicate that it is an error union. An error union is a type that can be either the type that is specified or any error.

In Zig, it is very common to see functions that return error unions. Here is an example function that returns either a `u8` or an error:

```
fn isEven(number: u8) !u8 {
    if (number % 2 == 0) {
        return number;
    } else {
        return error.NotEven;
    }
}
```

Let's call this function twice. The first time, it will execute and return a `u8`. The second time, it will return an error:

```zig
var result: anyerror!u8 = isEven(2);
print("Result isEven(2):\n{any}\n", .{result});

result = isEven(3);
print("Result isEven(3):\n{any}\n", .{result});
```

When we run this code, the following is printed to screen:

```
Result isEven(2):
2
Result isEven(3):
error.NotEven
```



A common pattern you will see in Zig is payload capturing. This is where you capture the value of an error in a variable using the `catch` keyword. Here is an example of a function that uses the `catch` keyword:

```zig
fn useCatch(number: u8) !u8 {
    const result = isEven(number) catch |err| return err;
    return result;
}


result = useCatch(2);
print("Result useCatch(2):\n{any}\n", .{result});

result = useCatch(3);
print("Result useCatch(3):\n{any}\n", .{result});
```

When `isEven` is called in this function, and when it produces an error, the `catch` statement will capture an error value inside the `err` variable. If there is an error value, the function will return that error.

If `isEven` executes without any error, the function will continue to run. The previous example returns the following:

```
Result useCatch(2):
2
Result useCatch(3):
error.NotEven
```

There is also a shorthand for the `catch` keyword. Next, we use `catch` to indicate what value we want to work with in case the function returns an error:

```zig
var u8_result: u8 = isEven(2) catch 0;
print("isEven(2) catch 0;\n{any}\n", .{u8_result});

u8_result = isEven(3) catch 0;
print("isEven(3) catch 0;\n{any}\n", .{u8_result});
```

Notice that we can now capture the result of the function in a value of type `u8`. We can do this is because the compiler understands that the expression will always result in a `u8`, even when `isEven` returns an error. Basically, this allows you to specify a default value for this function while handling the possible error the function may return.

The previous code produces the following result:

```
isEven(2) catch 0;
2
isEven(3) catch 0;
0
```



Zig also offers `try`. This is shorthand for `catch |err| return err`. In the following example, we define a function in which we call `isEven`. We use `try` when we call the function. What this will do is return the error if the `isEven` function returns an error value. If the `isEven` function returns a non-error value, the rest of the function continues to execute.

Also notice in this case the return value of the function:

```zig
fn useTry(number: u8) !u8 {
    const result = try isEven(number);
    print("useTry body executes for number {d}\n", .{number});
    return result;
}
```
The function return is of the type `!u8`. This means the function returns an error union, which is either an error or a `u8`.

The first line will `try` to run the `isEven` function. If the function does not produce an error, the rest of the function will execute normally:


```zig
result = useTry(2);
```

This will print the following to screen:

```
useTry body executes for number 2
```
The function ran all the way to the end and it returned a `u8`.

```zig
result = useTry(3);
```

Now observe the following:

```zig
result = useTry(3);
print("Result useTry(3):\n{any}\n", .{result});
```

The `isEven` function will now produce an error, causing the function to stop and return immediately. When we run it, we see the following:

```
Result useTry(3):
error.NotEven
```

We notice that the print statement from the function body was not executed. Instead, it immediately returned the error value `error.NotEven` that was returned by the `isEven` function.


The source code for the examples can be found [here](https://github.com/saidvandeklundert/fortheloveofzig/blob/dev/src/errors.zig).