// zig run ".\slice.zig"
// zig test "string slice.zig"
const expect = @import("std").testing.expect;
const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    var backing_array = [6]i32{ 1, 2, 3, 4, 5, 6 };
    var slice = backing_array[2..5];

    print("element 1: {d}\n", .{slice[0]});
    print("slice length: {d}\n", .{slice.len});

    for (slice) |element| {
        print("element: {}\n", .{element});
    }

    var not_a_slice = backing_array[0..3];
    print("not_a_slice: {}\n", .{@TypeOf(not_a_slice)});
    const array_ptr = &backing_array;
    const slice_ptr = &slice;
    const not_a_slice_ptr = &not_a_slice;
    print("array_ptr: {any}\n, slice_ptr: {any}\nnot_a_slice_ptr: {any}\n", .{ array_ptr, slice_ptr, not_a_slice_ptr });

    print("is 'not_a_slice' a slice?: {}\n", .{(@TypeOf(not_a_slice) == []i32)});
    print("is a 'slice' a slice?: {}\n", .{(@TypeOf(slice) == []i32)});

    print("slice is of the type: {}\n", .{@TypeOf(slice)});
    print("not_a_slice is of the type: {}\n", .{@TypeOf(not_a_slice)});
    print("backing_array is of the type: {}\n", .{@TypeOf(backing_array)});
    // print("Slices have array bounds checking.{}\n", .{slice[100]});
}
