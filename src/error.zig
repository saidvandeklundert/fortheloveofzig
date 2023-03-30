// zig run .\error.zig
const std = @import("std");
const print = std.debug.print;

fn isEven(number: u8) !u8 {
    if (number % 2 == 0) {
        return number;
    } else {
        return error.NotEven;
    }
}

fn useCatch(number: u8) !u8 {
    const result = isEven(number) catch |err| return err;
    return result;
}

fn useTry(number: u8) !u8 {
    const result = try isEven(number);
    print("useTry body executes for number {d}\n", .{number});
    return result;
}

pub fn main() !void {
    var result: anyerror!u8 = isEven(2);
    print("Result isEven(2):\n{any}\n", .{result});

    result = isEven(3);
    print("Result isEven(3):\n{any}\n", .{result});

    print("\n\n\n", .{});

    result = useCatch(2);
    print("Result useCatch(2):\n{any}\n", .{result});

    result = useCatch(3);
    print("Result useCatch(3):\n{any}\n", .{result});

    print("\n\n\n", .{});

    var u8_result: u8 = isEven(2) catch 0;
    print("isEven(2) catch 0;\n{any}\n", .{u8_result});
    u8_result = isEven(3) catch 0;
    print("isEven(3) catch 0;\n{any}\n", .{u8_result});

    print("\n\n\n", .{});

    result = useTry(2);
    result = useTry(3);
    print("Result useTry(3):\n{any}\n", .{result});
}
