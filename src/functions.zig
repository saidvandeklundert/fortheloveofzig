// zig run .\functions.zig
const std = @import("std");
const print = std.debug.print;

// a function that does not return anything:
fn printDouble(number: i32) void {
    std.debug.print("{d}\n", .{number * 2});
}

// A function that takes 2 integers and returns their sum as an integer:
fn addNumbers(a: i32, b: i32) i32 {
    return a + b;
}

// a function that can work with any type (that supports the operations in the function body):
fn addAndDouble(x: anytype, y: anytype) @TypeOf(x) {
    const xy = x + y;
    return xy * 2;
}

pub fn example() void {
    print("we can import this function into another file.\n", .{});
}

fn multiplyNumbers(a: i32, b: i32) i32 {
    return a * b;
}

fn takesAFunction(comptime func: fn (i32, i32) i32, x: i32, y: i32) void {
    const result = func(x, y);
    print("result of the function: {d}\n", .{result});
}

fn takesAFunctionPointer(func: *const fn (i32, i32) i32, x: i32, y: i32) void {
    const result = func(x, y);
    print("result of the function: {d}\n", .{result});
}

pub fn main() void {
    var result = addNumbers(1, 2);
    print("{d}\n", .{result});

    const x: u8 = 1;
    const y: u8 = 2;
    result = addAndDouble(x, y);
    print("{d}\n", .{result});
    const xx: i32 = 1000;
    const yy: i32 = 2000;
    result = addAndDouble(xx, yy);
    print("{d}\n", .{result});

    example();

    takesAFunction(addNumbers, 10, 10);
    takesAFunctionPointer(&addNumbers, 10, 10);
}
