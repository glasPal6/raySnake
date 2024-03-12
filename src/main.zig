const std = @import("std");

const raylib = @cImport({
    @cInclude("raylib.h");
});

pub fn main() !void {
    const screen_width: i16 = 800;
    const screen_height: i16 = 800;

    raylib.InitWindow(screen_width, screen_height, "Snake!");
    defer raylib.CloseWindow();

    raylib.SetTargetFPS(60);

    while (!raylib.WindowShouldClose()) {
        raylib.BeginDrawing();
        defer raylib.EndDrawing();

        raylib.ClearBackground(raylib.RAYWHITE);
        raylib.DrawText("Hello, World!", 190, 200, 20, raylib.LIGHTGRAY);
    }
}
