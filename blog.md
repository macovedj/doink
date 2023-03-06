#Making WebAssembly Components with Zig

The component model is one of the more recent developments in WebAssembly, and is interesting for several reasons.  In core WebAssembly, there are concepts of both guests and hosts.  A guest is code that is compiled to Webassembly, and a host executes the functionality that the WebAssembly module exposes. In this post, our guest will be implemented in zig, and our host will be javascript.  When using components instead of core wasm modules, we much more convenience in linking multiple modules to each other, as well as passing functions back and forth between guest and host code.  In this post, we'll cover how to create a WebAssembly component using `wasm-tools`, which is a utility that the developers of wasmtime have made to help their development.  Most developers probably won't interact with this toolchain directly, but will use other interfaces that use this functionality, as more languages add support for the component model.  

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

The reason that we have the funky name `@"foo#add"` requires a bit of explaining.  First, we need the `#` in our funtion name so that when we export our function, we have the proper namespacing for the exposed WIT interface, which we'll also elaborate on further shortly.  The entire name is wrapped in `@""` as that is how zig enables us to create strings out of characters that wouldn't typically be allowed in a keyword. In this example, it's what allows us to include `#` in a function identifier.

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
wasm-tools component new embedded.wasm -o final.wasm --adapt wasi_snapshot_preview1.wasm
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

After embedding information about our wit interface, we now see that an instance of the original wasm module is now exported.  So now let's look at running the thing.  You'll need to install a Bytecode Alliance project called jco.

```
npm install -g @bytecodealliance/jco
```

We can use this to transpile our wasm component, which will generate some javascript that is capable of executing the functions we've exposed.

```
jco transpile final.wasm -o component
```

What you're interested in is located in `./component/component.js`, where you should find the following bit of javascript.

```js
export { foo, command }
```

Note that had we not embedded the wit file, the `foo` export would not be present.  We can now author the file will call our wasm exports.  I've called mine `index.js` and made it look like this

```js
import { foo } from "./component/component.js"

console.log(foo.add(2, 3))
```

You should now be able to run the following, and see the output logged to your console.

```
node index.js
```

Yay we did it.  But that was easy, because adding two numbers together doesn't require interactions with memory at all.  Let's add a function that concatenates strings, to see where the component model really comes in handy.