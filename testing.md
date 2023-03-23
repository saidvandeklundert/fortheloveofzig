---
layout: default
title: testing
nav_order: 6
permalink: /testing
---

An example of a few different ways to unit test a function would be the following:

```zig
const std = @import("std");
const assert = std.debug.assert;
const testing = std.testing;

pub fn multiply(a: i32, b: i32) i32 {
    return a * b;
}

test "multiply using expectEqual" {
    try std.testing.expectEqual(multiply(2, 3), 6);
}

test "multiply using expect"{
    try std.testing.expect(multiply(2,2) == 4);
}

test "multipy using assert"{
    assert (multiply(2, 2) == 4);
    assert (multiply(3, 3) == 9);
}
```

We use `assert` from `std.debug` and `expectEqual`/`expect` from `std.testing`. 

The output of the tests is somewhat primitive. When a test using `expectEqual` fails, we see the following:

```
Test [2/4] test.multiply using expectEqual... expected 6, found 8
```

The `assert` and `expect` simply display the name of the test and the failure. 

A test block counts as a single test case. We can put multiple tests into a single test block.

To run tests, we use `zig test <filename>`. When we execute the tests above, we get the following output:
```
zig test test.zig
All 3 tests passed.
```

Testing a struct and a method could look like this:

```zig
const std = @import("std");
const assert = std.debug.assert;

const Person = struct {
    name: []const u8,
    age: u8,

    pub fn new(name: []const u8, age:u8) Person {
        return Person {
            .name = name,
            .age = age,
        };
    }
};
test "person creation and field access" {
    const jan = Person.new("Jan", 7);
    try std.testing.expect(jan.age == 7);
    assert( std.mem.eql(u8, jan.name, "Jan"));
}
```


[index](index.md)