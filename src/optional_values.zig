// zig run "optional_values.zig"
const std = @import("std");
const assert = std.debug.assert;
const print = std.debug.print;
const RndGen = std.rand.DefaultPrng;

pub fn main() !void {

    // optional value is declared by prefixing the type with a question mark:
    var optional_hello_world: ?[]const u8 = null;

    print("\noptional_hello_world\n\ttype: {}\n\tvalue: {?s}\n", .{
        @TypeOf(optional_hello_world), optional_hello_world,
    });

    optional_hello_world = "hello world!";

    print("\noptional_hello_world\n\ttype: {}\n\tvalue: {?s}\n", .{
        @TypeOf(optional_hello_world), optional_hello_world,
    });

    // optional struct value:
    const Person = struct {
        name: []const u8,
        age: ?u8,
    };
    const jan = Person{
        .name = "Jan",
        .age = 7,
    };

    const marie = Person{
        .name = "Marie",
        .age = null,
    };

    print("{s} {?}\n", .{ jan.name, jan.age });
    print("{s} {?}\n", .{ marie.name, marie.age });

    // optional return:
    var number: u8 = try getRandomNumber();
    print("{?}\n", .{possibleNumber(number)});

    print("{?}\n", .{possibleNumber(200)});
    print("{?}\n", .{possibleNumber(1)});
}

fn possibleNumber(number: u8) ?u8 {
    if (number > 127) {
        return null;
    }
    return number * 2;
}

fn getRandomNumber() !u8 {
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.os.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });
    const random_number = prng.random().intRangeAtMost(u8, 1, 200);
    return random_number;
}
