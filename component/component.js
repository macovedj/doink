import { dropDescriptor as lowering2Callee, dropDirEntryStream as lowering3Callee, readViaStream as lowering7Callee, writeViaStream as lowering8Callee, appendViaStream as lowering9Callee, openAt as lowering10Callee } from '@bytecodealliance/preview2-shim/filesystem';
import { exit as lowering4Callee } from '@bytecodealliance/preview2-shim/exit';
import { print as lowering11Callee } from '@bytecodealliance/preview2-shim/stderr';
import { dropInputStream as lowering0Callee, dropOutputStream as lowering1Callee, read as lowering5Callee, write as lowering6Callee } from '@bytecodealliance/preview2-shim/io';

const instantiateCore = WebAssembly.instantiate;

const hasOwnProperty = Object.prototype.hasOwnProperty;

function getErrorPayload(e) {
  if (hasOwnProperty.call(e, 'payload')) return e.payload;
  if (hasOwnProperty.call(e, 'message')) return String(e.message);
  return String(e);
}

let dv = new DataView(new ArrayBuffer());
const dataView = mem => dv.buffer === mem.buffer ? dv : dv = new DataView(mem.buffer);

const toUint64 = val => BigInt.asUintN(64, val);

function toUint32(val) {
  return val >>> 0;
}

function toString(val) {
  if (typeof val === 'symbol') throw new TypeError('symbols cannot be converted to strings');
  return String(val);
}

const utf8Decoder = new TextDecoder();

const utf8Encoder = new TextEncoder();

let utf8EncodedLen = 0;
function utf8Encode(s, realloc, memory) {
  if (typeof s !== 'string') throw new TypeError('expected a string');
  if (s.length === 0) {
    utf8EncodedLen = 0;
    return 1;
  }
  let allocLen = 0;
  let ptr = 0;
  let writtenTotal = 0;
  while (s.length > 0) {
    ptr = realloc(ptr, allocLen, 1, allocLen + s.length);
    allocLen += s.length;
    const { read, written } = utf8Encoder.encodeInto(
    s,
    new Uint8Array(memory.buffer, ptr + writtenTotal, allocLen - writtenTotal),
    );
    writtenTotal += written;
    s = s.slice(read);
  }
  if (allocLen > writtenTotal)
  ptr = realloc(ptr, allocLen, 1, writtenTotal);
  utf8EncodedLen = writtenTotal;
  return ptr;
}

class ComponentError extends Error {
  constructor (value) {
    const enumerable = typeof value !== 'string';
    super(enumerable ? `${String(value)} (see error.payload)` : value);
    Object.defineProperty(this, 'payload', { value, enumerable });
  }
}

const isNode = typeof process !== 'undefined' && process.versions && process.versions.node;
let _fs;
async function fetchCompile (url) {
  if (isNode) {
    _fs = _fs || await import('fs/promises');
    return WebAssembly.compile(await _fs.readFile(url));
  }
  return fetch(url).then(WebAssembly.compileStreaming);
}

const base64Compile = str => WebAssembly.compile(typeof Buffer !== 'undefined' ? Buffer.from(str, 'base64') : Uint8Array.from(atob(str), b => b.charCodeAt(0)));

let exports0;
let exports1;

function lowering0(arg0) {
  lowering0Callee(arg0 >>> 0);
}

function lowering1(arg0) {
  lowering1Callee(arg0 >>> 0);
}

function lowering2(arg0) {
  lowering2Callee(arg0 >>> 0);
}

function lowering3(arg0) {
  lowering3Callee(arg0 >>> 0);
}

function lowering4(arg0) {
  let variant0;
  switch (arg0) {
    case 0: {
      variant0= {
        tag: 'ok',
        val: undefined
      };
      break;
    }
    case 1: {
      variant0= {
        tag: 'err',
        val: undefined
      };
      break;
    }
    default: {
      throw new TypeError('invalid variant discriminant for expected');
    }
  }
  lowering4Callee(variant0);
}
let exports2;
let memory0;
let realloc0;

