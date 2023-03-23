# Making WebAssembly Components with Zig

The component model is one of the more recent developments in WebAssembly, and is interesting for several reasons.  In core WebAssembly, there are concepts of both guests and hosts.  A guest is code that is compiled to Webassembly, and a host executes the functionality that the WebAssembly module exposes. In this post, our guest will be implemented in zig, and our host will be javascript.  When using components instead of core wasm modules, we get much added convenience when linking multiple modules to each other, as well as when passing functions back and forth between guest and host code.  In this post, we'll cover how to create a WebAssembly component using `wasm-tools`, which is a utility that the developers of wasmtime have made to help their development.  Most developers probably won't interact with this toolchain directly, but will use other interfaces that use this functionality, as more languages add support for the component model.  

We'll start off with creating the zig file that will eventually be compiled to a wasm component, along with a WIT file.

`my-component.zig`
```zig
export fn @"foo#add"(left: u32, right: u32) u32 {
  return left + right;
}

pub fn main() void {}
```

We can compile this zig to a core wasm module with the following command:

```
zig build-exe my-component.zig -target wasm32-wasi -rdynamic
```

Under other circumstances, you can omit `main` and use `build-lib` instead of `build-exe` to create a dynamic library of exported functionality in wasm, a `main` function is required at this time in order to use the tools that we need to transform our wasm module into a component.

`example.wit`
```
default world example {
  export foo: interface {
    add: func(left: u32, right: u32) -> u32
  }
}
```

The reason that we have the funky name `@"foo#add"` requires a bit of explaining.  First, we need the `#` in our function name so that when we export our function, we have the proper namespacing for the exposed WIT interface, which we'll also elaborate on further shortly.  The entire name is wrapped in `@""` as that is how zig enables us to create strings out of characters that wouldn't typically be allowed in a keyword. In this example, it's what allows us to include `#` in a function identifier.

Ok, let's actually make a component from our webassembly module now.

```
wasm-tools component new my-component.wasm -o final.wasm --adapt wasi_snapshot_preview1.wasm
```

In order to get this to work properly, you'll need to visit [this page](https://github.com/bytecodealliance/preview2-prototyping/releases/tag/latest) and grab an adapter module.  The idea here is that components will be using wasi preview2, but our zig code was compiled to using wasi preview1.  The adapter module takes code that expects preview1 imports, and turns it into code that expects preview2 imports instead.  One confusing and very important thing about all of this is that because our code has a `main` function, we actually need to grab `wasi_snapshot_preview1.command.wasm` at the link referenced above, but our tools won't work unless you rename it to `wasi_snapshot_preview1.wasm`.

This command creates a perfectly legitimate wasm component, but unfortunately it's not the component that we need.
You can use the following command to create WebAssembly Text Format in order to see what's going on in our wasm component
```
wasm-tools print final.wasm > final.wat
```

The bottom of your new file should look something like this
```ts
(core instance (;11;) (instantiate 3
      (with "" (instance 10))
    )
  )
  (type (;5;) (list string))
  (type (;6;) (result))
  (type (;7;) (func (param "stdin" u32) (param "stdout" u32) (param "args" 5) (result 6)))
  (alias core export 9 "command" (core func (;19;)))
  (func (;8;) (type 7) (canon lift (core func 19) (memory 0) (realloc 11) string-encoding=utf8))
  (export (;9;) "command" (func 8))
```

The only thing that is exported here is a "command", which corresponds to our `main` function in our zig code.  This is because we didn't actually use the `example.wit` file that we made when generating our component.  First we need to run the following.

```
wasm-tools component embed example.wit my-component.wasm -o embed.wasm
wasm-tools component new embed.wasm -o final.wasm --adapt wasi_snapshot_preview1.wasm
wasm-tools print final.wasm > final.wat
```

If we take a look at the bottom of this `final.wat`, we'll see this.

```ts
(export (;5;) "foo" (instance 4))
(type (;6;) (list string))
(type (;7;) (result))
(type (;8;) (func (param "stdin" u32) (param "stdout" u32) (param "args" 6) (result 7)))
(alias core export 9 "command" (core func (;20;)))
(func (;9;) (type 8) (canon lift (core func 20) (memory 0) (realloc 11) string-encoding=utf8))
(export (;10;) "command" (func 9))
```

After embedding information about our wit interface, we now see that an instance of the original wasm module is now exported.  So now let's look at running the thing.  You'll need to install a Bytecode Alliance project called jco, as well as a shim package for interacting with wasi preview 2.

```
npm install -g @bytecodealliance/jco
npm i @bytecodealliance/preview2-shim
```

We can use this to transpile our wasm component, which will generate some javascript that is capable of executing the functions we've exposed.

```
jco transpile final.wasm -o component --map 'wasi-*=@bytecodealliance/preview2-shim/*' 
```

What you're interested in is located in `./final/final.js`, where you should find the following bit of javascript.

```js
export { foo, command }
```

Note that had we not embedded the wit file, the `foo` export would not be present.  We can now author the file will call our wasm exports.  I've called mine `index.js` and made it look like this

```js
import { foo } from "./final/final.js"

console.log(foo.add(2, 3))
```

