---
layout: default
title: Hello world
nav_order: 1
permalink: /hello-world
---


```zig
const std = @import("std");

pub fn main() void {
    std.debug.print("Hello, {s}!\n", .{"World"});
}
```

To compile and run the example from the repository, use <b>zig run .\hello_world.zig</b>. 


```
$ zig run .\hello_world.zig
Hello, World!
```

In addition to the Zig hello world programm, there are also the C and CPP examples in the repo.


```c
#include <stdio.h>
int main(int argcount, char **argv)
{
    printf("Hello world!\n");

    printf("Compiled using 'zig cc .\\hello_world.c -o hello_world.exe'");
    return 0;
}
```

To compile this program on Windows:

```
zig cc .\hello_world.c -o hello_world.exe
```

The C++ version of the program:

```cpp
#include <iostream>

int main() {
    std::cout << "Hello World!";
    return 0;
}
```

To compile the CPP version on Windows:

```
zig c++ .\hello_world.cpp -o hello_world_cpp.exe
```


[variables](variables.md)
