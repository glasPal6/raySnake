const std = @import("std");
const display_functions = @import("display_functions.zig");

const raylib = @cImport({
    @cInclude("raylib.h");
});

const Game_State = enum {
    Title_Screen,
    Game_Screen,
    Ending_Screen,
};

pub fn main() !void {
    // Initialize the window and close it at the end
    const screen_width: i16 = 800;
    const screen_height: i16 = 800;

    raylib.InitWindow(screen_width, screen_height, "Snake!");
    defer raylib.CloseWindow();

    // Define the variables
    var game_state: Game_State = Game_State.Title_Screen;
    var game_paused: bool = false;
    _ = game_paused;
    var frame_count: u32 = 0;

    raylib.SetTargetFPS(60);

    // Run the game
    while (!raylib.WindowShouldClose()) {
        // Update Step
        try switch (game_state) {
            Game_State.Title_Screen => display_functions.display_Title_Screen(&frame_count),
            Game_State.Game_Screen => display_functions.display_Game_Screen(),
            Game_State.Ending_Screen => display_functions.display_Endingn_Screen(100),
        };
        frame_count += 1;

        // Draw Step
        raylib.BeginDrawing();
        defer raylib.EndDrawing();

        raylib.ClearBackground(raylib.BLACK);
        
        if (raylib.IsKeyReleased(raylib.KEY_ENTER)) {
            game_state = switch (game_state) {
                Game_State.Title_Screen => Game_State.Game_Screen,
                Game_State.Game_Screen => Game_State.Ending_Screen,
                Game_State.Ending_Screen => Game_State.Title_Screen,
            };
        }
    }
}
