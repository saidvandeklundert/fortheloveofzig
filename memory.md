

Stack memory is handled by the compiler. The compiler allocates memory for local variables and function parameters on the stack. The compiler also allocates memory for function calls and returns. The compiler is responsible for freeing this memory when the function returns.

It would be easy to do everything on the stack. Unfortunately, that is not possible. When you would only use stack memory, generally, some of the problems you would run into would be:
- fixed lifetimes where variables only exist for the duration of the function (or block as is the case in Zig)
- fixed size, the stack cannot grow or shrink
- limited size would prevent us from working with large data structures


So if not on the stack, then where do we put the data?

The answer is the heap. The programmer is responsible for allocating and freeing memory on the heap. The heap is not that limited in size, and can grow and shrink as needed. The heap is also not limited in lifetime, and can outlive the function that allocated it.

And how do we allocate memory on the heap? We ask the OS to give our program some memory.

In Zig, we can use the existing and provided allocators or we can choose to write our own.


## Alloctor

- free / alloc: allocate memmory for slices
- create / destroy: allocate memmory for single items

## memory allocation strategies:

- don't
- let the OS do it

