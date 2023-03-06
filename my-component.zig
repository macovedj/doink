const std = @import("std");
const mem = std.mem;
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
const allocator = gpa.allocator();

fn alloc(len: usize) [*]u8 {
  const buf = allocator.alloc(u8, len) catch |e| {
    std.debug.panic("FAILED TO ALLOC MEM {}", .{e});
  };
  return buf.ptr;
}

export fn @"foo#add"(left: u32, right: u32) u32 {
  return left + right;
}

export fn @"foo#concat"(leftPtr: [*]u8, leftLength: u32, rightPtr: [*]u8, rightLength: u32) [*]u32 {
  const left = leftPtr[0..leftLength];
  const right = rightPtr[0..rightLength];
  const slice = alloc(8);
  const str = alloc(leftLength + rightLength);
  std.mem.copy(u8, str[0..leftLength], left);
  std.mem.copy(u8, str[leftLength..leftLength + rightLength], right);
  std.mem.writeIntLittle(u32, slice[0..4], @intCast(u32, @ptrToInt(str)));
  std.mem.writeIntLittle(u32, slice[4..8], @intCast(u32, leftLength + rightLength));
  return @ptrCast([*]u32, @alignCast(4, slice));
}

export fn @"cabi_realloc"(origPtr: *[]u8, origSize: u8, alignment: u8, newSize: u8) ?[*]u8 {
  _ = origSize;
  _ = alignment;
  const buf = allocator.realloc(origPtr.*, newSize) catch {
    return null;
  };
  return buf.ptr;
}

export fn @"cabi_post_foo#concat"(len: [*]u32) void {
  _ = len;
}

pub fn main() void {}