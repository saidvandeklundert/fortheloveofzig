// zig run ".\tagged_union.zig"
// zig test ".\tagged_union.zig"
const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;

const ComplexTypeTag = enum {
    ok,
    not_ok,
};
const ComplexType = union(ComplexTypeTag) {
    ok: u8,
    not_ok: void,

    fn truthy(self: ComplexType) bool {
        return switch (self) {
            ComplexType.ok => |x_int| x_int != 0,
            ComplexType.not_ok => false,
        };
    }
};

pub fn main() !void {
    const ok = ComplexType{ .ok = 100 };
    const not_ok = ComplexType{
        .not_ok = @as(void, undefined),
    };
    handle_complex_type(ok);
    handle_complex_type(not_ok);
    print("is the tagged union truthy?: {any}\n", .{ok.truthy()});
    print("is the tagged union truthy?: {any}\n", .{not_ok.truthy()});
    const complex_array = [3]ComplexType{ ComplexType{ .ok = 1 }, ComplexType{ .not_ok = @as(void, undefined) }, ComplexType{ .ok = 0 } };
    for (complex_array) |complex_type| {
        handle_complex_type(complex_type);

        print("{any}\n", .{complex_type.truthy()});
    }
}

fn handle_complex_type(c: ComplexType) void {
    switch (c) {
        ComplexTypeTag.ok => |value| std.debug.print("ok: {}\n", .{value}),
        ComplexTypeTag.not_ok => std.debug.print("not ok\n", .{}),
    }
}

test "switch on tagged union" {
    const c = ComplexType{ .ok = 42 };
    try expect(@as(ComplexTypeTag, c) == ComplexTypeTag.ok);

    switch (c) {
        ComplexTypeTag.ok => |value| try expect(value == 42),
        ComplexTypeTag.not_ok => unreachable,
    }
}

test "get tag type" {
    try expect(std.meta.Tag(ComplexType) == ComplexTypeTag);
}
