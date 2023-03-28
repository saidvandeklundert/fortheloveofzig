---
layout: default
title: naming conventions
nav_order: 11
permalink: /naming conventions
---

Types are PascalCase:

```zig
const Person = struct {
    name: []const u8,
    age: u8,
};
```

Functions are camelCase:

```zig
fn addNumbers(a: i32, b: i31) i32 {
    return a + b;
}
```

Variables are lowercase with underscores:

```zig
const array_of_int = [5]i32{1, 2, 3, 4, 5};
```

File names and directories are snakecase. For files, there is an exception. When the file exists to 
The previous files.

```
some_dir/some_file.zig
some_dir/TypeName.zig
```

