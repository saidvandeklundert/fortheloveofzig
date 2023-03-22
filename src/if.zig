// zig run .\if.zig
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




