// zig run ".\binary search.zig"
const std = @import("std");
// checkout std.sort.binarySearch for comparison
const print = std.debug.print;
pub fn main() void {
    const array_of_int = [5]i32{ 1, 2, 3, 4, 5 };

    print("result: {any}\n", .{binarySearch(&array_of_int, 3)});
    print("result: {any}\n", .{binarySearch(&array_of_int, 6)});
}

fn binarySearch(array: []const i32, target: i32) ?usize {
    var low: usize = 0;
    var high: usize = array.len - 1;
    while (low <= high) {
        const mid: usize = low + (high - low) / 2;

        if (array[mid] == target) {
            return mid;
        } else if (array[mid] < target) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    return null;
}
