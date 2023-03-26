// zig run .\defer.zig
const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    {
        defer print("executes at the end of the scope\n", .{});
        print("Hello world!\n", .{});
    }
    deferring_something();
    stacked_defers();
    try allocate_and_free_memory();
}

fn deferring_something() void {
    defer print("clean up some resources\n", .{});
    print("this runs prior to the defer statement\n", .{});
}

fn stacked_defers() void {
    defer print("deferred 1\n", .{});
    defer print("deferred 2\n", .{});
    defer print("deferred 3\n", .{});
    print("The last defer statement is executed first\n", .{});
}

fn allocate_and_free_memory() !void {
    const allocator = std.heap.page_allocator;

    const hundred_bytes = try allocator.alloc(u8, 100);
    defer allocator.free(hundred_bytes);
    print("Use the hundred_bytes while relying on defer to clean up.\n", .{});
}