function lowering5(arg0, arg1, arg2) {
  let ret;
  try {
    ret = { tag: 'ok', val: lowering5Callee(arg0 >>> 0, BigInt.asUintN(64, arg1)) };
  } catch (e) {
    ret = { tag: 'err', val: getErrorPayload(e) };
  }
  const variant3 = ret;
  switch (variant3.tag) {
    case 'ok': {
      const e = variant3.val;
      dataView(memory0).setInt8(arg2 + 0, 0, true);
      const [tuple0_0, tuple0_1] = e;
      const val1 = tuple0_0;
      const len1 = val1.byteLength;
      const ptr1 = realloc0(0, 0, 1, len1 * 1);
      const src1 = new Uint8Array(val1.buffer || val1, val1.byteOffset, len1 * 1);
      (new Uint8Array(memory0.buffer, ptr1, len1 * 1)).set(src1);
      dataView(memory0).setInt32(arg2 + 8, len1, true);
      dataView(memory0).setInt32(arg2 + 4, ptr1, true);
      dataView(memory0).setInt8(arg2 + 12, tuple0_1 ? 1 : 0, true);
      break;
    }
    case 'err': {
      const e = variant3.val;
      dataView(memory0).setInt8(arg2 + 0, 1, true);
      const { } = e;
      break;
    }
    default: {
      throw new TypeError('invalid variant specified for result');
    }
  }
}

function lowering6(arg0, arg1, arg2, arg3) {
  const ptr0 = arg1;
  const len0 = arg2;
  const result0 = new Uint8Array(memory0.buffer.slice(ptr0, ptr0 + len0 * 1));
  let ret;
  try {
    ret = { tag: 'ok', val: lowering6Callee(arg0 >>> 0, result0) };
  } catch (e) {
    ret = { tag: 'err', val: getErrorPayload(e) };
  }
  const variant2 = ret;
  switch (variant2.tag) {
    case 'ok': {
      const e = variant2.val;
      dataView(memory0).setInt8(arg3 + 0, 0, true);
      dataView(memory0).setBigInt64(arg3 + 8, toUint64(e), true);
      break;
    }
    case 'err': {
      const e = variant2.val;
      dataView(memory0).setInt8(arg3 + 0, 1, true);
      const { } = e;
      break;
    }
    default: {
      throw new TypeError('invalid variant specified for result');
    }
  }
}

function lowering7(arg0, arg1, arg2) {
  let ret;
  try {
    ret = { tag: 'ok', val: lowering7Callee(arg0 >>> 0, BigInt.asUintN(64, arg1)) };
  } catch (e) {
    ret = { tag: 'err', val: getErrorPayload(e) };
  }
  const variant1 = ret;
  switch (variant1.tag) {
    case 'ok': {
      const e = variant1.val;
      dataView(memory0).setInt8(arg2 + 0, 0, true);
      dataView(memory0).setInt32(arg2 + 4, toUint32(e), true);
      break;
    }
    case 'err': {
      const e = variant1.val;
      dataView(memory0).setInt8(arg2 + 0, 1, true);
      const val0 = toString(e);
      let enum0;
      switch (val0) {
        case 'access': {
          enum0 = 0;
          break;
        }
        case 'again': {
          enum0 = 1;
          break;
        }
        case 'already': {
          enum0 = 2;
          break;
        }
        case 'badf': {
          enum0 = 3;
          break;
        }
        case 'busy': {
          enum0 = 4;
          break;
        }
        case 'deadlk': {
          enum0 = 5;
          break;
        }
        case 'dquot': {
          enum0 = 6;
          break;
        }
        case 'exist': {
          enum0 = 7;
          break;
        }
        case 'fbig': {
          enum0 = 8;
          break;
        }
        case 'ilseq': {
          enum0 = 9;
          break;
        }
        case 'inprogress': {
          enum0 = 10;
          break;
        }
        case 'intr': {
          enum0 = 11;
          break;
        }
        case 'inval': {
          enum0 = 12;
          break;
        }
        case 'io': {
          enum0 = 13;
          break;
        }
        case 'isdir': {
          enum0 = 14;
          break;
        }
        case 'loop': {
          enum0 = 15;
          break;
        }
        case 'mlink': {
          enum0 = 16;
          break;
        }
        case 'msgsize': {
          enum0 = 17;
          break;
        }
        case 'nametoolong': {
          enum0 = 18;
          break;
        }
        case 'nodev': {
          enum0 = 19;
          break;
        }
        case 'noent': {
          enum0 = 20;
          break;
        }
        case 'nolck': {
          enum0 = 21;
          break;
        }
        case 'nomem': {
          enum0 = 22;
          break;
        }
        case 'nospc': {
          enum0 = 23;
          break;
        }
        case 'nosys': {
          enum0 = 24;
          break;
        }
        case 'notdir': {
          enum0 = 25;
          break;
        }
        case 'notempty': {
          enum0 = 26;
          break;
        }
        case 'notrecoverable': {
          enum0 = 27;
          break;
        }
        case 'notsup': {
          enum0 = 28;
          break;
        }
        case 'notty': {
          enum0 = 29;
          break;
        }
        case 'nxio': {
          enum0 = 30;
          break;
        }
        case 'overflow': {
          enum0 = 31;
          break;
        }
        case 'perm': {
          enum0 = 32;
          break;
        }
        case 'pipe': {
          enum0 = 33;
          break;
        }
        case 'rofs': {
          enum0 = 34;
          break;
        }
        case 'spipe': {
          enum0 = 35;
          break;
        }
        case 'txtbsy': {
          enum0 = 36;
          break;
        }
        case 'xdev': {
          enum0 = 37;
          break;
        }
        default: {
          throw new TypeError(`"${val0}" is not one of the cases of errno`);
        }
      }
      dataView(memory0).setInt8(arg2 + 4, enum0, true);
      break;
    }
    default: {
      throw new TypeError('invalid variant specified for result');
    }
  }
}

