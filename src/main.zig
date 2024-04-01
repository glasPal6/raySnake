const std = @import("std");
const display_functions = @import("display_functions.zig");

const raylib = @cImport({
    @cInclude("raylib.h");
});

// --------------------------------
// Constant Variables and Structs
// --------------------------------

const NO_TILES_X = 50; 
const NO_TILES_Y = 50; 
const SNAKE_WAIT_TIME = 0.5;

const Game_State = enum {
    Title_Screen,
    Game_Screen,
    Ending_Screen,
};

const Direction = enum {
    Up, Down,
    Left, Right,
    Null
};

const Snake = struct {
    head_x: i16,
    head_y: i16,
    tail_x: i16,
    tail_y: i16,
    direction: Direction,
};
 
const Tile = struct {
    has_movement: Direction, 
};

pub fn main() !void {
    // --------------------------------
    // Initialize the window and close it at the end
    // --------------------------------
    const screen_width: i16 = 800;
    const screen_height: i16 = 800;

    raylib.InitWindow(screen_width, screen_height, "Snake!");
    defer raylib.CloseWindow();

    // Define the variables
    var game_state: Game_State = Game_State.Title_Screen;
    var game_paused: bool = false;
    _ = game_paused;
    var frame_count: u32 = 0;

    const snake = Snake {
        .head_x = NO_TILES_X / 2,
        .head_y = NO_TILES_Y / 2,
        .tail_x = NO_TILES_X / 2,
        .tail_y = NO_TILES_Y / 2,
        .direction = Direction.Up,
    };
    _ = snake;

    raylib.SetTargetFPS(60);

    // Run the game
    while (!raylib.WindowShouldClose()) {
        // --------------------------------
        // Update Step
        // --------------------------------
        if (raylib.IsKeyReleased(raylib.KEY_ENTER)) {
            game_state = switch (game_state) {
                Game_State.Title_Screen => Game_State.Game_Screen,
                Game_State.Game_Screen => Game_State.Ending_Screen,
                Game_State.Ending_Screen => Game_State.Title_Screen,
            };
        }
        frame_count += 1;

        // --------------------------------
        // Draw Step
        // --------------------------------
        raylib.BeginDrawing();
        defer raylib.EndDrawing();

        raylib.ClearBackground(raylib.BLACK);
        
        try switch (game_state) {
            Game_State.Title_Screen => display_functions.display_Title_Screen(&frame_count),
            Game_State.Game_Screen => display_functions.display_Game_Screen(),
            Game_State.Ending_Screen => display_functions.display_Endingn_Screen(100),
        };
    }
}
