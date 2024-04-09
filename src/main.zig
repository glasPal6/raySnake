const std = @import("std");
const display_functions = @import("display_functions.zig");

const raylib = @cImport({
    @cInclude("raylib.h");
});

// --------------------------------
// Constant Variables and Structs
// --------------------------------

const SCREEN_WIDTH = 800;
const SCREEN_HEIGHT = 800;
const NO_TILES_X = 10; 
const NO_TILES_Y = 10; 
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
    head_x: u16,
    head_y: u16,
    tail_x: u16,
    tail_y: u16,
};
 
const Tile = struct {
    has_movement: Direction, 
};

pub fn main() !void 
{
    // --------------------------------
    // Initialize the window and close it at the end
    // --------------------------------

    raylib.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Snake!");
    defer raylib.CloseWindow();

    // Define the variables
    var game_state: Game_State = Game_State.Title_Screen;
    var frame_count: u32 = 0;

    var board = [_][NO_TILES_X]Tile {
        [_]Tile {
            Tile {
                .has_movement = Direction.Null,
            }
        } ** NO_TILES_Y,
    } ** NO_TILES_X;
    board[NO_TILES_X / 2][NO_TILES_Y / 2].has_movement = Direction.Up;

    var snake = Snake {
        .head_x = NO_TILES_X / 2,
        .head_y = NO_TILES_Y / 2,
        .tail_x = NO_TILES_X / 2,
        .tail_y = NO_TILES_Y / 2,
    };

    var score: u16 = 0;

    raylib.SetTargetFPS(60);

    // Run the game
    while (!raylib.WindowShouldClose()) {
        // --------------------------------
        // Update Step
        // --------------------------------
        game_state = switch (game_state) {
            Game_State.Title_Screen => blk: {
                if (raylib.IsKeyPressed(raylib.KEY_ENTER)) {
                    break :blk Game_State.Game_Screen;
                }
            },
            Game_State.Game_Screen => blk: {
                var collision: bool = false;

                // Move the snake
                switch (board[snake.tail_x][snake.tail_y].has_movement) {
                    Direction.Up => {
                        if (snake.tail_x - 1 == 0) {
                            collision = true;
                        } else {
                            board[snake.tail_x][snake.tail_y].has_movement = Direction.Null;
                            snake.tail_x -= 1;
                        }
                    },
                    Direction.Down => {
                        if (snake.tail_x + 1 == NO_TILES_X) {
                            collision = true;
                        } else {
                            board[snake.tail_x][snake.tail_y].has_movement = Direction.Null;
                            snake.tail_x += 1;
                        }
                    },
                    Direction.Left => {
                        if (snake.tail_y - 1 == 0) {
                            collision = true;
                        } else {
                            board[snake.tail_x][snake.tail_y].has_movement = Direction.Null;
                            snake.tail_y -= 1;
                        }
                    },
                    Direction.Right => {
                        if (snake.tail_y + 1 == NO_TILES_Y) {
                            collision = true;
                        } else {
                            board[snake.tail_x][snake.tail_y].has_movement = Direction.Null;
                            snake.tail_y += 1;
                        }
                    },
                    Direction.Null => {},
                }
                switch (board[snake.tail_x][snake.tail_y].has_movement) {
                    Direction.Up => {
                        if (snake.tail_x - 1 == 0) {
                            collision = true;
                        } else {
                            board[snake.tail_x][snake.tail_y].has_movement = Direction.Null;
                            snake.tail_x -= 1;
                        }
                    },
                    Direction.Down => {
                        if (snake.tail_x + 1 == NO_TILES_X) {
                            collision = true;
                        } else {
                            board[snake.tail_x][snake.tail_y].has_movement = Direction.Null;
                            snake.tail_x += 1;
                        }
                    },
                    Direction.Left => {
                        if (snake.tail_y - 1 == 0) {
                            collision = true;
                        } else {
                            board[snake.tail_x][snake.tail_y].has_movement = Direction.Null;
                            snake.tail_y -= 1;
                        }
                    },
                    Direction.Right => {
                        if (snake.tail_y + 1 == NO_TILES_Y) {
                            collision = true;
                        } else {
                            board[snake.tail_x][snake.tail_y].has_movement = Direction.Null;
                            snake.tail_y += 1;
                        }
                    },
                    Direction.Null => {},
                }

                // Change the game state if the snake collides
                if (collision) {
                    break :blk Game_State.Ending_Screen;
                }
            },
            Game_State.Ending_Screen => blk: {
                if (raylib.IsKeyPressed(raylib.KEY_ENTER)) {
                    break :blk Game_State.Title_Screen;
                }
            },
        };
        frame_count += 1;

        // --------------------------------
        // Draw Step
        // --------------------------------
        raylib.BeginDrawing();
        defer raylib.EndDrawing();

        raylib.ClearBackground(raylib.BLACK);
        
        try switch (game_state) {
            Game_State.Title_Screen => display_functions.display_Title_Screen(frame_count),
            Game_State.Game_Screen => display_functions.display_Game_Screen(),
            Game_State.Ending_Screen => display_functions.display_Endingn_Screen(score, frame_count),
        };
    }
}
