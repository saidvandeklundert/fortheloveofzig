// zig run ".\allocators.zig"
const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;
const Allocator = std.mem.Allocator;

pub fn main() !void {

    // using a fixed buffer allocator:
    var buffer: [10]u8 = undefined;
    var fb_allocator = std.heap.FixedBufferAllocator.init(&buffer);
    var fixed_buffer_allocator = fb_allocator.allocator();
    try takes_allocator(&fixed_buffer_allocator);
    // Using an arena allocator:
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    var arena_allocator = arena.allocator();
    try takes_allocator(&arena_allocator);
    // Using a general purpose allocator:
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var gpa_allocator = gpa.allocator();
    try takes_allocator(&gpa_allocator);
}

// function that receives an allocator, uses it to claim memory and then writes some data to it
fn takes_allocator(allocator: *Allocator) !void {
    const memory = try allocator.alloc(u8, 5);
    defer allocator.free(memory);
    print("{d}\n", .{memory});
    memory[0] = 72;
    memory[1] = 101;
    memory[2] = 108;
    memory[3] = 108;
    memory[4] = 111;

    print("{s}\n", .{memory});
}

fn later() void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        const deinit_status = gpa.deinit();
        //fail test; can't try in defer as defer is executed after we return
        if (deinit_status == .leak) expect(false) catch @panic("TEST FAIL");
    }

    const bytes = try allocator.alloc(u8, 100);
    defer allocator.free(bytes);
}
