// https://github.com/ziglang/zig/blob/master/lib/std/hash_map.zig
// zig run ".\string hashmap.zig"
// zig test "string hashmap.zig"
const std = @import("std");
const test_allocator = std.testing.allocator;
const expect = std.testing.expect;
const print = std.debug.print;

pub fn main() !void {
    var gpa: std.heap.GeneralPurposeAllocator(.{}) = .{};
    defer _ = gpa.deinit(); // <- checks for leaks at the end of scope
    const allocator = gpa.allocator();

    // std.StringHashMap is a function that returns a hashmap
    // the key will be of the type []const u8 and the value is set
    // to the type you pass in
    var map = std.StringHashMap(i32).init(allocator);

    defer map.deinit();

    try map.put("one", 1);
    try map.put("two", 2);
    try map.put("three", 3);
    try map.put("four", 4);

    var count_result = map.count();
    print("number of items in the map: {d}\n", .{count_result});

    var contains_one = map.contains("one");
    var contains_nine = map.contains("nine");
    print("contains one: {}\ncontains nine: {}\n", .{ contains_one, contains_nine });
    var value = map.get("one");

    if (value) |v| {
        print("one = {d}\n", .{v});
    } else {
        print("one does not exist\n{any}\n", .{value});
    }
    value = map.get("five");
    if (value) |v| {
        print("one = {d}\n", .{v});
    } else {
        print("five does not exist\n{any}\n", .{value});
    }

    var entry_result = map.getEntry("one");
    print("dereferend pointer to the key: {s} \n", .{entry_result.?.key_ptr.*});
    print("dereferenced pointer to the value: {d} \n", .{entry_result.?.value_ptr.*});

    var iterator = map.iterator();

    while (iterator.next()) |entry| {
        print("pointer key: {d} dereferenced pointer key {s}\n", .{ entry.key_ptr, entry.key_ptr.* });
        print("pointer value: {d} dereferenced pointer value {d}\n", .{ entry.value_ptr, entry.value_ptr.* });
    }
}
