// zig run .\variables.zig
const std = @import("std");
const print = std.debug.print;


pub fn main() void {
    const immutable_number: i32 = 5;  // immutable signed 32-bit constant
    var mutable_number: u32 = 5; // mutable unsigned 32-bit variable
    mutable_number +=1;
    print("{d} {d}\n", .{immutable_number, mutable_number});
    var boolean: bool = true; // mutable boolean variable
    print("{}\n", .{boolean});
    const float: f32 = 3.14; // immutable 32-bit floating point variable
    print("{d}\n", .{float});
    var msg = "string literal"; // mutable string variable, type is inferred
    print("{s}\n", .{msg});
}