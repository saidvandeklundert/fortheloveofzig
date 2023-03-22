// zig run .\arrays.zig
const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    
    // array declaration:
    const array_of_int = [5]i32{1, 2, 3, 4, 5};
    const element = array_of_int[1];
    
    print("array_of_int: {d}\n", .{array_of_int});
    print("array_of_int[1]: {}\n", .{element});
    
    // retrieve the length of an array:
    const length = array_of_int.len; 
    print("length of array: {}\n", .{length});  

    // let the compiler infer the length of the array:
    const bytes = [_]u8{ 104, 101, 108, 108, 111 };
    print("bytes {d} can also be read as {s}\n", .{bytes, bytes});
    
    // iterate over the array:
    for (bytes) |byte| {
        print("{c}\n", .{byte});
    }    
    
    // mutable array:
    var mut_array_of_int = [5]i32{1, 2, 3, 4, 5};
    mut_array_of_int[0] = 65000;
    print("{any}\n", .{mut_array_of_int});  

    // initializing arrays with default values:
    var buff = [_]u8{0} ** 10;
    var message = [_]u8{'a'} ** 5; 
    print("buff: {d}\nmessage: {s}\n", .{buff, message});  

    // 2D arrays:
    var array2d = [_][3]i32{
    [_]i32{ 0, 0, 0 },
    [_]i32{ 0, 0, 1  },
    [_]i32{ 0 } ** 3,
    };    
    print("array2d[1][2]: {d}\n", .{array2d[1][2]});
    print("array2d:\n", .{});  
    for (array2d) |array| {
        print("{d}\n", .{array});
    }  

}
