// zig run .\debugging.zig
const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    
    var string = "world";    
    std.log.debug("string variable is of the type: {}", .{@TypeOf(string)});
    debugPrinter(string);


    const Point = struct {
        x: i32,
        y: i32,
    };
    const some_point = Point{
        .x = 7,
        .y = 77,
    };    

    std.log.debug("some_point variable is of the type: {}", .{@TypeOf(some_point)});
    debugStructPrinter(some_point);  
       
    
}


fn debugPrinter(data: anytype) void {
    const T = @TypeOf(data);
    print("{}\n", .{T});
}

fn debugStructPrinter(data: anytype) void {
    const T = @TypeOf(data);
    print("type:\n\t{}\n", .{T});
    inline for (@typeInfo(T).Struct.fields) | field|{
        print("\tfield name: {s} value: {any}\n", 
            .{field.name,@field(data, field.name)});        
    }
}