const std = @import("std");
const logErr = std.log.err;
const eql = std.mem.eql;

// zig run args.zig -- -a -b
pub fn main() anyerror!void {
    var allocator = std.heap.page_allocator;

    // Optional args
    var optionA: bool = false;
    var optionB: bool = false;

    var args = std.process.args();
    while (args.next(allocator)) |error_or_arg| {
        const arg = error_or_arg catch |err| {
            logErr("Error parsing argument: {s}", .{err});
            return err;
        };

        if (eql(u8, arg, "-a")) {
            optionA = true;
        }

        if (eql(u8, arg, "-b")) {
            optionB = true;
        }

        std.debug.print("arg: {s}, optionA: {s}, optionB: {s}\n", .{ arg, optionA, optionB });
    }
}
