---
layout: default
title: Tagged Unions
nav_order: 14
permalink: /tagged unions
---

A union is a data structure that can hold a value which can take on several different, but fixed, types. A tagged union, aka variant or choice type, is a union that also contains a tag to explicitly indicate which of the types is in use.

Why do we have this? 

Typesafety.

Take the union type in C. There, a union type is a bit of memory that overlaps the layout of 2 different types. To represent the union of an 8-bit and 16-bit integer, the compiler will use 16 bits. The problem with this is you cannot know, based on the value in that memory location, whether or not that value should be interpreted as an 8- or 16- bits integer.

In order to differentiate between the two, a tag is added to the union and this tag indicated how certain values in memory should be interpreted.

Take the tagged union example from the Zig docs:


```
const ComplexTypeTag = enum {
    ok,
    not_ok,
};
const ComplexType = union(ComplexTypeTag) {
    ok: u8,
    not_ok: void,
};
```

It starts of declaring an enum to represent the tags in `ComplexTypeTag`. After this, the union type is specified as a `ComplexType`. It takes the previously specified tag, and it then specifies the union as either `ok` (u8) or `not_ok` (void).


We can declare variables of that `ComplexType` like so:

```
const ok = ComplexType{ .ok = 100 };
const not_ok = ComplexType{
    .not_ok = @as(void, undefined),
};
```

When we start passing variables of this type around in our program, we can use a `switch` statement to work with the different types in the union:

```
fn handle_complex_type(c: ComplexType) void {
    switch (c) {
        ComplexTypeTag.ok => |value| std.debug.print("ok: {}\n", .{value}),
        ComplexTypeTag.not_ok => std.debug.print("not ok\n", .{}),
    }
}

handle_complex_type(ok);
handle_complex_type(not_ok);
```

The above will output the following:

```
ok: 100
not ok
```

It is also possible for us to put methods on tagged unions. A modified example from the Zig docs:

```
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
```

The tagged union now has a truthy method that you can call:
```
print("is the tagged union truthy?: {any}\n", .{ok.truthy()});
```

This will output:

```
is the tagged union truthy?: true
```


This code, and more on tagged unions, can be found [here](https://github.com/saidvandeklundert/fortheloveofzig/blob/dev/src/tagged_union.zig).