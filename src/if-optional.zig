// zig run .\if-optional.zig
const std = @import("std");
const print = std.debug.print;


pub fn main() !void {
    const number:i32 =123;
    
    if (number == 123) {
        print("The number is {}\n", .{number});
    } 

    booleanIf(1);
    booleanIf(2);
    booleanIf(3);
    booleanIf(4);

    const optional_a: ?u8 = 10;
    const optional_b: ?u8 = null;
    optionalIf(optional_a);
    optionalIf(optional_b);

    const a: anyerror!?u8 = 10;
    const b: anyerror!?u8 = null;
    const c: anyerror!?u8 = error.MajorError;
    errorUnionWithOptional(a);
    errorUnionWithOptional(b);
    errorUnionWithOptional(c);

    

}


fn isNumber2(number:i32) bool {
    return number == 2;
}

fn booleanIf(number:i32) void {
    if (number == 1) {
        print("The number is 1!\n", .{});

    } else if (isNumber2(number)) {
        print("The number is 2!\n", .{});

    } else {
        print("The number is something else: {}\n", .{number});
    }
}

fn optionalIf(optional: ?u8) void {
    if (optional) |value| {
        print("optional gives {}\n", .{value});
    } else {
        print("optional is null\n", .{});
    }
}

fn errorUnionWithOptional(a: anyerror!?u8) void {
    if (a) |value| {
        var non_null = value orelse 0;
        print("errorUnionWithOptional gives {?}\n", .{non_null});
    } else |err| {
        print("errorUnionWithOptional gives an error: {?}\n", .{err});
    }
}



