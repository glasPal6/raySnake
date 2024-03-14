const std = @import("std");

const raylib = @cImport({
    @cInclude("raylib.h");
});

const Game_State = enum {
    Title_Screen,
    Game_Screen,
    Ending_Screen,
};

const Snake_Cell = struct {
    active: bool = false,
    position: raylib.Vector2 = raylib.Vector2{
        .x = 0,
        .y = 0,
    },
    head: bool = false,
};

pub fn main() !void {
    // Initialize the window and close it at the end
    const screen_width: i16 = 800;
    const screen_height: i16 = 800;

    raylib.InitWindow(screen_width, screen_height, "Snake!");
    defer raylib.CloseWindow();

    // Define the variables
    var game_state: Game_State = Game_State.Title_Screen;
    _ = game_state;
    var game_paused: bool = false;
    _ = game_paused;

    var snake = [_]Snake_Cell{Snake_Cell{}} ** (@as(i32, 100) * 100);

    snake[0] = Snake_Cell{
        .head = true,
        .active = true, 
        .position = raylib.Vector2{ .x = screen_width / 2, .y = screen_height / 2 } 
    };

    raylib.SetTargetFPS(60);

    // Run the game
    while (!raylib.WindowShouldClose()) {
        raylib.BeginDrawing();
        defer raylib.EndDrawing();

        raylib.ClearBackground(raylib.RAYWHITE);
        raylib.DrawText("Hello, World!", 190, 200, 20, raylib.LIGHTGRAY);
    }
}
