// zig run .\structs.zig
const std = @import("std");
const print = std.debug.print;

const Person = struct {
    name: []const u8,
    age: u8,
};

fn newPerson(name: []const u8, age: u8) Person {
    return Person{
        .name = name,
        .age = age,
    };
}

fn newPersonPointer(name: []const u8, age: u8) *Person {
    var person = Person{
        .name = name,
        .age = age,
    };
    return &person;
}

pub fn main() void {
    var jan = Person{
        .name = "Jan",
        .age = 7,
    };
    print("jan.name: {s}\n", .{jan.name});
    print("jan.age: {d}\n", .{jan.age});
    jan.age = 17;
    print("jan.age after the change: {d}\n", .{jan.age});
    var marie = newPerson("Marie", 4);
    print("marie.name: {s}\nmarie.age: {d}\n", .{ marie.name, marie.age });
    setAge(&marie, 5);
    print("marie.name: {s}\nmarie.age: {d}\n", .{ marie.name, marie.age });

    print("marie.name after another: {s}\nmarie.age: {d}\n", .{ marie.name, marie.age });
    var anne = newPerson("Anne", 38);
    print("anne.name: {s}\nanne.age: {d}\n", .{ anne.name, anne.age });

    var said: *Person = newPersonPointer("Said", 38);
    print(
        "marie is of the type {any}\nsaid is of the type {any}\n",
        .{ @TypeOf(marie), @TypeOf(said) },
    );

    var default_point = Point{};
    print("default_point.x: {d}\ndefault_point.y: {d}\n", .{ default_point.x, default_point.y });
    default_point.x = 1;
    default_point.y = 2;
    print("default_point.x: {d}\ndefault_point.y: {d}\n", .{ default_point.x, default_point.y });

    var traveler_jan = Character{
        .name = "Jan",
        .age = 27,
        .backpack = BackPack{
            .items = [_][]const u8{ "cheese", "ring", "potion", "map", "torch" },
        },
        .class = Class.traveler,
    };
    print("{s} is a {s} and is carrying: {s}", .{ traveler_jan.name, @tagName(traveler_jan.class), traveler_jan.backpack.items });
}

fn setAge(person: *Person, age: u8) void {
    person.age = age;
}

const Point = struct {
    x: i32 = 0,
    y: i32 = 0,
};

const Character = struct {
    name: []const u8,
    age: u8,
    backpack: BackPack,
    class: Class,
};

const BackPack = struct {
    items: [5][]const u8,
};

const Class = enum {
    traveler,
    artist,
    sde,
};