You should now be able to run the following, and see the output logged to your console.

```
node index.js
```

Yay we did it.  But that was easy, because adding two numbers together doesn't require interactions with memory at all.  Let's add a function that concatenates strings, to see where the component model really comes in handy.

The first thing that we're going to need is a function that allows us to allocate memory.  Let's add this to the top of our zig file.

```zig
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
```

Now that we have what we need for working with memory, let's go ahead and write the function that we want.

```zig
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
```

Here a string is represented in 8 bytes.  The first four are used to store a u32 representing a pointer the segment of memory that contains the actual bytes of a string.  The next four bytes are another u32 used to represent the number of bytes used by the string at that pointer.  Hence, `slice` is where these two u32s are stored, and what is returned by our function.  This is needed because core wasm only has numeric data types.  The `std.mem` operations take care of writing the bytes to the pertinent parts of memory for us.

We're also going to need to update our wit file, adding the following just below our add function.

```
concat: func(left: string, right: string) -> string
```

If we try to compile now, we'll get some errors, since the canonical abi expects us to provide some information.  This can be fixed by adding the following to our zig code.

```zig
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
```

Now we should be good to go with the following set of commands.

```
zig build-exe my-component.zig -target wasm32-wasi -rdynamic
wasm-tools component embed example.wit my-component.wasm -o embed.wasm
wasm-tools component new embed.wasm -o final.wasm --adapt wasi_snapshot_preview1.wasm
jco transpile final.wasm -o component --map 'wasi-*=@bytecodealliance/preview2-shim/*' 
```

Then just add the following to `index.js`
```js
console.log(foo.concat("hello ", "world"))
```

And voila, we're printing strings to the console from our wasm component.

So what is the component model doing for us here?

First let's talk about what things would look like if we just wanted to do this with a core wasm module.  Since core wasm functions can't receive strings as input, we would have to write to memory directly on the javascript side, similarly to how we do things on the zig side here, just to provide the input strings.  Here's an example of what that might look like.

```js
const instance = await WebAssembly.instantiate(compiledModule);
const mem = instance.exports.memory;
const alloc = instance.exports.alloc;
const helloPtr = alloc(6);
const worldPtr = alloc(5);
const encoder = new TextEncoder();
const helloBuf = new Uint8Array(mem, helloPtr, 6);
const worldBuf = new Uint8Array(mem, worldPtr, 5);
helloBuf.set(encoder.encode("hello "));
worldBuf.set(encoder.encode("world"));
const concatPtr = instance.exports.foo.concat(helloBuf, 5, worldBuf, 6)
const concatBuf = new Uint8Array(mem, concatBuf, 8)
const stringPtr = concatBuf.getUint32(0);
const stringSize = concatBuf.getUint32(4);
const decoder = new TextDecoder()
const concatReturnval = decoder.decode(new Uint8Array(mem, stringPtr, stringSize))
console.log(concatReturnVal)
```

That's a lot more annoying than the simple function that jco provided for us.
```js
console.log(foo.concat("hello", "world"))
```

But this is a really simple example.  This is with strings.  What if we were working with json?  Not only that, but the memory layout that we use is something that will vary, depending on the layout used by the language that we used to implement the guest.  So here, a string is represented by a u32 for the pointer, and a u32 for the size.  If we have nested data structures that we create using something like json, the memory representation is more complex, and the js that we write to call the exposed functions might only work if we know that the the wasm was generated from zig code.  This is all so annoying that it makes using wasm at all seem very impractical.  But the canonical abi in the component model provides a common memory layout for everything to use, so that we don't need to know what language the guest was written in in order to use it in our host, and you can even have guests talk directly to each other withouth any knowledge about their original implementation language... (something I also hope to write about soon).

To see this, let's look at the WebAssembly text for our concat function.

```ts
(export (;5;) "foo" (instance 4))
```

So the fifth export in the component is exported as "foo", and it is instance 4, which we can also look at.

```ts
(instance (;4;) (instantiate 0
    (with "add" (func 12))
    (with "concat" (func 13))
  )
)
```

Instance 4 instantiates the 0th wasm module/component, with "add" being supplied by function 12 and "concat" being supplied by function 13.  The 0th wasm module/component basically defined by our wit world

```ts
(component (;0;)
    (alias outer 1 6 (type (;0;)))
    (import "add" (func (;0;) (type 0)))
    (alias outer 1 7 (type (;1;)))
    (import "concat" (func (;1;) (type 1)))
    (type (;2;) (func (param "left" u32) (param "right" u32) (result u32)))
    (export (;2;) "add" (func 0) (func (type 2)))
    (type (;3;) (func (param "left" string) (param "right" string) (result string)))
    (export (;3;) "concat" (func 1) (func (type 3)))
  )
  ```

  And function 13 looks like this
  ```ts
  (func (;13;) (type 7) (canon lift (core func 35) (memory 0) (realloc 5) string-encoding=utf8 (post-return 36)))
  ```

  Here is where the core function export that we wrote for concat is "lifted" from core wasm to the canonical abi.  It uses the realloc function that we had to write as well, to lift the representation of the various data structures into the canonical abi.