function lowering8(arg0, arg1, arg2) {
  let ret;
  try {
    ret = { tag: 'ok', val: lowering8Callee(arg0 >>> 0, BigInt.asUintN(64, arg1)) };
  } catch (e) {
    ret = { tag: 'err', val: getErrorPayload(e) };
  }
  const variant1 = ret;
  switch (variant1.tag) {
    case 'ok': {
      const e = variant1.val;
      dataView(memory0).setInt8(arg2 + 0, 0, true);
      dataView(memory0).setInt32(arg2 + 4, toUint32(e), true);
      break;
    }
    case 'err': {
      const e = variant1.val;
      dataView(memory0).setInt8(arg2 + 0, 1, true);
      const val0 = toString(e);
      let enum0;
      switch (val0) {
        case 'access': {
          enum0 = 0;
          break;
        }
        case 'again': {
          enum0 = 1;
          break;
        }
        case 'already': {
          enum0 = 2;
          break;
        }
        case 'badf': {
          enum0 = 3;
          break;
        }
        case 'busy': {
          enum0 = 4;
          break;
        }
        case 'deadlk': {
          enum0 = 5;
          break;
        }
        case 'dquot': {
          enum0 = 6;
          break;
        }
        case 'exist': {
          enum0 = 7;
          break;
        }
        case 'fbig': {
          enum0 = 8;
          break;
        }
        case 'ilseq': {
          enum0 = 9;
          break;
        }
        case 'inprogress': {
          enum0 = 10;
          break;
        }
        case 'intr': {
          enum0 = 11;
          break;
        }
        case 'inval': {
          enum0 = 12;
          break;
        }
        case 'io': {
          enum0 = 13;
          break;
        }
        case 'isdir': {
          enum0 = 14;
          break;
        }
        case 'loop': {
          enum0 = 15;
          break;
        }
        case 'mlink': {
          enum0 = 16;
          break;
        }
        case 'msgsize': {
          enum0 = 17;
          break;
        }
        case 'nametoolong': {
          enum0 = 18;
          break;
        }
        case 'nodev': {
          enum0 = 19;
          break;
        }
        case 'noent': {
          enum0 = 20;
          break;
        }
        case 'nolck': {
          enum0 = 21;
          break;
        }
        case 'nomem': {
          enum0 = 22;
          break;
        }
        case 'nospc': {
          enum0 = 23;
          break;
        }
        case 'nosys': {
          enum0 = 24;
          break;
        }
        case 'notdir': {
          enum0 = 25;
          break;
        }
        case 'notempty': {
          enum0 = 26;
          break;
        }
        case 'notrecoverable': {
          enum0 = 27;
          break;
        }
        case 'notsup': {
          enum0 = 28;
          break;
        }
        case 'notty': {
          enum0 = 29;
          break;
        }
        case 'nxio': {
          enum0 = 30;
          break;
        }
        case 'overflow': {
          enum0 = 31;
          break;
        }
        case 'perm': {
          enum0 = 32;
          break;
        }
        case 'pipe': {
          enum0 = 33;
          break;
        }
        case 'rofs': {
          enum0 = 34;
          break;
        }
        case 'spipe': {
          enum0 = 35;
          break;
        }
        case 'txtbsy': {
          enum0 = 36;
          break;
        }
        case 'xdev': {
          enum0 = 37;
          break;
        }
        default: {
          throw new TypeError(`"${val0}" is not one of the cases of errno`);
        }
      }
      dataView(memory0).setInt8(arg2 + 4, enum0, true);
      break;
    }
    default: {
      throw new TypeError('invalid variant specified for result');
    }
  }
}

