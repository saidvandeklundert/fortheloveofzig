// zig run ".\read_file.zig"
const std = @import("std");
const fs = std.fs;
const print = std.debug.print;

const Allocator = std.mem.Allocator;

pub fn main() anyerror!void {
    const file_name = "data/some_words.txt";

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    var arena_allocator = arena.allocator();

    try line_printer(arena_allocator, file_name);
    try print_lines(arena_allocator, file_name);
    try print_lines_reader(file_name);
}

// read a file, line by line, and print it to stdout
fn line_printer(allocator: Allocator, file_name: []const u8) !void {
    var f = try fs.cwd().openFile(file_name, .{});
    defer f.close();

    const stdout = std.io.getStdOut().writer();

    while (true) {
        if (f.reader().readUntilDelimiterAlloc(allocator, '\n', 1024)) |line| {
            try stdout.print("{s}\n", .{line});
            allocator.free(line);
        } else |err| {
            try stdout.print("error: {any}\n", .{err});
            break;
        }
    }
}

// read a file, line by line, and print it to stdout
fn print_lines(allocator: Allocator, file_name: []const u8) !void {
    var f = try fs.cwd().openFile(file_name, .{});
    defer f.close();

    // Read the contents, fails in case the file is larger than 2000 bytes:
    const max_bytes = 2000;
    const file_buffer = try f.readToEndAlloc(allocator, max_bytes);
    defer allocator.free(file_buffer);

    // Split by "\n" and iterate through the resulting slices of "const []u8"
    var iter = std.mem.split(u8, file_buffer, "\n");

    var count: usize = 0;
    while (iter.next()) |line| : (count += 1) {
        print("{s}\n", .{line});
    }
}

// using a buffered reader:
fn print_lines_reader(file_name: []const u8) !void {
    var file = try std.fs.cwd().openFile(file_name, .{});
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();

    var buffer: [2048]u8 = undefined;
    while (try in_stream.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        print("{s}\n", .{line});
    }
}
