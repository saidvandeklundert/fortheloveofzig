---
layout: default
title: Structs
nav_order: 9
permalink: /structs
---


A struct is a way to group (related) data together. A struct is a composite data type and it allows you to define types that can store a fixed set of named fields.

Zig allows for different types of structs, but we will focus on the most common and basic one: `struct`.

Defining a struct can be done as follows:

```zig
const Person = struct {
    name: []const u8,
    age: u8,
};
```

This is a basic struct that contains two fields: `name` and `age`. The `name` field is a `[]const u8` and the `age` field is a `u8`.

Here is an example where we instantiate a `Person` struct and access its fields:

```zig
var jan = Person{
    .name = "Jan",
    .age = 7,
};

print("jan.name: {s}\n", .{jan.name});
print("jan.age: {d}\n", .{jan.age});
```    

This outputs the following:
```
jan.name: Jan
jan.age: 7
```

We can also access the field to change the value:

```zig
jan.age = 17;
```

A function can be made to return a struct/struct pointer:

```zig
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

var marie = newPerson("Marie", 4);
var said: *Person = newPersonPointer("Said", 38);

print(
    "marie is of the type {any}\nsaid is of the type {any}\n",
    .{ @TypeOf(marie), @TypeOf(said) },
);
```

This prints the following to console:

```
said is of the type *structs.Person
marie is of the type structs.Person
```


Structs can also be passed to functions as arguments. When we define a function that takes the struct type, we are able to access the struct fields. However, we will not be able to mutate any of the fields. If we want to pass a struct to a function and mutate any of the fields, we need to declare the function to take a pointer to the struct type:

```zig
fn setAge(person: *Person, age: u8) void {
    person.age = age;
}

var marie = newPerson("Marie", 4);

print("marie.name: {s}\nmarie.age: {d}\n", .{ marie.name, marie.age });
setAge(&marie, 5);
print("marie.age after setAge: {d}\n", .{marie.age});
```

The above code prints the following to console:

```
marie.age: 4
marie.age after setAge: 5
```

A struct can be given default values:

```
const Point = struct {
    x: i32 = 0,
    y: i32 = 0,
};
```


Structs can be used to express more complicated types and collections then what we have shown so far. For instance, a struct can contain other structs, enums and more. 

Here is a more complex example of a struct:

```zig
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
```

To instantiate a `Character` struct, we can do the following:

```zig
var traveler_jan = Character{
    .name = "Jan",
    .age = 27,
    .backpack = BackPack{
        .items = [_][]const u8{ "cheese", "ring", "potion", "map", "torch" },
    },
    .class = Class.traveler,
};
print("{s} is a {s} and is carrying: {s}", .{ traveler_jan.name, @tagName(traveler_jan.class), traveler_jan.backpack.items });
```

Giving us:

```
Jan is a traveler and is carrying: { cheese, ring, potion, map, torch }
```

Though in this example the struct was assembled in a single statement, it is possible to assemble the struct in another way. For instance, by assembling the struct in multiple steps or by following a builder pattern where several functions or methods build the struct.


Full code is [here](https://github.com/saidvandeklundert/fortheloveofzig/blob/dev/src/structs.zig).