function lowering9(arg0, arg1) {
  let ret;
  try {
    ret = { tag: 'ok', val: lowering9Callee(arg0 >>> 0) };
  } catch (e) {
    ret = { tag: 'err', val: getErrorPayload(e) };
  }
  const variant1 = ret;
  switch (variant1.tag) {
    case 'ok': {
      const e = variant1.val;
      dataView(memory0).setInt8(arg1 + 0, 0, true);
      dataView(memory0).setInt32(arg1 + 4, toUint32(e), true);
      break;
    }
    case 'err': {
      const e = variant1.val;
      dataView(memory0).setInt8(arg1 + 0, 1, true);
      const val0 = toString(e);
      let enum0;
      switch (val0) {
        case 'access': {
          enum0 = 0;
          break;
        }
        case 'again': {
          enum0 = 1;
          break;
        }
        case 'already': {
          enum0 = 2;
          break;
        }
        case 'badf': {
          enum0 = 3;
          break;
        }
        case 'busy': {
          enum0 = 4;
          break;
        }
        case 'deadlk': {
          enum0 = 5;
          break;
        }
        case 'dquot': {
          enum0 = 6;
          break;
        }
        case 'exist': {
          enum0 = 7;
          break;
        }
        case 'fbig': {
          enum0 = 8;
          break;
        }
        case 'ilseq': {
          enum0 = 9;
          break;
        }
        case 'inprogress': {
          enum0 = 10;
          break;
        }
        case 'intr': {
          enum0 = 11;
          break;
        }
        case 'inval': {
          enum0 = 12;
          break;
        }
        case 'io': {
          enum0 = 13;
          break;
        }
        case 'isdir': {
          enum0 = 14;
          break;
        }
        case 'loop': {
          enum0 = 15;
          break;
        }
        case 'mlink': {
          enum0 = 16;
          break;
        }
        case 'msgsize': {
          enum0 = 17;
          break;
        }
        case 'nametoolong': {
          enum0 = 18;
          break;
        }
        case 'nodev': {
          enum0 = 19;
          break;
        }
        case 'noent': {
          enum0 = 20;
          break;
        }
        case 'nolck': {
          enum0 = 21;
          break;
        }
        case 'nomem': {
          enum0 = 22;
          break;
        }
        case 'nospc': {
          enum0 = 23;
          break;
        }
        case 'nosys': {
          enum0 = 24;
          break;
        }
        case 'notdir': {
          enum0 = 25;
          break;
        }
        case 'notempty': {
          enum0 = 26;
          break;
        }
        case 'notrecoverable': {
          enum0 = 27;
          break;
        }
        case 'notsup': {
          enum0 = 28;
          break;
        }
        case 'notty': {
          enum0 = 29;
          break;
        }
        case 'nxio': {
          enum0 = 30;
          break;
        }
        case 'overflow': {
          enum0 = 31;
          break;
        }
        case 'perm': {
          enum0 = 32;
          break;
        }
        case 'pipe': {
          enum0 = 33;
          break;
        }
        case 'rofs': {
          enum0 = 34;
          break;
        }
        case 'spipe': {
          enum0 = 35;
          break;
        }
        case 'txtbsy': {
          enum0 = 36;
          break;
        }
        case 'xdev': {
          enum0 = 37;
          break;
        }
        default: {
          throw new TypeError(`"${val0}" is not one of the cases of errno`);
        }
      }
      dataView(memory0).setInt8(arg1 + 4, enum0, true);
      break;
    }
    default: {
      throw new TypeError('invalid variant specified for result');
    }
  }
}

