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
Note that `raylib` as a library will need to be installed. Currently it uses the C library, not the zig library. The `raylib` github has how to install it, and some pre-compiled binaries.

## Controls

The snake is controlled with: \
- `q` for up
- `e` for down
- `a` for left
- `i` for right \
These can be changed in the constants at the top of main.zig. \
The pace of the snake and the size of the board can also be set in the constants.



