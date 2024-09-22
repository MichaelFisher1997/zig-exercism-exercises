const test_allocator = std.testing.allocator;
const std = @import("std");
const bufPrint = std.fmt.bufPrint;
pub fn twoFer(buffer: []u8, name: ?[]const u8) anyerror![]u8 {
    const n = name orelse "you";
    return try bufPrint(buffer, "One for {s}, one for me.", .{n});
}