function lowering10(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7) {
  if ((arg1 & 4294967294) !== 0) {
    throw new TypeError('flags have extraneous bits set');
  }
  const flags0 = {
    symlinkFollow: Boolean(arg1 & 1),
  };
  const ptr1 = arg2;
  const len1 = arg3;
  const result1 = utf8Decoder.decode(new Uint8Array(memory0.buffer, ptr1, len1));
  if ((arg4 & 4294967280) !== 0) {
    throw new TypeError('flags have extraneous bits set');
  }
  const flags2 = {
    create: Boolean(arg4 & 1),
    directory: Boolean(arg4 & 2),
    excl: Boolean(arg4 & 4),
    trunc: Boolean(arg4 & 8),
  };
  if ((arg5 & 4294967168) !== 0) {
    throw new TypeError('flags have extraneous bits set');
  }
  const flags3 = {
    read: Boolean(arg5 & 1),
    write: Boolean(arg5 & 2),
    nonblock: Boolean(arg5 & 4),
    sync: Boolean(arg5 & 8),
    dsync: Boolean(arg5 & 16),
    rsync: Boolean(arg5 & 32),
    mutateDirectory: Boolean(arg5 & 64),
  };
  if ((arg6 & 4294967288) !== 0) {
    throw new TypeError('flags have extraneous bits set');
  }
  const flags4 = {
    readable: Boolean(arg6 & 1),
    writeable: Boolean(arg6 & 2),
    executable: Boolean(arg6 & 4),
  };
  let ret;
  try {
    ret = { tag: 'ok', val: lowering10Callee(arg0 >>> 0, flags0, result1, flags2, flags3, flags4) };
  } catch (e) {
    ret = { tag: 'err', val: getErrorPayload(e) };
  }
  const variant6 = ret;
  switch (variant6.tag) {
    case 'ok': {
      const e = variant6.val;
      dataView(memory0).setInt8(arg7 + 0, 0, true);
      dataView(memory0).setInt32(arg7 + 4, toUint32(e), true);
      break;
    }
    case 'err': {
      const e = variant6.val;
      dataView(memory0).setInt8(arg7 + 0, 1, true);
      const val5 = toString(e);
      let enum5;
      switch (val5) {
        case 'access': {
          enum5 = 0;
          break;
        }
        case 'again': {
          enum5 = 1;
          break;
        }
        case 'already': {
          enum5 = 2;
          break;
        }
        case 'badf': {
          enum5 = 3;
          break;
        }
        case 'busy': {
          enum5 = 4;
          break;
        }
        case 'deadlk': {
          enum5 = 5;
          break;
        }
        case 'dquot': {
          enum5 = 6;
          break;
        }
        case 'exist': {
          enum5 = 7;
          break;
        }
        case 'fbig': {
          enum5 = 8;
          break;
        }
        case 'ilseq': {
          enum5 = 9;
          break;
        }
        case 'inprogress': {
          enum5 = 10;
          break;
        }
        case 'intr': {
          enum5 = 11;
          break;
        }
        case 'inval': {
          enum5 = 12;
          break;
        }
        case 'io': {
          enum5 = 13;
          break;
        }
        case 'isdir': {
          enum5 = 14;
          break;
        }
        case 'loop': {
          enum5 = 15;
          break;
        }
        case 'mlink': {
          enum5 = 16;
          break;
        }
        case 'msgsize': {
          enum5 = 17;
          break;
        }
        case 'nametoolong': {
          enum5 = 18;
          break;
        }
        case 'nodev': {
          enum5 = 19;
          break;
        }
        case 'noent': {
          enum5 = 20;
          break;
        }
        case 'nolck': {
          enum5 = 21;
          break;
        }
        case 'nomem': {
          enum5 = 22;
          break;
        }
        case 'nospc': {
          enum5 = 23;
          break;
        }
        case 'nosys': {
          enum5 = 24;
          break;
        }
        case 'notdir': {
          enum5 = 25;
          break;
        }
        case 'notempty': {
          enum5 = 26;
          break;
        }
        case 'notrecoverable': {
          enum5 = 27;
          break;
        }
        case 'notsup': {
          enum5 = 28;
          break;
        }
        case 'notty': {
          enum5 = 29;
          break;
        }
        case 'nxio': {
          enum5 = 30;
          break;
        }
        case 'overflow': {
          enum5 = 31;
          break;
        }
        case 'perm': {
          enum5 = 32;
          break;
        }
        case 'pipe': {
          enum5 = 33;
          break;
        }
        case 'rofs': {
          enum5 = 34;
          break;
        }
        case 'spipe': {
          enum5 = 35;
          break;
        }
        case 'txtbsy': {
          enum5 = 36;
          break;
        }
        case 'xdev': {
          enum5 = 37;
          break;
        }
        default: {
          throw new TypeError(`"${val5}" is not one of the cases of errno`);
        }
      }
      dataView(memory0).setInt8(arg7 + 4, enum5, true);
      break;
    }
    default: {
      throw new TypeError('invalid variant specified for result');
    }
  }
}

