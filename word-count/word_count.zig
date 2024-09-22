const std = @import("std");
const mem = std.mem;

/// Returns the counts of the words in `s`.
/// Caller owns the returned memory.
pub fn countWords(allocator: mem.Allocator, s: []const u8) !std.StringHashMap(u32) {
    //_ = s;
    var map = std.StringHashMap(u32).init(allocator);
    var tokens = std.mem.tokenizeAny(u8, s, "!@#$%^&*()-_=+[]{}()|\\;:\",.<>/? \t\n");
    //var sArray = []u8{};
    while (tokens.next()) |token| {
        const word = std.mem.trim(u8, token, "'");
        const key = if (word.len > 0) try std.ascii.allocLowerString(allocator, word) else continue;
        if (map.getPtr(key)) |ptr| {
            allocator.free(key);
            ptr.* += 1;
        } else try map.put(key, 1);
    }
    return map;
    //@compileError("please implement the countWords function");
}

//full credit to "museadam's solution"
