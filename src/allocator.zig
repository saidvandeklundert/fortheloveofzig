// zig run ".\allocator.zig"
const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;
const Allocator = std.mem.Allocator;

// Create an allocator, allocate some memory, write to it and then free
// the memory.
pub fn main() !void {
    var gpa: std.heap.GeneralPurposeAllocator(.{}) = .{};

    // free the memory on exit:
    defer gpa.deinit();

    // initialize the allocator:
    const allocator = gpa.allocator();

    // allocate 100 bytes of memory:
    const bytes = try allocator.alloc(u8, 100);

    // print the content of the bytes:
    print("{d}\n", .{bytes});
    defer allocator.free(bytes);
    bytes[0] = 72;
    bytes[1] = 101;
    bytes[2] = 108;
    bytes[3] = 108;
    bytes[4] = 111;

    print("{s}\n", .{bytes});
}
