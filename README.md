# raySnake

## The Game

A basic, classic snake game. \

## Building

```
zig build -Doptimize=ReleaseSafe
cd zig-out/bin
./raySnake
```

Note that `raylib` as a library will need to be installed. Currently it uses the C library, not the zig library. 

## Controls

The snake is controlled with the `arrow keys`. \
The game can ge paused with "p".
