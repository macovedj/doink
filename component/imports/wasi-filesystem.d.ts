export type Descriptor = number;
export type Filesize = bigint;
export type InputStream = InputStream;
/**
 * # Variants
 * 
 * ## `"access"`
 * 
 * ## `"again"`
 * 
 * ## `"already"`
 * 
 * ## `"badf"`
 * 
 * ## `"busy"`
 * 
 * ## `"deadlk"`
 * 
 * ## `"dquot"`
 * 
 * ## `"exist"`
 * 
 * ## `"fbig"`
 * 
 * ## `"ilseq"`
 * 
 * ## `"inprogress"`
 * 
 * ## `"intr"`
 * 
 * ## `"inval"`
 * 
 * ## `"io"`
 * 
 * ## `"isdir"`
 * 
 * ## `"loop"`
 * 
 * ## `"mlink"`
 * 
 * ## `"msgsize"`
 * 
 * ## `"nametoolong"`
 * 
 * ## `"nodev"`
 * 
 * ## `"noent"`
 * 
 * ## `"nolck"`
 * 
 * ## `"nomem"`
 * 
 * ## `"nospc"`
 * 
 * ## `"nosys"`
 * 
 * ## `"notdir"`
 * 
 * ## `"notempty"`
 * 
 * ## `"notrecoverable"`
 * 
 * ## `"notsup"`
 * 
 * ## `"notty"`
 * 
 * ## `"nxio"`
 * 
 * ## `"overflow"`
 * 
 * ## `"perm"`
 * 
 * ## `"pipe"`
 * 
 * ## `"rofs"`
 * 
 * ## `"spipe"`
 * 
 * ## `"txtbsy"`
 * 
 * ## `"xdev"`
 */
export type Errno = 'access' | 'again' | 'already' | 'badf' | 'busy' | 'deadlk' | 'dquot' | 'exist' | 'fbig' | 'ilseq' | 'inprogress' | 'intr' | 'inval' | 'io' | 'isdir' | 'loop' | 'mlink' | 'msgsize' | 'nametoolong' | 'nodev' | 'noent' | 'nolck' | 'nomem' | 'nospc' | 'nosys' | 'notdir' | 'notempty' | 'notrecoverable' | 'notsup' | 'notty' | 'nxio' | 'overflow' | 'perm' | 'pipe' | 'rofs' | 'spipe' | 'txtbsy' | 'xdev';
export type OutputStream = OutputStream;
export interface AtFlags {
  symlinkFollow?: boolean,
}
export interface OFlags {
  create?: boolean,
  directory?: boolean,
  excl?: boolean,
  trunc?: boolean,
}
export interface DescriptorFlags {
  read?: boolean,
  write?: boolean,
  nonblock?: boolean,
  sync?: boolean,
  dsync?: boolean,
  rsync?: boolean,
  mutateDirectory?: boolean,
}
export interface Mode {
  readable?: boolean,
  writeable?: boolean,
  executable?: boolean,
}
export type DirEntryStream = number;
export namespace WasiFilesystem {
  export function readViaStream(this: Descriptor, offset: Filesize): InputStream;
  export function writeViaStream(this: Descriptor, offset: Filesize): OutputStream;
  export function appendViaStream(this: Descriptor): OutputStream;
  export function openAt(this: Descriptor, atFlags: AtFlags, path: string, oFlags: OFlags, flags: DescriptorFlags, mode: Mode): Descriptor;
  export function dropDescriptor(this: Descriptor): void;
  export function dropDirEntryStream(this: DirEntryStream): void;
}