function lowering11(arg0, arg1) {
  const ptr0 = arg0;
  const len0 = arg1;
  const result0 = utf8Decoder.decode(new Uint8Array(memory0.buffer, ptr0, len0));
  lowering11Callee(result0);
}
let exports3;
let realloc1;
let postReturn0;
let realloc2;
const foo = {
  add(arg0, arg1) {
    const ret = exports1['foo#add'](toUint32(arg0), toUint32(arg1));
    return ret >>> 0;
  },
  concat(arg0, arg1) {
    const ptr0 = utf8Encode(arg0, realloc1, memory0);
    const len0 = utf8EncodedLen;
    const ptr1 = utf8Encode(arg1, realloc1, memory0);
    const len1 = utf8EncodedLen;
    const ret = exports1['foo#concat'](ptr0, len0, ptr1, len1);
    const ptr2 = dataView(memory0).getInt32(ret + 0, true);
    const len2 = dataView(memory0).getInt32(ret + 4, true);
    const result2 = utf8Decoder.decode(new Uint8Array(memory0.buffer, ptr2, len2));
    postReturn0(ret);
    return result2;
  },
  
};

function command(arg0, arg1, arg2) {
  const vec1 = arg2;
  const len1 = vec1.length;
  const result1 = realloc2(0, 0, 4, len1 * 8);
  for (let i = 0; i < vec1.length; i++) {
    const e = vec1[i];
    const base = result1 + i * 8;const ptr0 = utf8Encode(e, realloc2, memory0);
    const len0 = utf8EncodedLen;
    dataView(memory0).setInt32(base + 4, len0, true);
    dataView(memory0).setInt32(base + 0, ptr0, true);
  }
  const ret = exports2.command(toUint32(arg0), toUint32(arg1), result1, len1);
  let variant2;
  switch (ret) {
    case 0: {
      variant2= {
        tag: 'ok',
        val: undefined
      };
      break;
    }
    case 1: {
      variant2= {
        tag: 'err',
        val: undefined
      };
      break;
    }
    default: {
      throw new TypeError('invalid variant discriminant for expected');
    }
  }
  if (variant2.tag === 'err') {
    throw new ComponentError(variant2.val);
  }
  return variant2.val;
}

export { foo, command }

