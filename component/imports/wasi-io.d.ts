export type InputStream = number;
export interface StreamError {
}
export type OutputStream = number;
export namespace WasiIo {
  export function read(this: InputStream, len: bigint): [Uint8Array | ArrayBuffer, boolean];
  export function dropInputStream(this: InputStream): void;
  export function write(this: OutputStream, buf: Uint8Array): bigint;
  export function dropOutputStream(this: OutputStream): void;
}
