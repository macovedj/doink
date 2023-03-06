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
