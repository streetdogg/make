## What is this?
A tutorial of cool `Makefile` trick to deal with a messy source code!

## The source tree
```shell
❯ tree
.
├── a
│   └── b
│       ├── c
│       │   └── d
│       │       ├── e
│       │       │   └── main.c
│       │       └── f
│       │           └── include_me.h
│       └── donothing.c
├── LICENSE
├── Makefile
└── README.md

6 directories, 6 files
```

Notice the following:
- the `main.c` is burried somewhere deep.
- the `header` file and other `source` files are also burried somewhere very deep!

## Try this

```shell
❯ make
gcc -I./a/b/c/d/f/ -c a/b/c/d/e/main.c -o a/b/c/d/e/main.o
gcc -I./a/b/c/d/f/ -c a/b/donothing.c -o a/b/donothing.o
gcc -o main a/b/c/d/e/main.o a/b/donothing.o
```

`make` does all the hard work! Then try this:
```
❯ ./main 
hello, world!
```

## The Trick

- Find all `.c` file path.
- Find all directories that have the `.h` files.
- Provide the list to compiler (`gcc`) to generate `main`

## What is what in the Makefile
| gibberish      | description |
| ----------- | ----------- |
| `PROJECT`     | Final output, set to `main`.|
| `SRC`         | List of path of `.c` files. |
| `OBJS`        | List of `.o` files (generated from `SRC`). |
| `INC`         | List of directories that have the `.h` files. |
| `INC`         | List of directories that have the `.h` files. |
| `%.o: %c`     | `.o` file depends on `.c` file with same name. Eg: `foo.o` depends on `foo.c` |
| `$^`          | All files in the dependency list. |
| `$@`          | The target. |
| `.PHONY`      | Make targets that don't depend on anything. |