# raySnake

## The Game

A basic, classic snake game.

## Building

```
zig build -Doptimize=ReleaseSafe
cd zig-out/bin
./raySnake
```

Zig will have to be installed. The binary can be downloaded into this directory to build the game.
Note that `raylib` as a library will need to be installed. Currently it uses the C library, not the zig library. The `raylib` github has how to install it.

## Controls

The snake is controlled with the `arrow keys`. \
The game can ge paused with "p". \
The pace of the snake can be set in the constants.
