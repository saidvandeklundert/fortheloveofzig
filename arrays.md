---
layout: default
title: Arrays
nav_order: 4
permalink: /arrays
---

Defining an array in Zig and accessing an element:

```zig
const array_of_int = [5]i32{1, 2, 3, 4, 5};
const element = array_of_int[1];
    
print("array_of_int: {d}\n", .{array_of_int});
print("array_of_int[1]: {}\n", .{element});
```

The array syntax is `[size]type{elements}`. In the previous, we declared the array using `[5]i32{1, 2, 3, 4, 5}`. Breaking down the syntax, we have:
- `[5]`: the size of the array is set to 5
- `i32`: the type of item that the array will hold is an `i32`
- `{1, 2, 3, 4, 5}`: these specified the elements of the array

We can get the length of the array using `len`:

```zig
const length = array_of_int.len; 
print("length of array: {}\n", .{length}); 
```

Iterating over an array of bytes can be done as follows:

```zig
const bytes = [_]u8{ 104, 101, 108, 108, 111 };

for (bytes) |byte| {
    print("{c}", .{byte});
}    
```

We step through the array using `for (bytes) | byte |`. The for loop first references the array (`(bytes)`). After this, we specify the `byte` variable that will hold the value of the elements as we are stepping through the array.

Also notice how the array was defined using `_` in `[_]u8`. This is telling the compiler to infer the length of the array from the source code.

Running the above will give the following output:

```
hello
```

The way in which we have been defining arrays has been giving us immutable arrays. In order to ensure we can change the elements in the array, we should define the array using the `var` keyword:

```zig
var mut_array_of_int = [5]i32{1, 2, 3, 4, 5};
mut_array_of_int[0] = 65000;
print("{any}\n", .{mut_array_of_int});
```

The above outputs the following:

```
{ 65000, 2, 3, 4, 5 }
```

Initializing an array with default values can be done by specifying the default value and then using `**` to indicate how often that value should be repeated:

```zig
var buff = [_]u8{0} ** 10;
var message = [_]u8{'a'} ** 5; 
print("buff: {d}\nmessage: {s}\n", .{buff, message});  
```

This will output the following:

```
buff: { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
message: aaaaa
```

You can create multidimensional arrays by nesting arrays. An example of a 2D array is shown below:

```zig
var array2d = [_][3]i32{
    [_]i32{ 0, 0, 0 },
    [_]i32{ 0, 0, 1  },
    [_]i32{ 0 } ** 3,
};    

print("array2d[1][2]: {d}\n", .{array2d[1][2]});
print("array2d:\n", .{});  

for (array2d) |array| {
    print("{d}\n", .{array});
}  
```    

We start off defining the array. After that, we access the third element in the second array. We wrap up printing the array to console:

```
array2d[1][2]: 1
array2d:
{ 0, 0, 0 }
{ 0, 0, 1 }
{ 0, 0, 0 }
```

[index](index.md)