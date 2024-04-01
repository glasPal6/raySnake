const std = @import("std");
const raylib = @cImport({
    @cInclude("raylib.h");
});

pub fn display_Title_Screen(frame_count: *u32) void {
    // Draw the title screen
    raylib.DrawText("SNAKE",
                    @divFloor(raylib.GetScreenWidth(), 2) - @divFloor(raylib.MeasureText("SNAKE", 80), 2),
                    @divFloor(raylib.GetScreenHeight(), 2) - 100, 
                    80, raylib.GREEN
    );
    raylib.DrawText("Use the arrow keys to navigate",
                    @divFloor(raylib.GetScreenWidth(), 2) - @divFloor(raylib.MeasureText("Use the arrow keys to navigate", 20), 2),
                    @divFloor(raylib.GetScreenHeight(), 2) - 10, 
                    20, raylib.GREEN
    );
    if ((frame_count.* / 30) % 2 == 0) {
        raylib.DrawText("Press [Enter] to start",
                        @divFloor(raylib.GetScreenWidth(), 2) - @divFloor(raylib.MeasureText("Press [Enter] to start", 20), 2),
                        @divFloor(raylib.GetScreenHeight(), 2) + 20, 
                        20, raylib.GREEN
        );
    }
}

pub fn display_Game_Screen() void {
    raylib.DrawText("Game Screen", 10, 10, 20, raylib.RED);
}

pub fn display_Endingn_Screen(score: u16) !void {
    // Display the score on the screen
    var score_buf: [3]u8 = undefined;
    const score_str = try std.fmt.bufPrint(&score_buf, "{}", .{score});
    raylib.DrawText(@ptrCast(score_str), 
                    @divFloor(raylib.GetScreenWidth(), 2) - @divFloor(raylib.MeasureText(@ptrCast(score_str), 80), 2),
                    @divFloor(raylib.GetScreenHeight(), 2) - 100, 
                    80, raylib.GREEN
    );
}
