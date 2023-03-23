// zig test test.zig
const std = @import("std");
const assert = std.debug.assert;
const testing = std.testing;

pub fn multiply(a: i32, b: i32) i32 {
    return a * b;
}

test "multipy using assert"{
    assert (multiply(2, 2) == 4);
}

test "multiply using expectEqual" {
    try std.testing.expectEqual(multiply(2, 3), 8);
}

test "multiply using expect"{
    try std.testing.expect(multiply(2,2) == 4);
}

const Person = struct {
    name: []const u8,
    age: u8,

    pub fn new(name: []const u8, age:u8) Person {
        return Person {
            .name = name,
            .age = age,
        };
    }
};
test "person creation and field access" {
    const jan = Person.new("Jan", 7);
    try std.testing.expect(jan.age == 7);
    assert( std.mem.eql(u8, jan.name, "Jan"));
}