const $init = (async() => {
  const module0 = fetchCompile(new URL('./component.core.wasm', import.meta.url));
  const module1 = fetchCompile(new URL('./component.core2.wasm', import.meta.url));
  const module2 = base64Compile('AGFzbQEAAAABQQlgA39+fwBgBH9/f38AYAJ/fwBgCH9/f39/f39/AGACf38AYAF/AGAEf39/fwF/YAF/AX9gCX9/f39/fn5/fwF/Aw0MAAEAAAIDBAUGBgcIBAUBcAEMDAc+DQEwAAABMQABATIAAgEzAAMBNAAEATUABQE2AAYBNwAHATgACAE5AAkCMTAACgIxMQALCCRpbXBvcnRzAQAKuQEMDQAgACABIAJBABEAAAsPACAAIAEgAiADQQERAQALDQAgACABIAJBAhEAAAsNACAAIAEgAkEDEQAACwsAIAAgAUEEEQIACxcAIAAgASACIAMgBCAFIAYgB0EFEQMACwsAIAAgAUEGEQQACwkAIABBBxEFAAsPACAAIAEgAiADQQgRBgALDwAgACABIAIgA0EJEQYACwkAIABBChEHAAsZACAAIAEgAiADIAQgBSAGIAcgCEELEQgACwAtCXByb2R1Y2VycwEMcHJvY2Vzc2VkLWJ5AQ13aXQtY29tcG9uZW50BTAuNy4wANADBG5hbWUAExJ3aXQtY29tcG9uZW50OnNoaW0BswMMABVpbmRpcmVjdC13YXNpLWlvLXJlYWQBFmluZGlyZWN0LXdhc2ktaW8td3JpdGUCKGluZGlyZWN0LXdhc2ktZmlsZXN5c3RlbS1yZWFkLXZpYS1zdHJlYW0DKWluZGlyZWN0LXdhc2ktZmlsZXN5c3RlbS13cml0ZS12aWEtc3RyZWFtBCppbmRpcmVjdC13YXNpLWZpbGVzeXN0ZW0tYXBwZW5kLXZpYS1zdHJlYW0FIGluZGlyZWN0LXdhc2ktZmlsZXN5c3RlbS1vcGVuLWF0BhppbmRpcmVjdC13YXNpLXN0ZGVyci1wcmludAcmYWRhcHQtd2FzaV9zbmFwc2hvdF9wcmV2aWV3MS1wcm9jX2V4aXQIJWFkYXB0LXdhc2lfc25hcHNob3RfcHJldmlldzEtZmRfd3JpdGUJJGFkYXB0LXdhc2lfc25hcHNob3RfcHJldmlldzEtZmRfcmVhZAolYWRhcHQtd2FzaV9zbmFwc2hvdF9wcmV2aWV3MS1mZF9jbG9zZQsmYWRhcHQtd2FzaV9zbmFwc2hvdF9wcmV2aWV3MS1wYXRoX29wZW4=');
  const module3 = base64Compile('AGFzbQEAAAABQQlgA39+fwBgBH9/f38AYAJ/fwBgCH9/f39/f39/AGACf38AYAF/AGAEf39/fwF/YAF/AX9gCX9/f39/fn5/fwF/Ak4NAAEwAAAAATEAAQABMgAAAAEzAAAAATQAAgABNQADAAE2AAQAATcABQABOAAGAAE5AAYAAjEwAAcAAjExAAgACCRpbXBvcnRzAXABDAwJEgEAQQALDAABAgMEBQYHCAkKCwAtCXByb2R1Y2VycwEMcHJvY2Vzc2VkLWJ5AQ13aXQtY29tcG9uZW50BTAuNy4wABwEbmFtZQAVFHdpdC1jb21wb25lbnQ6Zml4dXBz');
  Promise.all([module0, module1, module2, module3]).catch(() => {});
  ({ exports: exports0 } = await instantiateCore(await module2));
  ({ exports: exports1 } = await instantiateCore(await module0, {
    wasi_snapshot_preview1: {
      fd_close: exports0['10'],
      fd_read: exports0['9'],
      fd_write: exports0['8'],
      path_open: exports0['11'],
      proc_exit: exports0['7'],
    },
  }));
  ({ exports: exports2 } = await instantiateCore(await module1, {
    __main_module__: {
      _start: exports1._start,
      cabi_realloc: exports1.cabi_realloc,
    },
    env: {
      memory: exports1.memory,
    },
    'wasi-exit': {
      exit: lowering4,
    },
    'wasi-filesystem': {
      'append-via-stream': exports0['4'],
      'drop-descriptor': lowering2,
      'drop-dir-entry-stream': lowering3,
      'open-at': exports0['5'],
      'read-via-stream': exports0['2'],
      'write-via-stream': exports0['3'],
    },
    'wasi-io': {
      'drop-input-stream': lowering0,
      'drop-output-stream': lowering1,
      read: exports0['0'],
      write: exports0['1'],
    },
    'wasi-stderr': {
      print: exports0['6'],
    },
  }));
  memory0 = exports1.memory;
  realloc0 = exports2.cabi_import_realloc;
  ({ exports: exports3 } = await instantiateCore(await module3, {
    '': {
      $imports: exports0.$imports,
      '0': lowering5,
      '1': lowering6,
      '10': exports2.fd_close,
      '11': exports2.path_open,
      '2': lowering7,
      '3': lowering8,
      '4': lowering9,
      '5': lowering10,
      '6': lowering11,
      '7': exports2.proc_exit,
      '8': exports2.fd_write,
      '9': exports2.fd_read,
    },
  }));
  realloc1 = exports1.cabi_realloc;
  postReturn0 = exports1['cabi_post_foo#concat'];
  realloc2 = exports2.cabi_export_realloc;
})();

await $init;
