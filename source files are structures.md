---
layout: default
title: source files are structures
nav_order: 12
permalink: /source files are structures
---

Something that caught my eye when reading the Zig documentation is that source files are structs. The paragraph after that was also interesting so I am posting it verbatim:

```
Zig source files are implicitly structs, with a name equal to the file's basename with the extension truncated. @import returns the struct type corresponding to the file.

Declarations which have the pub keyword may be referenced from a different source file than the one they are declared in.

path can be a relative path or it can be the name of a package. If it is a relative path, it is relative to the file that contains the @import function call.
```