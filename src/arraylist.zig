// zig run ".\arraylist.zig"
const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;
const Allocator = std.mem.Allocator;
const ArrayList = std.ArrayList;
// Create an allocator, allocate some memory, write to it and then free
// the memory.
pub fn main() !void {
    var gpa: std.heap.GeneralPurposeAllocator(.{}) = .{};

    defer _ = gpa.deinit();

    const allocator = gpa.allocator();

    const bytes = try allocator.alloc(u8, 100);

    print("{d}\n", .{bytes});
    defer allocator.free(bytes);

    print("{s}\n", .{bytes});
    var list = ArrayList(u8).init(allocator);
    defer list.deinit();
    try list.append('H');
    try list.append('e');
    try list.append('l');
    try list.append('l');
    try list.append('o');
    try list.appendSlice(" World!");
    print("{s}\n", .{list.items});
}
