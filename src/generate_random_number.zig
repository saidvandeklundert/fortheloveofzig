// zig run "generate_random_number.zig"
const std = @import("std");

pub fn main() !void {
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.os.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });
    const value = prng.random().intRangeAtMost(i64, 1, 100);

    std.debug.print("That's right {}", .{value});
}
