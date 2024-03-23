const std = @import("std");
const raylib = @cImport({
    @cInclude("raylib.h");
});

pub fn update_Title_Screen() void {
    // Draw the title screen
    raylib.DrawText("SNAKE",
                    raylib.MeasureText("SNAKE", 80),
                    @divFloor(raylib.GetScreenHeight(), 2) - 100, 
                    80, raylib.GREEN
    );
}

pub fn update_Game_Screen() void {
    raylib.DrawText("Game Screen", 10, 10, 20, raylib.RED);
}

pub fn update_Endingn_Screen(score: u16) !void {
    // Display the score on the screen
    var score_buf: [3]u8 = undefined;
    const score_str = try std.fmt.bufPrint(&score_buf, "{}", .{score});
    raylib.DrawText(@ptrCast(score_str), 
                    @divFloor(raylib.GetScreenWidth(), 2) - 50, 
                    @divFloor(raylib.GetScreenHeight(), 2) - 100, 
                    80, raylib.GREEN
    );
}
