/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    if (s.len == 0) {
        return buffer[0..0]; // Return an empty slice if the input string is empty
    }
    var i = s.len;
    var n: usize = 0;
    while (i > 0) : (i -= 1) {
        buffer[n] = s[i - 1];
        n += 1;
    }

    return buffer[0..n];
}
