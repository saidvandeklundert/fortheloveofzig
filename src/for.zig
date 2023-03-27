// zig run ".\for.zig"
const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const array = [_]u8{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    var slice_end: usize = 4;
    var slice = array[1..slice_end];

    for (array) |element| {
        print("{d} ", .{element});
    }
    print("\n", .{});
    for (slice) |element| {
        print("{d} ", .{element});
    }
    print("\n", .{});
    for (array, 0..) |element, index| {
        print("{d} is at index {d}\n", .{ element, index });
    }

    for (array, 0..) |_, index| {
        print("{d} ", .{index});
    }
    print("\nDemonstrate continue and break:\n", .{});
    for (array) |element| {
        if (element % 2 == 0) {
            continue;
        } else if (element >= 6) {
            break;
        }
        print("{d} ", .{element});
    }
}
