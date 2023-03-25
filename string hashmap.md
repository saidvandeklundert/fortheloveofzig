---
layout: default
title: String Hashmap
nav_order: 6
permalink: /string hashmap
---

Hashmap, hashes, maps or dicts as they are sometimes called. Zig has them on offer and the one discussed in this example is the `StringHashMap`. The `StringHashMap` is a hashmap where the key `must` be a string. The value is a generic type specified upon instantiation. In addition to specifying the value type, we also need to specify the allocator.

The `StringHashMap` is implemented in the standard library. In the following example, we:
- instantiate an allocator
- create a `StringHashMap` that can store `i32` values

```zig
const std = @import("std");
const test_allocator = std.testing.allocator;

var gpa: std.heap.GeneralPurposeAllocator(.{}) = .{};
defer _ = gpa.deinit(); // <- checks for leaks at the end of scope
const allocator = gpa.allocator();

var map = std.StringHashMap(i32).init(allocator);

defer map.deinit();
```

Now that we have the map, we can add some key/values to it:

```zig
try map.put("one", 1);
try map.put("two", 2);
try map.put("three", 3);
try map.put("four", 4);
```

Printing out the number of items in the map could be done like so:

```
var count_result = map.count();
print("number of items in the map: {d}\n", .{count_result});
```

In our case, we would get the following:

```
number of items in the map: 4
```

To test the map for the existence of a key, we can use the `contains` method:

```zig
var contains_one = map.contains("one");
var contains_nine = map.contains("nine");
print("contains one: {}\ncontains nine: {}\n", .{ contains_one, contains_nine });
```

This would print out:

```
contains one: true
contains nine: false
```

Safely accessing a value in the map can be done using get:

```zig
var value = map.get("one");

if (value) |v| {
    print("one = {d}\n", .{v});
} else {
    print("one does not exist\n{any}\n", .{value});
}
```

This would give us:

```
one = 1
```

We can also retrieve the key and the value from the map. This is done using the `getEntry` method. The `getEntry` method returns the `Entry` struct which is defined as follows:

```zig
pub const Entry = struct {
    key_ptr: *K,
    value_ptr: *V,
};
```

Notice that the fields in the `Entry` struct contain pointers to the key and the value in the map.

Here is an example where we retrieve the key and the value from the map and print that to console:

```zig
var entry_result = map.getEntry("one");
print("dereferend pointer to the key: {s} \n", .{entry_result.?.key_ptr.*});
print("dereferenced pointer to the value: {d} \n", .{entry_result.?.value_ptr.*});
```

This gives us:

```
dereferend pointer to the key: one
dereferenced pointer to the value: 1
```

We can also iterate the map to work with the key/value pairs. To do this, we first create an iterator. Then, we use a while loop to exhaust the iterator and perform some action on the key/value pairs. 

In the next example, we iterate the map and print the key and the value to console:

```zig
var iterator = map.iterator();

while (iterator.next()) |entry| {
    print("pointer key: {d} dereferenced pointer key {s}\n", .{ entry.key_ptr, entry.key_ptr.* });
    print("pointer value: {d} dereferenced pointer value {d}\n", .{ entry.value_ptr, entry.value_ptr.* });
}
```

This prints the following to console:

```
pointer key: []const u8@17c0cd50030 dereferenced pointer key four
pointer value: i32@17c0cd500a4 dereferenced pointer value 4
pointer key: []const u8@17c0cd50040 dereferenced pointer key one
pointer value: i32@17c0cd500a8 dereferenced pointer value 1
pointer key: []const u8@17c0cd50050 dereferenced pointer key three
pointer value: i32@17c0cd500ac dereferenced pointer value 3
pointer key: []const u8@17c0cd50060 dereferenced pointer key two
pointer value: i32@17c0cd500b0 dereferenced pointer value 2
```

The entire source code is [here](https://github.com/saidvandeklundert/fortheloveofzig/blob/dev/src/string%20hashmap.zig).