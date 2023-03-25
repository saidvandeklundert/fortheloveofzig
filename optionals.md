---
layout: default
title: Optionals
nav_order: 8
permalink: /optionals
---

In Zig, a value is turned into an optional value by prefixing the type in the declaration with a question mark. Turning a regular `[]const u8` into an optional is done by declaring it as `?[]const u8`. 

In the following code, we declare an optional `[]const u8` and assign it a null value. After printing the value, we assign the value a string and print it again:

```zig
var optional_hello_world: ?[]const u8 = null;

print("\noptional_hello_world\n\ttype: {}\n\tvalue: {?s}\n", .{
    @TypeOf(optional_hello_world), optional_hello_world,
});

optional_hello_world = "hello world!";

print("\noptional_hello_world\n\ttype: {}\n\tvalue: {?s}\n", .{
    @TypeOf(optional_hello_world), optional_hello_world,
});
```

This will print the following:

```
optional_hello_world
        type: ?[]const u8
        value: null

optional_hello_world
        type: ?[]const u8
        value: hello world!
```

Struct fields can also be marked as an optional value. This is done like so:
```zig
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
```

This gives us the following:

```
Jan 7
Marie null
```


Like variables and struct fields, function returns are no different. They too can be made optional by prefixing the type with a question mark.

```zig
fn possibleNumber(number: u8) ?u8 {
    if (number > 127) {
        return null;
    }
    return number * 2;
}

print("{?}\n", .{possibleNumber(200)});
print("{?}\n", .{possibleNumber(1)});
```

This outputs the following:

```
null
2
```

Runnable code can be found [here](https://github.com/saidvandeklundert/fortheloveofzig/blob/dev/src/optional_values.zig).