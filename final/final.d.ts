import { WasiStderr as WasiStderrImports } from './imports/wasi-stderr';
import { WasiIo as WasiIoImports } from './imports/wasi-io';
import { WasiFilesystem as WasiFilesystemImports } from './imports/wasi-filesystem';
import { WasiExit as WasiExitImports } from './imports/wasi-exit';
export function command(stdin: number, stdout: number, args: string[]): void;
