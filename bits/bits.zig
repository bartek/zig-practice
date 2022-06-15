const std = @import("std");
const testing = std.testing;

// test if a bit is set
fn test_bit(value: u8, bit: u3) bool {
    return (value >> bit) & 1 == 1;
}

// set a bit and return the new value
fn set_bit(value: u8, bit: u3) u8 {
    return value | (@as(u8, 1) << bit);
}

// clears a bit and returns the value
fn clear_bit(value: u8, bit: u3) u8 {
    return value & ~(@as(u8, 1) << bit);
}

// return the value of a bit
fn val(value: u8, bit: u3) u8 {
    return (value >> bit) & 1;
}

pub fn main() !void {
    // 10111111 -> 11111111 (set bit 6)
    try testing.expectEqual(false, test_bit(0xbf, 6));
    var b = set_bit(0xbf, 6);
    try testing.expectEqual(true, test_bit(b, 6));

    // 11111111 -> 11111111 (clear bit 6)
    var c = clear_bit(0xff, 6);
    try testing.expectEqual(c, 191);

    // 1000111 (0x47)
    try testing.expectEqual(val(0x47, 3), 0);
    try testing.expectEqual(val(0x47, 6), 1);
}
