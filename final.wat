(component
  (type (;0;)
    (instance
      (type (;0;) (func (param "message" string)))
      (export (;0;) "print" (func (type 0)))
    )
  )
  (import "wasi-stderr" (instance (;0;) (type 0)))
  (type (;1;)
    (instance
      (type (;0;) u32)
      (export (;1;) "input-stream" (type (eq 0)))
      (type (;2;) (func (param "this" 1)))
      (export (;0;) "drop-input-stream" (func (type 2)))
      (type (;3;) u32)
      (export (;4;) "output-stream" (type (eq 3)))
      (type (;5;) (list u8))
      (type (;6;) (record))
      (export (;7;) "stream-error" (type (eq 6)))
      (type (;8;) (result u64 (error 7)))
      (type (;9;) (func (param "this" 4) (param "buf" 5) (result 8)))
      (export (;1;) "write" (func (type 9)))
      (type (;10;) (func (param "this" 4)))
      (export (;2;) "drop-output-stream" (func (type 10)))
    )
  )
  (import "wasi-io" (instance (;1;) (type 1)))
  (alias export 1 "output-stream" (type (;2;)))
  (type (;3;)
    (instance
      (type (;0;) u32)
      (export (;1;) "descriptor" (type (eq 0)))
      (type (;2;) u64)
      (export (;3;) "filesize" (type (eq 2)))
      (alias outer 1 2 (type (;4;)))
      (export (;5;) "output-stream" (type (eq 4)))
      (type (;6;) (enum "access" "again" "already" "badf" "busy" "deadlk" "dquot" "exist" "fbig" "ilseq" "inprogress" "intr" "inval" "io" "isdir" "loop" "mlink" "msgsize" "nametoolong" "nodev" "noent" "nolck" "nomem" "nospc" "nosys" "notdir" "notempty" "notrecoverable" "notsup" "notty" "nxio" "overflow" "perm" "pipe" "rofs" "spipe" "txtbsy" "xdev"))
      (export (;7;) "errno" (type (eq 6)))
      (type (;8;) (result 5 (error 7)))
      (type (;9;) (func (param "this" 1) (param "offset" 3) (result 8)))
      (export (;0;) "write-via-stream" (func (type 9)))
      (type (;10;) (func (param "this" 1) (result 8)))
      (export (;1;) "append-via-stream" (func (type 10)))
      (type (;11;) (func (param "this" 1)))
      (export (;2;) "drop-descriptor" (func (type 11)))
    )
  )
  (import "wasi-filesystem" (instance (;2;) (type 3)))
  (type (;4;)
    (instance
      (type (;0;) (result))
      (type (;1;) (func (param "status" 0)))
      (export (;0;) "exit" (func (type 1)))
    )
  )
  (import "wasi-exit" (instance (;3;) (type 4)))
  (core module (;0;)
    (type (;0;) (func (param i32)))
    (type (;1;) (func (param i32 i32 i32 i32) (result i32)))
    (type (;2;) (func))
    (type (;3;) (func (param i32 i32) (result i32)))
    (type (;4;) (func (param i32 i32 i32 i32)))
    (type (;5;) (func (param i32 i32)))
    (type (;6;) (func (result i32)))
    (type (;7;) (func (param i32) (result i32)))
    (type (;8;) (func (param i32 i32 i32 i32 i32) (result i32)))
    (type (;9;) (func (param i32 i32 i32) (result i32)))
    (type (;10;) (func (param i32 i32 i32)))
    (import "wasi_snapshot_preview1" "proc_exit" (func $proc_exit|wasi_snapshot_preview1 (;0;) (type 0)))
    (import "wasi_snapshot_preview1" "fd_write" (func $fd_write|wasi_snapshot_preview1 (;1;) (type 1)))
    (func $_start (;2;) (type 2)
      (local i32)
      call $my-component.main
      i32.const 0
      local.set 0
      local.get 0
      call $proc_exit|wasi_snapshot_preview1
      unreachable
    )
    (func $my-component.main (;3;) (type 2)
      return
    )
    (func $foo#add (;4;) (type 3) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 16
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      local.get 4
      local.get 0
      i32.store
      local.get 4
      local.get 1
      i32.store offset=4
      local.get 0
      local.get 1
      i32.add
      local.set 5
      local.get 5
      local.get 0
      i32.lt_u
      local.set 6
      local.get 4
      local.get 5
      i32.store offset=8
      i32.const 1
      local.set 7
      local.get 6
      local.get 7
      i32.and
      local.set 8
      local.get 4
      local.get 8
      i32.store8 offset=12
      local.get 4
      i32.load8_u offset=12
      local.set 9
      i32.const 0
      local.set 10
      i32.const 1
      local.set 11
      local.get 9
      local.get 11
      i32.and
      local.set 12
      i32.const 1
      local.set 13
      local.get 10
      local.get 13
      i32.and
      local.set 14
      local.get 12
      local.get 14
      i32.eq
      local.set 15
      i32.const 1
      local.set 16
      local.get 15
      local.get 16
      i32.and
      local.set 17
      block ;; label = @1
        block ;; label = @2
          local.get 17
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1048669
        local.set 18
        i32.const 16
        local.set 19
        i32.const 0
        local.set 20
        i32.const 1049148
        local.set 21
        local.get 18
        local.get 19
        local.get 20
        local.get 21
        call $builtin.default_panic
        unreachable
      end
      local.get 4
      i32.load offset=8
      local.set 22
      i32.const 16
      local.set 23
      local.get 4
      local.get 23
      i32.add
      local.set 24
      local.get 24
      global.set $__stack_pointer
      local.get 22
      return
    )
    (func $builtin.default_panic (;5;) (type 4) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 4
      i32.const 32
      local.set 5
      local.get 4
      local.get 5
      i32.sub
      local.set 6
      local.get 6
      global.set $__stack_pointer
      local.get 6
      local.get 1
      i32.store offset=12
      local.get 6
      local.get 0
      i32.store offset=8
      local.get 6
      local.get 2
      i32.store offset=20
      local.get 6
      local.get 1
      i32.store offset=28
      local.get 6
      local.get 0
      i32.store offset=24
      i32.const 24
      local.set 7
      local.get 6
      local.get 7
      i32.add
      local.set 8
      local.get 8
      local.set 9
      local.get 9
      call $debug.print__anon_1092
      call $os.abort
      unreachable
    )
    (func $debug.print__anon_1092 (;6;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 32
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      i32.const 1049992
      local.set 4
      local.get 4
      call $Thread.Mutex.lock
      local.get 3
      local.set 5
      local.get 5
      call $io.getStdErr
      local.get 3
      i32.load
      local.set 6
      local.get 3
      local.get 6
      i32.store offset=8
      i32.const 16
      local.set 7
      local.get 3
      local.get 7
      i32.add
      local.set 8
      local.get 8
      local.set 9
      i32.const 8
      local.set 10
      local.get 3
      local.get 10
      i32.add
      local.set 11
      local.get 11
      local.set 12
      local.get 9
      local.get 12
      call $fs.file.File.writer
      local.get 3
      i32.load offset=16
      local.set 13
      local.get 3
      local.get 13
      i32.store offset=24
      i32.const 24
      local.set 14
      local.get 3
      local.get 14
      i32.add
      local.set 15
      local.get 15
      local.set 16
      local.get 16
      local.get 0
      call $#func11<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.print__anon_1445>
      local.set 17
      i32.const 0
      local.set 18
      i32.const 65535
      local.set 19
      local.get 17
      local.get 19
      i32.and
      local.set 20
      i32.const 65535
      local.set 21
      local.get 18
      local.get 21
      i32.and
      local.set 22
      local.get 20
      local.get 22
      i32.eq
      local.set 23
      i32.const 1
      local.set 24
      local.get 23
      local.get 24
      i32.and
      local.set 25
      block ;; label = @1
        block ;; label = @2
          local.get 25
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1049992
        local.set 26
        local.get 26
        call $Thread.Mutex.unlock
        i32.const 32
        local.set 27
        local.get 3
        local.get 27
        i32.add
        local.set 28
        local.get 28
        global.set $__stack_pointer
        return
      end
      i32.const 1049992
      local.set 29
      local.get 29
      call $Thread.Mutex.unlock
      i32.const 32
      local.set 30
      local.get 3
      local.get 30
      i32.add
      local.set 31
      local.get 31
      global.set $__stack_pointer
      return
    )
    (func $os.abort (;7;) (type 2)
      (local i32)
      unreachable
      i32.const 1
      local.set 0
      local.get 0
      call $os.exit
      unreachable
    )
    (func $Thread.Mutex.lock (;8;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 16
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      local.get 3
      local.get 0
      i32.store offset=8
      local.get 3
      local.get 0
      i32.store offset=12
      local.get 3
      i32.load offset=12
      local.set 4
      local.get 4
      call $Thread.Mutex.SingleThreadedImpl.lock
      i32.const 16
      local.set 5
      local.get 3
      local.get 5
      i32.add
      local.set 6
      local.get 6
      global.set $__stack_pointer
      return
    )
    (func $io.getStdErr (;9;) (type 0) (param i32)
      (local i32)
      call $io.getStdErrHandle
      local.set 1
      local.get 0
      local.get 1
      i32.store
      return
    )
    (func $fs.file.File.writer (;10;) (type 5) (param i32 i32)
      (local i32)
      local.get 1
      i32.load
      local.set 2
      local.get 0
      local.get 2
      i32.store
      return
    )
    (func $#func11<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.print__anon_1445> (@name "io.writer.Writer(fs.file.File,error{AccessDenied,BrokenPipe,ConnectionResetByPeer,DiskQuota,FileTooBig,InputOutput,LockViolation,NoSpaceLeft,NotOpenForWriting,OperationAborted,SystemResources,Unexpected,WouldBlock},(function \'write\')).print__anon_1445") (;11;) (type 3) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 16
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      local.get 0
      local.get 1
      call $fmt.format__anon_1587
      local.set 5
      local.get 4
      local.get 5
      i32.store16 offset=14
      local.get 4
      i32.load16_u offset=14
      local.set 6
      i32.const 16
      local.set 7
      local.get 4
      local.get 7
      i32.add
      local.set 8
      local.get 8
      global.set $__stack_pointer
      local.get 6
      return
    )
    (func $Thread.Mutex.unlock (;12;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 16
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      local.get 3
      local.get 0
      i32.store offset=8
      local.get 3
      local.get 0
      i32.store offset=12
      local.get 3
      i32.load offset=12
      local.set 4
      local.get 4
      call $Thread.Mutex.SingleThreadedImpl.unlock
      i32.const 16
      local.set 5
      local.get 3
      local.get 5
      i32.add
      local.set 6
      local.get 6
      global.set $__stack_pointer
      return
    )
    (func $os.exit (;13;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 16
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      local.get 3
      local.get 0
      i32.store8 offset=15
      i32.const 255
      local.set 4
      local.get 0
      local.get 4
      i32.and
      local.set 5
      local.get 5
      call $proc_exit|wasi_snapshot_preview1
      unreachable
    )
    (func $debug.assert (;14;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 16
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      i32.const 1
      local.set 4
      local.get 0
      local.get 4
      i32.and
      local.set 5
      local.get 3
      local.get 5
      i32.store8 offset=15
      i32.const -1
      local.set 6
      local.get 0
      local.get 6
      i32.xor
      local.set 7
      i32.const 1
      local.set 8
      local.get 7
      local.get 8
      i32.and
      local.set 9
      block ;; label = @1
        local.get 9
        i32.eqz
        br_if 0 (;@1;)
        i32.const 1048829
        local.set 10
        i32.const 24
        local.set 11
        i32.const 0
        local.set 12
        i32.const 1049156
        local.set 13
        local.get 10
        local.get 11
        local.get 12
        local.get 13
        call $builtin.default_panic
        unreachable
      end
      i32.const 16
      local.set 14
      local.get 3
      local.get 14
      i32.add
      local.set 15
      local.get 15
      global.set $__stack_pointer
      return
    )
    (func $Thread.Mutex.SingleThreadedImpl.lock (;15;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 16
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      local.get 3
      local.get 0
      i32.store offset=8
      local.get 3
      local.get 0
      i32.store offset=12
      local.get 3
      i32.load offset=12
      local.set 4
      local.get 4
      call $Thread.Mutex.SingleThreadedImpl.tryLock
      local.set 5
      i32.const -1
      local.set 6
      local.get 5
      local.get 6
      i32.xor
      local.set 7
      i32.const 1
      local.set 8
      local.get 7
      local.get 8
      i32.and
      local.set 9
      block ;; label = @1
        local.get 9
        i32.eqz
        br_if 0 (;@1;)
        i32.const 1048829
        local.set 10
        i32.const 24
        local.set 11
        i32.const 0
        local.set 12
        i32.const 1049188
        local.set 13
        local.get 10
        local.get 11
        local.get 12
        local.get 13
        call $builtin.default_panic
        unreachable
      end
      i32.const 16
      local.set 14
      local.get 3
      local.get 14
      i32.add
      local.set 15
      local.get 15
      global.set $__stack_pointer
      return
    )
    (func $io.getStdErrHandle (;16;) (type 6) (result i32)
      (local i32)
      i32.const 2
      local.set 0
      local.get 0
      return
    )
    (func $fmt.format__anon_1587 (;17;) (type 3) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 16
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      i32.const 0
      local.set 5
      local.get 4
      local.get 5
      i32.store offset=12
      local.get 1
      i32.load offset=4
      local.set 6
      local.get 1
      i32.load
      local.set 7
      i32.const 1049168
      local.set 8
      i32.const 3
      local.set 9
      local.get 7
      local.get 6
      local.get 8
      local.get 0
      local.get 9
      call $fmt.formatType__anon_1634
      local.set 10
      i32.const 0
      local.set 11
      i32.const 65535
      local.set 12
      local.get 10
      local.get 12
      i32.and
      local.set 13
      i32.const 65535
      local.set 14
      local.get 11
      local.get 14
      i32.and
      local.set 15
      local.get 13
      local.get 15
      i32.ne
      local.set 16
      i32.const 1
      local.set 17
      local.get 16
      local.get 17
      i32.and
      local.set 18
      block ;; label = @1
        local.get 18
        i32.eqz
        br_if 0 (;@1;)
        i32.const 16
        local.set 19
        local.get 4
        local.get 19
        i32.add
        local.set 20
        local.get 20
        global.set $__stack_pointer
        local.get 10
        return
      end
      i32.const 0
      local.set 21
      i32.const 16
      local.set 22
      local.get 4
      local.get 22
      i32.add
      local.set 23
      local.get 23
      global.set $__stack_pointer
      local.get 21
      return
    )
    (func $Thread.Mutex.SingleThreadedImpl.unlock (;18;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 16
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      local.get 3
      local.get 0
      i32.store offset=8
      local.get 0
      i32.load8_u
      local.set 4
      local.get 4
      call $debug.assert
      local.get 3
      local.get 0
      i32.store offset=12
      local.get 3
      i32.load offset=12
      local.set 5
      i32.const 0
      local.set 6
      i32.const 1
      local.set 7
      local.get 6
      local.get 7
      i32.and
      local.set 8
      local.get 5
      local.get 8
      i32.store8
      i32.const 16
      local.set 9
      local.get 3
      local.get 9
      i32.add
      local.set 10
      local.get 10
      global.set $__stack_pointer
      return
    )
    (func $Thread.Mutex.SingleThreadedImpl.tryLock (;19;) (type 7) (param i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 16
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      local.get 3
      local.get 0
      i32.store offset=8
      local.get 0
      i32.load8_u
      local.set 4
      i32.const 1
      local.set 5
      local.get 4
      local.get 5
      i32.and
      local.set 6
      block ;; label = @1
        local.get 6
        i32.eqz
        br_if 0 (;@1;)
        i32.const 0
        local.set 7
        i32.const 16
        local.set 8
        local.get 3
        local.get 8
        i32.add
        local.set 9
        local.get 9
        global.set $__stack_pointer
        local.get 7
        return
      end
      local.get 3
      local.get 0
      i32.store offset=12
      local.get 3
      i32.load offset=12
      local.set 10
      i32.const 1
      local.set 11
      i32.const 1
      local.set 12
      local.get 11
      local.get 12
      i32.and
      local.set 13
      local.get 10
      local.get 13
      i32.store8
      i32.const 1
      local.set 14
      i32.const 16
      local.set 15
      local.get 3
      local.get 15
      i32.add
      local.set 16
      local.get 16
      global.set $__stack_pointer
      local.get 14
      return
    )
    (func $fs.file.File.write (;20;) (type 4) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32)
      global.get $__stack_pointer
      local.set 4
      i32.const 16
      local.set 5
      local.get 4
      local.get 5
      i32.sub
      local.set 6
      local.get 6
      global.set $__stack_pointer
      local.get 3
      local.set 7
      local.get 2
      local.set 8
      local.get 6
      local.get 3
      i32.store offset=4
      local.get 6
      local.get 2
      i32.store
      local.get 1
      i32.load
      local.set 9
      i32.const 8
      local.set 10
      local.get 6
      local.get 10
      i32.add
      local.set 11
      local.get 11
      local.set 12
      local.get 12
      local.get 9
      local.get 8
      local.get 7
      call $os.write
      local.get 6
      i64.load offset=8
      local.set 13
      local.get 0
      local.get 13
      i64.store align=4
      i32.const 16
      local.set 14
      local.get 6
      local.get 14
      i32.add
      local.set 15
      local.get 15
      global.set $__stack_pointer
      return
    )
    (func $os.write (;21;) (type 4) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32)
      global.get $__stack_pointer
      local.set 4
      i32.const 64
      local.set 5
      local.get 4
      local.get 5
      i32.sub
      local.set 6
      local.get 6
      global.set $__stack_pointer
      local.get 3
      local.set 7
      local.get 2
      local.set 8
      local.get 6
      local.get 1
      i32.store offset=12
      local.get 6
      local.get 3
      i32.store offset=20
      local.get 6
      local.get 2
      i32.store offset=16
      block ;; label = @1
        local.get 7
        br_if 0 (;@1;)
        i64.const 0
        local.set 9
        local.get 0
        local.get 9
        i64.store align=4
        i32.const 64
        local.set 10
        local.get 6
        local.get 10
        i32.add
        local.set 11
        local.get 11
        global.set $__stack_pointer
        return
      end
      local.get 6
      local.get 8
      i32.store offset=24
      local.get 6
      local.get 7
      i32.store offset=28
      i32.const -1431655766
      local.set 12
      local.get 6
      local.get 12
      i32.store offset=36
      i32.const 24
      local.set 13
      local.get 6
      local.get 13
      i32.add
      local.set 14
      local.get 14
      local.set 15
      block ;; label = @1
        block ;; label = @2
          local.get 15
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1048731
        local.set 16
        i32.const 30
        local.set 17
        i32.const 0
        local.set 18
        i32.const 1049196
        local.set 19
        local.get 16
        local.get 17
        local.get 18
        local.get 19
        call $builtin.default_panic
        unreachable
      end
      i32.const 1
      local.set 20
      i32.const 24
      local.set 21
      local.get 6
      local.get 21
      i32.add
      local.set 22
      i32.const 36
      local.set 23
      local.get 6
      local.get 23
      i32.add
      local.set 24
      local.get 1
      local.get 22
      local.get 20
      local.get 24
      call $fd_write|wasi_snapshot_preview1
      local.set 25
      i32.const 65535
      local.set 26
      local.get 25
      local.get 26
      i32.and
      local.set 27
      i32.const 76
      local.set 28
      local.get 27
      local.get 28
      i32.gt_u
      drop
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      block ;; label = @9
                        block ;; label = @10
                          block ;; label = @11
                            block ;; label = @12
                              block ;; label = @13
                                block ;; label = @14
                                  block ;; label = @15
                                    local.get 27
                                    br_table 1 (;@14;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 5 (;@10;) 0 (;@15;) 6 (;@9;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 7 (;@8;) 0 (;@15;) 8 (;@7;) 0 (;@15;) 4 (;@11;) 9 (;@6;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 2 (;@13;) 3 (;@12;) 10 (;@5;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 11 (;@4;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 12 (;@3;) 13 (;@2;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 0 (;@15;) 14 (;@1;) 0 (;@15;)
                                  end
                                  local.get 6
                                  local.get 25
                                  i32.store16 offset=54
                                  local.get 25
                                  call $os.unexpectedErrno
                                  local.set 29
                                  local.get 6
                                  local.get 29
                                  i32.store16 offset=60
                                  local.get 6
                                  i64.load offset=56
                                  local.set 30
                                  local.get 0
                                  local.get 30
                                  i64.store align=4
                                  i32.const 64
                                  local.set 31
                                  local.get 6
                                  local.get 31
                                  i32.add
                                  local.set 32
                                  local.get 32
                                  global.set $__stack_pointer
                                  return
                                end
                                local.get 6
                                i32.load offset=36
                                local.set 33
                                i32.const 0
                                local.set 34
                                local.get 6
                                local.get 34
                                i32.store16 offset=44
                                local.get 6
                                local.get 33
                                i32.store offset=40
                                local.get 6
                                i64.load offset=40
                                local.set 35
                                local.get 0
                                local.get 35
                                i64.store align=4
                                i32.const 64
                                local.set 36
                                local.get 6
                                local.get 36
                                i32.add
                                local.set 37
                                local.get 37
                                global.set $__stack_pointer
                                return
                              end
                              i32.const 1048829
                              local.set 38
                              i32.const 24
                              local.set 39
                              i32.const 0
                              local.set 40
                              i32.const 1049204
                              local.set 41
                              local.get 38
                              local.get 39
                              local.get 40
                              local.get 41
                              call $builtin.default_panic
                              unreachable
                            end
                            i32.const 1048829
                            local.set 42
                            i32.const 24
                            local.set 43
                            i32.const 0
                            local.set 44
                            i32.const 1049212
                            local.set 45
                            local.get 42
                            local.get 43
                            local.get 44
                            local.get 45
                            call $builtin.default_panic
                            unreachable
                          end
                          i32.const 1048829
                          local.set 46
                          i32.const 24
                          local.set 47
                          i32.const 0
                          local.set 48
                          i32.const 1049220
                          local.set 49
                          local.get 46
                          local.get 47
                          local.get 48
                          local.get 49
                          call $builtin.default_panic
                          unreachable
                        end
                        i32.const 1048829
                        local.set 50
                        i32.const 24
                        local.set 51
                        i32.const 0
                        local.set 52
                        i32.const 1049228
                        local.set 53
                        local.get 50
                        local.get 51
                        local.get 52
                        local.get 53
                        call $builtin.default_panic
                        unreachable
                      end
                      i32.const 0
                      local.set 54
                      local.get 54
                      i64.load offset=1049236 align=4
                      local.set 55
                      local.get 0
                      local.get 55
                      i64.store align=4
                      i32.const 64
                      local.set 56
                      local.get 6
                      local.get 56
                      i32.add
                      local.set 57
                      local.get 57
                      global.set $__stack_pointer
                      return
                    end
                    i32.const 1048829
                    local.set 58
                    i32.const 24
                    local.set 59
                    i32.const 0
                    local.set 60
                    i32.const 1049244
                    local.set 61
                    local.get 58
                    local.get 59
                    local.get 60
                    local.get 61
                    call $builtin.default_panic
                    unreachable
                  end
                  i32.const 0
                  local.set 62
                  local.get 62
                  i64.load offset=1049252 align=4
                  local.set 63
                  local.get 0
                  local.get 63
                  i64.store align=4
                  i32.const 64
                  local.set 64
                  local.get 6
                  local.get 64
                  i32.add
                  local.set 65
                  local.get 65
                  global.set $__stack_pointer
                  return
                end
                i32.const 0
                local.set 66
                local.get 66
                i64.load offset=1049260 align=4
                local.set 67
                local.get 0
                local.get 67
                i64.store align=4
                i32.const 64
                local.set 68
                local.get 6
                local.get 68
                i32.add
                local.set 69
                local.get 69
                global.set $__stack_pointer
                return
              end
              i32.const 0
              local.set 70
              local.get 70
              i64.load offset=1049268 align=4
              local.set 71
              local.get 0
              local.get 71
              i64.store align=4
              i32.const 64
              local.set 72
              local.get 6
              local.get 72
              i32.add
              local.set 73
              local.get 73
              global.set $__stack_pointer
              return
            end
            i32.const 0
            local.set 74
            local.get 74
            i64.load offset=1049276 align=4
            local.set 75
            local.get 0
            local.get 75
            i64.store align=4
            i32.const 64
            local.set 76
            local.get 6
            local.get 76
            i32.add
            local.set 77
            local.get 77
            global.set $__stack_pointer
            return
          end
          i32.const 0
          local.set 78
          local.get 78
          i64.load offset=1049284 align=4
          local.set 79
          local.get 0
          local.get 79
          i64.store align=4
          i32.const 64
          local.set 80
          local.get 6
          local.get 80
          i32.add
          local.set 81
          local.get 81
          global.set $__stack_pointer
          return
        end
        i32.const 0
        local.set 82
        local.get 82
        i64.load offset=1049292 align=4
        local.set 83
        local.get 0
        local.get 83
        i64.store align=4
        i32.const 64
        local.set 84
        local.get 6
        local.get 84
        i32.add
        local.set 85
        local.get 85
        global.set $__stack_pointer
        return
      end
      i32.const 0
      local.set 86
      local.get 86
      i64.load offset=1049300 align=4
      local.set 87
      local.get 0
      local.get 87
      i64.store align=4
      i32.const 64
      local.set 88
      local.get 6
      local.get 88
      i32.add
      local.set 89
      local.get 89
      global.set $__stack_pointer
      return
    )
    (func $os.unexpectedErrno (;22;) (type 7) (param i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 16
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      local.get 3
      local.get 0
      i32.store16 offset=6
      local.get 3
      local.get 0
      i32.store16 offset=8
      i32.const 8
      local.set 4
      local.get 3
      local.get 4
      i32.add
      local.set 5
      local.get 5
      local.set 6
      local.get 6
      call $debug.print__anon_2357
      i32.const 1049416
      local.set 7
      local.get 7
      call $debug.dumpCurrentStackTrace
      i32.const 13
      local.set 8
      i32.const 16
      local.set 9
      local.get 3
      local.get 9
      i32.add
      local.set 10
      local.get 10
      global.set $__stack_pointer
      local.get 8
      return
    )
    (func $fmt.formatType__anon_1634 (;23;) (type 8) (param i32 i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 5
      i32.const 48
      local.set 6
      local.get 5
      local.get 6
      i32.sub
      local.set 7
      local.get 7
      global.set $__stack_pointer
      local.get 1
      local.set 8
      local.get 0
      local.set 9
      local.get 7
      local.get 1
      i32.store offset=12
      local.get 7
      local.get 0
      i32.store offset=8
      local.get 7
      local.get 4
      i32.store offset=20
      i32.const 1
      local.set 10
      local.get 7
      local.get 10
      i32.store offset=28
      i32.const 1049164
      local.set 11
      local.get 7
      local.get 11
      i32.store offset=24
      block ;; label = @1
        local.get 4
        br_if 0 (;@1;)
        local.get 3
        i32.load
        local.set 12
        local.get 7
        local.get 12
        i32.store offset=40
        i32.const 40
        local.set 13
        local.get 7
        local.get 13
        i32.add
        local.set 14
        local.get 14
        local.set 15
        i32.const 1048661
        local.set 16
        i32.const 7
        local.set 17
        local.get 15
        local.get 16
        local.get 17
        call $#func24<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeAll>
        local.set 18
        local.get 7
        local.get 18
        i32.store16 offset=38
        local.get 7
        i32.load16_u offset=38
        local.set 19
        i32.const 48
        local.set 20
        local.get 7
        local.get 20
        i32.add
        local.set 21
        local.get 21
        global.set $__stack_pointer
        local.get 19
        return
      end
      local.get 9
      local.get 8
      local.get 2
      local.get 3
      call $fmt.formatBuf__anon_2029
      local.set 22
      local.get 7
      local.get 22
      i32.store16 offset=46
      local.get 7
      i32.load16_u offset=46
      local.set 23
      i32.const 48
      local.set 24
      local.get 7
      local.get 24
      i32.add
      local.set 25
      local.get 25
      global.set $__stack_pointer
      local.get 23
      return
    )
    (func $#func24<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeAll> (@name "io.writer.Writer(fs.file.File,error{AccessDenied,BrokenPipe,ConnectionResetByPeer,DiskQuota,FileTooBig,InputOutput,LockViolation,NoSpaceLeft,NotOpenForWriting,OperationAborted,SystemResources,Unexpected,WouldBlock},(function \'write\')).writeAll") (;24;) (type 9) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 64
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 2
      local.set 6
      local.get 1
      local.set 7
      local.get 5
      local.get 2
      i32.store offset=12
      local.get 5
      local.get 1
      i32.store offset=8
      i32.const 0
      local.set 8
      local.get 5
      local.get 8
      i32.store offset=20
      block ;; label = @1
        loop ;; label = @2
          local.get 5
          i32.load offset=20
          local.set 9
          local.get 9
          local.set 10
          local.get 6
          local.set 11
          local.get 10
          local.get 11
          i32.ne
          local.set 12
          i32.const 1
          local.set 13
          local.get 12
          local.get 13
          i32.and
          local.set 14
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  local.get 14
                  i32.eqz
                  br_if 0 (;@6;)
                  local.get 5
                  i32.load offset=20
                  local.set 15
                  local.get 0
                  i32.load
                  local.set 16
                  local.get 5
                  local.get 16
                  i32.store offset=24
                  local.get 5
                  i32.load offset=24
                  local.set 17
                  local.get 5
                  local.get 17
                  i32.store offset=32
                  local.get 5
                  local.get 6
                  i32.store offset=44
                  local.get 5
                  local.get 7
                  i32.store offset=40
                  local.get 5
                  i32.load offset=20
                  local.set 18
                  local.get 5
                  i32.load offset=44
                  local.set 19
                  local.get 5
                  i32.load offset=40
                  local.set 20
                  local.get 20
                  local.get 18
                  i32.add
                  local.set 21
                  local.get 18
                  local.set 22
                  local.get 19
                  local.set 23
                  local.get 22
                  local.get 23
                  i32.le_u
                  local.set 24
                  i32.const 1
                  local.set 25
                  local.get 24
                  local.get 25
                  i32.and
                  local.set 26
                  local.get 26
                  br_if 1 (;@5;)
                  br 2 (;@4;)
                end
                br 4 (;@1;)
              end
              br 1 (;@3;)
            end
            local.get 18
            local.get 19
            call $builtin.panicStartGreaterThanEnd
            unreachable
          end
          local.get 19
          local.get 18
          i32.sub
          local.set 27
          local.get 19
          local.set 28
          local.get 19
          local.set 29
          local.get 28
          local.get 29
          i32.le_u
          local.set 30
          i32.const 1
          local.set 31
          local.get 30
          local.get 31
          i32.and
          local.set 32
          block ;; label = @3
            block ;; label = @4
              local.get 32
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            local.get 19
            local.get 19
            call $builtin.panicOutOfBounds
            unreachable
          end
          local.get 18
          local.set 33
          local.get 19
          local.set 34
          local.get 33
          local.get 34
          i32.le_u
          local.set 35
          i32.const 1
          local.set 36
          local.get 35
          local.get 36
          i32.and
          local.set 37
          block ;; label = @3
            block ;; label = @4
              local.get 37
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            local.get 18
            local.get 19
            call $builtin.panicOutOfBounds
            unreachable
          end
          local.get 27
          local.set 38
          local.get 21
          local.set 39
          i32.const 48
          local.set 40
          local.get 5
          local.get 40
          i32.add
          local.set 41
          local.get 41
          local.set 42
          i32.const 32
          local.set 43
          local.get 5
          local.get 43
          i32.add
          local.set 44
          local.get 44
          local.set 45
          local.get 42
          local.get 45
          local.get 39
          local.get 38
          call $#func40<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.write>
          local.get 5
          i32.load16_u offset=52
          local.set 46
          i32.const 0
          local.set 47
          i32.const 65535
          local.set 48
          local.get 46
          local.get 48
          i32.and
          local.set 49
          i32.const 65535
          local.set 50
          local.get 47
          local.get 50
          i32.and
          local.set 51
          local.get 49
          local.get 51
          i32.ne
          local.set 52
          i32.const 1
          local.set 53
          local.get 52
          local.get 53
          i32.and
          local.set 54
          block ;; label = @3
            local.get 54
            i32.eqz
            br_if 0 (;@3;)
            local.get 5
            i32.load16_u offset=52
            local.set 55
            i32.const 64
            local.set 56
            local.get 5
            local.get 56
            i32.add
            local.set 57
            local.get 57
            global.set $__stack_pointer
            local.get 55
            return
          end
          local.get 5
          i32.load offset=48
          local.set 58
          local.get 15
          local.get 58
          i32.add
          local.set 59
          local.get 59
          local.get 15
          i32.lt_u
          local.set 60
          local.get 5
          local.get 59
          i32.store offset=56
          i32.const 1
          local.set 61
          local.get 60
          local.get 61
          i32.and
          local.set 62
          local.get 5
          local.get 62
          i32.store8 offset=60
          local.get 5
          i32.load8_u offset=60
          local.set 63
          i32.const 0
          local.set 64
          i32.const 1
          local.set 65
          local.get 63
          local.get 65
          i32.and
          local.set 66
          i32.const 1
          local.set 67
          local.get 64
          local.get 67
          i32.and
          local.set 68
          local.get 66
          local.get 68
          i32.eq
          local.set 69
          i32.const 1
          local.set 70
          local.get 69
          local.get 70
          i32.and
          local.set 71
          block ;; label = @3
            block ;; label = @4
              local.get 71
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 1048669
            local.set 72
            i32.const 16
            local.set 73
            i32.const 0
            local.set 74
            i32.const 1049424
            local.set 75
            local.get 72
            local.get 73
            local.get 74
            local.get 75
            call $builtin.default_panic
            unreachable
          end
          local.get 5
          i32.load offset=56
          local.set 76
          local.get 5
          local.get 76
          i32.store offset=20
          br 0 (;@2;)
        end
      end
      i32.const 0
      local.set 77
      i32.const 64
      local.set 78
      local.get 5
      local.get 78
      i32.add
      local.set 79
      local.get 79
      global.set $__stack_pointer
      local.get 77
      return
    )
    (func $fmt.formatBuf__anon_2029 (;25;) (type 1) (param i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 4
      i32.const 144
      local.set 5
      local.get 4
      local.get 5
      i32.sub
      local.set 6
      local.get 6
      global.set $__stack_pointer
      local.get 1
      local.set 7
      local.get 0
      local.set 8
      local.get 6
      local.get 1
      i32.store offset=4
      local.get 6
      local.get 0
      i32.store
      i32.const 8
      local.set 9
      local.get 2
      local.get 9
      i32.add
      local.set 10
      local.get 10
      i64.load align=4
      local.set 11
      local.get 6
      local.get 11
      i64.store offset=8
      local.get 6
      i32.load8_u offset=12
      local.set 12
      i32.const 0
      local.set 13
      i32.const 255
      local.set 14
      local.get 12
      local.get 14
      i32.and
      local.set 15
      i32.const 255
      local.set 16
      local.get 13
      local.get 16
      i32.and
      local.set 17
      local.get 15
      local.get 17
      i32.ne
      local.set 18
      i32.const 1
      local.set 19
      local.get 18
      local.get 19
      i32.and
      local.set 20
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    local.get 20
                    i32.eqz
                    br_if 0 (;@7;)
                    local.get 6
                    i32.load offset=8
                    local.set 21
                    local.get 6
                    local.get 21
                    i32.store offset=20
                    i32.const 24
                    local.set 22
                    local.get 6
                    local.get 22
                    i32.add
                    local.set 23
                    local.get 23
                    local.set 24
                    local.get 24
                    local.get 8
                    local.get 7
                    call $unicode.utf8CountCodepoints
                    local.get 6
                    i32.load16_u offset=28
                    local.set 25
                    i32.const 0
                    local.set 26
                    i32.const 65535
                    local.set 27
                    local.get 25
                    local.get 27
                    i32.and
                    local.set 28
                    i32.const 65535
                    local.set 29
                    local.get 26
                    local.get 29
                    i32.and
                    local.set 30
                    local.get 28
                    local.get 30
                    i32.eq
                    local.set 31
                    i32.const 1
                    local.set 32
                    local.get 31
                    local.get 32
                    i32.and
                    local.set 33
                    local.get 33
                    br_if 1 (;@6;)
                    br 2 (;@5;)
                  end
                  local.get 3
                  i32.load
                  local.set 34
                  local.get 6
                  local.get 34
                  i32.store offset=136
                  i32.const 136
                  local.set 35
                  local.get 6
                  local.get 35
                  i32.add
                  local.set 36
                  local.get 36
                  local.set 37
                  local.get 37
                  local.get 8
                  local.get 7
                  call $#func24<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeAll>
                  local.set 38
                  i32.const 0
                  local.set 39
                  i32.const 65535
                  local.set 40
                  local.get 38
                  local.get 40
                  i32.and
                  local.set 41
                  i32.const 65535
                  local.set 42
                  local.get 39
                  local.get 42
                  i32.and
                  local.set 43
                  local.get 41
                  local.get 43
                  i32.ne
                  local.set 44
                  i32.const 1
                  local.set 45
                  local.get 44
                  local.get 45
                  i32.and
                  local.set 46
                  local.get 46
                  br_if 3 (;@3;)
                  br 4 (;@2;)
                end
                local.get 6
                i32.load offset=24
                local.set 47
                local.get 47
                local.set 48
                br 1 (;@4;)
              end
              local.get 7
              local.set 48
            end
            local.get 48
            local.set 49
            local.get 6
            local.get 49
            i32.store offset=36
            local.get 49
            local.set 50
            local.get 21
            local.set 51
            local.get 50
            local.get 51
            i32.lt_u
            local.set 52
            i32.const 1
            local.set 53
            local.get 52
            local.get 53
            i32.and
            local.set 54
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      local.get 54
                      i32.eqz
                      br_if 0 (;@8;)
                      local.get 21
                      local.get 49
                      i32.sub
                      local.set 55
                      local.get 55
                      local.get 21
                      i32.gt_u
                      local.set 56
                      local.get 6
                      local.get 55
                      i32.store offset=40
                      i32.const 1
                      local.set 57
                      local.get 56
                      local.get 57
                      i32.and
                      local.set 58
                      local.get 6
                      local.get 58
                      i32.store8 offset=44
                      local.get 6
                      i32.load8_u offset=44
                      local.set 59
                      i32.const 0
                      local.set 60
                      i32.const 1
                      local.set 61
                      local.get 59
                      local.get 61
                      i32.and
                      local.set 62
                      i32.const 1
                      local.set 63
                      local.get 60
                      local.get 63
                      i32.and
                      local.set 64
                      local.get 62
                      local.get 64
                      i32.eq
                      local.set 65
                      i32.const 1
                      local.set 66
                      local.get 65
                      local.get 66
                      i32.and
                      local.set 67
                      local.get 67
                      br_if 1 (;@7;)
                      br 2 (;@6;)
                    end
                    i32.const 0
                    local.set 68
                    local.get 68
                    local.set 69
                    br 3 (;@4;)
                  end
                  br 1 (;@5;)
                end
                i32.const 1048669
                local.set 70
                i32.const 16
                local.set 71
                i32.const 0
                local.set 72
                i32.const 1049392
                local.set 73
                local.get 70
                local.get 71
                local.get 72
                local.get 73
                call $builtin.default_panic
                unreachable
              end
              local.get 6
              i32.load offset=40
              local.set 74
              local.get 74
              local.set 69
            end
            local.get 69
            local.set 75
            local.get 6
            local.get 75
            i32.store offset=48
            block ;; label = @4
              local.get 75
              br_if 0 (;@4;)
              local.get 3
              i32.load
              local.set 76
              local.get 6
              local.get 76
              i32.store offset=56
              i32.const 56
              local.set 77
              local.get 6
              local.get 77
              i32.add
              local.set 78
              local.get 78
              local.set 79
              local.get 79
              local.get 8
              local.get 7
              call $#func24<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeAll>
              local.set 80
              local.get 6
              local.get 80
              i32.store16 offset=54
              local.get 6
              i32.load16_u offset=54
              local.set 81
              i32.const 144
              local.set 82
              local.get 6
              local.get 82
              i32.add
              local.set 83
              local.get 83
              global.set $__stack_pointer
              local.get 81
              return
            end
            local.get 2
            i32.load8_u offset=16
            local.set 84
            i32.const 2
            local.set 85
            local.get 84
            local.get 85
            i32.add
            local.set 86
            i32.const 3
            local.set 87
            local.get 86
            local.get 87
            i32.and
            local.set 88
            i32.const 0
            local.set 89
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      local.get 89
                      br_if 0 (;@8;)
                      local.get 88
                      br_table 3 (;@5;) 0 (;@8;) 1 (;@7;) 2 (;@6;) 3 (;@5;)
                    end
                    i32.const 1048805
                    local.set 90
                    i32.const 23
                    local.set 91
                    i32.const 0
                    local.set 92
                    i32.const 1049408
                    local.set 93
                    local.get 90
                    local.get 91
                    local.get 92
                    local.get 93
                    call $builtin.default_panic
                    unreachable
                  end
                  local.get 3
                  i32.load
                  local.set 94
                  local.get 6
                  local.get 94
                  i32.store offset=64
                  i32.const 64
                  local.set 95
                  local.get 6
                  local.get 95
                  i32.add
                  local.set 96
                  local.get 96
                  local.set 97
                  local.get 97
                  local.get 8
                  local.get 7
                  call $#func24<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeAll>
                  local.set 98
                  i32.const 0
                  local.set 99
                  i32.const 65535
                  local.set 100
                  local.get 98
                  local.get 100
                  i32.and
                  local.set 101
                  i32.const 65535
                  local.set 102
                  local.get 99
                  local.get 102
                  i32.and
                  local.set 103
                  local.get 101
                  local.get 103
                  i32.ne
                  local.set 104
                  i32.const 1
                  local.set 105
                  local.get 104
                  local.get 105
                  i32.and
                  local.set 106
                  block ;; label = @7
                    local.get 106
                    i32.eqz
                    br_if 0 (;@7;)
                    i32.const 144
                    local.set 107
                    local.get 6
                    local.get 107
                    i32.add
                    local.set 108
                    local.get 108
                    global.set $__stack_pointer
                    local.get 98
                    return
                  end
                  local.get 3
                  i32.load
                  local.set 109
                  local.get 6
                  local.get 109
                  i32.store offset=72
                  local.get 2
                  i32.load8_u offset=17
                  local.set 110
                  i32.const 72
                  local.set 111
                  local.get 6
                  local.get 111
                  i32.add
                  local.set 112
                  local.get 112
                  local.set 113
                  local.get 113
                  local.get 110
                  local.get 75
                  call $#func39<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeByteNTimes>
                  local.set 114
                  i32.const 0
                  local.set 115
                  i32.const 65535
                  local.set 116
                  local.get 114
                  local.get 116
                  i32.and
                  local.set 117
                  i32.const 65535
                  local.set 118
                  local.get 115
                  local.get 118
                  i32.and
                  local.set 119
                  local.get 117
                  local.get 119
                  i32.ne
                  local.set 120
                  i32.const 1
                  local.set 121
                  local.get 120
                  local.get 121
                  i32.and
                  local.set 122
                  block ;; label = @7
                    local.get 122
                    i32.eqz
                    br_if 0 (;@7;)
                    i32.const 144
                    local.set 123
                    local.get 6
                    local.get 123
                    i32.add
                    local.set 124
                    local.get 124
                    global.set $__stack_pointer
                    local.get 114
                    return
                  end
                  br 2 (;@4;)
                end
                i32.const 1
                local.set 125
                local.get 75
                local.get 125
                i32.shr_u
                local.set 126
                local.get 6
                local.get 126
                i32.store offset=76
                i32.const 1
                local.set 127
                local.get 75
                local.get 127
                i32.add
                local.set 128
                local.get 128
                i32.eqz
                local.set 129
                local.get 6
                local.get 128
                i32.store offset=80
                i32.const 1
                local.set 130
                local.get 129
                local.get 130
                i32.and
                local.set 131
                local.get 6
                local.get 131
                i32.store8 offset=84
                local.get 6
                i32.load8_u offset=84
                local.set 132
                i32.const 0
                local.set 133
                i32.const 1
                local.set 134
                local.get 132
                local.get 134
                i32.and
                local.set 135
                i32.const 1
                local.set 136
                local.get 133
                local.get 136
                i32.and
                local.set 137
                local.get 135
                local.get 137
                i32.eq
                local.set 138
                i32.const 1
                local.set 139
                local.get 138
                local.get 139
                i32.and
                local.set 140
                block ;; label = @6
                  block ;; label = @7
                    local.get 140
                    i32.eqz
                    br_if 0 (;@7;)
                    br 1 (;@6;)
                  end
                  i32.const 1048669
                  local.set 141
                  i32.const 16
                  local.set 142
                  i32.const 0
                  local.set 143
                  i32.const 1049400
                  local.set 144
                  local.get 141
                  local.get 142
                  local.get 143
                  local.get 144
                  call $builtin.default_panic
                  unreachable
                end
                local.get 6
                i32.load offset=80
                local.set 145
                i32.const 1
                local.set 146
                local.get 145
                local.get 146
                i32.shr_u
                local.set 147
                local.get 6
                local.get 147
                i32.store offset=92
                local.get 3
                i32.load
                local.set 148
                local.get 6
                local.get 148
                i32.store offset=96
                local.get 2
                i32.load8_u offset=17
                local.set 149
                i32.const 96
                local.set 150
                local.get 6
                local.get 150
                i32.add
                local.set 151
                local.get 151
                local.set 152
                local.get 152
                local.get 149
                local.get 126
                call $#func39<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeByteNTimes>
                local.set 153
                i32.const 0
                local.set 154
                i32.const 65535
                local.set 155
                local.get 153
                local.get 155
                i32.and
                local.set 156
                i32.const 65535
                local.set 157
                local.get 154
                local.get 157
                i32.and
                local.set 158
                local.get 156
                local.get 158
                i32.ne
                local.set 159
                i32.const 1
                local.set 160
                local.get 159
                local.get 160
                i32.and
                local.set 161
                block ;; label = @6
                  local.get 161
                  i32.eqz
                  br_if 0 (;@6;)
                  i32.const 144
                  local.set 162
                  local.get 6
                  local.get 162
                  i32.add
                  local.set 163
                  local.get 163
                  global.set $__stack_pointer
                  local.get 153
                  return
                end
                local.get 3
                i32.load
                local.set 164
                local.get 6
                local.get 164
                i32.store offset=104
                i32.const 104
                local.set 165
                local.get 6
                local.get 165
                i32.add
                local.set 166
                local.get 166
                local.set 167
                local.get 167
                local.get 8
                local.get 7
                call $#func24<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeAll>
                local.set 168
                i32.const 0
                local.set 169
                i32.const 65535
                local.set 170
                local.get 168
                local.get 170
                i32.and
                local.set 171
                i32.const 65535
                local.set 172
                local.get 169
                local.get 172
                i32.and
                local.set 173
                local.get 171
                local.get 173
                i32.ne
                local.set 174
                i32.const 1
                local.set 175
                local.get 174
                local.get 175
                i32.and
                local.set 176
                block ;; label = @6
                  local.get 176
                  i32.eqz
                  br_if 0 (;@6;)
                  i32.const 144
                  local.set 177
                  local.get 6
                  local.get 177
                  i32.add
                  local.set 178
                  local.get 178
                  global.set $__stack_pointer
                  local.get 168
                  return
                end
                local.get 3
                i32.load
                local.set 179
                local.get 6
                local.get 179
                i32.store offset=112
                local.get 2
                i32.load8_u offset=17
                local.set 180
                i32.const 112
                local.set 181
                local.get 6
                local.get 181
                i32.add
                local.set 182
                local.get 182
                local.set 183
                local.get 183
                local.get 180
                local.get 147
                call $#func39<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeByteNTimes>
                local.set 184
                i32.const 0
                local.set 185
                i32.const 65535
                local.set 186
                local.get 184
                local.get 186
                i32.and
                local.set 187
                i32.const 65535
                local.set 188
                local.get 185
                local.get 188
                i32.and
                local.set 189
                local.get 187
                local.get 189
                i32.ne
                local.set 190
                i32.const 1
                local.set 191
                local.get 190
                local.get 191
                i32.and
                local.set 192
                block ;; label = @6
                  local.get 192
                  i32.eqz
                  br_if 0 (;@6;)
                  i32.const 144
                  local.set 193
                  local.get 6
                  local.get 193
                  i32.add
                  local.set 194
                  local.get 194
                  global.set $__stack_pointer
                  local.get 184
                  return
                end
                br 1 (;@4;)
              end
              local.get 3
              i32.load
              local.set 195
              local.get 6
              local.get 195
              i32.store offset=120
              local.get 2
              i32.load8_u offset=17
              local.set 196
              i32.const 120
              local.set 197
              local.get 6
              local.get 197
              i32.add
              local.set 198
              local.get 198
              local.set 199
              local.get 199
              local.get 196
              local.get 75
              call $#func39<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeByteNTimes>
              local.set 200
              i32.const 0
              local.set 201
              i32.const 65535
              local.set 202
              local.get 200
              local.get 202
              i32.and
              local.set 203
              i32.const 65535
              local.set 204
              local.get 201
              local.get 204
              i32.and
              local.set 205
              local.get 203
              local.get 205
              i32.ne
              local.set 206
              i32.const 1
              local.set 207
              local.get 206
              local.get 207
              i32.and
              local.set 208
              block ;; label = @5
                local.get 208
                i32.eqz
                br_if 0 (;@5;)
                i32.const 144
                local.set 209
                local.get 6
                local.get 209
                i32.add
                local.set 210
                local.get 210
                global.set $__stack_pointer
                local.get 200
                return
              end
              local.get 3
              i32.load
              local.set 211
              local.get 6
              local.get 211
              i32.store offset=128
              i32.const 128
              local.set 212
              local.get 6
              local.get 212
              i32.add
              local.set 213
              local.get 213
              local.set 214
              local.get 214
              local.get 8
              local.get 7
              call $#func24<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeAll>
              local.set 215
              i32.const 0
              local.set 216
              i32.const 65535
              local.set 217
              local.get 215
              local.get 217
              i32.and
              local.set 218
              i32.const 65535
              local.set 219
              local.get 216
              local.get 219
              i32.and
              local.set 220
              local.get 218
              local.get 220
              i32.ne
              local.set 221
              i32.const 1
              local.set 222
              local.get 221
              local.get 222
              i32.and
              local.set 223
              block ;; label = @5
                local.get 223
                i32.eqz
                br_if 0 (;@5;)
                i32.const 144
                local.set 224
                local.get 6
                local.get 224
                i32.add
                local.set 225
                local.get 225
                global.set $__stack_pointer
                local.get 215
                return
              end
            end
            br 2 (;@1;)
          end
          i32.const 144
          local.set 226
          local.get 6
          local.get 226
          i32.add
          local.set 227
          local.get 227
          global.set $__stack_pointer
          local.get 38
          return
        end
      end
      i32.const 0
      local.set 228
      i32.const 144
      local.set 229
      local.get 6
      local.get 229
      i32.add
      local.set 230
      local.get 230
      global.set $__stack_pointer
      local.get 228
      return
    )
    (func $debug.print__anon_2357 (;26;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 32
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      i32.const 1049992
      local.set 4
      local.get 4
      call $Thread.Mutex.lock
      local.get 3
      local.set 5
      local.get 5
      call $io.getStdErr
      local.get 3
      i32.load
      local.set 6
      local.get 3
      local.get 6
      i32.store offset=8
      i32.const 16
      local.set 7
      local.get 3
      local.get 7
      i32.add
      local.set 8
      local.get 8
      local.set 9
      i32.const 8
      local.set 10
      local.get 3
      local.get 10
      i32.add
      local.set 11
      local.get 11
      local.set 12
      local.get 9
      local.get 12
      call $fs.file.File.writer
      local.get 3
      i32.load offset=16
      local.set 13
      local.get 3
      local.get 13
      i32.store offset=24
      i32.const 24
      local.set 14
      local.get 3
      local.get 14
      i32.add
      local.set 15
      local.get 15
      local.set 16
      local.get 16
      local.get 0
      call $#func43<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.print__anon_2364>
      local.set 17
      i32.const 0
      local.set 18
      i32.const 65535
      local.set 19
      local.get 17
      local.get 19
      i32.and
      local.set 20
      i32.const 65535
      local.set 21
      local.get 18
      local.get 21
      i32.and
      local.set 22
      local.get 20
      local.get 22
      i32.eq
      local.set 23
      i32.const 1
      local.set 24
      local.get 23
      local.get 24
      i32.and
      local.set 25
      block ;; label = @1
        block ;; label = @2
          local.get 25
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1049992
        local.set 26
        local.get 26
        call $Thread.Mutex.unlock
        i32.const 32
        local.set 27
        local.get 3
        local.get 27
        i32.add
        local.set 28
        local.get 28
        global.set $__stack_pointer
        return
      end
      i32.const 1049992
      local.set 29
      local.get 29
      call $Thread.Mutex.unlock
      i32.const 32
      local.set 30
      local.get 3
      local.get 30
      i32.add
      local.set 31
      local.get 31
      global.set $__stack_pointer
      return
    )
    (func $debug.dumpCurrentStackTrace (;27;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 32
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      local.get 3
      local.set 4
      local.get 4
      call $io.getStdErr
      local.get 3
      i32.load
      local.set 5
      local.get 3
      local.get 5
      i32.store offset=8
      i32.const 16
      local.set 6
      local.get 3
      local.get 6
      i32.add
      local.set 7
      local.get 7
      local.set 8
      i32.const 8
      local.set 9
      local.get 3
      local.get 9
      i32.add
      local.set 10
      local.get 10
      local.set 11
      local.get 8
      local.get 11
      call $fs.file.File.writer
      local.get 3
      i32.load offset=16
      local.set 12
      local.get 3
      local.get 12
      i32.store offset=24
      i32.const 24
      local.set 13
      local.get 3
      local.get 13
      i32.add
      local.set 14
      local.get 14
      local.set 15
      local.get 15
      call $#func44<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.print__anon_2460>
      local.set 16
      i32.const 0
      local.set 17
      i32.const 65535
      local.set 18
      local.get 16
      local.get 18
      i32.and
      local.set 19
      i32.const 65535
      local.set 20
      local.get 17
      local.get 20
      i32.and
      local.set 21
      local.get 19
      local.get 21
      i32.eq
      local.set 22
      i32.const 1
      local.set 23
      local.get 22
      local.get 23
      i32.and
      local.set 24
      block ;; label = @1
        block ;; label = @2
          local.get 24
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 32
        local.set 25
        local.get 3
        local.get 25
        i32.add
        local.set 26
        local.get 26
        global.set $__stack_pointer
        return
      end
      i32.const 32
      local.set 27
      local.get 3
      local.get 27
      i32.add
      local.set 28
      local.get 28
      global.set $__stack_pointer
      return
    )
    (func $builtin.panicOutOfBounds (;28;) (type 5) (param i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 32
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      local.get 4
      local.get 0
      i32.store offset=8
      local.get 4
      local.get 1
      i32.store offset=12
      local.get 4
      local.get 0
      i32.store offset=16
      local.get 4
      local.get 1
      i32.store offset=20
      i32.const 0
      local.set 5
      local.get 4
      local.get 5
      i32.store offset=24
      i32.const 1
      local.set 6
      local.get 4
      local.get 6
      i32.store8 offset=28
      i32.const 0
      local.set 7
      i32.const 24
      local.set 8
      local.get 4
      local.get 8
      i32.add
      local.set 9
      local.get 9
      local.set 10
      i32.const 16
      local.set 11
      local.get 4
      local.get 11
      i32.add
      local.set 12
      local.get 12
      local.set 13
      local.get 7
      local.get 10
      local.get 13
      call $debug.panicExtra__anon_2359
      unreachable
    )
    (func $builtin.panicStartGreaterThanEnd (;29;) (type 5) (param i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 32
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      local.get 4
      local.get 0
      i32.store offset=8
      local.get 4
      local.get 1
      i32.store offset=12
      local.get 4
      local.get 0
      i32.store offset=16
      local.get 4
      local.get 1
      i32.store offset=20
      i32.const 0
      local.set 5
      local.get 4
      local.get 5
      i32.store offset=24
      i32.const 1
      local.set 6
      local.get 4
      local.get 6
      i32.store8 offset=28
      i32.const 0
      local.set 7
      i32.const 24
      local.set 8
      local.get 4
      local.get 8
      i32.add
      local.set 9
      local.get 9
      local.set 10
      i32.const 16
      local.set 11
      local.get 4
      local.get 11
      i32.add
      local.set 12
      local.get 12
      local.set 13
      local.get 7
      local.get 10
      local.get 13
      call $debug.panicExtra__anon_2361
      unreachable
    )
    (func $debug.panicExtra__anon_2359 (;30;) (type 10) (param i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 4160
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 5
      local.get 0
      i32.store offset=8
      i32.const 1049055
      local.set 6
      local.get 5
      local.get 6
      i32.store offset=12
      i32.const 4111
      local.set 7
      i32.const 170
      local.set 8
      i32.const 17
      local.set 9
      local.get 5
      local.get 9
      i32.add
      local.set 10
      local.get 10
      local.get 8
      local.get 7
      call $memset
      drop
      i32.const 17
      local.set 11
      local.get 5
      local.get 11
      i32.add
      local.set 12
      local.get 12
      local.set 13
      i32.const 1
      local.set 14
      i32.const 1
      local.set 15
      local.get 14
      local.get 15
      i32.and
      local.set 16
      block ;; label = @1
        block ;; label = @2
          local.get 16
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 17
        i32.const 4096
        local.set 18
        local.get 17
        local.get 18
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      i32.const 4096
      local.set 19
      local.get 13
      local.set 20
      i32.const 4128
      local.set 21
      local.get 5
      local.get 21
      i32.add
      local.set 22
      local.get 22
      local.set 23
      local.get 23
      local.get 20
      local.get 19
      local.get 2
      call $fmt.bufPrint__anon_2463
      local.get 5
      i32.load16_u offset=4136
      local.set 24
      i32.const 0
      local.set 25
      i32.const 65535
      local.set 26
      local.get 24
      local.get 26
      i32.and
      local.set 27
      i32.const 65535
      local.set 28
      local.get 25
      local.get 28
      i32.and
      local.set 29
      local.get 27
      local.get 29
      i32.eq
      local.set 30
      i32.const 1
      local.set 31
      local.get 30
      local.get 31
      i32.and
      local.set 32
      block ;; label = @1
        block ;; label = @2
          local.get 32
          i32.eqz
          br_if 0 (;@2;)
          local.get 5
          i32.load offset=4132
          local.set 33
          local.get 5
          i32.load offset=4128
          local.set 34
          local.get 34
          local.set 35
          local.get 33
          local.set 36
          br 1 (;@1;)
        end
        local.get 5
        i32.load16_u offset=4136
        local.set 37
        i32.const 4
        local.set 38
        local.get 37
        local.get 38
        i32.eq
        local.set 39
        block ;; label = @2
          local.get 39
          br_if 0 (;@2;)
          i32.const 1048805
          local.set 40
          i32.const 23
          local.set 41
          i32.const 0
          local.set 42
          i32.const 1049448
          local.set 43
          local.get 40
          local.get 41
          local.get 42
          local.get 43
          call $builtin.default_panic
          unreachable
        end
        i32.const 17
        local.set 44
        local.get 5
        local.get 44
        i32.add
        local.set 45
        local.get 45
        local.set 46
        i32.const 4096
        local.set 47
        local.get 46
        local.get 47
        i32.add
        local.set 48
        i32.const 1
        local.set 49
        i32.const 1
        local.set 50
        local.get 49
        local.get 50
        i32.and
        local.set 51
        block ;; label = @2
          block ;; label = @3
            local.get 51
            i32.eqz
            br_if 0 (;@3;)
            br 1 (;@2;)
          end
          i32.const 4096
          local.set 52
          i32.const 4111
          local.set 53
          local.get 52
          local.get 53
          call $builtin.panicStartGreaterThanEnd
          unreachable
        end
        i32.const 15
        local.set 54
        local.get 48
        local.set 55
        i32.const 1049055
        local.set 56
        i32.const 15
        local.set 57
        local.get 55
        local.get 54
        local.get 56
        local.get 57
        call $mem.copy__anon_2464
        i32.const 17
        local.set 58
        local.get 5
        local.get 58
        i32.add
        local.set 59
        local.get 59
        local.set 60
        local.get 60
        local.set 61
        local.get 61
        local.set 62
        i32.const 4111
        local.set 63
        local.get 62
        local.set 64
        local.get 64
        local.set 35
        local.get 63
        local.set 36
      end
      local.get 36
      local.set 65
      local.get 35
      local.set 66
      local.get 5
      local.get 66
      i32.store offset=4144
      local.get 5
      local.get 65
      i32.store offset=4148
      local.get 5
      local.get 65
      i32.store offset=4156
      local.get 5
      local.get 66
      i32.store offset=4152
      local.get 5
      i32.load offset=4156
      local.set 67
      local.get 5
      i32.load offset=4152
      local.set 68
      local.get 68
      local.get 67
      local.get 0
      local.get 1
      call $builtin.default_panic
      unreachable
    )
    (func $debug.panicExtra__anon_2361 (;31;) (type 10) (param i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 4160
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 5
      local.get 0
      i32.store offset=8
      i32.const 1049055
      local.set 6
      local.get 5
      local.get 6
      i32.store offset=12
      i32.const 4111
      local.set 7
      i32.const 170
      local.set 8
      i32.const 17
      local.set 9
      local.get 5
      local.get 9
      i32.add
      local.set 10
      local.get 10
      local.get 8
      local.get 7
      call $memset
      drop
      i32.const 17
      local.set 11
      local.get 5
      local.get 11
      i32.add
      local.set 12
      local.get 12
      local.set 13
      i32.const 1
      local.set 14
      i32.const 1
      local.set 15
      local.get 14
      local.get 15
      i32.and
      local.set 16
      block ;; label = @1
        block ;; label = @2
          local.get 16
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 17
        i32.const 4096
        local.set 18
        local.get 17
        local.get 18
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      i32.const 4096
      local.set 19
      local.get 13
      local.set 20
      i32.const 4128
      local.set 21
      local.get 5
      local.get 21
      i32.add
      local.set 22
      local.get 22
      local.set 23
      local.get 23
      local.get 20
      local.get 19
      local.get 2
      call $fmt.bufPrint__anon_2465
      local.get 5
      i32.load16_u offset=4136
      local.set 24
      i32.const 0
      local.set 25
      i32.const 65535
      local.set 26
      local.get 24
      local.get 26
      i32.and
      local.set 27
      i32.const 65535
      local.set 28
      local.get 25
      local.get 28
      i32.and
      local.set 29
      local.get 27
      local.get 29
      i32.eq
      local.set 30
      i32.const 1
      local.set 31
      local.get 30
      local.get 31
      i32.and
      local.set 32
      block ;; label = @1
        block ;; label = @2
          local.get 32
          i32.eqz
          br_if 0 (;@2;)
          local.get 5
          i32.load offset=4132
          local.set 33
          local.get 5
          i32.load offset=4128
          local.set 34
          local.get 34
          local.set 35
          local.get 33
          local.set 36
          br 1 (;@1;)
        end
        local.get 5
        i32.load16_u offset=4136
        local.set 37
        i32.const 4
        local.set 38
        local.get 37
        local.get 38
        i32.eq
        local.set 39
        block ;; label = @2
          local.get 39
          br_if 0 (;@2;)
          i32.const 1048805
          local.set 40
          i32.const 23
          local.set 41
          i32.const 0
          local.set 42
          i32.const 1049456
          local.set 43
          local.get 40
          local.get 41
          local.get 42
          local.get 43
          call $builtin.default_panic
          unreachable
        end
        i32.const 17
        local.set 44
        local.get 5
        local.get 44
        i32.add
        local.set 45
        local.get 45
        local.set 46
        i32.const 4096
        local.set 47
        local.get 46
        local.get 47
        i32.add
        local.set 48
        i32.const 1
        local.set 49
        i32.const 1
        local.set 50
        local.get 49
        local.get 50
        i32.and
        local.set 51
        block ;; label = @2
          block ;; label = @3
            local.get 51
            i32.eqz
            br_if 0 (;@3;)
            br 1 (;@2;)
          end
          i32.const 4096
          local.set 52
          i32.const 4111
          local.set 53
          local.get 52
          local.get 53
          call $builtin.panicStartGreaterThanEnd
          unreachable
        end
        i32.const 15
        local.set 54
        local.get 48
        local.set 55
        i32.const 1049055
        local.set 56
        i32.const 15
        local.set 57
        local.get 55
        local.get 54
        local.get 56
        local.get 57
        call $mem.copy__anon_2464
        i32.const 17
        local.set 58
        local.get 5
        local.get 58
        i32.add
        local.set 59
        local.get 59
        local.set 60
        local.get 60
        local.set 61
        local.get 61
        local.set 62
        i32.const 4111
        local.set 63
        local.get 62
        local.set 64
        local.get 64
        local.set 35
        local.get 63
        local.set 36
      end
      local.get 36
      local.set 65
      local.get 35
      local.set 66
      local.get 5
      local.get 66
      i32.store offset=4144
      local.get 5
      local.get 65
      i32.store offset=4148
      local.get 5
      local.get 65
      i32.store offset=4156
      local.get 5
      local.get 66
      i32.store offset=4152
      local.get 5
      i32.load offset=4156
      local.set 67
      local.get 5
      i32.load offset=4152
      local.set 68
      local.get 68
      local.get 67
      local.get 0
      local.get 1
      call $builtin.default_panic
      unreachable
    )
    (func $unicode.utf8ByteSequenceLength (;32;) (type 5) (param i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 16
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      local.get 4
      local.get 1
      i32.store8 offset=15
      i32.const 0
      local.set 5
      i32.const 255
      local.set 6
      local.get 1
      local.get 6
      i32.and
      local.set 7
      i32.const 255
      local.set 8
      local.get 5
      local.get 8
      i32.and
      local.set 9
      local.get 7
      local.get 9
      i32.ge_u
      local.set 10
      i32.const 127
      local.set 11
      i32.const 255
      local.set 12
      local.get 1
      local.get 12
      i32.and
      local.set 13
      i32.const 255
      local.set 14
      local.get 11
      local.get 14
      i32.and
      local.set 15
      local.get 13
      local.get 15
      i32.le_u
      local.set 16
      local.get 10
      local.get 16
      i32.and
      local.set 17
      i32.const 1
      local.set 18
      local.get 17
      local.get 18
      i32.and
      local.set 19
      block ;; label = @1
        block ;; label = @2
          local.get 19
          i32.eqz
          br_if 0 (;@2;)
          i32.const 0
          local.set 20
          local.get 20
          i32.load offset=1049308 align=2
          local.set 21
          local.get 0
          local.get 21
          i32.store align=2
          br 1 (;@1;)
        end
        i32.const 192
        local.set 22
        i32.const 255
        local.set 23
        local.get 1
        local.get 23
        i32.and
        local.set 24
        i32.const 255
        local.set 25
        local.get 22
        local.get 25
        i32.and
        local.set 26
        local.get 24
        local.get 26
        i32.ge_u
        local.set 27
        i32.const 223
        local.set 28
        i32.const 255
        local.set 29
        local.get 1
        local.get 29
        i32.and
        local.set 30
        i32.const 255
        local.set 31
        local.get 28
        local.get 31
        i32.and
        local.set 32
        local.get 30
        local.get 32
        i32.le_u
        local.set 33
        local.get 27
        local.get 33
        i32.and
        local.set 34
        i32.const 1
        local.set 35
        local.get 34
        local.get 35
        i32.and
        local.set 36
        block ;; label = @2
          local.get 36
          i32.eqz
          br_if 0 (;@2;)
          i32.const 0
          local.set 37
          local.get 37
          i32.load offset=1049312 align=2
          local.set 38
          local.get 0
          local.get 38
          i32.store align=2
          br 1 (;@1;)
        end
        i32.const 224
        local.set 39
        i32.const 255
        local.set 40
        local.get 1
        local.get 40
        i32.and
        local.set 41
        i32.const 255
        local.set 42
        local.get 39
        local.get 42
        i32.and
        local.set 43
        local.get 41
        local.get 43
        i32.ge_u
        local.set 44
        i32.const 239
        local.set 45
        i32.const 255
        local.set 46
        local.get 1
        local.get 46
        i32.and
        local.set 47
        i32.const 255
        local.set 48
        local.get 45
        local.get 48
        i32.and
        local.set 49
        local.get 47
        local.get 49
        i32.le_u
        local.set 50
        local.get 44
        local.get 50
        i32.and
        local.set 51
        i32.const 1
        local.set 52
        local.get 51
        local.get 52
        i32.and
        local.set 53
        block ;; label = @2
          local.get 53
          i32.eqz
          br_if 0 (;@2;)
          i32.const 0
          local.set 54
          local.get 54
          i32.load offset=1049316 align=2
          local.set 55
          local.get 0
          local.get 55
          i32.store align=2
          br 1 (;@1;)
        end
        i32.const 240
        local.set 56
        i32.const 255
        local.set 57
        local.get 1
        local.get 57
        i32.and
        local.set 58
        i32.const 255
        local.set 59
        local.get 56
        local.get 59
        i32.and
        local.set 60
        local.get 58
        local.get 60
        i32.ge_u
        local.set 61
        i32.const 247
        local.set 62
        i32.const 255
        local.set 63
        local.get 1
        local.get 63
        i32.and
        local.set 64
        i32.const 255
        local.set 65
        local.get 62
        local.get 65
        i32.and
        local.set 66
        local.get 64
        local.get 66
        i32.le_u
        local.set 67
        local.get 61
        local.get 67
        i32.and
        local.set 68
        i32.const 1
        local.set 69
        local.get 68
        local.get 69
        i32.and
        local.set 70
        block ;; label = @2
          local.get 70
          i32.eqz
          br_if 0 (;@2;)
          i32.const 0
          local.set 71
          local.get 71
          i32.load offset=1049320 align=2
          local.set 72
          local.get 0
          local.get 72
          i32.store align=2
          br 1 (;@1;)
        end
        i32.const 0
        local.set 73
        local.get 73
        i32.load offset=1049324 align=2
        local.set 74
        local.get 0
        local.get 74
        i32.store align=2
      end
      i32.const 16
      local.set 75
      local.get 4
      local.get 75
      i32.add
      local.set 76
      local.get 76
      global.set $__stack_pointer
      return
    )
    (func $unicode.utf8CountCodepoints (;33;) (type 10) (param i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 160
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 2
      local.set 6
      local.get 1
      local.set 7
      local.get 5
      local.get 2
      i32.store offset=12
      local.get 5
      local.get 1
      i32.store offset=8
      i32.const 0
      local.set 8
      local.get 5
      local.get 8
      i32.store offset=16
      i32.const 0
      local.set 9
      local.get 5
      local.get 9
      i32.store offset=20
      block ;; label = @1
        loop ;; label = @2
          local.get 5
          i32.load offset=20
          local.set 10
          local.get 10
          local.set 11
          local.get 6
          local.set 12
          local.get 11
          local.get 12
          i32.lt_u
          local.set 13
          i32.const 1
          local.set 14
          local.get 13
          local.get 14
          i32.and
          local.set 15
          block ;; label = @3
            block ;; label = @4
              local.get 15
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            br 2 (;@1;)
          end
          loop ;; label = @3
            local.get 5
            i32.load offset=20
            local.set 16
            i32.const 4
            local.set 17
            local.get 16
            local.get 17
            i32.add
            local.set 18
            local.get 18
            local.get 16
            i32.lt_u
            local.set 19
            local.get 5
            local.get 18
            i32.store offset=24
            i32.const 1
            local.set 20
            local.get 19
            local.get 20
            i32.and
            local.set 21
            local.get 5
            local.get 21
            i32.store8 offset=28
            local.get 5
            i32.load8_u offset=28
            local.set 22
            i32.const 0
            local.set 23
            i32.const 1
            local.set 24
            local.get 22
            local.get 24
            i32.and
            local.set 25
            i32.const 1
            local.set 26
            local.get 23
            local.get 26
            i32.and
            local.set 27
            local.get 25
            local.get 27
            i32.eq
            local.set 28
            i32.const 1
            local.set 29
            local.get 28
            local.get 29
            i32.and
            local.set 30
            block ;; label = @4
              block ;; label = @5
                local.get 30
                i32.eqz
                br_if 0 (;@5;)
                br 1 (;@4;)
              end
              i32.const 1048669
              local.set 31
              i32.const 16
              local.set 32
              i32.const 0
              local.set 33
              i32.const 1049328
              local.set 34
              local.get 31
              local.get 32
              local.get 33
              local.get 34
              call $builtin.default_panic
              unreachable
            end
            local.get 5
            i32.load offset=24
            local.set 35
            local.get 35
            local.set 36
            local.get 6
            local.set 37
            local.get 36
            local.get 37
            i32.le_u
            local.set 38
            i32.const 1
            local.set 39
            local.get 38
            local.get 39
            i32.and
            local.set 40
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      local.get 40
                      i32.eqz
                      br_if 0 (;@8;)
                      local.get 5
                      local.get 7
                      i32.store offset=32
                      local.get 5
                      local.get 6
                      i32.store offset=36
                      local.get 5
                      i32.load offset=20
                      local.set 41
                      local.get 5
                      i32.load offset=36
                      local.set 42
                      local.get 5
                      i32.load offset=32
                      local.set 43
                      local.get 43
                      local.get 41
                      i32.add
                      local.set 44
                      local.get 41
                      local.set 45
                      local.get 42
                      local.set 46
                      local.get 45
                      local.get 46
                      i32.le_u
                      local.set 47
                      i32.const 1
                      local.set 48
                      local.get 47
                      local.get 48
                      i32.and
                      local.set 49
                      local.get 49
                      br_if 1 (;@7;)
                      br 2 (;@6;)
                    end
                    br 3 (;@4;)
                  end
                  br 1 (;@5;)
                end
                local.get 41
                local.get 42
                call $builtin.panicStartGreaterThanEnd
                unreachable
              end
              local.get 42
              local.get 41
              i32.sub
              local.set 50
              local.get 42
              local.set 51
              local.get 42
              local.set 52
              local.get 51
              local.get 52
              i32.le_u
              local.set 53
              i32.const 1
              local.set 54
              local.get 53
              local.get 54
              i32.and
              local.set 55
              block ;; label = @5
                block ;; label = @6
                  local.get 55
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                local.get 42
                local.get 42
                call $builtin.panicOutOfBounds
                unreachable
              end
              local.get 41
              local.set 56
              local.get 42
              local.set 57
              local.get 56
              local.get 57
              i32.le_u
              local.set 58
              i32.const 1
              local.set 59
              local.get 58
              local.get 59
              i32.and
              local.set 60
              block ;; label = @5
                block ;; label = @6
                  local.get 60
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                local.get 41
                local.get 42
                call $builtin.panicOutOfBounds
                unreachable
              end
              local.get 5
              local.get 50
              i32.store offset=44
              local.get 5
              local.get 44
              i32.store offset=40
              local.get 5
              i32.load offset=44
              local.set 61
              local.get 5
              i32.load offset=40
              local.set 62
              i32.const 1
              local.set 63
              i32.const 1
              local.set 64
              local.get 63
              local.get 64
              i32.and
              local.set 65
              block ;; label = @5
                block ;; label = @6
                  local.get 65
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                i32.const 0
                local.set 66
                i32.const 4
                local.set 67
                local.get 66
                local.get 67
                call $builtin.panicStartGreaterThanEnd
                unreachable
              end
              i32.const 4
              local.set 68
              local.get 68
              local.set 69
              local.get 61
              local.set 70
              local.get 69
              local.get 70
              i32.le_u
              local.set 71
              i32.const 1
              local.set 72
              local.get 71
              local.get 72
              i32.and
              local.set 73
              block ;; label = @5
                block ;; label = @6
                  local.get 73
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                i32.const 4
                local.set 74
                local.get 74
                local.get 61
                call $builtin.panicOutOfBounds
                unreachable
              end
              local.get 62
              call $mem.readIntNative__anon_2350
              local.set 75
              local.get 5
              local.get 75
              i32.store offset=52
              i32.const -2139062144
              local.set 76
              local.get 75
              local.get 76
              i32.and
              local.set 77
              block ;; label = @5
                local.get 77
                i32.eqz
                br_if 0 (;@5;)
                br 1 (;@4;)
              end
              local.get 5
              i32.load offset=16
              local.set 78
              i32.const 4
              local.set 79
              local.get 78
              local.get 79
              i32.add
              local.set 80
              local.get 80
              local.get 78
              i32.lt_u
              local.set 81
              local.get 5
              local.get 80
              i32.store offset=56
              i32.const 1
              local.set 82
              local.get 81
              local.get 82
              i32.and
              local.set 83
              local.get 5
              local.get 83
              i32.store8 offset=60
              local.get 5
              i32.load8_u offset=60
              local.set 84
              i32.const 0
              local.set 85
              i32.const 1
              local.set 86
              local.get 84
              local.get 86
              i32.and
              local.set 87
              i32.const 1
              local.set 88
              local.get 85
              local.get 88
              i32.and
              local.set 89
              local.get 87
              local.get 89
              i32.eq
              local.set 90
              i32.const 1
              local.set 91
              local.get 90
              local.get 91
              i32.and
              local.set 92
              block ;; label = @5
                block ;; label = @6
                  local.get 92
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                i32.const 1048669
                local.set 93
                i32.const 16
                local.set 94
                i32.const 0
                local.set 95
                i32.const 1049336
                local.set 96
                local.get 93
                local.get 94
                local.get 95
                local.get 96
                call $builtin.default_panic
                unreachable
              end
              local.get 5
              i32.load offset=56
              local.set 97
              local.get 5
              local.get 97
              i32.store offset=16
              local.get 5
              i32.load offset=20
              local.set 98
              i32.const 4
              local.set 99
              local.get 98
              local.get 99
              i32.add
              local.set 100
              local.get 100
              local.get 98
              i32.lt_u
              local.set 101
              local.get 5
              local.get 100
              i32.store offset=64
              i32.const 1
              local.set 102
              local.get 101
              local.get 102
              i32.and
              local.set 103
              local.get 5
              local.get 103
              i32.store8 offset=68
              local.get 5
              i32.load8_u offset=68
              local.set 104
              i32.const 0
              local.set 105
              i32.const 1
              local.set 106
              local.get 104
              local.get 106
              i32.and
              local.set 107
              i32.const 1
              local.set 108
              local.get 105
              local.get 108
              i32.and
              local.set 109
              local.get 107
              local.get 109
              i32.eq
              local.set 110
              i32.const 1
              local.set 111
              local.get 110
              local.get 111
              i32.and
              local.set 112
              block ;; label = @5
                block ;; label = @6
                  local.get 112
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                i32.const 1048669
                local.set 113
                i32.const 16
                local.set 114
                i32.const 0
                local.set 115
                i32.const 1049344
                local.set 116
                local.get 113
                local.get 114
                local.get 115
                local.get 116
                call $builtin.default_panic
                unreachable
              end
              local.get 5
              i32.load offset=64
              local.set 117
              local.get 5
              local.get 117
              i32.store offset=20
              br 1 (;@3;)
            end
          end
          local.get 5
          i32.load offset=20
          local.set 118
          local.get 118
          local.set 119
          local.get 6
          local.set 120
          local.get 119
          local.get 120
          i32.lt_u
          local.set 121
          i32.const 1
          local.set 122
          local.get 121
          local.get 122
          i32.and
          local.set 123
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    local.get 123
                    i32.eqz
                    br_if 0 (;@7;)
                    local.get 5
                    i32.load offset=20
                    local.set 124
                    local.get 124
                    local.set 125
                    local.get 6
                    local.set 126
                    local.get 125
                    local.get 126
                    i32.lt_u
                    local.set 127
                    i32.const 1
                    local.set 128
                    local.get 127
                    local.get 128
                    i32.and
                    local.set 129
                    local.get 129
                    br_if 1 (;@6;)
                    br 2 (;@5;)
                  end
                  br 3 (;@3;)
                end
                br 1 (;@4;)
              end
              local.get 124
              local.get 6
              call $builtin.panicOutOfBounds
              unreachable
            end
            local.get 7
            local.get 124
            i32.add
            local.set 130
            local.get 130
            i32.load8_u
            local.set 131
            i32.const 72
            local.set 132
            local.get 5
            local.get 132
            i32.add
            local.set 133
            local.get 133
            local.set 134
            local.get 134
            local.get 131
            call $unicode.utf8ByteSequenceLength
            local.get 5
            i32.load16_u offset=72
            local.set 135
            i32.const 0
            local.set 136
            i32.const 65535
            local.set 137
            local.get 135
            local.get 137
            i32.and
            local.set 138
            i32.const 65535
            local.set 139
            local.get 136
            local.get 139
            i32.and
            local.set 140
            local.get 138
            local.get 140
            i32.ne
            local.set 141
            i32.const 1
            local.set 142
            local.get 141
            local.get 142
            i32.and
            local.set 143
            block ;; label = @4
              local.get 143
              i32.eqz
              br_if 0 (;@4;)
              local.get 5
              i32.load16_u offset=72
              local.set 144
              local.get 5
              local.get 144
              i32.store16 offset=84
              local.get 5
              i64.load offset=80
              local.set 145
              local.get 0
              local.get 145
              i64.store align=4
              i32.const 160
              local.set 146
              local.get 5
              local.get 146
              i32.add
              local.set 147
              local.get 147
              global.set $__stack_pointer
              return
            end
            local.get 5
            i32.load8_u offset=74
            local.set 148
            local.get 148
            local.set 149
            local.get 5
            local.get 148
            i32.store8 offset=95
            local.get 5
            i32.load offset=20
            local.set 150
            local.get 150
            local.get 148
            i32.add
            local.set 151
            local.get 151
            local.get 150
            i32.lt_u
            local.set 152
            local.get 5
            local.get 151
            i32.store offset=96
            i32.const 1
            local.set 153
            local.get 152
            local.get 153
            i32.and
            local.set 154
            local.get 5
            local.get 154
            i32.store8 offset=100
            local.get 5
            i32.load8_u offset=100
            local.set 155
            i32.const 0
            local.set 156
            i32.const 1
            local.set 157
            local.get 155
            local.get 157
            i32.and
            local.set 158
            i32.const 1
            local.set 159
            local.get 156
            local.get 159
            i32.and
            local.set 160
            local.get 158
            local.get 160
            i32.eq
            local.set 161
            i32.const 1
            local.set 162
            local.get 161
            local.get 162
            i32.and
            local.set 163
            block ;; label = @4
              block ;; label = @5
                local.get 163
                i32.eqz
                br_if 0 (;@5;)
                br 1 (;@4;)
              end
              i32.const 1048669
              local.set 164
              i32.const 16
              local.set 165
              i32.const 0
              local.set 166
              i32.const 1049352
              local.set 167
              local.get 164
              local.get 165
              local.get 166
              local.get 167
              call $builtin.default_panic
              unreachable
            end
            local.get 5
            i32.load offset=96
            local.set 168
            local.get 168
            local.set 169
            local.get 6
            local.set 170
            local.get 169
            local.get 170
            i32.gt_u
            local.set 171
            i32.const 1
            local.set 172
            local.get 171
            local.get 172
            i32.and
            local.set 173
            block ;; label = @4
              local.get 173
              i32.eqz
              br_if 0 (;@4;)
              i32.const 0
              local.set 174
              local.get 174
              i64.load offset=1049360 align=4
              local.set 175
              local.get 0
              local.get 175
              i64.store align=4
              i32.const 160
              local.set 176
              local.get 5
              local.get 176
              i32.add
              local.set 177
              local.get 177
              global.set $__stack_pointer
              return
            end
            i32.const 7
            local.set 178
            local.get 149
            local.get 178
            i32.and
            local.set 179
            i32.const 1
            local.set 180
            local.get 179
            local.get 180
            i32.eq
            local.set 181
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      local.get 181
                      br_if 0 (;@8;)
                      local.get 5
                      local.get 7
                      i32.store offset=104
                      local.get 5
                      local.get 6
                      i32.store offset=108
                      local.get 5
                      i32.load offset=20
                      local.set 182
                      local.get 182
                      local.set 183
                      i32.const 7
                      local.set 184
                      local.get 149
                      local.get 184
                      i32.and
                      local.set 185
                      local.get 182
                      local.get 185
                      i32.add
                      local.set 186
                      local.get 186
                      local.get 182
                      i32.lt_u
                      local.set 187
                      local.get 5
                      local.get 186
                      i32.store offset=112
                      i32.const 1
                      local.set 188
                      local.get 187
                      local.get 188
                      i32.and
                      local.set 189
                      local.get 5
                      local.get 189
                      i32.store8 offset=116
                      local.get 5
                      i32.load8_u offset=116
                      local.set 190
                      i32.const 0
                      local.set 191
                      i32.const 1
                      local.set 192
                      local.get 190
                      local.get 192
                      i32.and
                      local.set 193
                      i32.const 1
                      local.set 194
                      local.get 191
                      local.get 194
                      i32.and
                      local.set 195
                      local.get 193
                      local.get 195
                      i32.eq
                      local.set 196
                      i32.const 1
                      local.set 197
                      local.get 196
                      local.get 197
                      i32.and
                      local.set 198
                      local.get 198
                      br_if 1 (;@7;)
                      br 2 (;@6;)
                    end
                    br 3 (;@4;)
                  end
                  br 1 (;@5;)
                end
                i32.const 1048669
                local.set 199
                i32.const 16
                local.set 200
                i32.const 0
                local.set 201
                i32.const 1049368
                local.set 202
                local.get 199
                local.get 200
                local.get 201
                local.get 202
                call $builtin.default_panic
                unreachable
              end
              local.get 5
              i32.load offset=112
              local.set 203
              local.get 5
              i32.load offset=108
              local.set 204
              local.get 5
              i32.load offset=104
              local.set 205
              local.get 205
              local.get 183
              i32.add
              local.set 206
              local.get 183
              local.set 207
              local.get 203
              local.set 208
              local.get 207
              local.get 208
              i32.le_u
              local.set 209
              i32.const 1
              local.set 210
              local.get 209
              local.get 210
              i32.and
              local.set 211
              block ;; label = @5
                block ;; label = @6
                  local.get 211
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                local.get 183
                local.get 203
                call $builtin.panicStartGreaterThanEnd
                unreachable
              end
              local.get 203
              local.get 183
              i32.sub
              local.set 212
              local.get 203
              local.set 213
              local.get 204
              local.set 214
              local.get 213
              local.get 214
              i32.le_u
              local.set 215
              i32.const 1
              local.set 216
              local.get 215
              local.get 216
              i32.and
              local.set 217
              block ;; label = @5
                block ;; label = @6
                  local.get 217
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                local.get 203
                local.get 204
                call $builtin.panicOutOfBounds
                unreachable
              end
              local.get 183
              local.set 218
              local.get 203
              local.set 219
              local.get 218
              local.get 219
              i32.le_u
              local.set 220
              i32.const 1
              local.set 221
              local.get 220
              local.get 221
              i32.and
              local.set 222
              block ;; label = @5
                block ;; label = @6
                  local.get 222
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                local.get 183
                local.get 203
                call $builtin.panicOutOfBounds
                unreachable
              end
              local.get 212
              local.set 223
              local.get 206
              local.set 224
              i32.const 120
              local.set 225
              local.get 5
              local.get 225
              i32.add
              local.set 226
              local.get 226
              local.set 227
              local.get 227
              local.get 224
              local.get 223
              call $unicode.utf8Decode
              local.get 5
              i32.load16_u offset=124
              local.set 228
              i32.const 0
              local.set 229
              i32.const 65535
              local.set 230
              local.get 228
              local.get 230
              i32.and
              local.set 231
              i32.const 65535
              local.set 232
              local.get 229
              local.get 232
              i32.and
              local.set 233
              local.get 231
              local.get 233
              i32.ne
              local.set 234
              i32.const 1
              local.set 235
              local.get 234
              local.get 235
              i32.and
              local.set 236
              block ;; label = @5
                local.get 236
                i32.eqz
                br_if 0 (;@5;)
                local.get 5
                i32.load16_u offset=124
                local.set 237
                local.get 5
                local.get 237
                i32.store16 offset=132
                local.get 5
                i64.load offset=128
                local.set 238
                local.get 0
                local.get 238
                i64.store align=4
                i32.const 160
                local.set 239
                local.get 5
                local.get 239
                i32.add
                local.set 240
                local.get 240
                global.set $__stack_pointer
                return
              end
            end
            local.get 5
            i32.load offset=20
            local.set 241
            i32.const 7
            local.set 242
            local.get 149
            local.get 242
            i32.and
            local.set 243
            local.get 241
            local.get 243
            i32.add
            local.set 244
            local.get 244
            local.get 241
            i32.lt_u
            local.set 245
            local.get 5
            local.get 244
            i32.store offset=136
            i32.const 1
            local.set 246
            local.get 245
            local.get 246
            i32.and
            local.set 247
            local.get 5
            local.get 247
            i32.store8 offset=140
            local.get 5
            i32.load8_u offset=140
            local.set 248
            i32.const 0
            local.set 249
            i32.const 1
            local.set 250
            local.get 248
            local.get 250
            i32.and
            local.set 251
            i32.const 1
            local.set 252
            local.get 249
            local.get 252
            i32.and
            local.set 253
            local.get 251
            local.get 253
            i32.eq
            local.set 254
            i32.const 1
            local.set 255
            local.get 254
            local.get 255
            i32.and
            local.set 256
            block ;; label = @4
              block ;; label = @5
                local.get 256
                i32.eqz
                br_if 0 (;@5;)
                br 1 (;@4;)
              end
              i32.const 1048669
              local.set 257
              i32.const 16
              local.set 258
              i32.const 0
              local.set 259
              i32.const 1049376
              local.set 260
              local.get 257
              local.get 258
              local.get 259
              local.get 260
              call $builtin.default_panic
              unreachable
            end
            local.get 5
            i32.load offset=136
            local.set 261
            local.get 5
            local.get 261
            i32.store offset=20
            local.get 5
            i32.load offset=16
            local.set 262
            i32.const 1
            local.set 263
            local.get 262
            local.get 263
            i32.add
            local.set 264
            local.get 264
            i32.eqz
            local.set 265
            local.get 5
            local.get 264
            i32.store offset=144
            i32.const 1
            local.set 266
            local.get 265
            local.get 266
            i32.and
            local.set 267
            local.get 5
            local.get 267
            i32.store8 offset=148
            local.get 5
            i32.load8_u offset=148
            local.set 268
            i32.const 0
            local.set 269
            i32.const 1
            local.set 270
            local.get 268
            local.get 270
            i32.and
            local.set 271
            i32.const 1
            local.set 272
            local.get 269
            local.get 272
            i32.and
            local.set 273
            local.get 271
            local.get 273
            i32.eq
            local.set 274
            i32.const 1
            local.set 275
            local.get 274
            local.get 275
            i32.and
            local.set 276
            block ;; label = @4
              block ;; label = @5
                local.get 276
                i32.eqz
                br_if 0 (;@5;)
                br 1 (;@4;)
              end
              i32.const 1048669
              local.set 277
              i32.const 16
              local.set 278
              i32.const 0
              local.set 279
              i32.const 1049384
              local.set 280
              local.get 277
              local.get 278
              local.get 279
              local.get 280
              call $builtin.default_panic
              unreachable
            end
            local.get 5
            i32.load offset=144
            local.set 281
            local.get 5
            local.get 281
            i32.store offset=16
          end
          br 0 (;@2;)
        end
      end
      local.get 5
      i32.load offset=16
      local.set 282
      i32.const 0
      local.set 283
      local.get 5
      local.get 283
      i32.store16 offset=156
      local.get 5
      local.get 282
      i32.store offset=152
      local.get 5
      i64.load offset=152
      local.set 284
      local.get 0
      local.get 284
      i64.store align=4
      i32.const 160
      local.set 285
      local.get 5
      local.get 285
      i32.add
      local.set 286
      local.get 286
      global.set $__stack_pointer
      return
    )
    (func $mem.readIntNative__anon_2350 (;34;) (type 7) (param i32) (result i32)
      (local i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 16
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      local.get 3
      local.get 0
      i32.store offset=12
      local.get 0
      i32.load align=1
      local.set 4
      i32.const 16
      local.set 5
      local.get 3
      local.get 5
      i32.add
      local.set 6
      local.get 6
      global.set $__stack_pointer
      local.get 4
      return
    )
    (func $unicode.utf8Decode (;35;) (type 10) (param i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 48
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 2
      local.set 6
      local.get 1
      local.set 7
      local.get 5
      local.get 2
      i32.store offset=12
      local.get 5
      local.get 1
      i32.store offset=8
      i32.const -1
      local.set 8
      local.get 2
      local.get 8
      i32.add
      local.set 9
      i32.const 3
      local.set 10
      local.get 9
      local.get 10
      i32.gt_u
      drop
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  local.get 9
                  br_table 1 (;@5;) 2 (;@4;) 3 (;@3;) 4 (;@2;) 0 (;@6;)
                end
                i32.const 1048829
                local.set 11
                i32.const 24
                local.set 12
                i32.const 0
                local.set 13
                i32.const 1049432
                local.set 14
                local.get 11
                local.get 12
                local.get 13
                local.get 14
                call $builtin.default_panic
                unreachable
              end
              i32.const 0
              local.set 15
              local.get 15
              local.set 16
              local.get 6
              local.set 17
              local.get 16
              local.get 17
              i32.lt_u
              local.set 18
              i32.const 1
              local.set 19
              local.get 18
              local.get 19
              i32.and
              local.set 20
              block ;; label = @5
                block ;; label = @6
                  local.get 20
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                i32.const 0
                local.set 21
                local.get 21
                local.get 6
                call $builtin.panicOutOfBounds
                unreachable
              end
              local.get 7
              i32.load8_u
              local.set 22
              i32.const 0
              local.set 23
              local.get 5
              local.get 23
              i32.store16 offset=20
              local.get 5
              local.get 23
              i32.store8 offset=18
              local.get 5
              local.get 22
              i32.store16 offset=16
              local.get 5
              i64.load offset=16
              local.set 24
              local.get 0
              local.get 24
              i64.store align=4
              br 3 (;@1;)
            end
            i32.const 24
            local.set 25
            local.get 5
            local.get 25
            i32.add
            local.set 26
            local.get 26
            local.set 27
            local.get 27
            local.get 7
            local.get 6
            call $unicode.utf8Decode2
            local.get 5
            i64.load offset=24
            local.set 28
            local.get 0
            local.get 28
            i64.store align=4
            br 2 (;@1;)
          end
          i32.const 32
          local.set 29
          local.get 5
          local.get 29
          i32.add
          local.set 30
          local.get 30
          local.set 31
          local.get 31
          local.get 7
          local.get 6
          call $unicode.utf8Decode3
          local.get 5
          i64.load offset=32
          local.set 32
          local.get 0
          local.get 32
          i64.store align=4
          br 1 (;@1;)
        end
        i32.const 40
        local.set 33
        local.get 5
        local.get 33
        i32.add
        local.set 34
        local.get 34
        local.set 35
        local.get 35
        local.get 7
        local.get 6
        call $unicode.utf8Decode4
        local.get 5
        i64.load offset=40
        local.set 36
        local.get 0
        local.get 36
        i64.store align=4
      end
      i32.const 48
      local.set 37
      local.get 5
      local.get 37
      i32.add
      local.set 38
      local.get 38
      global.set $__stack_pointer
      return
    )
    (func $unicode.utf8Decode2 (;36;) (type 10) (param i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 32
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 2
      local.set 6
      local.get 1
      local.set 7
      local.get 5
      local.get 2
      i32.store offset=12
      local.get 5
      local.get 1
      i32.store offset=8
      i32.const 2
      local.set 8
      local.get 6
      local.set 9
      local.get 8
      local.set 10
      local.get 9
      local.get 10
      i32.eq
      local.set 11
      local.get 11
      call $debug.assert
      i32.const 0
      local.set 12
      local.get 12
      local.set 13
      local.get 6
      local.set 14
      local.get 13
      local.get 14
      i32.lt_u
      local.set 15
      i32.const 1
      local.set 16
      local.get 15
      local.get 16
      i32.and
      local.set 17
      block ;; label = @1
        block ;; label = @2
          local.get 17
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 18
        local.get 18
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u
      local.set 19
      i32.const -32
      local.set 20
      local.get 19
      local.get 20
      i32.and
      local.set 21
      i32.const 192
      local.set 22
      i32.const 255
      local.set 23
      local.get 21
      local.get 23
      i32.and
      local.set 24
      i32.const 255
      local.set 25
      local.get 22
      local.get 25
      i32.and
      local.set 26
      local.get 24
      local.get 26
      i32.eq
      local.set 27
      local.get 27
      call $debug.assert
      i32.const 0
      local.set 28
      local.get 28
      local.set 29
      local.get 6
      local.set 30
      local.get 29
      local.get 30
      i32.lt_u
      local.set 31
      i32.const 1
      local.set 32
      local.get 31
      local.get 32
      i32.and
      local.set 33
      block ;; label = @1
        block ;; label = @2
          local.get 33
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 34
        local.get 34
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u
      local.set 35
      i32.const 31
      local.set 36
      local.get 35
      local.get 36
      i32.and
      local.set 37
      i32.const 0
      local.set 38
      local.get 5
      local.get 38
      i32.store8 offset=22
      local.get 5
      local.get 37
      i32.store16 offset=20
      i32.const 1
      local.set 39
      local.get 39
      local.set 40
      local.get 6
      local.set 41
      local.get 40
      local.get 41
      i32.lt_u
      local.set 42
      i32.const 1
      local.set 43
      local.get 42
      local.get 43
      i32.and
      local.set 44
      block ;; label = @1
        block ;; label = @2
          local.get 44
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1
        local.set 45
        local.get 45
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u offset=1
      local.set 46
      i32.const -64
      local.set 47
      local.get 46
      local.get 47
      i32.and
      local.set 48
      i32.const 128
      local.set 49
      i32.const 255
      local.set 50
      local.get 48
      local.get 50
      i32.and
      local.set 51
      i32.const 255
      local.set 52
      local.get 49
      local.get 52
      i32.and
      local.set 53
      local.get 51
      local.get 53
      i32.ne
      local.set 54
      i32.const 1
      local.set 55
      local.get 54
      local.get 55
      i32.and
      local.set 56
      block ;; label = @1
        local.get 56
        i32.eqz
        br_if 0 (;@1;)
        i32.const 0
        local.set 57
        local.get 57
        i64.load offset=1049464 align=4
        local.set 58
        local.get 0
        local.get 58
        i64.store align=4
        i32.const 32
        local.set 59
        local.get 5
        local.get 59
        i32.add
        local.set 60
        local.get 60
        global.set $__stack_pointer
        return
      end
      local.get 5
      i32.load8_u offset=22
      local.set 61
      i32.const 16
      local.set 62
      local.get 61
      local.get 62
      i32.shl
      local.set 63
      local.get 5
      i32.load16_u offset=20
      local.set 64
      local.get 64
      local.get 63
      i32.or
      local.set 65
      i32.const 1
      local.set 66
      i32.const 1
      local.set 67
      local.get 66
      local.get 67
      i32.and
      local.set 68
      block ;; label = @1
        block ;; label = @2
          local.get 68
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1048762
        local.set 69
        i32.const 42
        local.set 70
        i32.const 0
        local.set 71
        i32.const 1049472
        local.set 72
        local.get 69
        local.get 70
        local.get 71
        local.get 72
        call $builtin.default_panic
        unreachable
      end
      i32.const 6
      local.set 73
      local.get 65
      local.get 73
      i32.shl
      local.set 74
      local.get 5
      local.get 74
      i32.store16 offset=20
      i32.const 10
      local.set 75
      local.get 65
      local.get 75
      i32.shr_u
      local.set 76
      i32.const 31
      local.set 77
      local.get 76
      local.get 77
      i32.and
      local.set 78
      local.get 5
      local.get 78
      i32.store8 offset=22
      local.get 5
      i32.load8_u offset=22
      local.set 79
      i32.const 16
      local.set 80
      local.get 79
      local.get 80
      i32.shl
      local.set 81
      local.get 5
      i32.load16_u offset=20
      local.set 82
      local.get 82
      local.get 81
      i32.or
      local.set 83
      i32.const 1
      local.set 84
      local.get 84
      local.set 85
      local.get 6
      local.set 86
      local.get 85
      local.get 86
      i32.lt_u
      local.set 87
      i32.const 1
      local.set 88
      local.get 87
      local.get 88
      i32.and
      local.set 89
      block ;; label = @1
        block ;; label = @2
          local.get 89
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1
        local.set 90
        local.get 90
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u offset=1
      local.set 91
      i32.const 63
      local.set 92
      local.get 91
      local.get 92
      i32.and
      local.set 93
      local.get 83
      local.get 93
      i32.or
      local.set 94
      local.get 5
      local.get 94
      i32.store16 offset=20
      i32.const 2097151
      local.set 95
      local.get 94
      local.get 95
      i32.and
      local.set 96
      i32.const 16
      local.set 97
      local.get 96
      local.get 97
      i32.shr_u
      local.set 98
      local.get 5
      local.get 98
      i32.store8 offset=22
      local.get 5
      i32.load8_u offset=22
      local.set 99
      local.get 99
      local.get 97
      i32.shl
      local.set 100
      local.get 5
      i32.load16_u offset=20
      local.set 101
      local.get 101
      local.get 100
      i32.or
      local.set 102
      i32.const 128
      local.set 103
      local.get 102
      local.get 103
      i32.lt_u
      local.set 104
      i32.const 1
      local.set 105
      local.get 104
      local.get 105
      i32.and
      local.set 106
      block ;; label = @1
        local.get 106
        i32.eqz
        br_if 0 (;@1;)
        i32.const 0
        local.set 107
        local.get 107
        i64.load offset=1049480 align=4
        local.set 108
        local.get 0
        local.get 108
        i64.store align=4
        i32.const 32
        local.set 109
        local.get 5
        local.get 109
        i32.add
        local.set 110
        local.get 110
        global.set $__stack_pointer
        return
      end
      local.get 5
      i32.load8_u offset=22
      local.set 111
      i32.const 16
      local.set 112
      local.get 111
      local.get 112
      i32.shl
      local.set 113
      local.get 5
      i32.load16_u offset=20
      local.set 114
      local.get 114
      local.get 113
      i32.or
      local.set 115
      i32.const 0
      local.set 116
      local.get 5
      local.get 116
      i32.store16 offset=28
      local.get 5
      local.get 114
      i32.store16 offset=24
      i32.const 2097151
      local.set 117
      local.get 115
      local.get 117
      i32.and
      local.set 118
      local.get 118
      local.get 112
      i32.shr_u
      local.set 119
      local.get 5
      local.get 119
      i32.store8 offset=26
      local.get 5
      i64.load offset=24
      local.set 120
      local.get 0
      local.get 120
      i64.store align=4
      i32.const 32
      local.set 121
      local.get 5
      local.get 121
      i32.add
      local.set 122
      local.get 122
      global.set $__stack_pointer
      return
    )
    (func $unicode.utf8Decode3 (;37;) (type 10) (param i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 32
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 2
      local.set 6
      local.get 1
      local.set 7
      local.get 5
      local.get 2
      i32.store offset=12
      local.get 5
      local.get 1
      i32.store offset=8
      i32.const 3
      local.set 8
      local.get 6
      local.set 9
      local.get 8
      local.set 10
      local.get 9
      local.get 10
      i32.eq
      local.set 11
      local.get 11
      call $debug.assert
      i32.const 0
      local.set 12
      local.get 12
      local.set 13
      local.get 6
      local.set 14
      local.get 13
      local.get 14
      i32.lt_u
      local.set 15
      i32.const 1
      local.set 16
      local.get 15
      local.get 16
      i32.and
      local.set 17
      block ;; label = @1
        block ;; label = @2
          local.get 17
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 18
        local.get 18
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u
      local.set 19
      i32.const -16
      local.set 20
      local.get 19
      local.get 20
      i32.and
      local.set 21
      i32.const 224
      local.set 22
      i32.const 255
      local.set 23
      local.get 21
      local.get 23
      i32.and
      local.set 24
      i32.const 255
      local.set 25
      local.get 22
      local.get 25
      i32.and
      local.set 26
      local.get 24
      local.get 26
      i32.eq
      local.set 27
      local.get 27
      call $debug.assert
      i32.const 0
      local.set 28
      local.get 28
      local.set 29
      local.get 6
      local.set 30
      local.get 29
      local.get 30
      i32.lt_u
      local.set 31
      i32.const 1
      local.set 32
      local.get 31
      local.get 32
      i32.and
      local.set 33
      block ;; label = @1
        block ;; label = @2
          local.get 33
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 34
        local.get 34
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u
      local.set 35
      i32.const 15
      local.set 36
      local.get 35
      local.get 36
      i32.and
      local.set 37
      i32.const 0
      local.set 38
      local.get 5
      local.get 38
      i32.store8 offset=22
      local.get 5
      local.get 37
      i32.store16 offset=20
      i32.const 1
      local.set 39
      local.get 39
      local.set 40
      local.get 6
      local.set 41
      local.get 40
      local.get 41
      i32.lt_u
      local.set 42
      i32.const 1
      local.set 43
      local.get 42
      local.get 43
      i32.and
      local.set 44
      block ;; label = @1
        block ;; label = @2
          local.get 44
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1
        local.set 45
        local.get 45
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u offset=1
      local.set 46
      i32.const -64
      local.set 47
      local.get 46
      local.get 47
      i32.and
      local.set 48
      i32.const 128
      local.set 49
      i32.const 255
      local.set 50
      local.get 48
      local.get 50
      i32.and
      local.set 51
      i32.const 255
      local.set 52
      local.get 49
      local.get 52
      i32.and
      local.set 53
      local.get 51
      local.get 53
      i32.ne
      local.set 54
      i32.const 1
      local.set 55
      local.get 54
      local.get 55
      i32.and
      local.set 56
      block ;; label = @1
        local.get 56
        i32.eqz
        br_if 0 (;@1;)
        i32.const 0
        local.set 57
        local.get 57
        i64.load offset=1049488 align=4
        local.set 58
        local.get 0
        local.get 58
        i64.store align=4
        i32.const 32
        local.set 59
        local.get 5
        local.get 59
        i32.add
        local.set 60
        local.get 60
        global.set $__stack_pointer
        return
      end
      local.get 5
      i32.load8_u offset=22
      local.set 61
      i32.const 16
      local.set 62
      local.get 61
      local.get 62
      i32.shl
      local.set 63
      local.get 5
      i32.load16_u offset=20
      local.set 64
      local.get 64
      local.get 63
      i32.or
      local.set 65
      i32.const 1
      local.set 66
      i32.const 1
      local.set 67
      local.get 66
      local.get 67
      i32.and
      local.set 68
      block ;; label = @1
        block ;; label = @2
          local.get 68
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1048762
        local.set 69
        i32.const 42
        local.set 70
        i32.const 0
        local.set 71
        i32.const 1049496
        local.set 72
        local.get 69
        local.get 70
        local.get 71
        local.get 72
        call $builtin.default_panic
        unreachable
      end
      i32.const 6
      local.set 73
      local.get 65
      local.get 73
      i32.shl
      local.set 74
      local.get 5
      local.get 74
      i32.store16 offset=20
      i32.const 10
      local.set 75
      local.get 65
      local.get 75
      i32.shr_u
      local.set 76
      i32.const 31
      local.set 77
      local.get 76
      local.get 77
      i32.and
      local.set 78
      local.get 5
      local.get 78
      i32.store8 offset=22
      local.get 5
      i32.load8_u offset=22
      local.set 79
      i32.const 16
      local.set 80
      local.get 79
      local.get 80
      i32.shl
      local.set 81
      local.get 5
      i32.load16_u offset=20
      local.set 82
      local.get 82
      local.get 81
      i32.or
      local.set 83
      i32.const 1
      local.set 84
      local.get 84
      local.set 85
      local.get 6
      local.set 86
      local.get 85
      local.get 86
      i32.lt_u
      local.set 87
      i32.const 1
      local.set 88
      local.get 87
      local.get 88
      i32.and
      local.set 89
      block ;; label = @1
        block ;; label = @2
          local.get 89
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1
        local.set 90
        local.get 90
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u offset=1
      local.set 91
      i32.const 63
      local.set 92
      local.get 91
      local.get 92
      i32.and
      local.set 93
      local.get 83
      local.get 93
      i32.or
      local.set 94
      local.get 5
      local.get 94
      i32.store16 offset=20
      i32.const 2097151
      local.set 95
      local.get 94
      local.get 95
      i32.and
      local.set 96
      i32.const 16
      local.set 97
      local.get 96
      local.get 97
      i32.shr_u
      local.set 98
      local.get 5
      local.get 98
      i32.store8 offset=22
      i32.const 2
      local.set 99
      local.get 99
      local.set 100
      local.get 6
      local.set 101
      local.get 100
      local.get 101
      i32.lt_u
      local.set 102
      i32.const 1
      local.set 103
      local.get 102
      local.get 103
      i32.and
      local.set 104
      block ;; label = @1
        block ;; label = @2
          local.get 104
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 2
        local.set 105
        local.get 105
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u offset=2
      local.set 106
      i32.const -64
      local.set 107
      local.get 106
      local.get 107
      i32.and
      local.set 108
      i32.const 128
      local.set 109
      i32.const 255
      local.set 110
      local.get 108
      local.get 110
      i32.and
      local.set 111
      i32.const 255
      local.set 112
      local.get 109
      local.get 112
      i32.and
      local.set 113
      local.get 111
      local.get 113
      i32.ne
      local.set 114
      i32.const 1
      local.set 115
      local.get 114
      local.get 115
      i32.and
      local.set 116
      block ;; label = @1
        local.get 116
        i32.eqz
        br_if 0 (;@1;)
        i32.const 0
        local.set 117
        local.get 117
        i64.load offset=1049504 align=4
        local.set 118
        local.get 0
        local.get 118
        i64.store align=4
        i32.const 32
        local.set 119
        local.get 5
        local.get 119
        i32.add
        local.set 120
        local.get 120
        global.set $__stack_pointer
        return
      end
      local.get 5
      i32.load8_u offset=22
      local.set 121
      i32.const 16
      local.set 122
      local.get 121
      local.get 122
      i32.shl
      local.set 123
      local.get 5
      i32.load16_u offset=20
      local.set 124
      local.get 124
      local.get 123
      i32.or
      local.set 125
      i32.const 1
      local.set 126
      i32.const 1
      local.set 127
      local.get 126
      local.get 127
      i32.and
      local.set 128
      block ;; label = @1
        block ;; label = @2
          local.get 128
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1048762
        local.set 129
        i32.const 42
        local.set 130
        i32.const 0
        local.set 131
        i32.const 1049512
        local.set 132
        local.get 129
        local.get 130
        local.get 131
        local.get 132
        call $builtin.default_panic
        unreachable
      end
      i32.const 6
      local.set 133
      local.get 125
      local.get 133
      i32.shl
      local.set 134
      local.get 5
      local.get 134
      i32.store16 offset=20
      i32.const 10
      local.set 135
      local.get 125
      local.get 135
      i32.shr_u
      local.set 136
      i32.const 31
      local.set 137
      local.get 136
      local.get 137
      i32.and
      local.set 138
      local.get 5
      local.get 138
      i32.store8 offset=22
      local.get 5
      i32.load8_u offset=22
      local.set 139
      i32.const 16
      local.set 140
      local.get 139
      local.get 140
      i32.shl
      local.set 141
      local.get 5
      i32.load16_u offset=20
      local.set 142
      local.get 142
      local.get 141
      i32.or
      local.set 143
      i32.const 2
      local.set 144
      local.get 144
      local.set 145
      local.get 6
      local.set 146
      local.get 145
      local.get 146
      i32.lt_u
      local.set 147
      i32.const 1
      local.set 148
      local.get 147
      local.get 148
      i32.and
      local.set 149
      block ;; label = @1
        block ;; label = @2
          local.get 149
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 2
        local.set 150
        local.get 150
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u offset=2
      local.set 151
      i32.const 63
      local.set 152
      local.get 151
      local.get 152
      i32.and
      local.set 153
      local.get 143
      local.get 153
      i32.or
      local.set 154
      local.get 5
      local.get 154
      i32.store16 offset=20
      i32.const 2097151
      local.set 155
      local.get 154
      local.get 155
      i32.and
      local.set 156
      i32.const 16
      local.set 157
      local.get 156
      local.get 157
      i32.shr_u
      local.set 158
      local.get 5
      local.get 158
      i32.store8 offset=22
      local.get 5
      i32.load8_u offset=22
      local.set 159
      local.get 159
      local.get 157
      i32.shl
      local.set 160
      local.get 5
      i32.load16_u offset=20
      local.set 161
      local.get 161
      local.get 160
      i32.or
      local.set 162
      i32.const 2048
      local.set 163
      local.get 162
      local.get 163
      i32.lt_u
      local.set 164
      i32.const 1
      local.set 165
      local.get 164
      local.get 165
      i32.and
      local.set 166
      block ;; label = @1
        local.get 166
        i32.eqz
        br_if 0 (;@1;)
        i32.const 0
        local.set 167
        local.get 167
        i64.load offset=1049520 align=4
        local.set 168
        local.get 0
        local.get 168
        i64.store align=4
        i32.const 32
        local.set 169
        local.get 5
        local.get 169
        i32.add
        local.set 170
        local.get 170
        global.set $__stack_pointer
        return
      end
      local.get 5
      i32.load8_u offset=22
      local.set 171
      i32.const 16
      local.set 172
      local.get 171
      local.get 172
      i32.shl
      local.set 173
      local.get 5
      i32.load16_u offset=20
      local.set 174
      local.get 174
      local.get 173
      i32.or
      local.set 175
      i32.const 55295
      local.set 176
      local.get 175
      local.get 176
      i32.gt_u
      local.set 177
      i32.const 1
      local.set 178
      local.get 177
      local.get 178
      i32.and
      local.set 179
      block ;; label = @1
        block ;; label = @2
          local.get 179
          i32.eqz
          br_if 0 (;@2;)
          local.get 5
          i32.load8_u offset=22
          local.set 180
          i32.const 16
          local.set 181
          local.get 180
          local.get 181
          i32.shl
          local.set 182
          local.get 5
          i32.load16_u offset=20
          local.set 183
          local.get 183
          local.get 182
          i32.or
          local.set 184
          i32.const 57344
          local.set 185
          local.get 184
          local.get 185
          i32.lt_u
          local.set 186
          local.get 186
          local.set 187
          br 1 (;@1;)
        end
        i32.const 0
        local.set 188
        local.get 188
        local.set 187
      end
      local.get 187
      local.set 189
      i32.const 1
      local.set 190
      local.get 189
      local.get 190
      i32.and
      local.set 191
      block ;; label = @1
        local.get 191
        i32.eqz
        br_if 0 (;@1;)
        i32.const 0
        local.set 192
        local.get 192
        i64.load offset=1049528 align=4
        local.set 193
        local.get 0
        local.get 193
        i64.store align=4
        i32.const 32
        local.set 194
        local.get 5
        local.get 194
        i32.add
        local.set 195
        local.get 195
        global.set $__stack_pointer
        return
      end
      local.get 5
      i32.load8_u offset=22
      local.set 196
      i32.const 16
      local.set 197
      local.get 196
      local.get 197
      i32.shl
      local.set 198
      local.get 5
      i32.load16_u offset=20
      local.set 199
      local.get 199
      local.get 198
      i32.or
      local.set 200
      i32.const 0
      local.set 201
      local.get 5
      local.get 201
      i32.store16 offset=28
      local.get 5
      local.get 199
      i32.store16 offset=24
      i32.const 2097151
      local.set 202
      local.get 200
      local.get 202
      i32.and
      local.set 203
      local.get 203
      local.get 197
      i32.shr_u
      local.set 204
      local.get 5
      local.get 204
      i32.store8 offset=26
      local.get 5
      i64.load offset=24
      local.set 205
      local.get 0
      local.get 205
      i64.store align=4
      i32.const 32
      local.set 206
      local.get 5
      local.get 206
      i32.add
      local.set 207
      local.get 207
      global.set $__stack_pointer
      return
    )
    (func $unicode.utf8Decode4 (;38;) (type 10) (param i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 32
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 2
      local.set 6
      local.get 1
      local.set 7
      local.get 5
      local.get 2
      i32.store offset=12
      local.get 5
      local.get 1
      i32.store offset=8
      i32.const 4
      local.set 8
      local.get 6
      local.set 9
      local.get 8
      local.set 10
      local.get 9
      local.get 10
      i32.eq
      local.set 11
      local.get 11
      call $debug.assert
      i32.const 0
      local.set 12
      local.get 12
      local.set 13
      local.get 6
      local.set 14
      local.get 13
      local.get 14
      i32.lt_u
      local.set 15
      i32.const 1
      local.set 16
      local.get 15
      local.get 16
      i32.and
      local.set 17
      block ;; label = @1
        block ;; label = @2
          local.get 17
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 18
        local.get 18
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u
      local.set 19
      i32.const -8
      local.set 20
      local.get 19
      local.get 20
      i32.and
      local.set 21
      i32.const 240
      local.set 22
      i32.const 255
      local.set 23
      local.get 21
      local.get 23
      i32.and
      local.set 24
      i32.const 255
      local.set 25
      local.get 22
      local.get 25
      i32.and
      local.set 26
      local.get 24
      local.get 26
      i32.eq
      local.set 27
      local.get 27
      call $debug.assert
      i32.const 0
      local.set 28
      local.get 28
      local.set 29
      local.get 6
      local.set 30
      local.get 29
      local.get 30
      i32.lt_u
      local.set 31
      i32.const 1
      local.set 32
      local.get 31
      local.get 32
      i32.and
      local.set 33
      block ;; label = @1
        block ;; label = @2
          local.get 33
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 34
        local.get 34
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u
      local.set 35
      i32.const 7
      local.set 36
      local.get 35
      local.get 36
      i32.and
      local.set 37
      i32.const 0
      local.set 38
      local.get 5
      local.get 38
      i32.store8 offset=22
      local.get 5
      local.get 37
      i32.store16 offset=20
      i32.const 1
      local.set 39
      local.get 39
      local.set 40
      local.get 6
      local.set 41
      local.get 40
      local.get 41
      i32.lt_u
      local.set 42
      i32.const 1
      local.set 43
      local.get 42
      local.get 43
      i32.and
      local.set 44
      block ;; label = @1
        block ;; label = @2
          local.get 44
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1
        local.set 45
        local.get 45
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u offset=1
      local.set 46
      i32.const -64
      local.set 47
      local.get 46
      local.get 47
      i32.and
      local.set 48
      i32.const 128
      local.set 49
      i32.const 255
      local.set 50
      local.get 48
      local.get 50
      i32.and
      local.set 51
      i32.const 255
      local.set 52
      local.get 49
      local.get 52
      i32.and
      local.set 53
      local.get 51
      local.get 53
      i32.ne
      local.set 54
      i32.const 1
      local.set 55
      local.get 54
      local.get 55
      i32.and
      local.set 56
      block ;; label = @1
        local.get 56
        i32.eqz
        br_if 0 (;@1;)
        i32.const 0
        local.set 57
        local.get 57
        i64.load offset=1049536 align=4
        local.set 58
        local.get 0
        local.get 58
        i64.store align=4
        i32.const 32
        local.set 59
        local.get 5
        local.get 59
        i32.add
        local.set 60
        local.get 60
        global.set $__stack_pointer
        return
      end
      local.get 5
      i32.load8_u offset=22
      local.set 61
      i32.const 16
      local.set 62
      local.get 61
      local.get 62
      i32.shl
      local.set 63
      local.get 5
      i32.load16_u offset=20
      local.set 64
      local.get 64
      local.get 63
      i32.or
      local.set 65
      i32.const 1
      local.set 66
      i32.const 1
      local.set 67
      local.get 66
      local.get 67
      i32.and
      local.set 68
      block ;; label = @1
        block ;; label = @2
          local.get 68
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1048762
        local.set 69
        i32.const 42
        local.set 70
        i32.const 0
        local.set 71
        i32.const 1049544
        local.set 72
        local.get 69
        local.get 70
        local.get 71
        local.get 72
        call $builtin.default_panic
        unreachable
      end
      i32.const 6
      local.set 73
      local.get 65
      local.get 73
      i32.shl
      local.set 74
      local.get 5
      local.get 74
      i32.store16 offset=20
      i32.const 10
      local.set 75
      local.get 65
      local.get 75
      i32.shr_u
      local.set 76
      i32.const 31
      local.set 77
      local.get 76
      local.get 77
      i32.and
      local.set 78
      local.get 5
      local.get 78
      i32.store8 offset=22
      local.get 5
      i32.load8_u offset=22
      local.set 79
      i32.const 16
      local.set 80
      local.get 79
      local.get 80
      i32.shl
      local.set 81
      local.get 5
      i32.load16_u offset=20
      local.set 82
      local.get 82
      local.get 81
      i32.or
      local.set 83
      i32.const 1
      local.set 84
      local.get 84
      local.set 85
      local.get 6
      local.set 86
      local.get 85
      local.get 86
      i32.lt_u
      local.set 87
      i32.const 1
      local.set 88
      local.get 87
      local.get 88
      i32.and
      local.set 89
      block ;; label = @1
        block ;; label = @2
          local.get 89
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1
        local.set 90
        local.get 90
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u offset=1
      local.set 91
      i32.const 63
      local.set 92
      local.get 91
      local.get 92
      i32.and
      local.set 93
      local.get 83
      local.get 93
      i32.or
      local.set 94
      local.get 5
      local.get 94
      i32.store16 offset=20
      i32.const 2097151
      local.set 95
      local.get 94
      local.get 95
      i32.and
      local.set 96
      i32.const 16
      local.set 97
      local.get 96
      local.get 97
      i32.shr_u
      local.set 98
      local.get 5
      local.get 98
      i32.store8 offset=22
      i32.const 2
      local.set 99
      local.get 99
      local.set 100
      local.get 6
      local.set 101
      local.get 100
      local.get 101
      i32.lt_u
      local.set 102
      i32.const 1
      local.set 103
      local.get 102
      local.get 103
      i32.and
      local.set 104
      block ;; label = @1
        block ;; label = @2
          local.get 104
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 2
        local.set 105
        local.get 105
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u offset=2
      local.set 106
      i32.const -64
      local.set 107
      local.get 106
      local.get 107
      i32.and
      local.set 108
      i32.const 128
      local.set 109
      i32.const 255
      local.set 110
      local.get 108
      local.get 110
      i32.and
      local.set 111
      i32.const 255
      local.set 112
      local.get 109
      local.get 112
      i32.and
      local.set 113
      local.get 111
      local.get 113
      i32.ne
      local.set 114
      i32.const 1
      local.set 115
      local.get 114
      local.get 115
      i32.and
      local.set 116
      block ;; label = @1
        local.get 116
        i32.eqz
        br_if 0 (;@1;)
        i32.const 0
        local.set 117
        local.get 117
        i64.load offset=1049552 align=4
        local.set 118
        local.get 0
        local.get 118
        i64.store align=4
        i32.const 32
        local.set 119
        local.get 5
        local.get 119
        i32.add
        local.set 120
        local.get 120
        global.set $__stack_pointer
        return
      end
      local.get 5
      i32.load8_u offset=22
      local.set 121
      i32.const 16
      local.set 122
      local.get 121
      local.get 122
      i32.shl
      local.set 123
      local.get 5
      i32.load16_u offset=20
      local.set 124
      local.get 124
      local.get 123
      i32.or
      local.set 125
      i32.const 1
      local.set 126
      i32.const 1
      local.set 127
      local.get 126
      local.get 127
      i32.and
      local.set 128
      block ;; label = @1
        block ;; label = @2
          local.get 128
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1048762
        local.set 129
        i32.const 42
        local.set 130
        i32.const 0
        local.set 131
        i32.const 1049560
        local.set 132
        local.get 129
        local.get 130
        local.get 131
        local.get 132
        call $builtin.default_panic
        unreachable
      end
      i32.const 6
      local.set 133
      local.get 125
      local.get 133
      i32.shl
      local.set 134
      local.get 5
      local.get 134
      i32.store16 offset=20
      i32.const 10
      local.set 135
      local.get 125
      local.get 135
      i32.shr_u
      local.set 136
      i32.const 31
      local.set 137
      local.get 136
      local.get 137
      i32.and
      local.set 138
      local.get 5
      local.get 138
      i32.store8 offset=22
      local.get 5
      i32.load8_u offset=22
      local.set 139
      i32.const 16
      local.set 140
      local.get 139
      local.get 140
      i32.shl
      local.set 141
      local.get 5
      i32.load16_u offset=20
      local.set 142
      local.get 142
      local.get 141
      i32.or
      local.set 143
      i32.const 2
      local.set 144
      local.get 144
      local.set 145
      local.get 6
      local.set 146
      local.get 145
      local.get 146
      i32.lt_u
      local.set 147
      i32.const 1
      local.set 148
      local.get 147
      local.get 148
      i32.and
      local.set 149
      block ;; label = @1
        block ;; label = @2
          local.get 149
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 2
        local.set 150
        local.get 150
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u offset=2
      local.set 151
      i32.const 63
      local.set 152
      local.get 151
      local.get 152
      i32.and
      local.set 153
      local.get 143
      local.get 153
      i32.or
      local.set 154
      local.get 5
      local.get 154
      i32.store16 offset=20
      i32.const 2097151
      local.set 155
      local.get 154
      local.get 155
      i32.and
      local.set 156
      i32.const 16
      local.set 157
      local.get 156
      local.get 157
      i32.shr_u
      local.set 158
      local.get 5
      local.get 158
      i32.store8 offset=22
      i32.const 3
      local.set 159
      local.get 159
      local.set 160
      local.get 6
      local.set 161
      local.get 160
      local.get 161
      i32.lt_u
      local.set 162
      i32.const 1
      local.set 163
      local.get 162
      local.get 163
      i32.and
      local.set 164
      block ;; label = @1
        block ;; label = @2
          local.get 164
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 3
        local.set 165
        local.get 165
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u offset=3
      local.set 166
      i32.const -64
      local.set 167
      local.get 166
      local.get 167
      i32.and
      local.set 168
      i32.const 128
      local.set 169
      i32.const 255
      local.set 170
      local.get 168
      local.get 170
      i32.and
      local.set 171
      i32.const 255
      local.set 172
      local.get 169
      local.get 172
      i32.and
      local.set 173
      local.get 171
      local.get 173
      i32.ne
      local.set 174
      i32.const 1
      local.set 175
      local.get 174
      local.get 175
      i32.and
      local.set 176
      block ;; label = @1
        local.get 176
        i32.eqz
        br_if 0 (;@1;)
        i32.const 0
        local.set 177
        local.get 177
        i64.load offset=1049568 align=4
        local.set 178
        local.get 0
        local.get 178
        i64.store align=4
        i32.const 32
        local.set 179
        local.get 5
        local.get 179
        i32.add
        local.set 180
        local.get 180
        global.set $__stack_pointer
        return
      end
      local.get 5
      i32.load8_u offset=22
      local.set 181
      i32.const 16
      local.set 182
      local.get 181
      local.get 182
      i32.shl
      local.set 183
      local.get 5
      i32.load16_u offset=20
      local.set 184
      local.get 184
      local.get 183
      i32.or
      local.set 185
      i32.const 1
      local.set 186
      i32.const 1
      local.set 187
      local.get 186
      local.get 187
      i32.and
      local.set 188
      block ;; label = @1
        block ;; label = @2
          local.get 188
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1048762
        local.set 189
        i32.const 42
        local.set 190
        i32.const 0
        local.set 191
        i32.const 1049576
        local.set 192
        local.get 189
        local.get 190
        local.get 191
        local.get 192
        call $builtin.default_panic
        unreachable
      end
      i32.const 6
      local.set 193
      local.get 185
      local.get 193
      i32.shl
      local.set 194
      local.get 5
      local.get 194
      i32.store16 offset=20
      i32.const 10
      local.set 195
      local.get 185
      local.get 195
      i32.shr_u
      local.set 196
      i32.const 31
      local.set 197
      local.get 196
      local.get 197
      i32.and
      local.set 198
      local.get 5
      local.get 198
      i32.store8 offset=22
      local.get 5
      i32.load8_u offset=22
      local.set 199
      i32.const 16
      local.set 200
      local.get 199
      local.get 200
      i32.shl
      local.set 201
      local.get 5
      i32.load16_u offset=20
      local.set 202
      local.get 202
      local.get 201
      i32.or
      local.set 203
      i32.const 3
      local.set 204
      local.get 204
      local.set 205
      local.get 6
      local.set 206
      local.get 205
      local.get 206
      i32.lt_u
      local.set 207
      i32.const 1
      local.set 208
      local.get 207
      local.get 208
      i32.and
      local.set 209
      block ;; label = @1
        block ;; label = @2
          local.get 209
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 3
        local.set 210
        local.get 210
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      i32.load8_u offset=3
      local.set 211
      i32.const 63
      local.set 212
      local.get 211
      local.get 212
      i32.and
      local.set 213
      local.get 203
      local.get 213
      i32.or
      local.set 214
      local.get 5
      local.get 214
      i32.store16 offset=20
      i32.const 2097151
      local.set 215
      local.get 214
      local.get 215
      i32.and
      local.set 216
      i32.const 16
      local.set 217
      local.get 216
      local.get 217
      i32.shr_u
      local.set 218
      local.get 5
      local.get 218
      i32.store8 offset=22
      local.get 5
      i32.load8_u offset=22
      local.set 219
      local.get 219
      local.get 217
      i32.shl
      local.set 220
      local.get 5
      i32.load16_u offset=20
      local.set 221
      local.get 221
      local.get 220
      i32.or
      local.set 222
      i32.const 65536
      local.set 223
      local.get 222
      local.get 223
      i32.lt_u
      local.set 224
      i32.const 1
      local.set 225
      local.get 224
      local.get 225
      i32.and
      local.set 226
      block ;; label = @1
        local.get 226
        i32.eqz
        br_if 0 (;@1;)
        i32.const 0
        local.set 227
        local.get 227
        i64.load offset=1049584 align=4
        local.set 228
        local.get 0
        local.get 228
        i64.store align=4
        i32.const 32
        local.set 229
        local.get 5
        local.get 229
        i32.add
        local.set 230
        local.get 230
        global.set $__stack_pointer
        return
      end
      local.get 5
      i32.load8_u offset=22
      local.set 231
      i32.const 16
      local.set 232
      local.get 231
      local.get 232
      i32.shl
      local.set 233
      local.get 5
      i32.load16_u offset=20
      local.set 234
      local.get 234
      local.get 233
      i32.or
      local.set 235
      i32.const 1114111
      local.set 236
      local.get 235
      local.get 236
      i32.gt_u
      local.set 237
      i32.const 1
      local.set 238
      local.get 237
      local.get 238
      i32.and
      local.set 239
      block ;; label = @1
        local.get 239
        i32.eqz
        br_if 0 (;@1;)
        i32.const 0
        local.set 240
        local.get 240
        i64.load offset=1049592 align=4
        local.set 241
        local.get 0
        local.get 241
        i64.store align=4
        i32.const 32
        local.set 242
        local.get 5
        local.get 242
        i32.add
        local.set 243
        local.get 243
        global.set $__stack_pointer
        return
      end
      local.get 5
      i32.load8_u offset=22
      local.set 244
      i32.const 16
      local.set 245
      local.get 244
      local.get 245
      i32.shl
      local.set 246
      local.get 5
      i32.load16_u offset=20
      local.set 247
      local.get 247
      local.get 246
      i32.or
      local.set 248
      i32.const 0
      local.set 249
      local.get 5
      local.get 249
      i32.store16 offset=28
      local.get 5
      local.get 247
      i32.store16 offset=24
      i32.const 2097151
      local.set 250
      local.get 248
      local.get 250
      i32.and
      local.set 251
      local.get 251
      local.get 245
      i32.shr_u
      local.set 252
      local.get 5
      local.get 252
      i32.store8 offset=26
      local.get 5
      i64.load offset=24
      local.set 253
      local.get 0
      local.get 253
      i64.store align=4
      i32.const 32
      local.set 254
      local.get 5
      local.get 254
      i32.add
      local.set 255
      local.get 255
      global.set $__stack_pointer
      return
    )
    (func $#func39<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeByteNTimes> (@name "io.writer.Writer(fs.file.File,error{AccessDenied,BrokenPipe,ConnectionResetByPeer,DiskQuota,FileTooBig,InputOutput,LockViolation,NoSpaceLeft,NotOpenForWriting,OperationAborted,SystemResources,Unexpected,WouldBlock},(function \'write\')).writeByteNTimes") (;39;) (type 9) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 304
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 5
      local.get 1
      i32.store8 offset=11
      local.get 5
      local.get 2
      i32.store offset=12
      i32.const 256
      local.set 6
      i32.const 170
      local.set 7
      i32.const 16
      local.set 8
      local.get 5
      local.get 8
      i32.add
      local.set 9
      local.get 9
      local.get 7
      local.get 6
      call $memset
      drop
      i32.const 16
      local.set 10
      local.get 5
      local.get 10
      i32.add
      local.set 11
      local.get 11
      local.set 12
      i32.const 1
      local.set 13
      i32.const 1
      local.set 14
      local.get 13
      local.get 14
      i32.and
      local.set 15
      block ;; label = @1
        block ;; label = @2
          local.get 15
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 16
        i32.const 256
        local.set 17
        local.get 16
        local.get 17
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      i32.const 256
      local.set 18
      local.get 12
      local.set 19
      local.get 19
      local.get 18
      local.get 1
      call $mem.set__anon_2362
      local.get 5
      local.get 2
      i32.store offset=272
      block ;; label = @1
        loop ;; label = @2
          local.get 5
          i32.load offset=272
          local.set 20
          i32.const 0
          local.set 21
          local.get 20
          local.set 22
          local.get 21
          local.set 23
          local.get 22
          local.get 23
          i32.gt_u
          local.set 24
          i32.const 1
          local.set 25
          local.get 24
          local.get 25
          i32.and
          local.set 26
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  local.get 26
                  i32.eqz
                  br_if 0 (;@6;)
                  local.get 5
                  i32.load offset=272
                  local.set 27
                  i32.const 256
                  local.set 28
                  local.get 27
                  local.get 28
                  call $math.min__anon_2363
                  local.set 29
                  local.get 5
                  local.get 29
                  i32.store offset=276
                  local.get 0
                  i32.load
                  local.set 30
                  local.get 5
                  local.get 30
                  i32.store offset=280
                  i32.const 16
                  local.set 31
                  local.get 5
                  local.get 31
                  i32.add
                  local.set 32
                  local.get 32
                  local.set 33
                  i32.const 0
                  local.set 34
                  local.get 34
                  local.set 35
                  local.get 29
                  local.set 36
                  local.get 35
                  local.get 36
                  i32.le_u
                  local.set 37
                  i32.const 1
                  local.set 38
                  local.get 37
                  local.get 38
                  i32.and
                  local.set 39
                  local.get 39
                  br_if 1 (;@5;)
                  br 2 (;@4;)
                end
                br 4 (;@1;)
              end
              br 1 (;@3;)
            end
            i32.const 0
            local.set 40
            local.get 40
            local.get 29
            call $builtin.panicStartGreaterThanEnd
            unreachable
          end
          i32.const 256
          local.set 41
          local.get 29
          local.set 42
          local.get 41
          local.set 43
          local.get 42
          local.get 43
          i32.le_u
          local.set 44
          i32.const 1
          local.set 45
          local.get 44
          local.get 45
          i32.and
          local.set 46
          block ;; label = @3
            block ;; label = @4
              local.get 46
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 256
            local.set 47
            local.get 29
            local.get 47
            call $builtin.panicOutOfBounds
            unreachable
          end
          i32.const 0
          local.set 48
          local.get 48
          local.set 49
          local.get 29
          local.set 50
          local.get 49
          local.get 50
          i32.le_u
          local.set 51
          i32.const 1
          local.set 52
          local.get 51
          local.get 52
          i32.and
          local.set 53
          block ;; label = @3
            block ;; label = @4
              local.get 53
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 0
            local.set 54
            local.get 54
            local.get 29
            call $builtin.panicOutOfBounds
            unreachable
          end
          local.get 5
          local.get 29
          i32.store offset=292
          local.get 5
          local.get 33
          i32.store offset=288
          local.get 5
          i32.load offset=292
          local.set 55
          local.get 5
          i32.load offset=288
          local.set 56
          i32.const 280
          local.set 57
          local.get 5
          local.get 57
          i32.add
          local.set 58
          local.get 58
          local.set 59
          local.get 59
          local.get 56
          local.get 55
          call $#func24<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeAll>
          local.set 60
          i32.const 0
          local.set 61
          i32.const 65535
          local.set 62
          local.get 60
          local.get 62
          i32.and
          local.set 63
          i32.const 65535
          local.set 64
          local.get 61
          local.get 64
          i32.and
          local.set 65
          local.get 63
          local.get 65
          i32.ne
          local.set 66
          i32.const 1
          local.set 67
          local.get 66
          local.get 67
          i32.and
          local.set 68
          block ;; label = @3
            local.get 68
            i32.eqz
            br_if 0 (;@3;)
            i32.const 304
            local.set 69
            local.get 5
            local.get 69
            i32.add
            local.set 70
            local.get 70
            global.set $__stack_pointer
            local.get 60
            return
          end
          local.get 5
          i32.load offset=272
          local.set 71
          local.get 71
          local.get 29
          i32.sub
          local.set 72
          local.get 72
          local.get 71
          i32.gt_u
          local.set 73
          local.get 5
          local.get 72
          i32.store offset=296
          i32.const 1
          local.set 74
          local.get 73
          local.get 74
          i32.and
          local.set 75
          local.get 5
          local.get 75
          i32.store8 offset=300
          local.get 5
          i32.load8_u offset=300
          local.set 76
          i32.const 0
          local.set 77
          i32.const 1
          local.set 78
          local.get 76
          local.get 78
          i32.and
          local.set 79
          i32.const 1
          local.set 80
          local.get 77
          local.get 80
          i32.and
          local.set 81
          local.get 79
          local.get 81
          i32.eq
          local.set 82
          i32.const 1
          local.set 83
          local.get 82
          local.get 83
          i32.and
          local.set 84
          block ;; label = @3
            block ;; label = @4
              local.get 84
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 1048669
            local.set 85
            i32.const 16
            local.set 86
            i32.const 0
            local.set 87
            i32.const 1049440
            local.set 88
            local.get 85
            local.get 86
            local.get 87
            local.get 88
            call $builtin.default_panic
            unreachable
          end
          local.get 5
          i32.load offset=296
          local.set 89
          local.get 5
          local.get 89
          i32.store offset=272
          br 0 (;@2;)
        end
      end
      i32.const 0
      local.set 90
      i32.const 304
      local.set 91
      local.get 5
      local.get 91
      i32.add
      local.set 92
      local.get 92
      global.set $__stack_pointer
      local.get 90
      return
    )
    (func $#func40<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.write> (@name "io.writer.Writer(fs.file.File,error{AccessDenied,BrokenPipe,ConnectionResetByPeer,DiskQuota,FileTooBig,InputOutput,LockViolation,NoSpaceLeft,NotOpenForWriting,OperationAborted,SystemResources,Unexpected,WouldBlock},(function \'write\')).write") (;40;) (type 4) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32)
      global.get $__stack_pointer
      local.set 4
      i32.const 16
      local.set 5
      local.get 4
      local.get 5
      i32.sub
      local.set 6
      local.get 6
      global.set $__stack_pointer
      local.get 3
      local.set 7
      local.get 2
      local.set 8
      local.get 6
      local.get 3
      i32.store offset=4
      local.get 6
      local.get 2
      i32.store
      i32.const 8
      local.set 9
      local.get 6
      local.get 9
      i32.add
      local.set 10
      local.get 10
      local.set 11
      local.get 11
      local.get 1
      local.get 8
      local.get 7
      call $fs.file.File.write
      local.get 6
      i64.load offset=8
      local.set 12
      local.get 0
      local.get 12
      i64.store align=4
      i32.const 16
      local.set 13
      local.get 6
      local.get 13
      i32.add
      local.set 14
      local.get 14
      global.set $__stack_pointer
      return
    )
    (func $mem.set__anon_2362 (;41;) (type 10) (param i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 48
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 5
      local.get 1
      i32.store offset=12
      local.get 5
      local.get 0
      i32.store offset=8
      local.get 5
      local.get 2
      i32.store8 offset=23
      local.get 5
      local.get 1
      i32.store offset=28
      local.get 5
      local.get 0
      i32.store offset=24
      local.get 5
      i32.load offset=28
      local.set 6
      local.get 5
      i32.load offset=24
      drop
      i32.const 0
      local.set 7
      local.get 5
      local.get 7
      i32.store offset=32
      block ;; label = @1
        loop ;; label = @2
          local.get 5
          i32.load offset=32
          local.set 8
          local.get 8
          local.set 9
          local.get 6
          local.set 10
          local.get 9
          local.get 10
          i32.lt_u
          local.set 11
          i32.const 1
          local.set 12
          local.get 11
          local.get 12
          i32.and
          local.set 13
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  local.get 13
                  i32.eqz
                  br_if 0 (;@6;)
                  local.get 5
                  i32.load offset=28
                  local.set 14
                  local.get 5
                  i32.load offset=24
                  local.set 15
                  local.get 8
                  local.set 16
                  local.get 14
                  local.set 17
                  local.get 16
                  local.get 17
                  i32.lt_u
                  local.set 18
                  i32.const 1
                  local.set 19
                  local.get 18
                  local.get 19
                  i32.and
                  local.set 20
                  local.get 20
                  br_if 1 (;@5;)
                  br 2 (;@4;)
                end
                br 4 (;@1;)
              end
              br 1 (;@3;)
            end
            local.get 8
            local.get 14
            call $builtin.panicOutOfBounds
            unreachable
          end
          local.get 15
          local.get 8
          i32.add
          local.set 21
          local.get 5
          local.get 21
          i32.store offset=36
          local.get 21
          local.get 2
          i32.store8
          local.get 5
          i32.load offset=32
          local.set 22
          i32.const 1
          local.set 23
          local.get 22
          local.get 23
          i32.add
          local.set 24
          local.get 24
          i32.eqz
          local.set 25
          local.get 5
          local.get 24
          i32.store offset=40
          i32.const 1
          local.set 26
          local.get 25
          local.get 26
          i32.and
          local.set 27
          local.get 5
          local.get 27
          i32.store8 offset=44
          local.get 5
          i32.load8_u offset=44
          local.set 28
          i32.const 0
          local.set 29
          i32.const 1
          local.set 30
          local.get 28
          local.get 30
          i32.and
          local.set 31
          i32.const 1
          local.set 32
          local.get 29
          local.get 32
          i32.and
          local.set 33
          local.get 31
          local.get 33
          i32.eq
          local.set 34
          i32.const 1
          local.set 35
          local.get 34
          local.get 35
          i32.and
          local.set 36
          block ;; label = @3
            block ;; label = @4
              local.get 36
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 1048669
            local.set 37
            i32.const 16
            local.set 38
            i32.const 0
            local.set 39
            i32.const 1049600
            local.set 40
            local.get 37
            local.get 38
            local.get 39
            local.get 40
            call $builtin.default_panic
            unreachable
          end
          local.get 5
          i32.load offset=40
          local.set 41
          local.get 5
          local.get 41
          i32.store offset=32
          br 0 (;@2;)
        end
      end
      i32.const 48
      local.set 42
      local.get 5
      local.get 42
      i32.add
      local.set 43
      local.get 43
      global.set $__stack_pointer
      return
    )
    (func $math.min__anon_2363 (;42;) (type 3) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 16
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      local.get 4
      local.get 0
      i32.store offset=8
      local.get 4
      local.get 1
      i32.store offset=12
      local.get 0
      local.set 5
      local.get 1
      local.set 6
      local.get 5
      local.get 6
      i32.lt_u
      local.set 7
      i32.const 1
      local.set 8
      local.get 7
      local.get 8
      i32.and
      local.set 9
      block ;; label = @1
        local.get 9
        i32.eqz
        br_if 0 (;@1;)
        i32.const 16
        local.set 10
        local.get 4
        local.get 10
        i32.add
        local.set 11
        local.get 11
        global.set $__stack_pointer
        local.get 0
        return
      end
      i32.const 16
      local.set 12
      local.get 4
      local.get 12
      i32.add
      local.set 13
      local.get 13
      global.set $__stack_pointer
      local.get 1
      return
    )
    (func $#func43<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.print__anon_2364> (@name "io.writer.Writer(fs.file.File,error{AccessDenied,BrokenPipe,ConnectionResetByPeer,DiskQuota,FileTooBig,InputOutput,LockViolation,NoSpaceLeft,NotOpenForWriting,OperationAborted,SystemResources,Unexpected,WouldBlock},(function \'write\')).print__anon_2364") (;43;) (type 3) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 16
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      local.get 0
      local.get 1
      call $fmt.format__anon_2467
      local.set 5
      local.get 4
      local.get 5
      i32.store16 offset=14
      local.get 4
      i32.load16_u offset=14
      local.set 6
      i32.const 16
      local.set 7
      local.get 4
      local.get 7
      i32.add
      local.set 8
      local.get 8
      global.set $__stack_pointer
      local.get 6
      return
    )
    (func $#func44<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.print__anon_2460> (@name "io.writer.Writer(fs.file.File,error{AccessDenied,BrokenPipe,ConnectionResetByPeer,DiskQuota,FileTooBig,InputOutput,LockViolation,NoSpaceLeft,NotOpenForWriting,OperationAborted,SystemResources,Unexpected,WouldBlock},(function \'write\')).print__anon_2460") (;44;) (type 7) (param i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 16
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      local.get 0
      call $fmt.format__anon_2507
      local.set 4
      local.get 3
      local.get 4
      i32.store16 offset=14
      local.get 3
      i32.load16_u offset=14
      local.set 5
      i32.const 16
      local.set 6
      local.get 3
      local.get 6
      i32.add
      local.set 7
      local.get 7
      global.set $__stack_pointer
      local.get 5
      return
    )
    (func $fmt.bufPrint__anon_2463 (;45;) (type 4) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 4
      i32.const 96
      local.set 5
      local.get 4
      local.get 5
      i32.sub
      local.set 6
      local.get 6
      global.set $__stack_pointer
      local.get 2
      local.set 7
      local.get 1
      local.set 8
      local.get 6
      local.get 2
      i32.store offset=20
      local.get 6
      local.get 1
      i32.store offset=16
      i32.const 40
      local.set 9
      local.get 6
      local.get 9
      i32.add
      local.set 10
      local.get 10
      local.set 11
      local.get 11
      local.get 8
      local.get 7
      call $io.fixed_buffer_stream.fixedBufferStream__anon_2528
      i32.const 8
      local.set 12
      i32.const 24
      local.set 13
      local.get 6
      local.get 13
      i32.add
      local.set 14
      local.get 14
      local.get 12
      i32.add
      local.set 15
      i32.const 40
      local.set 16
      local.get 6
      local.get 16
      i32.add
      local.set 17
      local.get 17
      local.get 12
      i32.add
      local.set 18
      local.get 18
      i32.load
      local.set 19
      local.get 15
      local.get 19
      i32.store
      local.get 6
      i64.load offset=40
      local.set 20
      local.get 6
      local.get 20
      i64.store offset=24
      i32.const 56
      local.set 21
      local.get 6
      local.get 21
      i32.add
      local.set 22
      local.get 22
      local.set 23
      i32.const 24
      local.set 24
      local.get 6
      local.get 24
      i32.add
      local.set 25
      local.get 25
      local.set 26
      local.get 23
      local.get 26
      call $#func51<io.fixed_buffer_stream.FixedBufferStream___u8_.writer>
      i32.const 56
      local.set 27
      local.get 6
      local.get 27
      i32.add
      local.set 28
      local.get 28
      local.set 29
      local.get 29
      local.get 3
      call $fmt.format__anon_2566
      local.set 30
      i32.const 0
      local.set 31
      i32.const 65535
      local.set 32
      local.get 30
      local.get 32
      i32.and
      local.set 33
      i32.const 65535
      local.set 34
      local.get 31
      local.get 34
      i32.and
      local.set 35
      local.get 33
      local.get 35
      i32.ne
      local.set 36
      i32.const 1
      local.set 37
      local.get 36
      local.get 37
      i32.and
      local.set 38
      block ;; label = @1
        local.get 38
        i32.eqz
        br_if 0 (;@1;)
        local.get 6
        local.get 30
        i32.store16 offset=72
        local.get 6
        i64.load offset=64
        local.set 39
        local.get 0
        local.get 39
        i64.store align=4
        i32.const 8
        local.set 40
        local.get 0
        local.get 40
        i32.add
        local.set 41
        i32.const 64
        local.set 42
        local.get 6
        local.get 42
        i32.add
        local.set 43
        local.get 43
        local.get 40
        i32.add
        local.set 44
        local.get 44
        i32.load
        local.set 45
        local.get 41
        local.get 45
        i32.store
        i32.const 96
        local.set 46
        local.get 6
        local.get 46
        i32.add
        local.set 47
        local.get 47
        global.set $__stack_pointer
        return
      end
      i32.const 8
      local.set 48
      local.get 6
      local.get 48
      i32.add
      local.set 49
      i32.const 24
      local.set 50
      local.get 6
      local.get 50
      i32.add
      local.set 51
      local.get 49
      local.get 51
      call $#func53<io.fixed_buffer_stream.FixedBufferStream___u8_.getWritten>
      local.get 6
      i32.load offset=8
      local.set 52
      local.get 6
      i32.load offset=12
      local.set 53
      i32.const 0
      local.set 54
      local.get 6
      local.get 54
      i32.store16 offset=88
      local.get 6
      local.get 53
      i32.store offset=84
      local.get 6
      local.get 52
      i32.store offset=80
      local.get 6
      i64.load offset=80
      local.set 55
      local.get 0
      local.get 55
      i64.store align=4
      i32.const 8
      local.set 56
      local.get 0
      local.get 56
      i32.add
      local.set 57
      i32.const 80
      local.set 58
      local.get 6
      local.get 58
      i32.add
      local.set 59
      local.get 59
      local.get 56
      i32.add
      local.set 60
      local.get 60
      i32.load
      local.set 61
      local.get 57
      local.get 61
      i32.store
      i32.const 96
      local.set 62
      local.get 6
      local.get 62
      i32.add
      local.set 63
      local.get 63
      global.set $__stack_pointer
      return
    )
    (func $mem.copy__anon_2464 (;46;) (type 4) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 4
      i32.const 48
      local.set 5
      local.get 4
      local.get 5
      i32.sub
      local.set 6
      local.get 6
      global.set $__stack_pointer
      local.get 1
      local.set 7
      local.get 0
      local.set 8
      local.get 3
      local.set 9
      local.get 2
      local.set 10
      local.get 6
      local.get 1
      i32.store offset=12
      local.get 6
      local.get 0
      i32.store offset=8
      local.get 6
      local.get 3
      i32.store offset=20
      local.get 6
      local.get 2
      i32.store offset=16
      local.get 7
      local.set 11
      local.get 9
      local.set 12
      local.get 11
      local.get 12
      i32.ge_u
      local.set 13
      local.get 13
      call $debug.assert
      i32.const 0
      local.set 14
      local.get 6
      local.get 14
      i32.store offset=28
      block ;; label = @1
        loop ;; label = @2
          local.get 6
          i32.load offset=28
          local.set 15
          local.get 15
          local.set 16
          local.get 9
          local.set 17
          local.get 16
          local.get 17
          i32.lt_u
          local.set 18
          i32.const 1
          local.set 19
          local.get 18
          local.get 19
          i32.and
          local.set 20
          block ;; label = @3
            block ;; label = @4
              local.get 20
              i32.eqz
              br_if 0 (;@4;)
              local.get 10
              local.get 15
              i32.add
              local.set 21
              local.get 21
              i32.load8_u
              local.set 22
              local.get 6
              local.get 22
              i32.store8 offset=35
              i32.const 28
              local.set 23
              local.get 6
              local.get 23
              i32.add
              local.set 24
              local.get 6
              local.get 24
              i32.store offset=36
              local.get 6
              local.get 7
              i32.store offset=44
              local.get 6
              local.get 8
              i32.store offset=40
              local.get 6
              i32.load offset=28
              local.set 25
              local.get 6
              i32.load offset=44
              drop
              local.get 6
              i32.load offset=40
              local.set 26
              local.get 26
              local.get 25
              i32.add
              local.set 27
              local.get 27
              local.get 22
              i32.store8
              br 1 (;@3;)
            end
            br 2 (;@1;)
          end
          local.get 6
          i32.load offset=28
          local.set 28
          i32.const 1
          local.set 29
          local.get 28
          local.get 29
          i32.add
          local.set 30
          local.get 6
          local.get 30
          i32.store offset=28
          br 0 (;@2;)
        end
      end
      i32.const 48
      local.set 31
      local.get 6
      local.get 31
      i32.add
      local.set 32
      local.get 32
      global.set $__stack_pointer
      return
    )
    (func $fmt.bufPrint__anon_2465 (;47;) (type 4) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 4
      i32.const 96
      local.set 5
      local.get 4
      local.get 5
      i32.sub
      local.set 6
      local.get 6
      global.set $__stack_pointer
      local.get 2
      local.set 7
      local.get 1
      local.set 8
      local.get 6
      local.get 2
      i32.store offset=20
      local.get 6
      local.get 1
      i32.store offset=16
      i32.const 40
      local.set 9
      local.get 6
      local.get 9
      i32.add
      local.set 10
      local.get 10
      local.set 11
      local.get 11
      local.get 8
      local.get 7
      call $io.fixed_buffer_stream.fixedBufferStream__anon_2528
      i32.const 8
      local.set 12
      i32.const 24
      local.set 13
      local.get 6
      local.get 13
      i32.add
      local.set 14
      local.get 14
      local.get 12
      i32.add
      local.set 15
      i32.const 40
      local.set 16
      local.get 6
      local.get 16
      i32.add
      local.set 17
      local.get 17
      local.get 12
      i32.add
      local.set 18
      local.get 18
      i32.load
      local.set 19
      local.get 15
      local.get 19
      i32.store
      local.get 6
      i64.load offset=40
      local.set 20
      local.get 6
      local.get 20
      i64.store offset=24
      i32.const 56
      local.set 21
      local.get 6
      local.get 21
      i32.add
      local.set 22
      local.get 22
      local.set 23
      i32.const 24
      local.set 24
      local.get 6
      local.get 24
      i32.add
      local.set 25
      local.get 25
      local.set 26
      local.get 23
      local.get 26
      call $#func51<io.fixed_buffer_stream.FixedBufferStream___u8_.writer>
      i32.const 56
      local.set 27
      local.get 6
      local.get 27
      i32.add
      local.set 28
      local.get 28
      local.set 29
      local.get 29
      local.get 3
      call $fmt.format__anon_2586
      local.set 30
      i32.const 0
      local.set 31
      i32.const 65535
      local.set 32
      local.get 30
      local.get 32
      i32.and
      local.set 33
      i32.const 65535
      local.set 34
      local.get 31
      local.get 34
      i32.and
      local.set 35
      local.get 33
      local.get 35
      i32.ne
      local.set 36
      i32.const 1
      local.set 37
      local.get 36
      local.get 37
      i32.and
      local.set 38
      block ;; label = @1
        local.get 38
        i32.eqz
        br_if 0 (;@1;)
        local.get 6
        local.get 30
        i32.store16 offset=72
        local.get 6
        i64.load offset=64
        local.set 39
        local.get 0
        local.get 39
        i64.store align=4
        i32.const 8
        local.set 40
        local.get 0
        local.get 40
        i32.add
        local.set 41
        i32.const 64
        local.set 42
        local.get 6
        local.get 42
        i32.add
        local.set 43
        local.get 43
        local.get 40
        i32.add
        local.set 44
        local.get 44
        i32.load
        local.set 45
        local.get 41
        local.get 45
        i32.store
        i32.const 96
        local.set 46
        local.get 6
        local.get 46
        i32.add
        local.set 47
        local.get 47
        global.set $__stack_pointer
        return
      end
      i32.const 8
      local.set 48
      local.get 6
      local.get 48
      i32.add
      local.set 49
      i32.const 24
      local.set 50
      local.get 6
      local.get 50
      i32.add
      local.set 51
      local.get 49
      local.get 51
      call $#func53<io.fixed_buffer_stream.FixedBufferStream___u8_.getWritten>
      local.get 6
      i32.load offset=8
      local.set 52
      local.get 6
      i32.load offset=12
      local.set 53
      i32.const 0
      local.set 54
      local.get 6
      local.get 54
      i32.store16 offset=88
      local.get 6
      local.get 53
      i32.store offset=84
      local.get 6
      local.get 52
      i32.store offset=80
      local.get 6
      i64.load offset=80
      local.set 55
      local.get 0
      local.get 55
      i64.store align=4
      i32.const 8
      local.set 56
      local.get 0
      local.get 56
      i32.add
      local.set 57
      i32.const 80
      local.set 58
      local.get 6
      local.get 58
      i32.add
      local.set 59
      local.get 59
      local.get 56
      i32.add
      local.set 60
      local.get 60
      i32.load
      local.set 61
      local.get 57
      local.get 61
      i32.store
      i32.const 96
      local.set 62
      local.get 6
      local.get 62
      i32.add
      local.set 63
      local.get 63
      global.set $__stack_pointer
      return
    )
    (func $fmt.format__anon_2467 (;48;) (type 3) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 16
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      local.get 0
      i32.load
      local.set 5
      local.get 4
      local.get 5
      i32.store
      i32.const 1
      local.set 6
      i32.const 1
      local.set 7
      local.get 6
      local.get 7
      i32.and
      local.set 8
      block ;; label = @1
        block ;; label = @2
          local.get 8
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 9
        i32.const 18
        local.set 10
        local.get 9
        local.get 10
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      local.get 4
      local.set 11
      i32.const 1049071
      local.set 12
      i32.const 18
      local.set 13
      local.get 11
      local.get 12
      local.get 13
      call $#func24<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeAll>
      local.set 14
      i32.const 0
      local.set 15
      i32.const 65535
      local.set 16
      local.get 14
      local.get 16
      i32.and
      local.set 17
      i32.const 65535
      local.set 18
      local.get 15
      local.get 18
      i32.and
      local.set 19
      local.get 17
      local.get 19
      i32.ne
      local.set 20
      i32.const 1
      local.set 21
      local.get 20
      local.get 21
      i32.and
      local.set 22
      block ;; label = @1
        local.get 22
        i32.eqz
        br_if 0 (;@1;)
        i32.const 16
        local.set 23
        local.get 4
        local.get 23
        i32.add
        local.set 24
        local.get 24
        global.set $__stack_pointer
        local.get 14
        return
      end
      i32.const 0
      local.set 25
      local.get 4
      local.get 25
      i32.store offset=4
      local.get 1
      i32.load16_u
      local.set 26
      i32.const 1049612
      local.set 27
      i32.const 3
      local.set 28
      local.get 26
      local.get 27
      local.get 0
      local.get 28
      call $fmt.formatType__anon_2500
      local.set 29
      i32.const 0
      local.set 30
      i32.const 65535
      local.set 31
      local.get 29
      local.get 31
      i32.and
      local.set 32
      i32.const 65535
      local.set 33
      local.get 30
      local.get 33
      i32.and
      local.set 34
      local.get 32
      local.get 34
      i32.ne
      local.set 35
      i32.const 1
      local.set 36
      local.get 35
      local.get 36
      i32.and
      local.set 37
      block ;; label = @1
        local.get 37
        i32.eqz
        br_if 0 (;@1;)
        i32.const 16
        local.set 38
        local.get 4
        local.get 38
        i32.add
        local.set 39
        local.get 39
        global.set $__stack_pointer
        local.get 29
        return
      end
      local.get 0
      i32.load
      local.set 40
      local.get 4
      local.get 40
      i32.store offset=8
      i32.const 1
      local.set 41
      i32.const 1
      local.set 42
      local.get 41
      local.get 42
      i32.and
      local.set 43
      block ;; label = @1
        block ;; label = @2
          local.get 43
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 21
        local.set 44
        i32.const 22
        local.set 45
        local.get 44
        local.get 45
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      i32.const 8
      local.set 46
      local.get 4
      local.get 46
      i32.add
      local.set 47
      local.get 47
      local.set 48
      i32.const 1049071
      local.set 49
      i32.const 21
      local.set 50
      local.get 49
      local.get 50
      i32.add
      local.set 51
      i32.const 1
      local.set 52
      local.get 48
      local.get 51
      local.get 52
      call $#func24<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeAll>
      local.set 53
      i32.const 0
      local.set 54
      i32.const 65535
      local.set 55
      local.get 53
      local.get 55
      i32.and
      local.set 56
      i32.const 65535
      local.set 57
      local.get 54
      local.get 57
      i32.and
      local.set 58
      local.get 56
      local.get 58
      i32.ne
      local.set 59
      i32.const 1
      local.set 60
      local.get 59
      local.get 60
      i32.and
      local.set 61
      block ;; label = @1
        local.get 61
        i32.eqz
        br_if 0 (;@1;)
        i32.const 16
        local.set 62
        local.get 4
        local.get 62
        i32.add
        local.set 63
        local.get 63
        global.set $__stack_pointer
        local.get 53
        return
      end
      i32.const 0
      local.set 64
      i32.const 16
      local.set 65
      local.get 4
      local.get 65
      i32.add
      local.set 66
      local.get 66
      global.set $__stack_pointer
      local.get 64
      return
    )
    (func $fmt.format__anon_2507 (;49;) (type 7) (param i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 16
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      local.get 0
      i32.load
      local.set 4
      local.get 3
      local.get 4
      i32.store offset=8
      i32.const 1
      local.set 5
      i32.const 1
      local.set 6
      local.get 5
      local.get 6
      i32.and
      local.set 7
      block ;; label = @1
        block ;; label = @2
          local.get 7
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 8
        i32.const 53
        local.set 9
        local.get 8
        local.get 9
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      i32.const 8
      local.set 10
      local.get 3
      local.get 10
      i32.add
      local.set 11
      local.get 11
      local.set 12
      i32.const 1049094
      local.set 13
      i32.const 53
      local.set 14
      local.get 12
      local.get 13
      local.get 14
      call $#func24<io.writer.Writer_fs.file.File_error_AccessDenied_BrokenPipe_ConnectionResetByPeer_DiskQuota_FileTooBig_InputOutput_LockViolation_NoSpaceLeft_NotOpenForWriting_OperationAborted_SystemResources_Unexpected_WouldBlock___function_'write'__.writeAll>
      local.set 15
      i32.const 0
      local.set 16
      i32.const 65535
      local.set 17
      local.get 15
      local.get 17
      i32.and
      local.set 18
      i32.const 65535
      local.set 19
      local.get 16
      local.get 19
      i32.and
      local.set 20
      local.get 18
      local.get 20
      i32.ne
      local.set 21
      i32.const 1
      local.set 22
      local.get 21
      local.get 22
      i32.and
      local.set 23
      block ;; label = @1
        local.get 23
        i32.eqz
        br_if 0 (;@1;)
        i32.const 16
        local.set 24
        local.get 3
        local.get 24
        i32.add
        local.set 25
        local.get 25
        global.set $__stack_pointer
        local.get 15
        return
      end
      i32.const 0
      local.set 26
      i32.const 16
      local.set 27
      local.get 3
      local.get 27
      i32.add
      local.set 28
      local.get 28
      global.set $__stack_pointer
      local.get 26
      return
    )
    (func $io.fixed_buffer_stream.fixedBufferStream__anon_2528 (;50;) (type 10) (param i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 16
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 5
      local.get 2
      i32.store offset=12
      local.get 5
      local.get 1
      i32.store offset=8
      local.get 5
      local.get 1
      local.get 2
      call $mem.span__anon_2625
      local.get 5
      i32.load
      local.set 6
      local.get 5
      i32.load offset=4
      local.set 7
      local.get 0
      local.get 7
      i32.store offset=4
      local.get 0
      local.get 6
      i32.store
      i32.const 0
      local.set 8
      local.get 0
      local.get 8
      i32.store offset=8
      i32.const 16
      local.set 9
      local.get 5
      local.get 9
      i32.add
      local.set 10
      local.get 10
      global.set $__stack_pointer
      return
    )
    (func $#func51<io.fixed_buffer_stream.FixedBufferStream___u8_.writer> (@name "io.fixed_buffer_stream.FixedBufferStream([]u8).writer") (;51;) (type 5) (param i32 i32)
      (local i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 16
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      local.get 4
      local.get 1
      i32.store offset=12
      local.get 0
      local.get 1
      i32.store
      i32.const 16
      local.set 5
      local.get 4
      local.get 5
      i32.add
      local.set 6
      local.get 6
      global.set $__stack_pointer
      return
    )
    (func $fmt.format__anon_2566 (;52;) (type 3) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 16
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      local.get 0
      i32.load
      local.set 5
      local.get 4
      local.get 5
      i32.store
      i32.const 1
      local.set 6
      i32.const 1
      local.set 7
      local.get 6
      local.get 7
      i32.and
      local.set 8
      block ;; label = @1
        block ;; label = @2
          local.get 8
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 9
        i32.const 27
        local.set 10
        local.get 9
        local.get 10
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      local.get 4
      local.set 11
      i32.const 1048621
      local.set 12
      i32.const 27
      local.set 13
      local.get 11
      local.get 12
      local.get 13
      call $#func57<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeAll>
      local.set 14
      i32.const 0
      local.set 15
      i32.const 65535
      local.set 16
      local.get 14
      local.get 16
      i32.and
      local.set 17
      i32.const 65535
      local.set 18
      local.get 15
      local.get 18
      i32.and
      local.set 19
      local.get 17
      local.get 19
      i32.ne
      local.set 20
      i32.const 1
      local.set 21
      local.get 20
      local.get 21
      i32.and
      local.set 22
      block ;; label = @1
        local.get 22
        i32.eqz
        br_if 0 (;@1;)
        i32.const 16
        local.set 23
        local.get 4
        local.get 23
        i32.add
        local.set 24
        local.get 24
        global.set $__stack_pointer
        local.get 14
        return
      end
      i32.const 0
      local.set 25
      local.get 4
      local.get 25
      i32.store offset=4
      local.get 1
      i32.load
      local.set 26
      i32.const 1049632
      local.set 27
      i32.const 3
      local.set 28
      local.get 26
      local.get 27
      local.get 0
      local.get 28
      call $fmt.formatType__anon_2579
      local.set 29
      i32.const 0
      local.set 30
      i32.const 65535
      local.set 31
      local.get 29
      local.get 31
      i32.and
      local.set 32
      i32.const 65535
      local.set 33
      local.get 30
      local.get 33
      i32.and
      local.set 34
      local.get 32
      local.get 34
      i32.ne
      local.set 35
      i32.const 1
      local.set 36
      local.get 35
      local.get 36
      i32.and
      local.set 37
      block ;; label = @1
        local.get 37
        i32.eqz
        br_if 0 (;@1;)
        i32.const 16
        local.set 38
        local.get 4
        local.get 38
        i32.add
        local.set 39
        local.get 39
        global.set $__stack_pointer
        local.get 29
        return
      end
      local.get 0
      i32.load
      local.set 40
      local.get 4
      local.get 40
      i32.store offset=8
      i32.const 1
      local.set 41
      i32.const 1
      local.set 42
      local.get 41
      local.get 42
      i32.and
      local.set 43
      block ;; label = @1
        block ;; label = @2
          local.get 43
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 30
        local.set 44
        i32.const 36
        local.set 45
        local.get 44
        local.get 45
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      i32.const 8
      local.set 46
      local.get 4
      local.get 46
      i32.add
      local.set 47
      local.get 47
      local.set 48
      i32.const 1048621
      local.set 49
      i32.const 30
      local.set 50
      local.get 49
      local.get 50
      i32.add
      local.set 51
      i32.const 6
      local.set 52
      local.get 48
      local.get 51
      local.get 52
      call $#func57<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeAll>
      local.set 53
      i32.const 0
      local.set 54
      i32.const 65535
      local.set 55
      local.get 53
      local.get 55
      i32.and
      local.set 56
      i32.const 65535
      local.set 57
      local.get 54
      local.get 57
      i32.and
      local.set 58
      local.get 56
      local.get 58
      i32.ne
      local.set 59
      i32.const 1
      local.set 60
      local.get 59
      local.get 60
      i32.and
      local.set 61
      block ;; label = @1
        local.get 61
        i32.eqz
        br_if 0 (;@1;)
        i32.const 16
        local.set 62
        local.get 4
        local.get 62
        i32.add
        local.set 63
        local.get 63
        global.set $__stack_pointer
        local.get 53
        return
      end
      i32.const 1
      local.set 64
      local.get 4
      local.get 64
      i32.store offset=12
      local.get 1
      i32.load offset=4
      local.set 65
      i32.const 1049652
      local.set 66
      i32.const 3
      local.set 67
      local.get 65
      local.get 66
      local.get 0
      local.get 67
      call $fmt.formatType__anon_2579
      local.set 68
      i32.const 0
      local.set 69
      i32.const 65535
      local.set 70
      local.get 68
      local.get 70
      i32.and
      local.set 71
      i32.const 65535
      local.set 72
      local.get 69
      local.get 72
      i32.and
      local.set 73
      local.get 71
      local.get 73
      i32.ne
      local.set 74
      i32.const 1
      local.set 75
      local.get 74
      local.get 75
      i32.and
      local.set 76
      block ;; label = @1
        local.get 76
        i32.eqz
        br_if 0 (;@1;)
        i32.const 16
        local.set 77
        local.get 4
        local.get 77
        i32.add
        local.set 78
        local.get 78
        global.set $__stack_pointer
        local.get 68
        return
      end
      i32.const 0
      local.set 79
      i32.const 16
      local.set 80
      local.get 4
      local.get 80
      i32.add
      local.set 81
      local.get 81
      global.set $__stack_pointer
      local.get 79
      return
    )
    (func $#func53<io.fixed_buffer_stream.FixedBufferStream___u8_.getWritten> (@name "io.fixed_buffer_stream.FixedBufferStream([]u8).getWritten") (;53;) (type 5) (param i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 16
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      i32.const 8
      local.set 5
      local.get 1
      local.get 5
      i32.add
      local.set 6
      local.get 6
      i32.load
      local.set 7
      local.get 4
      local.get 5
      i32.add
      local.set 8
      local.get 8
      local.get 7
      i32.store
      local.get 1
      i64.load align=4
      local.set 9
      local.get 4
      local.get 9
      i64.store
      local.get 6
      i32.load
      local.set 10
      local.get 4
      i32.load offset=4
      local.set 11
      local.get 4
      i32.load
      local.set 12
      i32.const 0
      local.set 13
      local.get 13
      local.set 14
      local.get 10
      local.set 15
      local.get 14
      local.get 15
      i32.le_u
      local.set 16
      i32.const 1
      local.set 17
      local.get 16
      local.get 17
      i32.and
      local.set 18
      block ;; label = @1
        block ;; label = @2
          local.get 18
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 19
        local.get 19
        local.get 10
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      local.get 10
      local.set 20
      local.get 11
      local.set 21
      local.get 20
      local.get 21
      i32.le_u
      local.set 22
      i32.const 1
      local.set 23
      local.get 22
      local.get 23
      i32.and
      local.set 24
      block ;; label = @1
        block ;; label = @2
          local.get 24
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        local.get 10
        local.get 11
        call $builtin.panicOutOfBounds
        unreachable
      end
      i32.const 0
      local.set 25
      local.get 25
      local.set 26
      local.get 10
      local.set 27
      local.get 26
      local.get 27
      i32.le_u
      local.set 28
      i32.const 1
      local.set 29
      local.get 28
      local.get 29
      i32.and
      local.set 30
      block ;; label = @1
        block ;; label = @2
          local.get 30
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 31
        local.get 31
        local.get 10
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 0
      local.get 10
      i32.store offset=4
      local.get 0
      local.get 12
      i32.store
      i32.const 16
      local.set 32
      local.get 4
      local.get 32
      i32.add
      local.set 33
      local.get 33
      global.set $__stack_pointer
      return
    )
    (func $fmt.format__anon_2586 (;54;) (type 3) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 16
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      local.get 0
      i32.load
      local.set 5
      local.get 4
      local.get 5
      i32.store
      i32.const 1
      local.set 6
      i32.const 1
      local.set 7
      local.get 6
      local.get 7
      i32.and
      local.set 8
      block ;; label = @1
        block ;; label = @2
          local.get 8
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 9
        i32.const 12
        local.set 10
        local.get 9
        local.get 10
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      local.get 4
      local.set 11
      i32.const 1048576
      local.set 12
      i32.const 12
      local.set 13
      local.get 11
      local.get 12
      local.get 13
      call $#func57<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeAll>
      local.set 14
      i32.const 0
      local.set 15
      i32.const 65535
      local.set 16
      local.get 14
      local.get 16
      i32.and
      local.set 17
      i32.const 65535
      local.set 18
      local.get 15
      local.get 18
      i32.and
      local.set 19
      local.get 17
      local.get 19
      i32.ne
      local.set 20
      i32.const 1
      local.set 21
      local.get 20
      local.get 21
      i32.and
      local.set 22
      block ;; label = @1
        local.get 22
        i32.eqz
        br_if 0 (;@1;)
        i32.const 16
        local.set 23
        local.get 4
        local.get 23
        i32.add
        local.set 24
        local.get 24
        global.set $__stack_pointer
        local.get 14
        return
      end
      i32.const 0
      local.set 25
      local.get 4
      local.get 25
      i32.store offset=4
      local.get 1
      i32.load
      local.set 26
      i32.const 1049672
      local.set 27
      i32.const 3
      local.set 28
      local.get 26
      local.get 27
      local.get 0
      local.get 28
      call $fmt.formatType__anon_2579
      local.set 29
      i32.const 0
      local.set 30
      i32.const 65535
      local.set 31
      local.get 29
      local.get 31
      i32.and
      local.set 32
      i32.const 65535
      local.set 33
      local.get 30
      local.get 33
      i32.and
      local.set 34
      local.get 32
      local.get 34
      i32.ne
      local.set 35
      i32.const 1
      local.set 36
      local.get 35
      local.get 36
      i32.and
      local.set 37
      block ;; label = @1
        local.get 37
        i32.eqz
        br_if 0 (;@1;)
        i32.const 16
        local.set 38
        local.get 4
        local.get 38
        i32.add
        local.set 39
        local.get 39
        global.set $__stack_pointer
        local.get 29
        return
      end
      local.get 0
      i32.load
      local.set 40
      local.get 4
      local.get 40
      i32.store offset=8
      i32.const 1
      local.set 41
      i32.const 1
      local.set 42
      local.get 41
      local.get 42
      i32.and
      local.set 43
      block ;; label = @1
        block ;; label = @2
          local.get 43
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 15
        local.set 44
        i32.const 41
        local.set 45
        local.get 44
        local.get 45
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      i32.const 8
      local.set 46
      local.get 4
      local.get 46
      i32.add
      local.set 47
      local.get 47
      local.set 48
      i32.const 1048576
      local.set 49
      i32.const 15
      local.set 50
      local.get 49
      local.get 50
      i32.add
      local.set 51
      i32.const 26
      local.set 52
      local.get 48
      local.get 51
      local.get 52
      call $#func57<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeAll>
      local.set 53
      i32.const 0
      local.set 54
      i32.const 65535
      local.set 55
      local.get 53
      local.get 55
      i32.and
      local.set 56
      i32.const 65535
      local.set 57
      local.get 54
      local.get 57
      i32.and
      local.set 58
      local.get 56
      local.get 58
      i32.ne
      local.set 59
      i32.const 1
      local.set 60
      local.get 59
      local.get 60
      i32.and
      local.set 61
      block ;; label = @1
        local.get 61
        i32.eqz
        br_if 0 (;@1;)
        i32.const 16
        local.set 62
        local.get 4
        local.get 62
        i32.add
        local.set 63
        local.get 63
        global.set $__stack_pointer
        local.get 53
        return
      end
      i32.const 1
      local.set 64
      local.get 4
      local.get 64
      i32.store offset=12
      local.get 1
      i32.load offset=4
      local.set 65
      i32.const 1049692
      local.set 66
      i32.const 3
      local.set 67
      local.get 65
      local.get 66
      local.get 0
      local.get 67
      call $fmt.formatType__anon_2579
      local.set 68
      i32.const 0
      local.set 69
      i32.const 65535
      local.set 70
      local.get 68
      local.get 70
      i32.and
      local.set 71
      i32.const 65535
      local.set 72
      local.get 69
      local.get 72
      i32.and
      local.set 73
      local.get 71
      local.get 73
      i32.ne
      local.set 74
      i32.const 1
      local.set 75
      local.get 74
      local.get 75
      i32.and
      local.set 76
      block ;; label = @1
        local.get 76
        i32.eqz
        br_if 0 (;@1;)
        i32.const 16
        local.set 77
        local.get 4
        local.get 77
        i32.add
        local.set 78
        local.get 78
        global.set $__stack_pointer
        local.get 68
        return
      end
      i32.const 0
      local.set 79
      i32.const 16
      local.set 80
      local.get 4
      local.get 80
      i32.add
      local.set 81
      local.get 81
      global.set $__stack_pointer
      local.get 79
      return
    )
    (func $fmt.formatType__anon_2500 (;55;) (type 1) (param i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 4
      i32.const 32
      local.set 5
      local.get 4
      local.get 5
      i32.sub
      local.set 6
      local.get 6
      global.set $__stack_pointer
      local.get 6
      local.get 0
      i32.store16 offset=10
      local.get 6
      local.get 3
      i32.store offset=12
      i32.const 1
      local.set 7
      local.get 6
      local.get 7
      i32.store offset=20
      i32.const 1049608
      local.set 8
      local.get 6
      local.get 8
      i32.store offset=16
      local.get 0
      local.get 1
      local.get 2
      call $fmt.formatValue__anon_2607
      local.set 9
      local.get 6
      local.get 9
      i32.store16 offset=30
      local.get 6
      i32.load16_u offset=30
      local.set 10
      i32.const 32
      local.set 11
      local.get 6
      local.get 11
      i32.add
      local.set 12
      local.get 12
      global.set $__stack_pointer
      local.get 10
      return
    )
    (func $fmt.formatValue__anon_2607 (;56;) (type 9) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 16
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 5
      local.get 0
      i32.store16 offset=12
      local.get 0
      local.get 1
      local.get 2
      call $fmt.formatIntValue__anon_2611
      local.set 6
      local.get 5
      local.get 6
      i32.store16 offset=14
      local.get 5
      i32.load16_u offset=14
      local.set 7
      i32.const 16
      local.set 8
      local.get 5
      local.get 8
      i32.add
      local.set 9
      local.get 9
      global.set $__stack_pointer
      local.get 7
      return
    )
    (func $#func57<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeAll> (@name "io.writer.Writer(*io.fixed_buffer_stream.FixedBufferStream([]u8),error{NoSpaceLeft},(function \'write\')).writeAll") (;57;) (type 9) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 64
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 2
      local.set 6
      local.get 1
      local.set 7
      local.get 5
      local.get 2
      i32.store offset=12
      local.get 5
      local.get 1
      i32.store offset=8
      i32.const 0
      local.set 8
      local.get 5
      local.get 8
      i32.store offset=20
      block ;; label = @1
        loop ;; label = @2
          local.get 5
          i32.load offset=20
          local.set 9
          local.get 9
          local.set 10
          local.get 6
          local.set 11
          local.get 10
          local.get 11
          i32.ne
          local.set 12
          i32.const 1
          local.set 13
          local.get 12
          local.get 13
          i32.and
          local.set 14
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  local.get 14
                  i32.eqz
                  br_if 0 (;@6;)
                  local.get 5
                  i32.load offset=20
                  local.set 15
                  local.get 0
                  i32.load
                  local.set 16
                  local.get 5
                  local.get 16
                  i32.store offset=24
                  local.get 5
                  i32.load offset=24
                  local.set 17
                  local.get 5
                  local.get 17
                  i32.store offset=32
                  local.get 5
                  local.get 6
                  i32.store offset=44
                  local.get 5
                  local.get 7
                  i32.store offset=40
                  local.get 5
                  i32.load offset=20
                  local.set 18
                  local.get 5
                  i32.load offset=44
                  local.set 19
                  local.get 5
                  i32.load offset=40
                  local.set 20
                  local.get 20
                  local.get 18
                  i32.add
                  local.set 21
                  local.get 18
                  local.set 22
                  local.get 19
                  local.set 23
                  local.get 22
                  local.get 23
                  i32.le_u
                  local.set 24
                  i32.const 1
                  local.set 25
                  local.get 24
                  local.get 25
                  i32.and
                  local.set 26
                  local.get 26
                  br_if 1 (;@5;)
                  br 2 (;@4;)
                end
                br 4 (;@1;)
              end
              br 1 (;@3;)
            end
            local.get 18
            local.get 19
            call $builtin.panicStartGreaterThanEnd
            unreachable
          end
          local.get 19
          local.get 18
          i32.sub
          local.set 27
          local.get 19
          local.set 28
          local.get 19
          local.set 29
          local.get 28
          local.get 29
          i32.le_u
          local.set 30
          i32.const 1
          local.set 31
          local.get 30
          local.get 31
          i32.and
          local.set 32
          block ;; label = @3
            block ;; label = @4
              local.get 32
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            local.get 19
            local.get 19
            call $builtin.panicOutOfBounds
            unreachable
          end
          local.get 18
          local.set 33
          local.get 19
          local.set 34
          local.get 33
          local.get 34
          i32.le_u
          local.set 35
          i32.const 1
          local.set 36
          local.get 35
          local.get 36
          i32.and
          local.set 37
          block ;; label = @3
            block ;; label = @4
              local.get 37
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            local.get 18
            local.get 19
            call $builtin.panicOutOfBounds
            unreachable
          end
          local.get 27
          local.set 38
          local.get 21
          local.set 39
          i32.const 48
          local.set 40
          local.get 5
          local.get 40
          i32.add
          local.set 41
          local.get 41
          local.set 42
          i32.const 32
          local.set 43
          local.get 5
          local.get 43
          i32.add
          local.set 44
          local.get 44
          local.set 45
          local.get 42
          local.get 45
          local.get 39
          local.get 38
          call $#func59<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.write>
          local.get 5
          i32.load16_u offset=52
          local.set 46
          i32.const 0
          local.set 47
          i32.const 65535
          local.set 48
          local.get 46
          local.get 48
          i32.and
          local.set 49
          i32.const 65535
          local.set 50
          local.get 47
          local.get 50
          i32.and
          local.set 51
          local.get 49
          local.get 51
          i32.ne
          local.set 52
          i32.const 1
          local.set 53
          local.get 52
          local.get 53
          i32.and
          local.set 54
          block ;; label = @3
            local.get 54
            i32.eqz
            br_if 0 (;@3;)
            local.get 5
            i32.load16_u offset=52
            local.set 55
            i32.const 64
            local.set 56
            local.get 5
            local.get 56
            i32.add
            local.set 57
            local.get 57
            global.set $__stack_pointer
            local.get 55
            return
          end
          local.get 5
          i32.load offset=48
          local.set 58
          local.get 15
          local.get 58
          i32.add
          local.set 59
          local.get 59
          local.get 15
          i32.lt_u
          local.set 60
          local.get 5
          local.get 59
          i32.store offset=56
          i32.const 1
          local.set 61
          local.get 60
          local.get 61
          i32.and
          local.set 62
          local.get 5
          local.get 62
          i32.store8 offset=60
          local.get 5
          i32.load8_u offset=60
          local.set 63
          i32.const 0
          local.set 64
          i32.const 1
          local.set 65
          local.get 63
          local.get 65
          i32.and
          local.set 66
          i32.const 1
          local.set 67
          local.get 64
          local.get 67
          i32.and
          local.set 68
          local.get 66
          local.get 68
          i32.eq
          local.set 69
          i32.const 1
          local.set 70
          local.get 69
          local.get 70
          i32.and
          local.set 71
          block ;; label = @3
            block ;; label = @4
              local.get 71
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 1048669
            local.set 72
            i32.const 16
            local.set 73
            i32.const 0
            local.set 74
            i32.const 1049832
            local.set 75
            local.get 72
            local.get 73
            local.get 74
            local.get 75
            call $builtin.default_panic
            unreachable
          end
          local.get 5
          i32.load offset=56
          local.set 76
          local.get 5
          local.get 76
          i32.store offset=20
          br 0 (;@2;)
        end
      end
      i32.const 0
      local.set 77
      i32.const 64
      local.set 78
      local.get 5
      local.get 78
      i32.add
      local.set 79
      local.get 79
      global.set $__stack_pointer
      local.get 77
      return
    )
    (func $fmt.formatType__anon_2579 (;58;) (type 1) (param i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 4
      i32.const 32
      local.set 5
      local.get 4
      local.get 5
      i32.sub
      local.set 6
      local.get 6
      global.set $__stack_pointer
      local.get 6
      local.get 0
      i32.store offset=8
      local.get 6
      local.get 3
      i32.store offset=12
      i32.const 1
      local.set 7
      local.get 6
      local.get 7
      i32.store offset=20
      i32.const 1049608
      local.set 8
      local.get 6
      local.get 8
      i32.store offset=16
      local.get 0
      local.get 1
      local.get 2
      call $fmt.formatValue__anon_2627
      local.set 9
      local.get 6
      local.get 9
      i32.store16 offset=30
      local.get 6
      i32.load16_u offset=30
      local.set 10
      i32.const 32
      local.set 11
      local.get 6
      local.get 11
      i32.add
      local.set 12
      local.get 12
      global.set $__stack_pointer
      local.get 10
      return
    )
    (func $#func59<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.write> (@name "io.writer.Writer(*io.fixed_buffer_stream.FixedBufferStream([]u8),error{NoSpaceLeft},(function \'write\')).write") (;59;) (type 4) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32)
      global.get $__stack_pointer
      local.set 4
      i32.const 16
      local.set 5
      local.get 4
      local.get 5
      i32.sub
      local.set 6
      local.get 6
      global.set $__stack_pointer
      local.get 3
      local.set 7
      local.get 2
      local.set 8
      local.get 6
      local.get 3
      i32.store offset=4
      local.get 6
      local.get 2
      i32.store
      local.get 1
      i32.load
      local.set 9
      i32.const 8
      local.set 10
      local.get 6
      local.get 10
      i32.add
      local.set 11
      local.get 11
      local.set 12
      local.get 12
      local.get 9
      local.get 8
      local.get 7
      call $#func69<io.fixed_buffer_stream.FixedBufferStream___u8_.write>
      local.get 6
      i64.load offset=8
      local.set 13
      local.get 0
      local.get 13
      i64.store align=4
      i32.const 16
      local.set 14
      local.get 6
      local.get 14
      i32.add
      local.set 15
      local.get 15
      global.set $__stack_pointer
      return
    )
    (func $fmt.formatValue__anon_2627 (;60;) (type 9) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 16
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 5
      local.get 0
      i32.store offset=8
      local.get 0
      local.get 1
      local.get 2
      call $fmt.formatIntValue__anon_2628
      local.set 6
      local.get 5
      local.get 6
      i32.store16 offset=14
      local.get 5
      i32.load16_u offset=14
      local.set 7
      i32.const 16
      local.set 8
      local.get 5
      local.get 8
      i32.add
      local.set 9
      local.get 9
      global.set $__stack_pointer
      local.get 7
      return
    )
    (func $mem.span__anon_2625 (;61;) (type 10) (param i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 32
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 5
      local.get 2
      i32.store offset=12
      local.get 5
      local.get 1
      i32.store offset=8
      local.get 1
      local.get 2
      call $mem.len__anon_2649
      local.set 6
      local.get 5
      local.get 6
      i32.store offset=20
      local.get 5
      local.get 2
      i32.store offset=28
      local.get 5
      local.get 1
      i32.store offset=24
      local.get 5
      i32.load offset=28
      local.set 7
      local.get 5
      i32.load offset=24
      local.set 8
      i32.const 0
      local.set 9
      local.get 9
      local.set 10
      local.get 6
      local.set 11
      local.get 10
      local.get 11
      i32.le_u
      local.set 12
      i32.const 1
      local.set 13
      local.get 12
      local.get 13
      i32.and
      local.set 14
      block ;; label = @1
        block ;; label = @2
          local.get 14
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 15
        local.get 15
        local.get 6
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      local.get 6
      local.set 16
      local.get 7
      local.set 17
      local.get 16
      local.get 17
      i32.le_u
      local.set 18
      i32.const 1
      local.set 19
      local.get 18
      local.get 19
      i32.and
      local.set 20
      block ;; label = @1
        block ;; label = @2
          local.get 20
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        local.get 6
        local.get 7
        call $builtin.panicOutOfBounds
        unreachable
      end
      i32.const 0
      local.set 21
      local.get 21
      local.set 22
      local.get 6
      local.set 23
      local.get 22
      local.get 23
      i32.le_u
      local.set 24
      i32.const 1
      local.set 25
      local.get 24
      local.get 25
      i32.and
      local.set 26
      block ;; label = @1
        block ;; label = @2
          local.get 26
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 27
        local.get 27
        local.get 6
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 0
      local.get 6
      i32.store offset=4
      local.get 0
      local.get 8
      i32.store
      i32.const 32
      local.set 28
      local.get 5
      local.get 28
      i32.add
      local.set 29
      local.get 29
      global.set $__stack_pointer
      return
    )
    (func $fmt.formatIntValue__anon_2611 (;62;) (type 9) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 16
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 5
      local.get 0
      i32.store16 offset=10
      local.get 5
      local.get 0
      i32.store16 offset=12
      i32.const 10
      local.set 6
      i32.const 0
      local.set 7
      local.get 0
      local.get 6
      local.get 7
      local.get 1
      local.get 2
      call $fmt.formatInt__anon_2617
      local.set 8
      local.get 5
      local.get 8
      i32.store16 offset=14
      local.get 5
      i32.load16_u offset=14
      local.set 9
      i32.const 16
      local.set 10
      local.get 5
      local.get 10
      i32.add
      local.set 11
      local.get 11
      global.set $__stack_pointer
      local.get 9
      return
    )
    (func $fmt.formatInt__anon_2617 (;63;) (type 8) (param i32 i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 5
      i32.const 128
      local.set 6
      local.get 5
      local.get 6
      i32.sub
      local.set 7
      local.get 7
      global.set $__stack_pointer
      local.get 7
      local.get 0
      i32.store16 offset=6
      local.get 7
      local.get 1
      i32.store8 offset=8
      i32.const 1
      local.set 8
      local.get 2
      local.get 8
      i32.and
      local.set 9
      local.get 7
      local.get 9
      i32.store8 offset=9
      i32.const 2
      local.set 10
      i32.const 255
      local.set 11
      local.get 1
      local.get 11
      i32.and
      local.set 12
      i32.const 255
      local.set 13
      local.get 10
      local.get 13
      i32.and
      local.set 14
      local.get 12
      local.get 14
      i32.ge_u
      local.set 15
      local.get 15
      call $debug.assert
      local.get 7
      local.get 0
      i32.store16 offset=10
      i32.const 16
      local.set 16
      local.get 7
      local.get 16
      i32.store16 offset=12
      local.get 0
      call $math.absCast__anon_2619
      local.set 17
      local.get 7
      local.get 17
      i32.store16 offset=14
      i32.const 32
      local.set 18
      local.get 7
      local.get 18
      i32.add
      local.set 19
      i32.const -86
      local.set 20
      local.get 19
      local.get 20
      i32.store8
      i32.const 24
      local.set 21
      local.get 7
      local.get 21
      i32.add
      local.set 22
      i64.const -6148914691236517206
      local.set 23
      local.get 22
      local.get 23
      i64.store
      local.get 7
      local.get 23
      i64.store offset=16
      local.get 7
      local.get 17
      i32.store16 offset=34
      i32.const 17
      local.set 24
      local.get 7
      local.get 24
      i32.store offset=36
      i32.const 10
      local.set 25
      i32.const 255
      local.set 26
      local.get 1
      local.get 26
      i32.and
      local.set 27
      i32.const 255
      local.set 28
      local.get 25
      local.get 28
      i32.and
      local.set 29
      local.get 27
      local.get 29
      i32.eq
      local.set 30
      i32.const 1
      local.set 31
      local.get 30
      local.get 31
      i32.and
      local.set 32
      block ;; label = @1
        block ;; label = @2
          local.get 32
          i32.eqz
          br_if 0 (;@2;)
          call $fmt.isComptime
          local.set 33
          i32.const -1
          local.set 34
          local.get 33
          local.get 34
          i32.xor
          local.set 35
          local.get 35
          local.set 36
          br 1 (;@1;)
        end
        i32.const 0
        local.set 37
        local.get 37
        local.set 36
      end
      local.get 36
      local.set 38
      i32.const 1
      local.set 39
      local.get 38
      local.get 39
      i32.and
      local.set 40
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 40
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            br 1 (;@2;)
          end
          block ;; label = @3
            loop ;; label = @4
              local.get 7
              i32.load16_u offset=34
              local.set 41
              i32.const 100
              local.set 42
              i32.const 65535
              local.set 43
              local.get 41
              local.get 43
              i32.and
              local.set 44
              i32.const 65535
              local.set 45
              local.get 42
              local.get 45
              i32.and
              local.set 46
              local.get 44
              local.get 46
              i32.ge_u
              local.set 47
              i32.const 1
              local.set 48
              local.get 47
              local.get 48
              i32.and
              local.set 49
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      local.get 49
                      i32.eqz
                      br_if 0 (;@8;)
                      local.get 7
                      i32.load offset=36
                      local.set 50
                      i32.const -2
                      local.set 51
                      local.get 50
                      local.get 51
                      i32.add
                      local.set 52
                      local.get 52
                      local.get 50
                      i32.gt_u
                      local.set 53
                      local.get 7
                      local.get 52
                      i32.store offset=40
                      i32.const 1
                      local.set 54
                      local.get 53
                      local.get 54
                      i32.and
                      local.set 55
                      local.get 7
                      local.get 55
                      i32.store8 offset=44
                      local.get 7
                      i32.load8_u offset=44
                      local.set 56
                      i32.const 0
                      local.set 57
                      i32.const 1
                      local.set 58
                      local.get 56
                      local.get 58
                      i32.and
                      local.set 59
                      i32.const 1
                      local.set 60
                      local.get 57
                      local.get 60
                      i32.and
                      local.set 61
                      local.get 59
                      local.get 61
                      i32.eq
                      local.set 62
                      i32.const 1
                      local.set 63
                      local.get 62
                      local.get 63
                      i32.and
                      local.set 64
                      local.get 64
                      br_if 1 (;@7;)
                      br 2 (;@6;)
                    end
                    br 4 (;@3;)
                  end
                  br 1 (;@5;)
                end
                i32.const 1048669
                local.set 65
                i32.const 16
                local.set 66
                i32.const 0
                local.set 67
                i32.const 1049712
                local.set 68
                local.get 65
                local.get 66
                local.get 67
                local.get 68
                call $builtin.default_panic
                unreachable
              end
              local.get 7
              i32.load offset=40
              local.set 69
              local.get 7
              local.get 69
              i32.store offset=36
              local.get 7
              i32.load offset=36
              local.set 70
              i32.const 16
              local.set 71
              local.get 7
              local.get 71
              i32.add
              local.set 72
              local.get 72
              local.set 73
              local.get 73
              local.get 70
              i32.add
              local.set 74
              i32.const 17
              local.set 75
              local.get 70
              local.set 76
              local.get 75
              local.set 77
              local.get 76
              local.get 77
              i32.le_u
              local.set 78
              i32.const 1
              local.set 79
              local.get 78
              local.get 79
              i32.and
              local.set 80
              block ;; label = @5
                block ;; label = @6
                  local.get 80
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                i32.const 17
                local.set 81
                local.get 70
                local.get 81
                call $builtin.panicStartGreaterThanEnd
                unreachable
              end
              i32.const 17
              local.set 82
              local.get 82
              local.get 70
              i32.sub
              local.set 83
              i32.const 1
              local.set 84
              i32.const 1
              local.set 85
              local.get 84
              local.get 85
              i32.and
              local.set 86
              block ;; label = @5
                block ;; label = @6
                  local.get 86
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                i32.const 17
                local.set 87
                local.get 87
                local.get 87
                call $builtin.panicOutOfBounds
                unreachable
              end
              i32.const 17
              local.set 88
              local.get 70
              local.set 89
              local.get 88
              local.set 90
              local.get 89
              local.get 90
              i32.le_u
              local.set 91
              i32.const 1
              local.set 92
              local.get 91
              local.get 92
              i32.and
              local.set 93
              block ;; label = @5
                block ;; label = @6
                  local.get 93
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                i32.const 17
                local.set 94
                local.get 70
                local.get 94
                call $builtin.panicOutOfBounds
                unreachable
              end
              local.get 7
              local.get 83
              i32.store offset=52
              local.get 7
              local.get 74
              i32.store offset=48
              local.get 7
              i32.load offset=52
              local.set 95
              local.get 7
              i32.load offset=48
              local.set 96
              i32.const 1
              local.set 97
              i32.const 1
              local.set 98
              local.get 97
              local.get 98
              i32.and
              local.set 99
              block ;; label = @5
                block ;; label = @6
                  local.get 99
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                i32.const 0
                local.set 100
                i32.const 2
                local.set 101
                local.get 100
                local.get 101
                call $builtin.panicStartGreaterThanEnd
                unreachable
              end
              i32.const 2
              local.set 102
              local.get 102
              local.set 103
              local.get 95
              local.set 104
              local.get 103
              local.get 104
              i32.le_u
              local.set 105
              i32.const 1
              local.set 106
              local.get 105
              local.get 106
              i32.and
              local.set 107
              block ;; label = @5
                block ;; label = @6
                  local.get 107
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                i32.const 2
                local.set 108
                local.get 108
                local.get 95
                call $builtin.panicOutOfBounds
                unreachable
              end
              local.get 7
              i32.load16_u offset=34
              local.set 109
              i32.const 100
              local.set 110
              local.get 109
              local.get 110
              i32.rem_u
              local.set 111
              i32.const 62
              local.set 112
              local.get 7
              local.get 112
              i32.add
              local.set 113
              local.get 113
              local.get 111
              call $fmt.digits2
              local.get 7
              i32.load16_u offset=62 align=1
              local.set 114
              local.get 96
              local.get 114
              i32.store16 align=1
              local.get 7
              i32.load16_u offset=34
              local.set 115
              local.get 115
              local.get 110
              i32.div_u
              local.set 116
              local.get 7
              local.get 116
              i32.store16 offset=34
              br 0 (;@4;)
            end
          end
          local.get 7
          i32.load16_u offset=34
          local.set 117
          i32.const 10
          local.set 118
          i32.const 65535
          local.set 119
          local.get 117
          local.get 119
          i32.and
          local.set 120
          i32.const 65535
          local.set 121
          local.get 118
          local.get 121
          i32.and
          local.set 122
          local.get 120
          local.get 122
          i32.lt_u
          local.set 123
          i32.const 1
          local.set 124
          local.get 123
          local.get 124
          i32.and
          local.set 125
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      block ;; label = @9
                        block ;; label = @10
                          local.get 125
                          i32.eqz
                          br_if 0 (;@10;)
                          local.get 7
                          i32.load offset=36
                          local.set 126
                          i32.const -1
                          local.set 127
                          local.get 126
                          local.get 127
                          i32.add
                          local.set 128
                          local.get 128
                          local.get 126
                          i32.gt_u
                          local.set 129
                          local.get 7
                          local.get 128
                          i32.store offset=64
                          i32.const 1
                          local.set 130
                          local.get 129
                          local.get 130
                          i32.and
                          local.set 131
                          local.get 7
                          local.get 131
                          i32.store8 offset=68
                          local.get 7
                          i32.load8_u offset=68
                          local.set 132
                          i32.const 0
                          local.set 133
                          i32.const 1
                          local.set 134
                          local.get 132
                          local.get 134
                          i32.and
                          local.set 135
                          i32.const 1
                          local.set 136
                          local.get 133
                          local.get 136
                          i32.and
                          local.set 137
                          local.get 135
                          local.get 137
                          i32.eq
                          local.set 138
                          i32.const 1
                          local.set 139
                          local.get 138
                          local.get 139
                          i32.and
                          local.set 140
                          local.get 140
                          br_if 1 (;@9;)
                          br 2 (;@8;)
                        end
                        local.get 7
                        i32.load offset=36
                        local.set 141
                        i32.const -2
                        local.set 142
                        local.get 141
                        local.get 142
                        i32.add
                        local.set 143
                        local.get 143
                        local.get 141
                        i32.gt_u
                        local.set 144
                        local.get 7
                        local.get 143
                        i32.store offset=80
                        i32.const 1
                        local.set 145
                        local.get 144
                        local.get 145
                        i32.and
                        local.set 146
                        local.get 7
                        local.get 146
                        i32.store8 offset=84
                        local.get 7
                        i32.load8_u offset=84
                        local.set 147
                        i32.const 0
                        local.set 148
                        i32.const 1
                        local.set 149
                        local.get 147
                        local.get 149
                        i32.and
                        local.set 150
                        i32.const 1
                        local.set 151
                        local.get 148
                        local.get 151
                        i32.and
                        local.set 152
                        local.get 150
                        local.get 152
                        i32.eq
                        local.set 153
                        i32.const 1
                        local.set 154
                        local.get 153
                        local.get 154
                        i32.and
                        local.set 155
                        local.get 155
                        br_if 3 (;@6;)
                        br 4 (;@5;)
                      end
                      br 1 (;@7;)
                    end
                    i32.const 1048669
                    local.set 156
                    i32.const 16
                    local.set 157
                    i32.const 0
                    local.set 158
                    i32.const 1049720
                    local.set 159
                    local.get 156
                    local.get 157
                    local.get 158
                    local.get 159
                    call $builtin.default_panic
                    unreachable
                  end
                  local.get 7
                  i32.load offset=64
                  local.set 160
                  local.get 7
                  local.get 160
                  i32.store offset=36
                  local.get 7
                  i32.load offset=36
                  local.set 161
                  i32.const 17
                  local.set 162
                  local.get 161
                  local.set 163
                  local.get 162
                  local.set 164
                  local.get 163
                  local.get 164
                  i32.lt_u
                  local.set 165
                  i32.const 1
                  local.set 166
                  local.get 165
                  local.get 166
                  i32.and
                  local.set 167
                  block ;; label = @7
                    block ;; label = @8
                      local.get 167
                      i32.eqz
                      br_if 0 (;@8;)
                      br 1 (;@7;)
                    end
                    i32.const 17
                    local.set 168
                    local.get 161
                    local.get 168
                    call $builtin.panicOutOfBounds
                    unreachable
                  end
                  i32.const 16
                  local.set 169
                  local.get 7
                  local.get 169
                  i32.add
                  local.set 170
                  local.get 170
                  local.get 161
                  i32.add
                  local.set 171
                  local.get 7
                  i32.load16_u offset=34
                  local.set 172
                  i32.const 255
                  local.set 173
                  local.get 173
                  local.get 172
                  i32.sub
                  local.set 174
                  i32.const 255
                  local.set 175
                  i32.const 65535
                  local.set 176
                  local.get 174
                  local.get 176
                  i32.and
                  local.set 177
                  i32.const 65535
                  local.set 178
                  local.get 175
                  local.get 178
                  i32.and
                  local.set 179
                  local.get 177
                  local.get 179
                  i32.le_u
                  local.set 180
                  i32.const 1
                  local.set 181
                  local.get 180
                  local.get 181
                  i32.and
                  local.set 182
                  block ;; label = @7
                    block ;; label = @8
                      local.get 182
                      i32.eqz
                      br_if 0 (;@8;)
                      br 1 (;@7;)
                    end
                    i32.const 1048686
                    local.set 183
                    i32.const 27
                    local.set 184
                    i32.const 0
                    local.set 185
                    i32.const 1049728
                    local.set 186
                    local.get 183
                    local.get 184
                    local.get 185
                    local.get 186
                    call $builtin.default_panic
                    unreachable
                  end
                  i32.const 255
                  local.set 187
                  local.get 172
                  local.get 187
                  i32.and
                  local.set 188
                  i32.const 48
                  local.set 189
                  local.get 188
                  local.get 189
                  i32.add
                  local.set 190
                  local.get 190
                  local.get 187
                  i32.and
                  local.set 191
                  local.get 191
                  local.get 190
                  i32.ne
                  local.set 192
                  local.get 190
                  local.set 193
                  local.get 7
                  local.get 193
                  i32.store8 offset=72
                  i32.const 1
                  local.set 194
                  local.get 192
                  local.get 194
                  i32.and
                  local.set 195
                  local.get 7
                  local.get 195
                  i32.store8 offset=73
                  local.get 7
                  i32.load8_u offset=73
                  local.set 196
                  i32.const 0
                  local.set 197
                  i32.const 1
                  local.set 198
                  local.get 196
                  local.get 198
                  i32.and
                  local.set 199
                  i32.const 1
                  local.set 200
                  local.get 197
                  local.get 200
                  i32.and
                  local.set 201
                  local.get 199
                  local.get 201
                  i32.eq
                  local.set 202
                  i32.const 1
                  local.set 203
                  local.get 202
                  local.get 203
                  i32.and
                  local.set 204
                  block ;; label = @7
                    block ;; label = @8
                      local.get 204
                      i32.eqz
                      br_if 0 (;@8;)
                      br 1 (;@7;)
                    end
                    i32.const 1048669
                    local.set 205
                    i32.const 16
                    local.set 206
                    i32.const 0
                    local.set 207
                    i32.const 1049736
                    local.set 208
                    local.get 205
                    local.get 206
                    local.get 207
                    local.get 208
                    call $builtin.default_panic
                    unreachable
                  end
                  local.get 7
                  i32.load8_u offset=72
                  local.set 209
                  local.get 171
                  local.get 209
                  i32.store8
                  br 3 (;@3;)
                end
                br 1 (;@4;)
              end
              i32.const 1048669
              local.set 210
              i32.const 16
              local.set 211
              i32.const 0
              local.set 212
              i32.const 1049744
              local.set 213
              local.get 210
              local.get 211
              local.get 212
              local.get 213
              call $builtin.default_panic
              unreachable
            end
            local.get 7
            i32.load offset=80
            local.set 214
            local.get 7
            local.get 214
            i32.store offset=36
            local.get 7
            i32.load offset=36
            local.set 215
            i32.const 16
            local.set 216
            local.get 7
            local.get 216
            i32.add
            local.set 217
            local.get 217
            local.set 218
            local.get 218
            local.get 215
            i32.add
            local.set 219
            i32.const 17
            local.set 220
            local.get 215
            local.set 221
            local.get 220
            local.set 222
            local.get 221
            local.get 222
            i32.le_u
            local.set 223
            i32.const 1
            local.set 224
            local.get 223
            local.get 224
            i32.and
            local.set 225
            block ;; label = @4
              block ;; label = @5
                local.get 225
                i32.eqz
                br_if 0 (;@5;)
                br 1 (;@4;)
              end
              i32.const 17
              local.set 226
              local.get 215
              local.get 226
              call $builtin.panicStartGreaterThanEnd
              unreachable
            end
            i32.const 17
            local.set 227
            local.get 227
            local.get 215
            i32.sub
            local.set 228
            i32.const 1
            local.set 229
            i32.const 1
            local.set 230
            local.get 229
            local.get 230
            i32.and
            local.set 231
            block ;; label = @4
              block ;; label = @5
                local.get 231
                i32.eqz
                br_if 0 (;@5;)
                br 1 (;@4;)
              end
              i32.const 17
              local.set 232
              local.get 232
              local.get 232
              call $builtin.panicOutOfBounds
              unreachable
            end
            i32.const 17
            local.set 233
            local.get 215
            local.set 234
            local.get 233
            local.set 235
            local.get 234
            local.get 235
            i32.le_u
            local.set 236
            i32.const 1
            local.set 237
            local.get 236
            local.get 237
            i32.and
            local.set 238
            block ;; label = @4
              block ;; label = @5
                local.get 238
                i32.eqz
                br_if 0 (;@5;)
                br 1 (;@4;)
              end
              i32.const 17
              local.set 239
              local.get 215
              local.get 239
              call $builtin.panicOutOfBounds
              unreachable
            end
            local.get 7
            local.get 228
            i32.store offset=92
            local.get 7
            local.get 219
            i32.store offset=88
            local.get 7
            i32.load offset=92
            local.set 240
            local.get 7
            i32.load offset=88
            local.set 241
            i32.const 1
            local.set 242
            i32.const 1
            local.set 243
            local.get 242
            local.get 243
            i32.and
            local.set 244
            block ;; label = @4
              block ;; label = @5
                local.get 244
                i32.eqz
                br_if 0 (;@5;)
                br 1 (;@4;)
              end
              i32.const 0
              local.set 245
              i32.const 2
              local.set 246
              local.get 245
              local.get 246
              call $builtin.panicStartGreaterThanEnd
              unreachable
            end
            i32.const 2
            local.set 247
            local.get 247
            local.set 248
            local.get 240
            local.set 249
            local.get 248
            local.get 249
            i32.le_u
            local.set 250
            i32.const 1
            local.set 251
            local.get 250
            local.get 251
            i32.and
            local.set 252
            block ;; label = @4
              block ;; label = @5
                local.get 252
                i32.eqz
                br_if 0 (;@5;)
                br 1 (;@4;)
              end
              i32.const 2
              local.set 253
              local.get 253
              local.get 240
              call $builtin.panicOutOfBounds
              unreachable
            end
            local.get 7
            i32.load16_u offset=34
            local.set 254
            i32.const 65535
            local.set 255
            local.get 254
            local.get 255
            i32.and
            local.set 256
            i32.const 100
            local.set 257
            local.get 7
            local.get 257
            i32.add
            local.set 258
            local.get 258
            local.set 259
            local.get 259
            local.get 256
            call $fmt.digits2
            local.get 7
            i32.load16_u offset=100 align=1
            local.set 260
            local.get 241
            local.get 260
            i32.store16 align=1
          end
          br 1 (;@1;)
        end
        loop ;; label = @2
          local.get 7
          i32.load16_u offset=34
          local.set 261
          i32.const 255
          local.set 262
          local.get 1
          local.get 262
          i32.and
          local.set 263
          i32.const 0
          local.set 264
          i32.const 65535
          local.set 265
          local.get 263
          local.get 265
          i32.and
          local.set 266
          i32.const 65535
          local.set 267
          local.get 264
          local.get 267
          i32.and
          local.set 268
          local.get 266
          local.get 268
          i32.ne
          local.set 269
          i32.const 1
          local.set 270
          local.get 269
          local.get 270
          i32.and
          local.set 271
          block ;; label = @3
            block ;; label = @4
              local.get 271
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 1048714
            local.set 272
            i32.const 16
            local.set 273
            i32.const 0
            local.set 274
            i32.const 1049752
            local.set 275
            local.get 272
            local.get 273
            local.get 274
            local.get 275
            call $builtin.default_panic
            unreachable
          end
          i32.const 65535
          local.set 276
          local.get 263
          local.get 276
          i32.and
          local.set 277
          local.get 261
          local.get 276
          i32.and
          local.set 278
          local.get 278
          local.get 277
          i32.rem_u
          local.set 279
          local.get 7
          local.get 279
          i32.store16 offset=102
          local.get 7
          i32.load offset=36
          local.set 280
          i32.const -1
          local.set 281
          local.get 280
          local.get 281
          i32.add
          local.set 282
          local.get 282
          local.get 280
          i32.gt_u
          local.set 283
          local.get 7
          local.get 282
          i32.store offset=104
          i32.const 1
          local.set 284
          local.get 283
          local.get 284
          i32.and
          local.set 285
          local.get 7
          local.get 285
          i32.store8 offset=108
          local.get 7
          i32.load8_u offset=108
          local.set 286
          i32.const 0
          local.set 287
          i32.const 1
          local.set 288
          local.get 286
          local.get 288
          i32.and
          local.set 289
          i32.const 1
          local.set 290
          local.get 287
          local.get 290
          i32.and
          local.set 291
          local.get 289
          local.get 291
          i32.eq
          local.set 292
          i32.const 1
          local.set 293
          local.get 292
          local.get 293
          i32.and
          local.set 294
          block ;; label = @3
            block ;; label = @4
              local.get 294
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 1048669
            local.set 295
            i32.const 16
            local.set 296
            i32.const 0
            local.set 297
            i32.const 1049760
            local.set 298
            local.get 295
            local.get 296
            local.get 297
            local.get 298
            call $builtin.default_panic
            unreachable
          end
          local.get 7
          i32.load offset=104
          local.set 299
          local.get 7
          local.get 299
          i32.store offset=36
          local.get 7
          i32.load offset=36
          local.set 300
          i32.const 17
          local.set 301
          local.get 300
          local.set 302
          local.get 301
          local.set 303
          local.get 302
          local.get 303
          i32.lt_u
          local.set 304
          i32.const 1
          local.set 305
          local.get 304
          local.get 305
          i32.and
          local.set 306
          block ;; label = @3
            block ;; label = @4
              local.get 306
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 17
            local.set 307
            local.get 300
            local.get 307
            call $builtin.panicOutOfBounds
            unreachable
          end
          i32.const 16
          local.set 308
          local.get 7
          local.get 308
          i32.add
          local.set 309
          local.get 309
          local.get 300
          i32.add
          local.set 310
          i32.const 255
          local.set 311
          local.get 311
          local.get 279
          i32.sub
          local.set 312
          i32.const 255
          local.set 313
          i32.const 65535
          local.set 314
          local.get 312
          local.get 314
          i32.and
          local.set 315
          i32.const 65535
          local.set 316
          local.get 313
          local.get 316
          i32.and
          local.set 317
          local.get 315
          local.get 317
          i32.le_u
          local.set 318
          i32.const 1
          local.set 319
          local.get 318
          local.get 319
          i32.and
          local.set 320
          block ;; label = @3
            block ;; label = @4
              local.get 320
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 1048686
            local.set 321
            i32.const 27
            local.set 322
            i32.const 0
            local.set 323
            i32.const 1049768
            local.set 324
            local.get 321
            local.get 322
            local.get 323
            local.get 324
            call $builtin.default_panic
            unreachable
          end
          local.get 279
          local.get 2
          call $fmt.digitToChar
          local.set 325
          local.get 310
          local.get 325
          i32.store8
          local.get 7
          i32.load16_u offset=34
          local.set 326
          i32.const 255
          local.set 327
          local.get 1
          local.get 327
          i32.and
          local.set 328
          i32.const 0
          local.set 329
          i32.const 65535
          local.set 330
          local.get 328
          local.get 330
          i32.and
          local.set 331
          i32.const 65535
          local.set 332
          local.get 329
          local.get 332
          i32.and
          local.set 333
          local.get 331
          local.get 333
          i32.ne
          local.set 334
          i32.const 1
          local.set 335
          local.get 334
          local.get 335
          i32.and
          local.set 336
          block ;; label = @3
            block ;; label = @4
              local.get 336
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 1048714
            local.set 337
            i32.const 16
            local.set 338
            i32.const 0
            local.set 339
            i32.const 1049776
            local.set 340
            local.get 337
            local.get 338
            local.get 339
            local.get 340
            call $builtin.default_panic
            unreachable
          end
          i32.const 65535
          local.set 341
          local.get 328
          local.get 341
          i32.and
          local.set 342
          local.get 326
          local.get 341
          i32.and
          local.set 343
          local.get 343
          local.get 342
          i32.div_u
          local.set 344
          local.get 7
          local.get 344
          i32.store16 offset=34
          local.get 7
          i32.load16_u offset=34
          local.set 345
          i32.const 0
          local.set 346
          i32.const 65535
          local.set 347
          local.get 345
          local.get 347
          i32.and
          local.set 348
          i32.const 65535
          local.set 349
          local.get 346
          local.get 349
          i32.and
          local.set 350
          local.get 348
          local.get 350
          i32.eq
          local.set 351
          i32.const 1
          local.set 352
          local.get 351
          local.get 352
          i32.and
          local.set 353
          block ;; label = @3
            block ;; label = @4
              local.get 353
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            br 1 (;@2;)
          end
        end
      end
      local.get 7
      i32.load offset=36
      local.set 354
      i32.const 16
      local.set 355
      local.get 7
      local.get 355
      i32.add
      local.set 356
      local.get 356
      local.set 357
      local.get 357
      local.get 354
      i32.add
      local.set 358
      i32.const 17
      local.set 359
      local.get 354
      local.set 360
      local.get 359
      local.set 361
      local.get 360
      local.get 361
      i32.le_u
      local.set 362
      i32.const 1
      local.set 363
      local.get 362
      local.get 363
      i32.and
      local.set 364
      block ;; label = @1
        block ;; label = @2
          local.get 364
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 17
        local.set 365
        local.get 354
        local.get 365
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      i32.const 17
      local.set 366
      local.get 366
      local.get 354
      i32.sub
      local.set 367
      i32.const 1
      local.set 368
      i32.const 1
      local.set 369
      local.get 368
      local.get 369
      i32.and
      local.set 370
      block ;; label = @1
        block ;; label = @2
          local.get 370
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 17
        local.set 371
        local.get 371
        local.get 371
        call $builtin.panicOutOfBounds
        unreachable
      end
      i32.const 17
      local.set 372
      local.get 354
      local.set 373
      local.get 372
      local.set 374
      local.get 373
      local.get 374
      i32.le_u
      local.set 375
      i32.const 1
      local.set 376
      local.get 375
      local.get 376
      i32.and
      local.set 377
      block ;; label = @1
        block ;; label = @2
          local.get 377
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 17
        local.set 378
        local.get 354
        local.get 378
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      local.get 367
      i32.store offset=124
      local.get 7
      local.get 358
      i32.store offset=120
      local.get 7
      i32.load offset=124
      local.set 379
      local.get 7
      i32.load offset=120
      local.set 380
      local.get 380
      local.get 379
      local.get 3
      local.get 4
      call $fmt.formatBuf__anon_2029
      local.set 381
      local.get 7
      local.get 381
      i32.store16 offset=118
      local.get 7
      i32.load16_u offset=118
      local.set 382
      i32.const 128
      local.set 383
      local.get 7
      local.get 383
      i32.add
      local.set 384
      local.get 384
      global.set $__stack_pointer
      local.get 382
      return
    )
    (func $math.absCast__anon_2619 (;64;) (type 7) (param i32) (result i32)
      (local i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 16
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      local.get 3
      local.get 0
      i32.store16 offset=14
      i32.const 16
      local.set 4
      local.get 3
      local.get 4
      i32.add
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 0
      return
    )
    (func $fmt.isComptime (;65;) (type 6) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 0
      i32.const 16
      local.set 1
      local.get 0
      local.get 1
      i32.sub
      local.set 2
      local.get 2
      global.set $__stack_pointer
      i32.const 0
      local.set 3
      local.get 2
      local.get 3
      i32.store8 offset=15
      i32.const 0
      local.set 4
      i32.const 16
      local.set 5
      local.get 2
      local.get 5
      i32.add
      local.set 6
      local.get 6
      global.set $__stack_pointer
      local.get 4
      return
    )
    (func $fmt.digits2 (;66;) (type 5) (param i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 32
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      local.get 4
      local.get 1
      i32.store offset=4
      local.get 1
      local.get 1
      i32.add
      local.set 5
      local.get 5
      local.get 1
      i32.lt_u
      local.set 6
      local.get 4
      local.get 5
      i32.store offset=8
      i32.const 1
      local.set 7
      local.get 6
      local.get 7
      i32.and
      local.set 8
      local.get 4
      local.get 8
      i32.store8 offset=12
      local.get 4
      i32.load8_u offset=12
      local.set 9
      i32.const 0
      local.set 10
      i32.const 1
      local.set 11
      local.get 9
      local.get 11
      i32.and
      local.set 12
      i32.const 1
      local.set 13
      local.get 10
      local.get 13
      i32.and
      local.set 14
      local.get 12
      local.get 14
      i32.eq
      local.set 15
      i32.const 1
      local.set 16
      local.get 15
      local.get 16
      i32.and
      local.set 17
      block ;; label = @1
        block ;; label = @2
          local.get 17
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1048669
        local.set 18
        i32.const 16
        local.set 19
        i32.const 0
        local.set 20
        i32.const 1049936
        local.set 21
        local.get 18
        local.get 19
        local.get 20
        local.get 21
        call $builtin.default_panic
        unreachable
      end
      local.get 4
      i32.load offset=8
      local.set 22
      i32.const 1048854
      local.set 23
      local.get 23
      local.get 22
      i32.add
      local.set 24
      i32.const 200
      local.set 25
      local.get 22
      local.set 26
      local.get 25
      local.set 27
      local.get 26
      local.get 27
      i32.le_u
      local.set 28
      i32.const 1
      local.set 29
      local.get 28
      local.get 29
      i32.and
      local.set 30
      block ;; label = @1
        block ;; label = @2
          local.get 30
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 200
        local.set 31
        local.get 22
        local.get 31
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      i32.const 200
      local.set 32
      local.get 32
      local.get 22
      i32.sub
      local.set 33
      i32.const 1
      local.set 34
      i32.const 1
      local.set 35
      local.get 34
      local.get 35
      i32.and
      local.set 36
      block ;; label = @1
        block ;; label = @2
          local.get 36
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 200
        local.set 37
        i32.const 201
        local.set 38
        local.get 37
        local.get 38
        call $builtin.panicOutOfBounds
        unreachable
      end
      i32.const 200
      local.set 39
      local.get 22
      local.set 40
      local.get 39
      local.set 41
      local.get 40
      local.get 41
      i32.le_u
      local.set 42
      i32.const 1
      local.set 43
      local.get 42
      local.get 43
      i32.and
      local.set 44
      block ;; label = @1
        block ;; label = @2
          local.get 44
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 200
        local.set 45
        local.get 22
        local.get 45
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 4
      local.get 33
      i32.store offset=20
      local.get 4
      local.get 24
      i32.store offset=16
      local.get 4
      i32.load offset=20
      local.set 46
      local.get 4
      i32.load offset=16
      local.set 47
      i32.const 1
      local.set 48
      i32.const 1
      local.set 49
      local.get 48
      local.get 49
      i32.and
      local.set 50
      block ;; label = @1
        block ;; label = @2
          local.get 50
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 51
        i32.const 2
        local.set 52
        local.get 51
        local.get 52
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      i32.const 1
      local.set 53
      local.get 46
      local.get 53
      i32.add
      local.set 54
      local.get 54
      i32.eqz
      local.set 55
      local.get 4
      local.get 54
      i32.store offset=24
      i32.const 1
      local.set 56
      local.get 55
      local.get 56
      i32.and
      local.set 57
      local.get 4
      local.get 57
      i32.store8 offset=28
      local.get 4
      i32.load8_u offset=28
      local.set 58
      i32.const 0
      local.set 59
      i32.const 1
      local.set 60
      local.get 58
      local.get 60
      i32.and
      local.set 61
      i32.const 1
      local.set 62
      local.get 59
      local.get 62
      i32.and
      local.set 63
      local.get 61
      local.get 63
      i32.eq
      local.set 64
      i32.const 1
      local.set 65
      local.get 64
      local.get 65
      i32.and
      local.set 66
      block ;; label = @1
        block ;; label = @2
          local.get 66
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1048669
        local.set 67
        i32.const 16
        local.set 68
        i32.const 0
        local.set 69
        i32.const 1049944
        local.set 70
        local.get 67
        local.get 68
        local.get 69
        local.get 70
        call $builtin.default_panic
        unreachable
      end
      local.get 4
      i32.load offset=24
      local.set 71
      i32.const 2
      local.set 72
      local.get 72
      local.set 73
      local.get 71
      local.set 74
      local.get 73
      local.get 74
      i32.le_u
      local.set 75
      i32.const 1
      local.set 76
      local.get 75
      local.get 76
      i32.and
      local.set 77
      block ;; label = @1
        block ;; label = @2
          local.get 77
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 2
        local.set 78
        local.get 78
        local.get 71
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 47
      i32.load16_u align=1
      local.set 79
      local.get 0
      local.get 79
      i32.store16 align=1
      i32.const 32
      local.set 80
      local.get 4
      local.get 80
      i32.add
      local.set 81
      local.get 81
      global.set $__stack_pointer
      return
    )
    (func $fmt.digitToChar (;67;) (type 3) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 32
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      local.get 4
      local.get 0
      i32.store8 offset=5
      i32.const 1
      local.set 5
      local.get 1
      local.get 5
      i32.and
      local.set 6
      local.get 4
      local.get 6
      i32.store8 offset=6
      i32.const 0
      local.set 7
      i32.const 255
      local.set 8
      local.get 0
      local.get 8
      i32.and
      local.set 9
      i32.const 255
      local.set 10
      local.get 7
      local.get 10
      i32.and
      local.set 11
      local.get 9
      local.get 11
      i32.ge_u
      local.set 12
      i32.const 9
      local.set 13
      i32.const 255
      local.set 14
      local.get 0
      local.get 14
      i32.and
      local.set 15
      i32.const 255
      local.set 16
      local.get 13
      local.get 16
      i32.and
      local.set 17
      local.get 15
      local.get 17
      i32.le_u
      local.set 18
      local.get 12
      local.get 18
      i32.and
      local.set 19
      i32.const 1
      local.set 20
      local.get 19
      local.get 20
      i32.and
      local.set 21
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      block ;; label = @9
                        block ;; label = @10
                          local.get 21
                          i32.eqz
                          br_if 0 (;@10;)
                          i32.const 255
                          local.set 22
                          local.get 0
                          local.get 22
                          i32.and
                          local.set 23
                          i32.const 48
                          local.set 24
                          local.get 23
                          local.get 24
                          i32.add
                          local.set 25
                          local.get 25
                          local.get 22
                          i32.and
                          local.set 26
                          local.get 26
                          local.get 25
                          i32.ne
                          local.set 27
                          local.get 25
                          local.set 28
                          local.get 4
                          local.get 28
                          i32.store8 offset=8
                          i32.const 1
                          local.set 29
                          local.get 27
                          local.get 29
                          i32.and
                          local.set 30
                          local.get 4
                          local.get 30
                          i32.store8 offset=9
                          local.get 4
                          i32.load8_u offset=9
                          local.set 31
                          i32.const 0
                          local.set 32
                          i32.const 1
                          local.set 33
                          local.get 31
                          local.get 33
                          i32.and
                          local.set 34
                          i32.const 1
                          local.set 35
                          local.get 32
                          local.get 35
                          i32.and
                          local.set 36
                          local.get 34
                          local.get 36
                          i32.eq
                          local.set 37
                          i32.const 1
                          local.set 38
                          local.get 37
                          local.get 38
                          i32.and
                          local.set 39
                          local.get 39
                          br_if 1 (;@9;)
                          br 2 (;@8;)
                        end
                        i32.const 10
                        local.set 40
                        i32.const 255
                        local.set 41
                        local.get 0
                        local.get 41
                        i32.and
                        local.set 42
                        i32.const 255
                        local.set 43
                        local.get 40
                        local.get 43
                        i32.and
                        local.set 44
                        local.get 42
                        local.get 44
                        i32.ge_u
                        local.set 45
                        i32.const 35
                        local.set 46
                        i32.const 255
                        local.set 47
                        local.get 0
                        local.get 47
                        i32.and
                        local.set 48
                        i32.const 255
                        local.set 49
                        local.get 46
                        local.get 49
                        i32.and
                        local.set 50
                        local.get 48
                        local.get 50
                        i32.le_u
                        local.set 51
                        local.get 45
                        local.get 51
                        i32.and
                        local.set 52
                        i32.const 1
                        local.set 53
                        local.get 52
                        local.get 53
                        i32.and
                        local.set 54
                        local.get 54
                        br_if 3 (;@6;)
                        br 4 (;@5;)
                      end
                      br 1 (;@7;)
                    end
                    i32.const 1048669
                    local.set 55
                    i32.const 16
                    local.set 56
                    i32.const 0
                    local.set 57
                    i32.const 1049952
                    local.set 58
                    local.get 55
                    local.get 56
                    local.get 57
                    local.get 58
                    call $builtin.default_panic
                    unreachable
                  end
                  local.get 4
                  i32.load8_u offset=8
                  local.set 59
                  local.get 4
                  local.get 59
                  i32.store8 offset=7
                  br 5 (;@1;)
                end
                i32.const 1
                local.set 60
                i32.const 1
                local.set 61
                local.get 1
                local.get 61
                i32.and
                local.set 62
                i32.const 1
                local.set 63
                local.get 60
                local.get 63
                i32.and
                local.set 64
                local.get 62
                local.get 64
                i32.eq
                local.set 65
                i32.const 1
                local.set 66
                local.get 65
                local.get 66
                i32.and
                local.set 67
                local.get 67
                br_if 1 (;@4;)
                br 2 (;@3;)
              end
              i32.const 1048829
              local.set 68
              i32.const 24
              local.set 69
              i32.const 0
              local.set 70
              i32.const 1049976
              local.set 71
              local.get 68
              local.get 69
              local.get 70
              local.get 71
              call $builtin.default_panic
              unreachable
            end
            i32.const 65
            local.set 72
            local.get 72
            local.set 73
            br 1 (;@2;)
          end
          i32.const 97
          local.set 74
          local.get 74
          local.set 73
        end
        local.get 73
        local.set 75
        i32.const 255
        local.set 76
        local.get 75
        local.get 76
        i32.and
        local.set 77
        i32.const -10
        local.set 78
        local.get 77
        local.get 78
        i32.add
        local.set 79
        local.get 79
        local.get 76
        i32.and
        local.set 80
        local.get 80
        local.get 79
        i32.ne
        local.set 81
        local.get 79
        drop
        local.get 4
        local.get 79
        i32.store8 offset=16
        i32.const 1
        local.set 82
        local.get 81
        local.get 82
        i32.and
        local.set 83
        local.get 4
        local.get 83
        i32.store8 offset=17
        local.get 4
        i32.load8_u offset=17
        local.set 84
        i32.const 0
        local.set 85
        i32.const 1
        local.set 86
        local.get 84
        local.get 86
        i32.and
        local.set 87
        i32.const 1
        local.set 88
        local.get 85
        local.get 88
        i32.and
        local.set 89
        local.get 87
        local.get 89
        i32.eq
        local.set 90
        i32.const 1
        local.set 91
        local.get 90
        local.get 91
        i32.and
        local.set 92
        block ;; label = @2
          block ;; label = @3
            local.get 92
            i32.eqz
            br_if 0 (;@3;)
            br 1 (;@2;)
          end
          i32.const 1048669
          local.set 93
          i32.const 16
          local.set 94
          i32.const 0
          local.set 95
          i32.const 1049960
          local.set 96
          local.get 93
          local.get 94
          local.get 95
          local.get 96
          call $builtin.default_panic
          unreachable
        end
        local.get 4
        i32.load8_u offset=16
        local.set 97
        i32.const 255
        local.set 98
        local.get 0
        local.get 98
        i32.and
        local.set 99
        local.get 99
        local.get 97
        i32.add
        local.set 100
        local.get 100
        local.get 98
        i32.and
        local.set 101
        local.get 101
        local.get 100
        i32.ne
        local.set 102
        local.get 100
        local.set 103
        local.get 4
        local.get 103
        i32.store8 offset=24
        i32.const 1
        local.set 104
        local.get 102
        local.get 104
        i32.and
        local.set 105
        local.get 4
        local.get 105
        i32.store8 offset=25
        local.get 4
        i32.load8_u offset=25
        local.set 106
        i32.const 0
        local.set 107
        i32.const 1
        local.set 108
        local.get 106
        local.get 108
        i32.and
        local.set 109
        i32.const 1
        local.set 110
        local.get 107
        local.get 110
        i32.and
        local.set 111
        local.get 109
        local.get 111
        i32.eq
        local.set 112
        i32.const 1
        local.set 113
        local.get 112
        local.get 113
        i32.and
        local.set 114
        block ;; label = @2
          block ;; label = @3
            local.get 114
            i32.eqz
            br_if 0 (;@3;)
            br 1 (;@2;)
          end
          i32.const 1048669
          local.set 115
          i32.const 16
          local.set 116
          i32.const 0
          local.set 117
          i32.const 1049968
          local.set 118
          local.get 115
          local.get 116
          local.get 117
          local.get 118
          call $builtin.default_panic
          unreachable
        end
        local.get 4
        i32.load8_u offset=24
        local.set 119
        local.get 4
        local.get 119
        i32.store8 offset=7
      end
      local.get 4
      i32.load8_u offset=7
      local.set 120
      i32.const 32
      local.set 121
      local.get 4
      local.get 121
      i32.add
      local.set 122
      local.get 122
      global.set $__stack_pointer
      local.get 120
      return
    )
    (func $mem.len__anon_2649 (;68;) (type 3) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 2
      i32.const 16
      local.set 3
      local.get 2
      local.get 3
      i32.sub
      local.set 4
      local.get 4
      global.set $__stack_pointer
      local.get 1
      local.set 5
      local.get 0
      drop
      local.get 4
      local.get 1
      i32.store offset=4
      local.get 4
      local.get 0
      i32.store
      local.get 4
      local.get 5
      i32.store offset=12
      local.get 4
      i32.load offset=12
      local.set 6
      i32.const 16
      local.set 7
      local.get 4
      local.get 7
      i32.add
      local.set 8
      local.get 8
      global.set $__stack_pointer
      local.get 6
      return
    )
    (func $#func69<io.fixed_buffer_stream.FixedBufferStream___u8_.write> (@name "io.fixed_buffer_stream.FixedBufferStream([]u8).write") (;69;) (type 4) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i64 i32 i32)
      global.get $__stack_pointer
      local.set 4
      i32.const 80
      local.set 5
      local.get 4
      local.get 5
      i32.sub
      local.set 6
      local.get 6
      global.set $__stack_pointer
      local.get 3
      local.set 7
      local.get 2
      local.set 8
      local.get 6
      local.get 1
      i32.store offset=4
      local.get 6
      local.get 3
      i32.store offset=12
      local.get 6
      local.get 2
      i32.store offset=8
      block ;; label = @1
        local.get 7
        br_if 0 (;@1;)
        i64.const 0
        local.set 9
        local.get 0
        local.get 9
        i64.store align=4
        i32.const 80
        local.set 10
        local.get 6
        local.get 10
        i32.add
        local.set 11
        local.get 11
        global.set $__stack_pointer
        return
      end
      local.get 1
      i32.load offset=8
      local.set 12
      local.get 1
      i32.load offset=4
      local.set 13
      local.get 1
      i32.load
      drop
      local.get 12
      local.set 14
      local.get 13
      local.set 15
      local.get 14
      local.get 15
      i32.ge_u
      local.set 16
      i32.const 1
      local.set 17
      local.get 16
      local.get 17
      i32.and
      local.set 18
      block ;; label = @1
        local.get 18
        i32.eqz
        br_if 0 (;@1;)
        i32.const 0
        local.set 19
        local.get 19
        i64.load offset=1049784 align=4
        local.set 20
        local.get 0
        local.get 20
        i64.store align=4
        i32.const 80
        local.set 21
        local.get 6
        local.get 21
        i32.add
        local.set 22
        local.get 22
        global.set $__stack_pointer
        return
      end
      local.get 1
      i32.load offset=8
      local.set 23
      local.get 23
      local.get 7
      i32.add
      local.set 24
      local.get 24
      local.get 23
      i32.lt_u
      local.set 25
      local.get 6
      local.get 24
      i32.store offset=16
      i32.const 1
      local.set 26
      local.get 25
      local.get 26
      i32.and
      local.set 27
      local.get 6
      local.get 27
      i32.store8 offset=20
      local.get 6
      i32.load8_u offset=20
      local.set 28
      i32.const 0
      local.set 29
      i32.const 1
      local.set 30
      local.get 28
      local.get 30
      i32.and
      local.set 31
      i32.const 1
      local.set 32
      local.get 29
      local.get 32
      i32.and
      local.set 33
      local.get 31
      local.get 33
      i32.eq
      local.set 34
      i32.const 1
      local.set 35
      local.get 34
      local.get 35
      i32.and
      local.set 36
      block ;; label = @1
        block ;; label = @2
          local.get 36
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1048669
        local.set 37
        i32.const 16
        local.set 38
        i32.const 0
        local.set 39
        i32.const 1049792
        local.set 40
        local.get 37
        local.get 38
        local.get 39
        local.get 40
        call $builtin.default_panic
        unreachable
      end
      local.get 6
      i32.load offset=16
      local.set 41
      local.get 1
      i32.load offset=4
      local.set 42
      local.get 1
      i32.load
      drop
      local.get 41
      local.set 43
      local.get 42
      local.set 44
      local.get 43
      local.get 44
      i32.le_u
      local.set 45
      i32.const 1
      local.set 46
      local.get 45
      local.get 46
      i32.and
      local.set 47
      block ;; label = @1
        block ;; label = @2
          local.get 47
          i32.eqz
          br_if 0 (;@2;)
          local.get 7
          local.set 48
          br 1 (;@1;)
        end
        local.get 1
        i32.load offset=4
        local.set 49
        local.get 1
        i32.load
        drop
        local.get 1
        i32.load offset=8
        local.set 50
        local.get 49
        local.get 50
        i32.sub
        local.set 51
        local.get 51
        local.get 49
        i32.gt_u
        local.set 52
        local.get 6
        local.get 51
        i32.store offset=24
        i32.const 1
        local.set 53
        local.get 52
        local.get 53
        i32.and
        local.set 54
        local.get 6
        local.get 54
        i32.store8 offset=28
        local.get 6
        i32.load8_u offset=28
        local.set 55
        i32.const 0
        local.set 56
        i32.const 1
        local.set 57
        local.get 55
        local.get 57
        i32.and
        local.set 58
        i32.const 1
        local.set 59
        local.get 56
        local.get 59
        i32.and
        local.set 60
        local.get 58
        local.get 60
        i32.eq
        local.set 61
        i32.const 1
        local.set 62
        local.get 61
        local.get 62
        i32.and
        local.set 63
        block ;; label = @2
          block ;; label = @3
            local.get 63
            i32.eqz
            br_if 0 (;@3;)
            br 1 (;@2;)
          end
          i32.const 1048669
          local.set 64
          i32.const 16
          local.set 65
          i32.const 0
          local.set 66
          i32.const 1049800
          local.set 67
          local.get 64
          local.get 65
          local.get 66
          local.get 67
          call $builtin.default_panic
          unreachable
        end
        local.get 6
        i32.load offset=24
        local.set 68
        local.get 68
        local.set 48
      end
      local.get 48
      local.set 69
      local.get 6
      local.get 69
      i32.store offset=32
      local.get 6
      local.get 1
      i32.store offset=36
      local.get 6
      i32.load offset=36
      local.set 70
      local.get 1
      i32.load offset=8
      local.set 71
      local.get 1
      i32.load offset=8
      local.set 72
      local.get 72
      local.get 69
      i32.add
      local.set 73
      local.get 73
      local.get 72
      i32.lt_u
      local.set 74
      local.get 6
      local.get 73
      i32.store offset=40
      i32.const 1
      local.set 75
      local.get 74
      local.get 75
      i32.and
      local.set 76
      local.get 6
      local.get 76
      i32.store8 offset=44
      local.get 6
      i32.load8_u offset=44
      local.set 77
      i32.const 0
      local.set 78
      i32.const 1
      local.set 79
      local.get 77
      local.get 79
      i32.and
      local.set 80
      i32.const 1
      local.set 81
      local.get 78
      local.get 81
      i32.and
      local.set 82
      local.get 80
      local.get 82
      i32.eq
      local.set 83
      i32.const 1
      local.set 84
      local.get 83
      local.get 84
      i32.and
      local.set 85
      block ;; label = @1
        block ;; label = @2
          local.get 85
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1048669
        local.set 86
        i32.const 16
        local.set 87
        i32.const 0
        local.set 88
        i32.const 1049808
        local.set 89
        local.get 86
        local.get 87
        local.get 88
        local.get 89
        call $builtin.default_panic
        unreachable
      end
      local.get 6
      i32.load offset=40
      local.set 90
      local.get 70
      i32.load offset=4
      local.set 91
      local.get 70
      i32.load
      local.set 92
      local.get 92
      local.get 71
      i32.add
      local.set 93
      local.get 71
      local.set 94
      local.get 90
      local.set 95
      local.get 94
      local.get 95
      i32.le_u
      local.set 96
      i32.const 1
      local.set 97
      local.get 96
      local.get 97
      i32.and
      local.set 98
      block ;; label = @1
        block ;; label = @2
          local.get 98
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        local.get 71
        local.get 90
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      local.get 90
      local.get 71
      i32.sub
      local.set 99
      local.get 90
      local.set 100
      local.get 91
      local.set 101
      local.get 100
      local.get 101
      i32.le_u
      local.set 102
      i32.const 1
      local.set 103
      local.get 102
      local.get 103
      i32.and
      local.set 104
      block ;; label = @1
        block ;; label = @2
          local.get 104
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        local.get 90
        local.get 91
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 71
      local.set 105
      local.get 90
      local.set 106
      local.get 105
      local.get 106
      i32.le_u
      local.set 107
      i32.const 1
      local.set 108
      local.get 107
      local.get 108
      i32.and
      local.set 109
      block ;; label = @1
        block ;; label = @2
          local.get 109
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        local.get 71
        local.get 90
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 99
      local.set 110
      local.get 93
      local.set 111
      local.get 6
      local.get 8
      i32.store offset=48
      local.get 6
      local.get 7
      i32.store offset=52
      local.get 6
      i32.load offset=52
      local.set 112
      local.get 6
      i32.load offset=48
      local.set 113
      i32.const 0
      local.set 114
      local.get 114
      local.set 115
      local.get 69
      local.set 116
      local.get 115
      local.get 116
      i32.le_u
      local.set 117
      i32.const 1
      local.set 118
      local.get 117
      local.get 118
      i32.and
      local.set 119
      block ;; label = @1
        block ;; label = @2
          local.get 119
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 120
        local.get 120
        local.get 69
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      local.get 69
      local.set 121
      local.get 112
      local.set 122
      local.get 121
      local.get 122
      i32.le_u
      local.set 123
      i32.const 1
      local.set 124
      local.get 123
      local.get 124
      i32.and
      local.set 125
      block ;; label = @1
        block ;; label = @2
          local.get 125
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        local.get 69
        local.get 112
        call $builtin.panicOutOfBounds
        unreachable
      end
      i32.const 0
      local.set 126
      local.get 126
      local.set 127
      local.get 69
      local.set 128
      local.get 127
      local.get 128
      i32.le_u
      local.set 129
      i32.const 1
      local.set 130
      local.get 129
      local.get 130
      i32.and
      local.set 131
      block ;; label = @1
        block ;; label = @2
          local.get 131
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 132
        local.get 132
        local.get 69
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 69
      local.set 133
      local.get 113
      local.set 134
      local.get 111
      local.get 110
      local.get 134
      local.get 133
      call $mem.copy__anon_2464
      local.get 6
      local.get 1
      i32.store offset=60
      local.get 6
      i32.load offset=60
      local.set 135
      i32.const 8
      local.set 136
      local.get 135
      local.get 136
      i32.add
      local.set 137
      local.get 135
      i32.load offset=8
      local.set 138
      local.get 138
      local.get 69
      i32.add
      local.set 139
      local.get 139
      local.get 138
      i32.lt_u
      local.set 140
      local.get 6
      local.get 139
      i32.store offset=64
      i32.const 1
      local.set 141
      local.get 140
      local.get 141
      i32.and
      local.set 142
      local.get 6
      local.get 142
      i32.store8 offset=68
      local.get 6
      i32.load8_u offset=68
      local.set 143
      i32.const 0
      local.set 144
      i32.const 1
      local.set 145
      local.get 143
      local.get 145
      i32.and
      local.set 146
      i32.const 1
      local.set 147
      local.get 144
      local.get 147
      i32.and
      local.set 148
      local.get 146
      local.get 148
      i32.eq
      local.set 149
      i32.const 1
      local.set 150
      local.get 149
      local.get 150
      i32.and
      local.set 151
      block ;; label = @1
        block ;; label = @2
          local.get 151
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 1048669
        local.set 152
        i32.const 16
        local.set 153
        i32.const 0
        local.set 154
        i32.const 1049816
        local.set 155
        local.get 152
        local.get 153
        local.get 154
        local.get 155
        call $builtin.default_panic
        unreachable
      end
      local.get 6
      i32.load offset=64
      local.set 156
      local.get 137
      local.get 156
      i32.store
      block ;; label = @1
        local.get 69
        br_if 0 (;@1;)
        i32.const 0
        local.set 157
        local.get 157
        i64.load offset=1049824 align=4
        local.set 158
        local.get 0
        local.get 158
        i64.store align=4
        i32.const 80
        local.set 159
        local.get 6
        local.get 159
        i32.add
        local.set 160
        local.get 160
        global.set $__stack_pointer
        return
      end
      i32.const 0
      local.set 161
      local.get 6
      local.get 161
      i32.store16 offset=76
      local.get 6
      local.get 69
      i32.store offset=72
      local.get 6
      i64.load offset=72
      local.set 162
      local.get 0
      local.get 162
      i64.store align=4
      i32.const 80
      local.set 163
      local.get 6
      local.get 163
      i32.add
      local.set 164
      local.get 164
      global.set $__stack_pointer
      return
    )
    (func $fmt.formatIntValue__anon_2628 (;70;) (type 9) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 16
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 5
      local.get 0
      i32.store offset=4
      local.get 5
      local.get 0
      i32.store offset=8
      i32.const 10
      local.set 6
      i32.const 0
      local.set 7
      local.get 0
      local.get 6
      local.get 7
      local.get 1
      local.get 2
      call $fmt.formatInt__anon_2631
      local.set 8
      local.get 5
      local.get 8
      i32.store16 offset=14
      local.get 5
      i32.load16_u offset=14
      local.set 9
      i32.const 16
      local.set 10
      local.get 5
      local.get 10
      i32.add
      local.set 11
      local.get 11
      global.set $__stack_pointer
      local.get 9
      return
    )
    (func $fmt.formatInt__anon_2631 (;71;) (type 8) (param i32 i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 5
      i32.const 160
      local.set 6
      local.get 5
      local.get 6
      i32.sub
      local.set 7
      local.get 7
      global.set $__stack_pointer
      local.get 7
      local.get 0
      i32.store offset=4
      local.get 7
      local.get 1
      i32.store8 offset=10
      i32.const 1
      local.set 8
      local.get 2
      local.get 8
      i32.and
      local.set 9
      local.get 7
      local.get 9
      i32.store8 offset=11
      i32.const 2
      local.set 10
      i32.const 255
      local.set 11
      local.get 1
      local.get 11
      i32.and
      local.set 12
      i32.const 255
      local.set 13
      local.get 10
      local.get 13
      i32.and
      local.set 14
      local.get 12
      local.get 14
      i32.ge_u
      local.set 15
      local.get 15
      call $debug.assert
      local.get 7
      local.get 0
      i32.store offset=12
      i32.const 32
      local.set 16
      local.get 7
      local.get 16
      i32.store16 offset=18
      local.get 0
      call $math.absCast__anon_2633
      local.set 17
      local.get 7
      local.get 17
      i32.store offset=20
      i32.const 56
      local.set 18
      local.get 7
      local.get 18
      i32.add
      local.set 19
      i32.const -86
      local.set 20
      local.get 19
      local.get 20
      i32.store8
      i32.const 48
      local.set 21
      local.get 7
      local.get 21
      i32.add
      local.set 22
      i64.const -6148914691236517206
      local.set 23
      local.get 22
      local.get 23
      i64.store
      i32.const 40
      local.set 24
      local.get 7
      local.get 24
      i32.add
      local.set 25
      local.get 25
      local.get 23
      i64.store
      i32.const 32
      local.set 26
      local.get 7
      local.get 26
      i32.add
      local.set 27
      local.get 27
      local.get 23
      i64.store
      local.get 7
      local.get 23
      i64.store offset=24
      local.get 7
      local.get 17
      i32.store offset=64
      i32.const 33
      local.set 28
      local.get 7
      local.get 28
      i32.store offset=68
      i32.const 10
      local.set 29
      i32.const 255
      local.set 30
      local.get 1
      local.get 30
      i32.and
      local.set 31
      i32.const 255
      local.set 32
      local.get 29
      local.get 32
      i32.and
      local.set 33
      local.get 31
      local.get 33
      i32.eq
      local.set 34
      i32.const 1
      local.set 35
      local.get 34
      local.get 35
      i32.and
      local.set 36
      block ;; label = @1
        block ;; label = @2
          local.get 36
          i32.eqz
          br_if 0 (;@2;)
          call $fmt.isComptime
          local.set 37
          i32.const -1
          local.set 38
          local.get 37
          local.get 38
          i32.xor
          local.set 39
          local.get 39
          local.set 40
          br 1 (;@1;)
        end
        i32.const 0
        local.set 41
        local.get 41
        local.set 40
      end
      local.get 40
      local.set 42
      i32.const 1
      local.set 43
      local.get 42
      local.get 43
      i32.and
      local.set 44
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 44
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            br 1 (;@2;)
          end
          block ;; label = @3
            loop ;; label = @4
              local.get 7
              i32.load offset=64
              local.set 45
              i32.const 100
              local.set 46
              local.get 45
              local.set 47
              local.get 46
              local.set 48
              local.get 47
              local.get 48
              i32.ge_u
              local.set 49
              i32.const 1
              local.set 50
              local.get 49
              local.get 50
              i32.and
              local.set 51
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      local.get 51
                      i32.eqz
                      br_if 0 (;@8;)
                      local.get 7
                      i32.load offset=68
                      local.set 52
                      i32.const -2
                      local.set 53
                      local.get 52
                      local.get 53
                      i32.add
                      local.set 54
                      local.get 54
                      local.get 52
                      i32.gt_u
                      local.set 55
                      local.get 7
                      local.get 54
                      i32.store offset=72
                      i32.const 1
                      local.set 56
                      local.get 55
                      local.get 56
                      i32.and
                      local.set 57
                      local.get 7
                      local.get 57
                      i32.store8 offset=76
                      local.get 7
                      i32.load8_u offset=76
                      local.set 58
                      i32.const 0
                      local.set 59
                      i32.const 1
                      local.set 60
                      local.get 58
                      local.get 60
                      i32.and
                      local.set 61
                      i32.const 1
                      local.set 62
                      local.get 59
                      local.get 62
                      i32.and
                      local.set 63
                      local.get 61
                      local.get 63
                      i32.eq
                      local.set 64
                      i32.const 1
                      local.set 65
                      local.get 64
                      local.get 65
                      i32.and
                      local.set 66
                      local.get 66
                      br_if 1 (;@7;)
                      br 2 (;@6;)
                    end
                    br 4 (;@3;)
                  end
                  br 1 (;@5;)
                end
                i32.const 1048669
                local.set 67
                i32.const 16
                local.set 68
                i32.const 0
                local.set 69
                i32.const 1049840
                local.set 70
                local.get 67
                local.get 68
                local.get 69
                local.get 70
                call $builtin.default_panic
                unreachable
              end
              local.get 7
              i32.load offset=72
              local.set 71
              local.get 7
              local.get 71
              i32.store offset=68
              local.get 7
              i32.load offset=68
              local.set 72
              i32.const 24
              local.set 73
              local.get 7
              local.get 73
              i32.add
              local.set 74
              local.get 74
              local.set 75
              local.get 75
              local.get 72
              i32.add
              local.set 76
              i32.const 33
              local.set 77
              local.get 72
              local.set 78
              local.get 77
              local.set 79
              local.get 78
              local.get 79
              i32.le_u
              local.set 80
              i32.const 1
              local.set 81
              local.get 80
              local.get 81
              i32.and
              local.set 82
              block ;; label = @5
                block ;; label = @6
                  local.get 82
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                i32.const 33
                local.set 83
                local.get 72
                local.get 83
                call $builtin.panicStartGreaterThanEnd
                unreachable
              end
              i32.const 33
              local.set 84
              local.get 84
              local.get 72
              i32.sub
              local.set 85
              i32.const 1
              local.set 86
              i32.const 1
              local.set 87
              local.get 86
              local.get 87
              i32.and
              local.set 88
              block ;; label = @5
                block ;; label = @6
                  local.get 88
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                i32.const 33
                local.set 89
                local.get 89
                local.get 89
                call $builtin.panicOutOfBounds
                unreachable
              end
              i32.const 33
              local.set 90
              local.get 72
              local.set 91
              local.get 90
              local.set 92
              local.get 91
              local.get 92
              i32.le_u
              local.set 93
              i32.const 1
              local.set 94
              local.get 93
              local.get 94
              i32.and
              local.set 95
              block ;; label = @5
                block ;; label = @6
                  local.get 95
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                i32.const 33
                local.set 96
                local.get 72
                local.get 96
                call $builtin.panicOutOfBounds
                unreachable
              end
              local.get 7
              local.get 85
              i32.store offset=84
              local.get 7
              local.get 76
              i32.store offset=80
              local.get 7
              i32.load offset=84
              local.set 97
              local.get 7
              i32.load offset=80
              local.set 98
              i32.const 1
              local.set 99
              i32.const 1
              local.set 100
              local.get 99
              local.get 100
              i32.and
              local.set 101
              block ;; label = @5
                block ;; label = @6
                  local.get 101
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                i32.const 0
                local.set 102
                i32.const 2
                local.set 103
                local.get 102
                local.get 103
                call $builtin.panicStartGreaterThanEnd
                unreachable
              end
              i32.const 2
              local.set 104
              local.get 104
              local.set 105
              local.get 97
              local.set 106
              local.get 105
              local.get 106
              i32.le_u
              local.set 107
              i32.const 1
              local.set 108
              local.get 107
              local.get 108
              i32.and
              local.set 109
              block ;; label = @5
                block ;; label = @6
                  local.get 109
                  i32.eqz
                  br_if 0 (;@6;)
                  br 1 (;@5;)
                end
                i32.const 2
                local.set 110
                local.get 110
                local.get 97
                call $builtin.panicOutOfBounds
                unreachable
              end
              local.get 7
              i32.load offset=64
              local.set 111
              i32.const 100
              local.set 112
              local.get 111
              local.get 112
              i32.rem_u
              local.set 113
              i32.const 94
              local.set 114
              local.get 7
              local.get 114
              i32.add
              local.set 115
              local.get 115
              local.set 116
              local.get 116
              local.get 113
              call $fmt.digits2
              local.get 7
              i32.load16_u offset=94 align=1
              local.set 117
              local.get 98
              local.get 117
              i32.store16 align=1
              local.get 7
              i32.load offset=64
              local.set 118
              i32.const 100
              local.set 119
              local.get 118
              local.get 119
              i32.div_u
              local.set 120
              local.get 7
              local.get 120
              i32.store offset=64
              br 0 (;@4;)
            end
          end
          local.get 7
          i32.load offset=64
          local.set 121
          i32.const 10
          local.set 122
          local.get 121
          local.set 123
          local.get 122
          local.set 124
          local.get 123
          local.get 124
          i32.lt_u
          local.set 125
          i32.const 1
          local.set 126
          local.get 125
          local.get 126
          i32.and
          local.set 127
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      block ;; label = @9
                        block ;; label = @10
                          local.get 127
                          i32.eqz
                          br_if 0 (;@10;)
                          local.get 7
                          i32.load offset=68
                          local.set 128
                          i32.const -1
                          local.set 129
                          local.get 128
                          local.get 129
                          i32.add
                          local.set 130
                          local.get 130
                          local.get 128
                          i32.gt_u
                          local.set 131
                          local.get 7
                          local.get 130
                          i32.store offset=96
                          i32.const 1
                          local.set 132
                          local.get 131
                          local.get 132
                          i32.and
                          local.set 133
                          local.get 7
                          local.get 133
                          i32.store8 offset=100
                          local.get 7
                          i32.load8_u offset=100
                          local.set 134
                          i32.const 0
                          local.set 135
                          i32.const 1
                          local.set 136
                          local.get 134
                          local.get 136
                          i32.and
                          local.set 137
                          i32.const 1
                          local.set 138
                          local.get 135
                          local.get 138
                          i32.and
                          local.set 139
                          local.get 137
                          local.get 139
                          i32.eq
                          local.set 140
                          i32.const 1
                          local.set 141
                          local.get 140
                          local.get 141
                          i32.and
                          local.set 142
                          local.get 142
                          br_if 1 (;@9;)
                          br 2 (;@8;)
                        end
                        local.get 7
                        i32.load offset=68
                        local.set 143
                        i32.const -2
                        local.set 144
                        local.get 143
                        local.get 144
                        i32.add
                        local.set 145
                        local.get 145
                        local.get 143
                        i32.gt_u
                        local.set 146
                        local.get 7
                        local.get 145
                        i32.store offset=112
                        i32.const 1
                        local.set 147
                        local.get 146
                        local.get 147
                        i32.and
                        local.set 148
                        local.get 7
                        local.get 148
                        i32.store8 offset=116
                        local.get 7
                        i32.load8_u offset=116
                        local.set 149
                        i32.const 0
                        local.set 150
                        i32.const 1
                        local.set 151
                        local.get 149
                        local.get 151
                        i32.and
                        local.set 152
                        i32.const 1
                        local.set 153
                        local.get 150
                        local.get 153
                        i32.and
                        local.set 154
                        local.get 152
                        local.get 154
                        i32.eq
                        local.set 155
                        i32.const 1
                        local.set 156
                        local.get 155
                        local.get 156
                        i32.and
                        local.set 157
                        local.get 157
                        br_if 3 (;@6;)
                        br 4 (;@5;)
                      end
                      br 1 (;@7;)
                    end
                    i32.const 1048669
                    local.set 158
                    i32.const 16
                    local.set 159
                    i32.const 0
                    local.set 160
                    i32.const 1049848
                    local.set 161
                    local.get 158
                    local.get 159
                    local.get 160
                    local.get 161
                    call $builtin.default_panic
                    unreachable
                  end
                  local.get 7
                  i32.load offset=96
                  local.set 162
                  local.get 7
                  local.get 162
                  i32.store offset=68
                  local.get 7
                  i32.load offset=68
                  local.set 163
                  i32.const 33
                  local.set 164
                  local.get 163
                  local.set 165
                  local.get 164
                  local.set 166
                  local.get 165
                  local.get 166
                  i32.lt_u
                  local.set 167
                  i32.const 1
                  local.set 168
                  local.get 167
                  local.get 168
                  i32.and
                  local.set 169
                  block ;; label = @7
                    block ;; label = @8
                      local.get 169
                      i32.eqz
                      br_if 0 (;@8;)
                      br 1 (;@7;)
                    end
                    i32.const 33
                    local.set 170
                    local.get 163
                    local.get 170
                    call $builtin.panicOutOfBounds
                    unreachable
                  end
                  i32.const 24
                  local.set 171
                  local.get 7
                  local.get 171
                  i32.add
                  local.set 172
                  local.get 172
                  local.set 173
                  local.get 173
                  local.get 163
                  i32.add
                  local.set 174
                  local.get 7
                  i32.load offset=64
                  local.set 175
                  i32.const 255
                  local.set 176
                  local.get 176
                  local.get 175
                  i32.sub
                  local.set 177
                  i32.const 255
                  local.set 178
                  local.get 177
                  local.set 179
                  local.get 178
                  local.set 180
                  local.get 179
                  local.get 180
                  i32.le_u
                  local.set 181
                  i32.const 1
                  local.set 182
                  local.get 181
                  local.get 182
                  i32.and
                  local.set 183
                  block ;; label = @7
                    block ;; label = @8
                      local.get 183
                      i32.eqz
                      br_if 0 (;@8;)
                      br 1 (;@7;)
                    end
                    i32.const 1048686
                    local.set 184
                    i32.const 27
                    local.set 185
                    i32.const 0
                    local.set 186
                    i32.const 1049856
                    local.set 187
                    local.get 184
                    local.get 185
                    local.get 186
                    local.get 187
                    call $builtin.default_panic
                    unreachable
                  end
                  i32.const 255
                  local.set 188
                  local.get 175
                  local.get 188
                  i32.and
                  local.set 189
                  i32.const 48
                  local.set 190
                  local.get 189
                  local.get 190
                  i32.add
                  local.set 191
                  local.get 191
                  local.get 188
                  i32.and
                  local.set 192
                  local.get 192
                  local.get 191
                  i32.ne
                  local.set 193
                  local.get 191
                  local.set 194
                  local.get 7
                  local.get 194
                  i32.store8 offset=104
                  i32.const 1
                  local.set 195
                  local.get 193
                  local.get 195
                  i32.and
                  local.set 196
                  local.get 7
                  local.get 196
                  i32.store8 offset=105
                  local.get 7
                  i32.load8_u offset=105
                  local.set 197
                  i32.const 0
                  local.set 198
                  i32.const 1
                  local.set 199
                  local.get 197
                  local.get 199
                  i32.and
                  local.set 200
                  i32.const 1
                  local.set 201
                  local.get 198
                  local.get 201
                  i32.and
                  local.set 202
                  local.get 200
                  local.get 202
                  i32.eq
                  local.set 203
                  i32.const 1
                  local.set 204
                  local.get 203
                  local.get 204
                  i32.and
                  local.set 205
                  block ;; label = @7
                    block ;; label = @8
                      local.get 205
                      i32.eqz
                      br_if 0 (;@8;)
                      br 1 (;@7;)
                    end
                    i32.const 1048669
                    local.set 206
                    i32.const 16
                    local.set 207
                    i32.const 0
                    local.set 208
                    i32.const 1049864
                    local.set 209
                    local.get 206
                    local.get 207
                    local.get 208
                    local.get 209
                    call $builtin.default_panic
                    unreachable
                  end
                  local.get 7
                  i32.load8_u offset=104
                  local.set 210
                  local.get 174
                  local.get 210
                  i32.store8
                  br 3 (;@3;)
                end
                br 1 (;@4;)
              end
              i32.const 1048669
              local.set 211
              i32.const 16
              local.set 212
              i32.const 0
              local.set 213
              i32.const 1049872
              local.set 214
              local.get 211
              local.get 212
              local.get 213
              local.get 214
              call $builtin.default_panic
              unreachable
            end
            local.get 7
            i32.load offset=112
            local.set 215
            local.get 7
            local.get 215
            i32.store offset=68
            local.get 7
            i32.load offset=68
            local.set 216
            i32.const 24
            local.set 217
            local.get 7
            local.get 217
            i32.add
            local.set 218
            local.get 218
            local.set 219
            local.get 219
            local.get 216
            i32.add
            local.set 220
            i32.const 33
            local.set 221
            local.get 216
            local.set 222
            local.get 221
            local.set 223
            local.get 222
            local.get 223
            i32.le_u
            local.set 224
            i32.const 1
            local.set 225
            local.get 224
            local.get 225
            i32.and
            local.set 226
            block ;; label = @4
              block ;; label = @5
                local.get 226
                i32.eqz
                br_if 0 (;@5;)
                br 1 (;@4;)
              end
              i32.const 33
              local.set 227
              local.get 216
              local.get 227
              call $builtin.panicStartGreaterThanEnd
              unreachable
            end
            i32.const 33
            local.set 228
            local.get 228
            local.get 216
            i32.sub
            local.set 229
            i32.const 1
            local.set 230
            i32.const 1
            local.set 231
            local.get 230
            local.get 231
            i32.and
            local.set 232
            block ;; label = @4
              block ;; label = @5
                local.get 232
                i32.eqz
                br_if 0 (;@5;)
                br 1 (;@4;)
              end
              i32.const 33
              local.set 233
              local.get 233
              local.get 233
              call $builtin.panicOutOfBounds
              unreachable
            end
            i32.const 33
            local.set 234
            local.get 216
            local.set 235
            local.get 234
            local.set 236
            local.get 235
            local.get 236
            i32.le_u
            local.set 237
            i32.const 1
            local.set 238
            local.get 237
            local.get 238
            i32.and
            local.set 239
            block ;; label = @4
              block ;; label = @5
                local.get 239
                i32.eqz
                br_if 0 (;@5;)
                br 1 (;@4;)
              end
              i32.const 33
              local.set 240
              local.get 216
              local.get 240
              call $builtin.panicOutOfBounds
              unreachable
            end
            local.get 7
            local.get 229
            i32.store offset=124
            local.get 7
            local.get 220
            i32.store offset=120
            local.get 7
            i32.load offset=124
            local.set 241
            local.get 7
            i32.load offset=120
            local.set 242
            i32.const 1
            local.set 243
            i32.const 1
            local.set 244
            local.get 243
            local.get 244
            i32.and
            local.set 245
            block ;; label = @4
              block ;; label = @5
                local.get 245
                i32.eqz
                br_if 0 (;@5;)
                br 1 (;@4;)
              end
              i32.const 0
              local.set 246
              i32.const 2
              local.set 247
              local.get 246
              local.get 247
              call $builtin.panicStartGreaterThanEnd
              unreachable
            end
            i32.const 2
            local.set 248
            local.get 248
            local.set 249
            local.get 241
            local.set 250
            local.get 249
            local.get 250
            i32.le_u
            local.set 251
            i32.const 1
            local.set 252
            local.get 251
            local.get 252
            i32.and
            local.set 253
            block ;; label = @4
              block ;; label = @5
                local.get 253
                i32.eqz
                br_if 0 (;@5;)
                br 1 (;@4;)
              end
              i32.const 2
              local.set 254
              local.get 254
              local.get 241
              call $builtin.panicOutOfBounds
              unreachable
            end
            local.get 7
            i32.load offset=64
            local.set 255
            i32.const 130
            local.set 256
            local.get 7
            local.get 256
            i32.add
            local.set 257
            local.get 257
            local.set 258
            local.get 258
            local.get 255
            call $fmt.digits2
            local.get 7
            i32.load16_u offset=130 align=1
            local.set 259
            local.get 242
            local.get 259
            i32.store16 align=1
          end
          br 1 (;@1;)
        end
        loop ;; label = @2
          local.get 7
          i32.load offset=64
          local.set 260
          i32.const 255
          local.set 261
          local.get 1
          local.get 261
          i32.and
          local.set 262
          block ;; label = @3
            block ;; label = @4
              local.get 262
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 1048714
            local.set 263
            i32.const 16
            local.set 264
            i32.const 0
            local.set 265
            i32.const 1049880
            local.set 266
            local.get 263
            local.get 264
            local.get 265
            local.get 266
            call $builtin.default_panic
            unreachable
          end
          local.get 260
          local.get 262
          i32.rem_u
          local.set 267
          local.get 7
          local.get 267
          i32.store offset=132
          local.get 7
          i32.load offset=68
          local.set 268
          i32.const -1
          local.set 269
          local.get 268
          local.get 269
          i32.add
          local.set 270
          local.get 270
          local.get 268
          i32.gt_u
          local.set 271
          local.get 7
          local.get 270
          i32.store offset=136
          i32.const 1
          local.set 272
          local.get 271
          local.get 272
          i32.and
          local.set 273
          local.get 7
          local.get 273
          i32.store8 offset=140
          local.get 7
          i32.load8_u offset=140
          local.set 274
          i32.const 0
          local.set 275
          i32.const 1
          local.set 276
          local.get 274
          local.get 276
          i32.and
          local.set 277
          i32.const 1
          local.set 278
          local.get 275
          local.get 278
          i32.and
          local.set 279
          local.get 277
          local.get 279
          i32.eq
          local.set 280
          i32.const 1
          local.set 281
          local.get 280
          local.get 281
          i32.and
          local.set 282
          block ;; label = @3
            block ;; label = @4
              local.get 282
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 1048669
            local.set 283
            i32.const 16
            local.set 284
            i32.const 0
            local.set 285
            i32.const 1049888
            local.set 286
            local.get 283
            local.get 284
            local.get 285
            local.get 286
            call $builtin.default_panic
            unreachable
          end
          local.get 7
          i32.load offset=136
          local.set 287
          local.get 7
          local.get 287
          i32.store offset=68
          local.get 7
          i32.load offset=68
          local.set 288
          i32.const 33
          local.set 289
          local.get 288
          local.set 290
          local.get 289
          local.set 291
          local.get 290
          local.get 291
          i32.lt_u
          local.set 292
          i32.const 1
          local.set 293
          local.get 292
          local.get 293
          i32.and
          local.set 294
          block ;; label = @3
            block ;; label = @4
              local.get 294
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 33
            local.set 295
            local.get 288
            local.get 295
            call $builtin.panicOutOfBounds
            unreachable
          end
          i32.const 24
          local.set 296
          local.get 7
          local.get 296
          i32.add
          local.set 297
          local.get 297
          local.set 298
          local.get 298
          local.get 288
          i32.add
          local.set 299
          i32.const 255
          local.set 300
          local.get 300
          local.get 267
          i32.sub
          local.set 301
          i32.const 255
          local.set 302
          local.get 301
          local.set 303
          local.get 302
          local.set 304
          local.get 303
          local.get 304
          i32.le_u
          local.set 305
          i32.const 1
          local.set 306
          local.get 305
          local.get 306
          i32.and
          local.set 307
          block ;; label = @3
            block ;; label = @4
              local.get 307
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 1048686
            local.set 308
            i32.const 27
            local.set 309
            i32.const 0
            local.set 310
            i32.const 1049896
            local.set 311
            local.get 308
            local.get 309
            local.get 310
            local.get 311
            call $builtin.default_panic
            unreachable
          end
          local.get 267
          local.get 2
          call $fmt.digitToChar
          local.set 312
          local.get 299
          local.get 312
          i32.store8
          local.get 7
          i32.load offset=64
          local.set 313
          i32.const 255
          local.set 314
          local.get 1
          local.get 314
          i32.and
          local.set 315
          block ;; label = @3
            block ;; label = @4
              local.get 315
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 1048714
            local.set 316
            i32.const 16
            local.set 317
            i32.const 0
            local.set 318
            i32.const 1049904
            local.set 319
            local.get 316
            local.get 317
            local.get 318
            local.get 319
            call $builtin.default_panic
            unreachable
          end
          local.get 313
          local.get 315
          i32.div_u
          local.set 320
          local.get 7
          local.get 320
          i32.store offset=64
          local.get 7
          i32.load offset=64
          local.set 321
          block ;; label = @3
            block ;; label = @4
              local.get 321
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            br 1 (;@2;)
          end
        end
      end
      local.get 7
      i32.load offset=68
      local.set 322
      i32.const 24
      local.set 323
      local.get 7
      local.get 323
      i32.add
      local.set 324
      local.get 324
      local.set 325
      local.get 325
      local.get 322
      i32.add
      local.set 326
      i32.const 33
      local.set 327
      local.get 322
      local.set 328
      local.get 327
      local.set 329
      local.get 328
      local.get 329
      i32.le_u
      local.set 330
      i32.const 1
      local.set 331
      local.get 330
      local.get 331
      i32.and
      local.set 332
      block ;; label = @1
        block ;; label = @2
          local.get 332
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 33
        local.set 333
        local.get 322
        local.get 333
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      i32.const 33
      local.set 334
      local.get 334
      local.get 322
      i32.sub
      local.set 335
      i32.const 1
      local.set 336
      i32.const 1
      local.set 337
      local.get 336
      local.get 337
      i32.and
      local.set 338
      block ;; label = @1
        block ;; label = @2
          local.get 338
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 33
        local.set 339
        local.get 339
        local.get 339
        call $builtin.panicOutOfBounds
        unreachable
      end
      i32.const 33
      local.set 340
      local.get 322
      local.set 341
      local.get 340
      local.set 342
      local.get 341
      local.get 342
      i32.le_u
      local.set 343
      i32.const 1
      local.set 344
      local.get 343
      local.get 344
      i32.and
      local.set 345
      block ;; label = @1
        block ;; label = @2
          local.get 345
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 33
        local.set 346
        local.get 322
        local.get 346
        call $builtin.panicOutOfBounds
        unreachable
      end
      local.get 7
      local.get 335
      i32.store offset=156
      local.get 7
      local.get 326
      i32.store offset=152
      local.get 7
      i32.load offset=156
      local.set 347
      local.get 7
      i32.load offset=152
      local.set 348
      local.get 348
      local.get 347
      local.get 3
      local.get 4
      call $fmt.formatBuf__anon_2635
      local.set 349
      local.get 7
      local.get 349
      i32.store16 offset=150
      local.get 7
      i32.load16_u offset=150
      local.set 350
      i32.const 160
      local.set 351
      local.get 7
      local.get 351
      i32.add
      local.set 352
      local.get 352
      global.set $__stack_pointer
      local.get 350
      return
    )
    (func $math.absCast__anon_2633 (;72;) (type 7) (param i32) (result i32)
      (local i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      i32.const 16
      local.set 2
      local.get 1
      local.get 2
      i32.sub
      local.set 3
      local.get 3
      global.set $__stack_pointer
      local.get 3
      local.get 0
      i32.store offset=12
      i32.const 16
      local.set 4
      local.get 3
      local.get 4
      i32.add
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 0
      return
    )
    (func $fmt.formatBuf__anon_2635 (;73;) (type 1) (param i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 4
      i32.const 144
      local.set 5
      local.get 4
      local.get 5
      i32.sub
      local.set 6
      local.get 6
      global.set $__stack_pointer
      local.get 1
      local.set 7
      local.get 0
      local.set 8
      local.get 6
      local.get 1
      i32.store offset=4
      local.get 6
      local.get 0
      i32.store
      i32.const 8
      local.set 9
      local.get 2
      local.get 9
      i32.add
      local.set 10
      local.get 10
      i64.load align=4
      local.set 11
      local.get 6
      local.get 11
      i64.store offset=8
      local.get 6
      i32.load8_u offset=12
      local.set 12
      i32.const 0
      local.set 13
      i32.const 255
      local.set 14
      local.get 12
      local.get 14
      i32.and
      local.set 15
      i32.const 255
      local.set 16
      local.get 13
      local.get 16
      i32.and
      local.set 17
      local.get 15
      local.get 17
      i32.ne
      local.set 18
      i32.const 1
      local.set 19
      local.get 18
      local.get 19
      i32.and
      local.set 20
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    local.get 20
                    i32.eqz
                    br_if 0 (;@7;)
                    local.get 6
                    i32.load offset=8
                    local.set 21
                    local.get 6
                    local.get 21
                    i32.store offset=20
                    i32.const 24
                    local.set 22
                    local.get 6
                    local.get 22
                    i32.add
                    local.set 23
                    local.get 23
                    local.set 24
                    local.get 24
                    local.get 8
                    local.get 7
                    call $unicode.utf8CountCodepoints
                    local.get 6
                    i32.load16_u offset=28
                    local.set 25
                    i32.const 0
                    local.set 26
                    i32.const 65535
                    local.set 27
                    local.get 25
                    local.get 27
                    i32.and
                    local.set 28
                    i32.const 65535
                    local.set 29
                    local.get 26
                    local.get 29
                    i32.and
                    local.set 30
                    local.get 28
                    local.get 30
                    i32.eq
                    local.set 31
                    i32.const 1
                    local.set 32
                    local.get 31
                    local.get 32
                    i32.and
                    local.set 33
                    local.get 33
                    br_if 1 (;@6;)
                    br 2 (;@5;)
                  end
                  local.get 3
                  i32.load
                  local.set 34
                  local.get 6
                  local.get 34
                  i32.store offset=136
                  i32.const 136
                  local.set 35
                  local.get 6
                  local.get 35
                  i32.add
                  local.set 36
                  local.get 36
                  local.set 37
                  local.get 37
                  local.get 8
                  local.get 7
                  call $#func57<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeAll>
                  local.set 38
                  i32.const 0
                  local.set 39
                  i32.const 65535
                  local.set 40
                  local.get 38
                  local.get 40
                  i32.and
                  local.set 41
                  i32.const 65535
                  local.set 42
                  local.get 39
                  local.get 42
                  i32.and
                  local.set 43
                  local.get 41
                  local.get 43
                  i32.ne
                  local.set 44
                  i32.const 1
                  local.set 45
                  local.get 44
                  local.get 45
                  i32.and
                  local.set 46
                  local.get 46
                  br_if 3 (;@3;)
                  br 4 (;@2;)
                end
                local.get 6
                i32.load offset=24
                local.set 47
                local.get 47
                local.set 48
                br 1 (;@4;)
              end
              local.get 7
              local.set 48
            end
            local.get 48
            local.set 49
            local.get 6
            local.get 49
            i32.store offset=36
            local.get 49
            local.set 50
            local.get 21
            local.set 51
            local.get 50
            local.get 51
            i32.lt_u
            local.set 52
            i32.const 1
            local.set 53
            local.get 52
            local.get 53
            i32.and
            local.set 54
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      local.get 54
                      i32.eqz
                      br_if 0 (;@8;)
                      local.get 21
                      local.get 49
                      i32.sub
                      local.set 55
                      local.get 55
                      local.get 21
                      i32.gt_u
                      local.set 56
                      local.get 6
                      local.get 55
                      i32.store offset=40
                      i32.const 1
                      local.set 57
                      local.get 56
                      local.get 57
                      i32.and
                      local.set 58
                      local.get 6
                      local.get 58
                      i32.store8 offset=44
                      local.get 6
                      i32.load8_u offset=44
                      local.set 59
                      i32.const 0
                      local.set 60
                      i32.const 1
                      local.set 61
                      local.get 59
                      local.get 61
                      i32.and
                      local.set 62
                      i32.const 1
                      local.set 63
                      local.get 60
                      local.get 63
                      i32.and
                      local.set 64
                      local.get 62
                      local.get 64
                      i32.eq
                      local.set 65
                      i32.const 1
                      local.set 66
                      local.get 65
                      local.get 66
                      i32.and
                      local.set 67
                      local.get 67
                      br_if 1 (;@7;)
                      br 2 (;@6;)
                    end
                    i32.const 0
                    local.set 68
                    local.get 68
                    local.set 69
                    br 3 (;@4;)
                  end
                  br 1 (;@5;)
                end
                i32.const 1048669
                local.set 70
                i32.const 16
                local.set 71
                i32.const 0
                local.set 72
                i32.const 1049912
                local.set 73
                local.get 70
                local.get 71
                local.get 72
                local.get 73
                call $builtin.default_panic
                unreachable
              end
              local.get 6
              i32.load offset=40
              local.set 74
              local.get 74
              local.set 69
            end
            local.get 69
            local.set 75
            local.get 6
            local.get 75
            i32.store offset=48
            block ;; label = @4
              local.get 75
              br_if 0 (;@4;)
              local.get 3
              i32.load
              local.set 76
              local.get 6
              local.get 76
              i32.store offset=56
              i32.const 56
              local.set 77
              local.get 6
              local.get 77
              i32.add
              local.set 78
              local.get 78
              local.set 79
              local.get 79
              local.get 8
              local.get 7
              call $#func57<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeAll>
              local.set 80
              local.get 6
              local.get 80
              i32.store16 offset=54
              local.get 6
              i32.load16_u offset=54
              local.set 81
              i32.const 144
              local.set 82
              local.get 6
              local.get 82
              i32.add
              local.set 83
              local.get 83
              global.set $__stack_pointer
              local.get 81
              return
            end
            local.get 2
            i32.load8_u offset=16
            local.set 84
            i32.const 2
            local.set 85
            local.get 84
            local.get 85
            i32.add
            local.set 86
            i32.const 3
            local.set 87
            local.get 86
            local.get 87
            i32.and
            local.set 88
            i32.const 0
            local.set 89
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      local.get 89
                      br_if 0 (;@8;)
                      local.get 88
                      br_table 3 (;@5;) 0 (;@8;) 1 (;@7;) 2 (;@6;) 3 (;@5;)
                    end
                    i32.const 1048805
                    local.set 90
                    i32.const 23
                    local.set 91
                    i32.const 0
                    local.set 92
                    i32.const 1049928
                    local.set 93
                    local.get 90
                    local.get 91
                    local.get 92
                    local.get 93
                    call $builtin.default_panic
                    unreachable
                  end
                  local.get 3
                  i32.load
                  local.set 94
                  local.get 6
                  local.get 94
                  i32.store offset=64
                  i32.const 64
                  local.set 95
                  local.get 6
                  local.get 95
                  i32.add
                  local.set 96
                  local.get 96
                  local.set 97
                  local.get 97
                  local.get 8
                  local.get 7
                  call $#func57<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeAll>
                  local.set 98
                  i32.const 0
                  local.set 99
                  i32.const 65535
                  local.set 100
                  local.get 98
                  local.get 100
                  i32.and
                  local.set 101
                  i32.const 65535
                  local.set 102
                  local.get 99
                  local.get 102
                  i32.and
                  local.set 103
                  local.get 101
                  local.get 103
                  i32.ne
                  local.set 104
                  i32.const 1
                  local.set 105
                  local.get 104
                  local.get 105
                  i32.and
                  local.set 106
                  block ;; label = @7
                    local.get 106
                    i32.eqz
                    br_if 0 (;@7;)
                    i32.const 144
                    local.set 107
                    local.get 6
                    local.get 107
                    i32.add
                    local.set 108
                    local.get 108
                    global.set $__stack_pointer
                    local.get 98
                    return
                  end
                  local.get 3
                  i32.load
                  local.set 109
                  local.get 6
                  local.get 109
                  i32.store offset=72
                  local.get 2
                  i32.load8_u offset=17
                  local.set 110
                  i32.const 72
                  local.set 111
                  local.get 6
                  local.get 111
                  i32.add
                  local.set 112
                  local.get 112
                  local.set 113
                  local.get 113
                  local.get 110
                  local.get 75
                  call $#func74<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeByteNTimes>
                  local.set 114
                  i32.const 0
                  local.set 115
                  i32.const 65535
                  local.set 116
                  local.get 114
                  local.get 116
                  i32.and
                  local.set 117
                  i32.const 65535
                  local.set 118
                  local.get 115
                  local.get 118
                  i32.and
                  local.set 119
                  local.get 117
                  local.get 119
                  i32.ne
                  local.set 120
                  i32.const 1
                  local.set 121
                  local.get 120
                  local.get 121
                  i32.and
                  local.set 122
                  block ;; label = @7
                    local.get 122
                    i32.eqz
                    br_if 0 (;@7;)
                    i32.const 144
                    local.set 123
                    local.get 6
                    local.get 123
                    i32.add
                    local.set 124
                    local.get 124
                    global.set $__stack_pointer
                    local.get 114
                    return
                  end
                  br 2 (;@4;)
                end
                i32.const 1
                local.set 125
                local.get 75
                local.get 125
                i32.shr_u
                local.set 126
                local.get 6
                local.get 126
                i32.store offset=76
                i32.const 1
                local.set 127
                local.get 75
                local.get 127
                i32.add
                local.set 128
                local.get 128
                i32.eqz
                local.set 129
                local.get 6
                local.get 128
                i32.store offset=80
                i32.const 1
                local.set 130
                local.get 129
                local.get 130
                i32.and
                local.set 131
                local.get 6
                local.get 131
                i32.store8 offset=84
                local.get 6
                i32.load8_u offset=84
                local.set 132
                i32.const 0
                local.set 133
                i32.const 1
                local.set 134
                local.get 132
                local.get 134
                i32.and
                local.set 135
                i32.const 1
                local.set 136
                local.get 133
                local.get 136
                i32.and
                local.set 137
                local.get 135
                local.get 137
                i32.eq
                local.set 138
                i32.const 1
                local.set 139
                local.get 138
                local.get 139
                i32.and
                local.set 140
                block ;; label = @6
                  block ;; label = @7
                    local.get 140
                    i32.eqz
                    br_if 0 (;@7;)
                    br 1 (;@6;)
                  end
                  i32.const 1048669
                  local.set 141
                  i32.const 16
                  local.set 142
                  i32.const 0
                  local.set 143
                  i32.const 1049920
                  local.set 144
                  local.get 141
                  local.get 142
                  local.get 143
                  local.get 144
                  call $builtin.default_panic
                  unreachable
                end
                local.get 6
                i32.load offset=80
                local.set 145
                i32.const 1
                local.set 146
                local.get 145
                local.get 146
                i32.shr_u
                local.set 147
                local.get 6
                local.get 147
                i32.store offset=92
                local.get 3
                i32.load
                local.set 148
                local.get 6
                local.get 148
                i32.store offset=96
                local.get 2
                i32.load8_u offset=17
                local.set 149
                i32.const 96
                local.set 150
                local.get 6
                local.get 150
                i32.add
                local.set 151
                local.get 151
                local.set 152
                local.get 152
                local.get 149
                local.get 126
                call $#func74<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeByteNTimes>
                local.set 153
                i32.const 0
                local.set 154
                i32.const 65535
                local.set 155
                local.get 153
                local.get 155
                i32.and
                local.set 156
                i32.const 65535
                local.set 157
                local.get 154
                local.get 157
                i32.and
                local.set 158
                local.get 156
                local.get 158
                i32.ne
                local.set 159
                i32.const 1
                local.set 160
                local.get 159
                local.get 160
                i32.and
                local.set 161
                block ;; label = @6
                  local.get 161
                  i32.eqz
                  br_if 0 (;@6;)
                  i32.const 144
                  local.set 162
                  local.get 6
                  local.get 162
                  i32.add
                  local.set 163
                  local.get 163
                  global.set $__stack_pointer
                  local.get 153
                  return
                end
                local.get 3
                i32.load
                local.set 164
                local.get 6
                local.get 164
                i32.store offset=104
                i32.const 104
                local.set 165
                local.get 6
                local.get 165
                i32.add
                local.set 166
                local.get 166
                local.set 167
                local.get 167
                local.get 8
                local.get 7
                call $#func57<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeAll>
                local.set 168
                i32.const 0
                local.set 169
                i32.const 65535
                local.set 170
                local.get 168
                local.get 170
                i32.and
                local.set 171
                i32.const 65535
                local.set 172
                local.get 169
                local.get 172
                i32.and
                local.set 173
                local.get 171
                local.get 173
                i32.ne
                local.set 174
                i32.const 1
                local.set 175
                local.get 174
                local.get 175
                i32.and
                local.set 176
                block ;; label = @6
                  local.get 176
                  i32.eqz
                  br_if 0 (;@6;)
                  i32.const 144
                  local.set 177
                  local.get 6
                  local.get 177
                  i32.add
                  local.set 178
                  local.get 178
                  global.set $__stack_pointer
                  local.get 168
                  return
                end
                local.get 3
                i32.load
                local.set 179
                local.get 6
                local.get 179
                i32.store offset=112
                local.get 2
                i32.load8_u offset=17
                local.set 180
                i32.const 112
                local.set 181
                local.get 6
                local.get 181
                i32.add
                local.set 182
                local.get 182
                local.set 183
                local.get 183
                local.get 180
                local.get 147
                call $#func74<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeByteNTimes>
                local.set 184
                i32.const 0
                local.set 185
                i32.const 65535
                local.set 186
                local.get 184
                local.get 186
                i32.and
                local.set 187
                i32.const 65535
                local.set 188
                local.get 185
                local.get 188
                i32.and
                local.set 189
                local.get 187
                local.get 189
                i32.ne
                local.set 190
                i32.const 1
                local.set 191
                local.get 190
                local.get 191
                i32.and
                local.set 192
                block ;; label = @6
                  local.get 192
                  i32.eqz
                  br_if 0 (;@6;)
                  i32.const 144
                  local.set 193
                  local.get 6
                  local.get 193
                  i32.add
                  local.set 194
                  local.get 194
                  global.set $__stack_pointer
                  local.get 184
                  return
                end
                br 1 (;@4;)
              end
              local.get 3
              i32.load
              local.set 195
              local.get 6
              local.get 195
              i32.store offset=120
              local.get 2
              i32.load8_u offset=17
              local.set 196
              i32.const 120
              local.set 197
              local.get 6
              local.get 197
              i32.add
              local.set 198
              local.get 198
              local.set 199
              local.get 199
              local.get 196
              local.get 75
              call $#func74<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeByteNTimes>
              local.set 200
              i32.const 0
              local.set 201
              i32.const 65535
              local.set 202
              local.get 200
              local.get 202
              i32.and
              local.set 203
              i32.const 65535
              local.set 204
              local.get 201
              local.get 204
              i32.and
              local.set 205
              local.get 203
              local.get 205
              i32.ne
              local.set 206
              i32.const 1
              local.set 207
              local.get 206
              local.get 207
              i32.and
              local.set 208
              block ;; label = @5
                local.get 208
                i32.eqz
                br_if 0 (;@5;)
                i32.const 144
                local.set 209
                local.get 6
                local.get 209
                i32.add
                local.set 210
                local.get 210
                global.set $__stack_pointer
                local.get 200
                return
              end
              local.get 3
              i32.load
              local.set 211
              local.get 6
              local.get 211
              i32.store offset=128
              i32.const 128
              local.set 212
              local.get 6
              local.get 212
              i32.add
              local.set 213
              local.get 213
              local.set 214
              local.get 214
              local.get 8
              local.get 7
              call $#func57<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeAll>
              local.set 215
              i32.const 0
              local.set 216
              i32.const 65535
              local.set 217
              local.get 215
              local.get 217
              i32.and
              local.set 218
              i32.const 65535
              local.set 219
              local.get 216
              local.get 219
              i32.and
              local.set 220
              local.get 218
              local.get 220
              i32.ne
              local.set 221
              i32.const 1
              local.set 222
              local.get 221
              local.get 222
              i32.and
              local.set 223
              block ;; label = @5
                local.get 223
                i32.eqz
                br_if 0 (;@5;)
                i32.const 144
                local.set 224
                local.get 6
                local.get 224
                i32.add
                local.set 225
                local.get 225
                global.set $__stack_pointer
                local.get 215
                return
              end
            end
            br 2 (;@1;)
          end
          i32.const 144
          local.set 226
          local.get 6
          local.get 226
          i32.add
          local.set 227
          local.get 227
          global.set $__stack_pointer
          local.get 38
          return
        end
      end
      i32.const 0
      local.set 228
      i32.const 144
      local.set 229
      local.get 6
      local.get 229
      i32.add
      local.set 230
      local.get 230
      global.set $__stack_pointer
      local.get 228
      return
    )
    (func $#func74<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeByteNTimes> (@name "io.writer.Writer(*io.fixed_buffer_stream.FixedBufferStream([]u8),error{NoSpaceLeft},(function \'write\')).writeByteNTimes") (;74;) (type 9) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      local.set 3
      i32.const 304
      local.set 4
      local.get 3
      local.get 4
      i32.sub
      local.set 5
      local.get 5
      global.set $__stack_pointer
      local.get 5
      local.get 1
      i32.store8 offset=11
      local.get 5
      local.get 2
      i32.store offset=12
      i32.const 256
      local.set 6
      i32.const 170
      local.set 7
      i32.const 16
      local.set 8
      local.get 5
      local.get 8
      i32.add
      local.set 9
      local.get 9
      local.get 7
      local.get 6
      call $memset
      drop
      i32.const 16
      local.set 10
      local.get 5
      local.get 10
      i32.add
      local.set 11
      local.get 11
      local.set 12
      i32.const 1
      local.set 13
      i32.const 1
      local.set 14
      local.get 13
      local.get 14
      i32.and
      local.set 15
      block ;; label = @1
        block ;; label = @2
          local.get 15
          i32.eqz
          br_if 0 (;@2;)
          br 1 (;@1;)
        end
        i32.const 0
        local.set 16
        i32.const 256
        local.set 17
        local.get 16
        local.get 17
        call $builtin.panicStartGreaterThanEnd
        unreachable
      end
      i32.const 256
      local.set 18
      local.get 12
      local.set 19
      local.get 19
      local.get 18
      local.get 1
      call $mem.set__anon_2362
      local.get 5
      local.get 2
      i32.store offset=272
      block ;; label = @1
        loop ;; label = @2
          local.get 5
          i32.load offset=272
          local.set 20
          i32.const 0
          local.set 21
          local.get 20
          local.set 22
          local.get 21
          local.set 23
          local.get 22
          local.get 23
          i32.gt_u
          local.set 24
          i32.const 1
          local.set 25
          local.get 24
          local.get 25
          i32.and
          local.set 26
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  local.get 26
                  i32.eqz
                  br_if 0 (;@6;)
                  local.get 5
                  i32.load offset=272
                  local.set 27
                  i32.const 256
                  local.set 28
                  local.get 27
                  local.get 28
                  call $math.min__anon_2363
                  local.set 29
                  local.get 5
                  local.get 29
                  i32.store offset=276
                  local.get 0
                  i32.load
                  local.set 30
                  local.get 5
                  local.get 30
                  i32.store offset=280
                  i32.const 16
                  local.set 31
                  local.get 5
                  local.get 31
                  i32.add
                  local.set 32
                  local.get 32
                  local.set 33
                  i32.const 0
                  local.set 34
                  local.get 34
                  local.set 35
                  local.get 29
                  local.set 36
                  local.get 35
                  local.get 36
                  i32.le_u
                  local.set 37
                  i32.const 1
                  local.set 38
                  local.get 37
                  local.get 38
                  i32.and
                  local.set 39
                  local.get 39
                  br_if 1 (;@5;)
                  br 2 (;@4;)
                end
                br 4 (;@1;)
              end
              br 1 (;@3;)
            end
            i32.const 0
            local.set 40
            local.get 40
            local.get 29
            call $builtin.panicStartGreaterThanEnd
            unreachable
          end
          i32.const 256
          local.set 41
          local.get 29
          local.set 42
          local.get 41
          local.set 43
          local.get 42
          local.get 43
          i32.le_u
          local.set 44
          i32.const 1
          local.set 45
          local.get 44
          local.get 45
          i32.and
          local.set 46
          block ;; label = @3
            block ;; label = @4
              local.get 46
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 256
            local.set 47
            local.get 29
            local.get 47
            call $builtin.panicOutOfBounds
            unreachable
          end
          i32.const 0
          local.set 48
          local.get 48
          local.set 49
          local.get 29
          local.set 50
          local.get 49
          local.get 50
          i32.le_u
          local.set 51
          i32.const 1
          local.set 52
          local.get 51
          local.get 52
          i32.and
          local.set 53
          block ;; label = @3
            block ;; label = @4
              local.get 53
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 0
            local.set 54
            local.get 54
            local.get 29
            call $builtin.panicOutOfBounds
            unreachable
          end
          local.get 5
          local.get 29
          i32.store offset=292
          local.get 5
          local.get 33
          i32.store offset=288
          local.get 5
          i32.load offset=292
          local.set 55
          local.get 5
          i32.load offset=288
          local.set 56
          i32.const 280
          local.set 57
          local.get 5
          local.get 57
          i32.add
          local.set 58
          local.get 58
          local.set 59
          local.get 59
          local.get 56
          local.get 55
          call $#func57<io.writer.Writer_*io.fixed_buffer_stream.FixedBufferStream___u8__error_NoSpaceLeft___function_'write'__.writeAll>
          local.set 60
          i32.const 0
          local.set 61
          i32.const 65535
          local.set 62
          local.get 60
          local.get 62
          i32.and
          local.set 63
          i32.const 65535
          local.set 64
          local.get 61
          local.get 64
          i32.and
          local.set 65
          local.get 63
          local.get 65
          i32.ne
          local.set 66
          i32.const 1
          local.set 67
          local.get 66
          local.get 67
          i32.and
          local.set 68
          block ;; label = @3
            local.get 68
            i32.eqz
            br_if 0 (;@3;)
            i32.const 304
            local.set 69
            local.get 5
            local.get 69
            i32.add
            local.set 70
            local.get 70
            global.set $__stack_pointer
            local.get 60
            return
          end
          local.get 5
          i32.load offset=272
          local.set 71
          local.get 71
          local.get 29
          i32.sub
          local.set 72
          local.get 72
          local.get 71
          i32.gt_u
          local.set 73
          local.get 5
          local.get 72
          i32.store offset=296
          i32.const 1
          local.set 74
          local.get 73
          local.get 74
          i32.and
          local.set 75
          local.get 5
          local.get 75
          i32.store8 offset=300
          local.get 5
          i32.load8_u offset=300
          local.set 76
          i32.const 0
          local.set 77
          i32.const 1
          local.set 78
          local.get 76
          local.get 78
          i32.and
          local.set 79
          i32.const 1
          local.set 80
          local.get 77
          local.get 80
          i32.and
          local.set 81
          local.get 79
          local.get 81
          i32.eq
          local.set 82
          i32.const 1
          local.set 83
          local.get 82
          local.get 83
          i32.and
          local.set 84
          block ;; label = @3
            block ;; label = @4
              local.get 84
              i32.eqz
              br_if 0 (;@4;)
              br 1 (;@3;)
            end
            i32.const 1048669
            local.set 85
            i32.const 16
            local.set 86
            i32.const 0
            local.set 87
            i32.const 1049984
            local.set 88
            local.get 85
            local.get 86
            local.get 87
            local.get 88
            call $builtin.default_panic
            unreachable
          end
          local.get 5
          i32.load offset=296
          local.set 89
          local.get 5
          local.get 89
          i32.store offset=272
          br 0 (;@2;)
        end
      end
      i32.const 0
      local.set 90
      i32.const 304
      local.set 91
      local.get 5
      local.get 91
      i32.add
      local.set 92
      local.get 92
      global.set $__stack_pointer
      local.get 90
      return
    )
    (func $memset (;75;) (type 9) (param i32 i32 i32) (result i32)
      (local i32 i32 i32)
      block ;; label = @1
        local.get 2
        i32.eqz
        br_if 0 (;@1;)
        local.get 2
        i32.const -1
        i32.add
        local.set 3
        block ;; label = @2
          block ;; label = @3
            local.get 2
            i32.const 7
            i32.and
            local.tee 4
            br_if 0 (;@3;)
            local.get 0
            local.set 5
            br 1 (;@2;)
          end
          local.get 0
          local.set 5
          loop ;; label = @3
            local.get 5
            local.get 1
            i32.store8
            local.get 5
            i32.const 1
            i32.add
            local.set 5
            local.get 2
            i32.const -1
            i32.add
            local.set 2
            local.get 4
            i32.const -1
            i32.add
            local.tee 4
            br_if 0 (;@3;)
          end
        end
        local.get 3
        i32.const 7
        i32.lt_u
        br_if 0 (;@1;)
        loop ;; label = @2
          local.get 5
          local.get 1
          i32.store8 offset=7
          local.get 5
          local.get 1
          i32.store8 offset=6
          local.get 5
          local.get 1
          i32.store8 offset=5
          local.get 5
          local.get 1
          i32.store8 offset=4
          local.get 5
          local.get 1
          i32.store8 offset=3
          local.get 5
          local.get 1
          i32.store8 offset=2
          local.get 5
          local.get 1
          i32.store8 offset=1
          local.get 5
          local.get 1
          i32.store8
          local.get 5
          i32.const 8
          i32.add
          local.set 5
          local.get 2
          i32.const -8
          i32.add
          local.tee 2
          br_if 0 (;@2;)
        end
      end
      local.get 0
    )
    (memory (;0;) 17)
    (global $__stack_pointer (;0;) (mut i32) i32.const 1048576)
    (export "memory" (memory 0))
    (export "_start" (func $_start))
    (export "foo#add" (func $foo#add))
    (data $.rodata (;0;) (i32.const 1048576) "start index {d} is larger than end index {d}\00index out of bounds: index {d}, len {d}\00{ ... }\00integer overflow\00integer cast truncated bits\00division by zero\00cast causes pointer to be null\00shift amount is greater than the type size\00switch on corrupt value\00reached unreachable code\0000010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899\00(msg truncated)\00unexpected errno: {d}\0a\00Unable to dump stack trace: not implemented for Wasm\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02 \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\09\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\03\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\05\00\00\00\00\00\00\00\06\00\00\00\00\00\00\00\05\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\0f\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\12\00\00\00\00\00\00\00\11\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\12\00\00\00\00\00\00\00\13\00\00\00\00\00\00\00\11\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\12\00\00\00\00\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00d\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02 \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02 \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02 \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02 \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02 \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
  )
  (core module (;1;)
    (type (;0;) (func (param i32)))
    (type (;1;) (func))
    (type (;2;) (func (result i32)))
    (type (;3;) (func (param i32 i32)))
    (type (;4;) (func (param i32 i64 i32)))
    (type (;5;) (func (param i32 i32 i32 i32)))
    (type (;6;) (func (param i32) (result i32)))
    (type (;7;) (func (param i32 i32 i32 i32) (result i32)))
    (type (;8;) (func (param i32 i32 i32) (result i32)))
    (type (;9;) (func (param i32 i32) (result i32)))
    (import "env" "memory" (memory (;0;) 0))
    (import "wasi-io" "drop-input-stream" (func $_ZN22wasi_snapshot_preview18bindings7wasi_io17drop_input_stream10wit_import17h900da2b905d2de82E (;0;) (type 0)))
    (import "wasi-io" "drop-output-stream" (func $_ZN22wasi_snapshot_preview18bindings7wasi_io18drop_output_stream10wit_import17h579ba1d3b3b1b48fE (;1;) (type 0)))
    (import "wasi-filesystem" "drop-descriptor" (func $_ZN22wasi_snapshot_preview18bindings15wasi_filesystem15drop_descriptor10wit_import17h1c59250d0182b49cE (;2;) (type 0)))
    (import "__main_module__" "_start" (func $_ZN22wasi_snapshot_preview17command6_start17hf407a2ffe0755a6cE (;3;) (type 1)))
    (import "wasi-stderr" "print" (func $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print10wit_import17h8b995f35ebf123f0E (;4;) (type 3)))
    (import "wasi-filesystem" "append-via-stream" (func $_ZN22wasi_snapshot_preview18bindings15wasi_filesystem17append_via_stream10wit_import17h6e24b4d9bec1d4d6E (;5;) (type 3)))
    (import "wasi-filesystem" "write-via-stream" (func $_ZN22wasi_snapshot_preview18bindings15wasi_filesystem16write_via_stream10wit_import17h392936cde63b6360E (;6;) (type 4)))
    (import "wasi-exit" "exit" (func $_ZN22wasi_snapshot_preview18bindings9wasi_exit4exit10wit_import17h4d62d60c6af21881E (;7;) (type 0)))
    (import "wasi-io" "write" (func $_ZN22wasi_snapshot_preview18bindings7wasi_io5write10wit_import17h2b4c23e9f7f46b96E (;8;) (type 5)))
    (func $realloc_via_memory_grow (;9;) (type 7) (param i32 i32 i32 i32) (result i32)
      (local i32)
      i32.const 0
      local.get 0
      i32.ne
      if ;; label = @1
        unreachable
      end
      i32.const 0
      local.get 1
      i32.ne
      if ;; label = @1
        unreachable
      end
      i32.const 65536
      local.get 3
      i32.ne
      if ;; label = @1
        unreachable
      end
      i32.const 1
      memory.grow
      local.tee 4
      i32.const -1
      i32.eq
      if ;; label = @1
        unreachable
      end
      local.get 4
      i32.const 16
      i32.shl
    )
    (func $_ZN4core3ptr55drop_in_place$LT$wasi_snapshot_preview1..Descriptor$GT$17hfbf47c22913cb6c3E (;10;) (type 0) (param i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      block ;; label = @1
        local.get 0
        i32.load
        i32.const 1
        i32.ne
        br_if 0 (;@1;)
        block ;; label = @2
          local.get 0
          i32.load offset=8
          i32.const 1
          i32.ne
          br_if 0 (;@2;)
          local.get 0
          i32.const 12
          i32.add
          i32.load
          call $_ZN22wasi_snapshot_preview18bindings7wasi_io17drop_input_stream10wit_import17h900da2b905d2de82E
        end
        block ;; label = @2
          local.get 0
          i32.const 16
          i32.add
          i32.load
          i32.const 1
          i32.ne
          br_if 0 (;@2;)
          local.get 0
          i32.const 20
          i32.add
          i32.load
          call $_ZN22wasi_snapshot_preview18bindings7wasi_io18drop_output_stream10wit_import17h579ba1d3b3b1b48fE
        end
        i32.const 2
        local.get 0
        i32.const 40
        i32.add
        i32.load8_u
        local.tee 2
        i32.const -2
        i32.add
        local.get 2
        i32.const 2
        i32.lt_u
        select
        i32.const 255
        i32.and
        local.tee 2
        i32.const 2
        i32.lt_u
        br_if 0 (;@1;)
        block ;; label = @2
          block ;; label = @3
            local.get 2
            i32.const -2
            i32.add
            br_table 1 (;@2;) 0 (;@3;) 1 (;@2;)
          end
          local.get 1
          i32.const 32
          i32.store8 offset=31
          local.get 1
          i32.const 1701734764
          i32.store offset=27 align=1
          local.get 1
          i64.const 2338600898263348341
          i64.store offset=19 align=1
          local.get 1
          i64.const 7162263158133189730
          i64.store offset=11 align=1
          local.get 1
          i64.const 7018969289221893749
          i64.store offset=3 align=1
          local.get 1
          i32.const 3
          i32.add
          i32.const 29
          call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
          i32.const 2203
          call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
          unreachable
          unreachable
        end
        local.get 0
        i32.const 24
        i32.add
        i32.load
        call $_ZN22wasi_snapshot_preview18bindings15wasi_filesystem15drop_descriptor10wit_import17h1c59250d0182b49cE
      end
      local.get 1
      i32.const 32
      i32.add
      global.set $__stack_pointer
    )
    (func $command (;11;) (type 7) (param i32 i32 i32 i32) (result i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          call $_ZN22wasi_snapshot_preview15State3ptr17hd4ae3330b90ac55eE
          local.tee 5
          i32.load
          br_if 0 (;@2;)
          local.get 5
          i32.const -1
          i32.store
          local.get 5
          i32.load offset=8
          i32.const 560490357
          i32.ne
          br_if 1 (;@1;)
          block ;; label = @3
            block ;; label = @4
              local.get 5
              i32.const 65532
              i32.add
              i32.load
              i32.const 560490357
              i32.ne
              br_if 0 (;@4;)
              local.get 5
              i32.const 24
              i32.add
              i32.load16_u
              i32.const 2
              i32.gt_u
              br_if 1 (;@3;)
              local.get 4
              i32.const 32
              i32.store8 offset=34
              local.get 4
              i32.const 1701734764
              i32.store offset=30 align=1
              local.get 4
              i64.const 2338600898263348341
              i64.store offset=22 align=1
              local.get 4
              i64.const 7162263158133189730
              i64.store offset=14 align=1
              local.get 4
              i64.const 7018969289221893749
              i64.store offset=6 align=1
              local.get 4
              i32.const 6
              i32.add
              i32.const 29
              call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
              i32.const 59
              call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
              local.get 4
              i32.const 8250
              i32.store16 offset=6 align=1
              local.get 4
              i32.const 6
              i32.add
              i32.const 2
              call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
              local.get 4
              i32.const 2675
              i32.store16 offset=46 align=1
              local.get 4
              i64.const 8245937468892930931
              i64.store offset=38 align=1
              local.get 4
              i64.const 7306000158383436915
              i64.store offset=30 align=1
              local.get 4
              i64.const 2338053640980886127
              i64.store offset=22 align=1
              local.get 4
              i64.const 7882826708941694313
              i64.store offset=14 align=1
              local.get 4
              i64.const 7163369272552681065
              i64.store offset=6 align=1
              local.get 4
              i32.const 6
              i32.add
              i32.const 42
              call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
              unreachable
              unreachable
            end
            local.get 4
            i32.const 32
            i32.store8 offset=34
            local.get 4
            i32.const 1701734764
            i32.store offset=30 align=1
            local.get 4
            i64.const 2338600898263348341
            i64.store offset=22 align=1
            local.get 4
            i64.const 7162263158133189730
            i64.store offset=14 align=1
            local.get 4
            i64.const 7018969289221893749
            i64.store offset=6 align=1
            local.get 4
            i32.const 6
            i32.add
            i32.const 29
            call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
            i32.const 2403
            call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
            local.get 4
            i32.const 8250
            i32.store16 offset=6 align=1
            local.get 4
            i32.const 6
            i32.add
            i32.const 2
            call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
            local.get 4
            i32.const 10
            i32.store8 offset=22
            local.get 4
            i64.const 7234307576302018670
            i64.store offset=14 align=1
            local.get 4
            i64.const 8028075845441778529
            i64.store offset=6 align=1
            local.get 4
            i32.const 6
            i32.add
            i32.const 17
            call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
            unreachable
            unreachable
          end
          local.get 5
          i32.const 32
          i32.add
          local.tee 6
          call $_ZN4core3ptr55drop_in_place$LT$wasi_snapshot_preview1..Descriptor$GT$17hfbf47c22913cb6c3E
          local.get 5
          i32.const 72
          i32.add
          i32.const 2
          i32.store8
          local.get 5
          i32.const 48
          i32.add
          i32.const 0
          i32.store
          local.get 5
          local.get 0
          i32.store offset=44
          local.get 5
          i32.const 40
          i32.add
          i32.const 1
          i32.store
          local.get 6
          i32.const 1
          i32.store
          local.get 5
          i32.const 80
          i32.add
          local.tee 0
          call $_ZN4core3ptr55drop_in_place$LT$wasi_snapshot_preview1..Descriptor$GT$17hfbf47c22913cb6c3E
          local.get 5
          i32.const 65184
          i32.add
          local.get 3
          i32.store
          local.get 5
          i32.const 65180
          i32.add
          local.get 2
          i32.store
          local.get 5
          i32.const 120
          i32.add
          i32.const 2
          i32.store8
          local.get 5
          local.get 1
          i32.store offset=100
          local.get 5
          i32.const 96
          i32.add
          i32.const 1
          i32.store
          local.get 5
          i32.const 88
          i32.add
          i32.const 0
          i32.store
          local.get 0
          i32.const 1
          i32.store
          local.get 5
          local.get 5
          i32.load
          i32.const 1
          i32.add
          i32.store
          call $_ZN22wasi_snapshot_preview17command6_start17hf407a2ffe0755a6cE
          local.get 4
          i32.const 48
          i32.add
          global.set $__stack_pointer
          i32.const 0
          return
        end
        local.get 4
        i32.const 32
        i32.store8 offset=34
        local.get 4
        i32.const 1701734764
        i32.store offset=30 align=1
        local.get 4
        i64.const 2338600898263348341
        i64.store offset=22 align=1
        local.get 4
        i64.const 7162263158133189730
        i64.store offset=14 align=1
        local.get 4
        i64.const 7018969289221893749
        i64.store offset=6 align=1
        local.get 4
        i32.const 6
        i32.add
        i32.const 29
        call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
        i32.const 2401
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
        unreachable
        unreachable
      end
      local.get 4
      i32.const 32
      i32.store8 offset=34
      local.get 4
      i32.const 1701734764
      i32.store offset=30 align=1
      local.get 4
      i64.const 2338600898263348341
      i64.store offset=22 align=1
      local.get 4
      i64.const 7162263158133189730
      i64.store offset=14 align=1
      local.get 4
      i64.const 7018969289221893749
      i64.store offset=6 align=1
      local.get 4
      i32.const 6
      i32.add
      i32.const 29
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      i32.const 2402
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
      local.get 4
      i32.const 8250
      i32.store16 offset=6 align=1
      local.get 4
      i32.const 6
      i32.add
      i32.const 2
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      local.get 4
      i32.const 10
      i32.store8 offset=22
      local.get 4
      i64.const 7234307576302018670
      i64.store offset=14 align=1
      local.get 4
      i64.const 8028075845441778529
      i64.store offset=6 align=1
      local.get 4
      i32.const 6
      i32.add
      i32.const 17
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      unreachable
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview15State3ptr17hd4ae3330b90ac55eE (;12;) (type 2) (result i32)
      (local i32)
      block ;; label = @1
        call $get_state_ptr
        local.tee 0
        br_if 0 (;@1;)
        call $_ZN22wasi_snapshot_preview15State3new17hbc72603a22248accE
        local.tee 0
        call $set_state_ptr
      end
      local.get 0
    )
    (func $cabi_import_realloc (;13;) (type 7) (param i32 i32 i32 i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 0
                br_if 0 (;@5;)
                local.get 1
                br_if 0 (;@5;)
                call $_ZN22wasi_snapshot_preview15State3ptr17hd4ae3330b90ac55eE
                local.tee 0
                i32.load
                local.tee 1
                i32.const 2147483647
                i32.ge_u
                br_if 1 (;@4;)
                local.get 0
                local.get 1
                i32.const 1
                i32.add
                i32.store
                local.get 0
                i32.load offset=8
                i32.const 560490357
                i32.ne
                br_if 2 (;@3;)
                block ;; label = @6
                  local.get 0
                  i32.const 65532
                  i32.add
                  i32.load
                  i32.const 560490357
                  i32.ne
                  br_if 0 (;@6;)
                  block ;; label = @7
                    local.get 0
                    i32.const 20
                    i32.add
                    i32.load
                    local.tee 1
                    i32.eqz
                    br_if 0 (;@7;)
                    local.get 1
                    local.get 2
                    local.get 3
                    call $_ZN22wasi_snapshot_preview19BumpArena5alloc17hee0f49accd206cd3E
                    local.set 2
                    br 6 (;@1;)
                  end
                  local.get 0
                  i32.load offset=12
                  local.tee 1
                  i32.eqz
                  br_if 4 (;@2;)
                  block ;; label = @7
                    local.get 2
                    local.get 1
                    i32.add
                    i32.const -1
                    i32.add
                    i32.const 0
                    local.get 2
                    i32.sub
                    i32.and
                    local.tee 2
                    local.get 3
                    i32.add
                    local.tee 3
                    local.get 2
                    i32.ge_u
                    local.get 3
                    call $_ZN97_$LT$core..option..Option$LT$T$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h61373a72f0df8506E
                    local.get 1
                    local.get 0
                    i32.const 16
                    i32.add
                    i32.load
                    i32.add
                    local.tee 3
                    local.get 1
                    i32.ge_u
                    local.get 3
                    call $_ZN97_$LT$core..option..Option$LT$T$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h61373a72f0df8506E
                    i32.gt_u
                    br_if 0 (;@7;)
                    local.get 0
                    i32.const 0
                    i32.store offset=12
                    br 6 (;@1;)
                  end
                  local.get 4
                  i32.const 32
                  i32.store8 offset=39
                  local.get 4
                  i32.const 1701734764
                  i32.store offset=35 align=1
                  local.get 4
                  i64.const 2338600898263348341
                  i64.store offset=27 align=1
                  local.get 4
                  i64.const 7162263158133189730
                  i64.store offset=19 align=1
                  local.get 4
                  i64.const 7018969289221893749
                  i64.store offset=11 align=1
                  local.get 4
                  i32.const 11
                  i32.add
                  i32.const 29
                  call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
                  i32.const 231
                  call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
                  local.get 4
                  i32.const 8250
                  i32.store16 offset=11 align=1
                  local.get 4
                  i32.const 11
                  i32.add
                  i32.const 2
                  call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
                  local.get 4
                  i32.const 2681
                  i32.store16 offset=23 align=1
                  local.get 4
                  i32.const 1919905125
                  i32.store offset=19 align=1
                  local.get 4
                  i64.const 7863397576860792175
                  i64.store offset=11 align=1
                  local.get 4
                  i32.const 11
                  i32.add
                  i32.const 14
                  call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
                  unreachable
                  unreachable
                end
                local.get 4
                i32.const 32
                i32.store8 offset=39
                local.get 4
                i32.const 1701734764
                i32.store offset=35 align=1
                local.get 4
                i64.const 2338600898263348341
                i64.store offset=27 align=1
                local.get 4
                i64.const 7162263158133189730
                i64.store offset=19 align=1
                local.get 4
                i64.const 7018969289221893749
                i64.store offset=11 align=1
                local.get 4
                i32.const 11
                i32.add
                i32.const 29
                call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
                i32.const 2391
                call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
                local.get 4
                i32.const 8250
                i32.store16 offset=11 align=1
                local.get 4
                i32.const 11
                i32.add
                i32.const 2
                call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
                local.get 4
                i32.const 10
                i32.store8 offset=27
                local.get 4
                i64.const 7234307576302018670
                i64.store offset=19 align=1
                local.get 4
                i64.const 8028075845441778529
                i64.store offset=11 align=1
                local.get 4
                i32.const 11
                i32.add
                i32.const 17
                call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
                unreachable
                unreachable
              end
              local.get 4
              i32.const 32
              i32.store8 offset=39
              local.get 4
              i32.const 1701734764
              i32.store offset=35 align=1
              local.get 4
              i64.const 2338600898263348341
              i64.store offset=27 align=1
              local.get 4
              i64.const 7162263158133189730
              i64.store offset=19 align=1
              local.get 4
              i64.const 7018969289221893749
              i64.store offset=11 align=1
              local.get 4
              i32.const 11
              i32.add
              i32.const 29
              call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
              i32.const 118
              call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
              unreachable
              unreachable
            end
            local.get 4
            i32.const 32
            i32.store8 offset=39
            local.get 4
            i32.const 1701734764
            i32.store offset=35 align=1
            local.get 4
            i64.const 2338600898263348341
            i64.store offset=27 align=1
            local.get 4
            i64.const 7162263158133189730
            i64.store offset=19 align=1
            local.get 4
            i64.const 7018969289221893749
            i64.store offset=11 align=1
            local.get 4
            i32.const 11
            i32.add
            i32.const 29
            call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
            i32.const 2389
            call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
            unreachable
            unreachable
          end
          local.get 4
          i32.const 32
          i32.store8 offset=39
          local.get 4
          i32.const 1701734764
          i32.store offset=35 align=1
          local.get 4
          i64.const 2338600898263348341
          i64.store offset=27 align=1
          local.get 4
          i64.const 7162263158133189730
          i64.store offset=19 align=1
          local.get 4
          i64.const 7018969289221893749
          i64.store offset=11 align=1
          local.get 4
          i32.const 11
          i32.add
          i32.const 29
          call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
          i32.const 2390
          call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
          local.get 4
          i32.const 8250
          i32.store16 offset=11 align=1
          local.get 4
          i32.const 11
          i32.add
          i32.const 2
          call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
          local.get 4
          i32.const 10
          i32.store8 offset=27
          local.get 4
          i64.const 7234307576302018670
          i64.store offset=19 align=1
          local.get 4
          i64.const 8028075845441778529
          i64.store offset=11 align=1
          local.get 4
          i32.const 11
          i32.add
          i32.const 17
          call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
          unreachable
          unreachable
        end
        local.get 4
        i32.const 32
        i32.store8 offset=39
        local.get 4
        i32.const 1701734764
        i32.store offset=35 align=1
        local.get 4
        i64.const 2338600898263348341
        i64.store offset=27 align=1
        local.get 4
        i64.const 7162263158133189730
        i64.store offset=19 align=1
        local.get 4
        i64.const 7018969289221893749
        i64.store offset=11 align=1
        local.get 4
        i32.const 11
        i32.add
        i32.const 29
        call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
        i32.const 224
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
        local.get 4
        i32.const 8250
        i32.store16 offset=11 align=1
        local.get 4
        i32.const 11
        i32.add
        i32.const 2
        call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
        local.get 4
        i32.const 10
        i32.store8 offset=47
        local.get 4
        i32.const 1684370293
        i32.store offset=43 align=1
        local.get 4
        i64.const 2340011850872286305
        i64.store offset=35 align=1
        local.get 4
        i64.const 2338053340533122404
        i64.store offset=27 align=1
        local.get 4
        i64.const 7599383958532420719
        i64.store offset=19 align=1
        local.get 4
        i64.const 7935468323262068066
        i64.store offset=11 align=1
        local.get 4
        i32.const 11
        i32.add
        i32.const 37
        call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
        unreachable
        unreachable
      end
      local.get 0
      local.get 0
      i32.load
      i32.const -1
      i32.add
      i32.store
      local.get 4
      i32.const 48
      i32.add
      global.set $__stack_pointer
      local.get 2
    )
    (func $_ZN22wasi_snapshot_preview19BumpArena5alloc17hee0f49accd206cd3E (;14;) (type 8) (param i32 i32 i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      block ;; label = @1
        local.get 0
        local.get 1
        i32.add
        local.get 0
        i32.load offset=54896
        i32.add
        i32.const -1
        i32.add
        i32.const 0
        local.get 1
        i32.sub
        i32.and
        local.tee 1
        local.get 0
        i32.sub
        local.get 2
        i32.add
        local.tee 2
        i32.const 54896
        i32.gt_u
        br_if 0 (;@1;)
        local.get 0
        local.get 2
        i32.store offset=54896
        local.get 3
        i32.const 32
        i32.add
        global.set $__stack_pointer
        local.get 1
        return
      end
      local.get 3
      i32.const 32
      i32.store8 offset=31
      local.get 3
      i32.const 1701734764
      i32.store offset=27 align=1
      local.get 3
      i64.const 2338600898263348341
      i64.store offset=19 align=1
      local.get 3
      i64.const 7162263158133189730
      i64.store offset=11 align=1
      local.get 3
      i64.const 7018969289221893749
      i64.store offset=3 align=1
      local.get 3
      i32.const 3
      i32.add
      i32.const 29
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      i32.const 148
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
      local.get 3
      i32.const 8250
      i32.store16 offset=3 align=1
      local.get 3
      i32.const 3
      i32.add
      i32.const 2
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      local.get 3
      i32.const 2681
      i32.store16 offset=15 align=1
      local.get 3
      i32.const 1919905125
      i32.store offset=11 align=1
      local.get 3
      i64.const 7863397576860792175
      i64.store offset=3 align=1
      local.get 3
      i32.const 3
      i32.add
      i32.const 14
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      unreachable
      unreachable
    )
    (func $cabi_export_realloc (;15;) (type 7) (param i32 i32 i32 i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 0
              br_if 0 (;@4;)
              local.get 1
              br_if 0 (;@4;)
              call $_ZN22wasi_snapshot_preview15State3ptr17hd4ae3330b90ac55eE
              local.tee 0
              i32.load
              br_if 1 (;@3;)
              local.get 0
              i32.const -1
              i32.store
              local.get 0
              i32.load offset=8
              i32.const 560490357
              i32.ne
              br_if 2 (;@2;)
              local.get 0
              i32.const 65532
              i32.add
              i32.load
              i32.const 560490357
              i32.ne
              br_if 3 (;@1;)
              local.get 0
              i32.const 10280
              i32.add
              local.get 2
              local.get 3
              call $_ZN22wasi_snapshot_preview19BumpArena5alloc17hee0f49accd206cd3E
              local.set 1
              local.get 0
              local.get 0
              i32.load
              i32.const 1
              i32.add
              i32.store
              local.get 4
              i32.const 32
              i32.add
              global.set $__stack_pointer
              local.get 1
              return
            end
            local.get 4
            i32.const 32
            i32.store8 offset=31
            local.get 4
            i32.const 1701734764
            i32.store offset=27 align=1
            local.get 4
            i64.const 2338600898263348341
            i64.store offset=19 align=1
            local.get 4
            i64.const 7162263158133189730
            i64.store offset=11 align=1
            local.get 4
            i64.const 7018969289221893749
            i64.store offset=3 align=1
            local.get 4
            i32.const 3
            i32.add
            i32.const 29
            call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
            i32.const 254
            call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
            unreachable
            unreachable
          end
          local.get 4
          i32.const 32
          i32.store8 offset=31
          local.get 4
          i32.const 1701734764
          i32.store offset=27 align=1
          local.get 4
          i64.const 2338600898263348341
          i64.store offset=19 align=1
          local.get 4
          i64.const 7162263158133189730
          i64.store offset=11 align=1
          local.get 4
          i64.const 7018969289221893749
          i64.store offset=3 align=1
          local.get 4
          i32.const 3
          i32.add
          i32.const 29
          call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
          i32.const 2401
          call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
          unreachable
          unreachable
        end
        local.get 4
        i32.const 32
        i32.store8 offset=31
        local.get 4
        i32.const 1701734764
        i32.store offset=27 align=1
        local.get 4
        i64.const 2338600898263348341
        i64.store offset=19 align=1
        local.get 4
        i64.const 7162263158133189730
        i64.store offset=11 align=1
        local.get 4
        i64.const 7018969289221893749
        i64.store offset=3 align=1
        local.get 4
        i32.const 3
        i32.add
        i32.const 29
        call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
        i32.const 2402
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
        local.get 4
        i32.const 8250
        i32.store16 offset=3 align=1
        local.get 4
        i32.const 3
        i32.add
        i32.const 2
        call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
        local.get 4
        i32.const 10
        i32.store8 offset=19
        local.get 4
        i64.const 7234307576302018670
        i64.store offset=11 align=1
        local.get 4
        i64.const 8028075845441778529
        i64.store offset=3 align=1
        local.get 4
        i32.const 3
        i32.add
        i32.const 17
        call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
        unreachable
        unreachable
      end
      local.get 4
      i32.const 32
      i32.store8 offset=31
      local.get 4
      i32.const 1701734764
      i32.store offset=27 align=1
      local.get 4
      i64.const 2338600898263348341
      i64.store offset=19 align=1
      local.get 4
      i64.const 7162263158133189730
      i64.store offset=11 align=1
      local.get 4
      i64.const 7018969289221893749
      i64.store offset=3 align=1
      local.get 4
      i32.const 3
      i32.add
      i32.const 29
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      i32.const 2403
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
      local.get 4
      i32.const 8250
      i32.store16 offset=3 align=1
      local.get 4
      i32.const 3
      i32.add
      i32.const 2
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      local.get 4
      i32.const 10
      i32.store8 offset=19
      local.get 4
      i64.const 7234307576302018670
      i64.store offset=11 align=1
      local.get 4
      i64.const 8028075845441778529
      i64.store offset=3 align=1
      local.get 4
      i32.const 3
      i32.add
      i32.const 17
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      unreachable
      unreachable
    )
    (func $fd_write (;16;) (type 7) (param i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i64)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 2
            i32.eqz
            br_if 0 (;@3;)
            loop ;; label = @4
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.tee 5
              br_if 2 (;@2;)
              local.get 1
              i32.const 8
              i32.add
              local.set 1
              local.get 2
              i32.const -1
              i32.add
              local.tee 2
              br_if 0 (;@4;)
            end
          end
          i32.const 0
          local.set 2
          local.get 3
          i32.const 0
          i32.store
          br 1 (;@1;)
        end
        local.get 1
        i32.load
        local.set 6
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  call $_ZN22wasi_snapshot_preview15State3ptr17hd4ae3330b90ac55eE
                  local.tee 1
                  i32.load
                  local.tee 2
                  i32.const 2147483647
                  i32.ge_u
                  br_if 0 (;@6;)
                  local.get 1
                  local.get 2
                  i32.const 1
                  i32.add
                  i32.store
                  local.get 1
                  i32.load offset=8
                  i32.const 560490357
                  i32.ne
                  br_if 1 (;@5;)
                  block ;; label = @7
                    block ;; label = @8
                      local.get 1
                      i32.const 65532
                      i32.add
                      i32.load
                      i32.const 560490357
                      i32.ne
                      br_if 0 (;@8;)
                      i32.const 8
                      local.set 2
                      local.get 1
                      i32.const 24
                      i32.add
                      i32.load16_u
                      local.get 0
                      i32.le_u
                      br_if 6 (;@2;)
                      block ;; label = @9
                        local.get 1
                        local.get 0
                        i32.const 48
                        i32.mul
                        i32.add
                        i32.const 32
                        i32.add
                        local.tee 0
                        i32.load
                        br_table 7 (;@2;) 0 (;@9;) 2 (;@7;) 7 (;@2;)
                      end
                      local.get 4
                      i32.const 16
                      i32.add
                      local.get 0
                      i32.const 8
                      i32.add
                      call $_ZN22wasi_snapshot_preview17Streams16get_write_stream17hc53dc202c6f56113E
                      block ;; label = @9
                        local.get 4
                        i32.load16_u offset=16
                        i32.eqz
                        br_if 0 (;@9;)
                        local.get 4
                        i32.load16_u offset=18
                        local.set 2
                        br 7 (;@2;)
                      end
                      local.get 4
                      local.get 4
                      i32.load offset=20
                      local.get 6
                      local.get 5
                      call $_ZN22wasi_snapshot_preview18bindings7wasi_io5write17h1687f6beba0bbfaeE
                      i32.const 29
                      local.set 2
                      local.get 4
                      i32.load
                      br_if 6 (;@2;)
                      local.get 4
                      i64.load offset=8
                      local.set 7
                      local.get 0
                      i32.const 40
                      i32.add
                      i32.load8_u
                      br_if 4 (;@4;)
                      local.get 0
                      i32.const 32
                      i32.add
                      local.tee 2
                      local.get 2
                      i64.load
                      local.get 7
                      i64.add
                      i64.store
                      br 4 (;@4;)
                    end
                    local.get 4
                    i32.const 32
                    i32.store8 offset=44
                    local.get 4
                    i32.const 1701734764
                    i32.store offset=40 align=1
                    local.get 4
                    i64.const 2338600898263348341
                    i64.store offset=32 align=1
                    local.get 4
                    i64.const 7162263158133189730
                    i64.store offset=24 align=1
                    local.get 4
                    i64.const 7018969289221893749
                    i64.store offset=16 align=1
                    local.get 4
                    i32.const 16
                    i32.add
                    i32.const 29
                    call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
                    i32.const 2391
                    call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
                    local.get 4
                    i32.const 8250
                    i32.store16 offset=16 align=1
                    local.get 4
                    i32.const 16
                    i32.add
                    i32.const 2
                    call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
                    local.get 4
                    i32.const 10
                    i32.store8 offset=32
                    local.get 4
                    i64.const 7234307576302018670
                    i64.store offset=24 align=1
                    local.get 4
                    i64.const 8028075845441778529
                    i64.store offset=16 align=1
                    local.get 4
                    i32.const 16
                    i32.add
                    i32.const 17
                    call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
                    unreachable
                    unreachable
                  end
                  local.get 6
                  local.get 5
                  call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print10wit_import17h8b995f35ebf123f0E
                  local.get 3
                  local.get 5
                  i32.store
                  br 3 (;@3;)
                end
                local.get 4
                i32.const 32
                i32.store8 offset=44
                local.get 4
                i32.const 1701734764
                i32.store offset=40 align=1
                local.get 4
                i64.const 2338600898263348341
                i64.store offset=32 align=1
                local.get 4
                i64.const 7162263158133189730
                i64.store offset=24 align=1
                local.get 4
                i64.const 7018969289221893749
                i64.store offset=16 align=1
                local.get 4
                i32.const 16
                i32.add
                i32.const 29
                call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
                i32.const 2389
                call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
                unreachable
                unreachable
              end
              local.get 4
              i32.const 32
              i32.store8 offset=44
              local.get 4
              i32.const 1701734764
              i32.store offset=40 align=1
              local.get 4
              i64.const 2338600898263348341
              i64.store offset=32 align=1
              local.get 4
              i64.const 7162263158133189730
              i64.store offset=24 align=1
              local.get 4
              i64.const 7018969289221893749
              i64.store offset=16 align=1
              local.get 4
              i32.const 16
              i32.add
              i32.const 29
              call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
              i32.const 2390
              call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
              local.get 4
              i32.const 8250
              i32.store16 offset=16 align=1
              local.get 4
              i32.const 16
              i32.add
              i32.const 2
              call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
              local.get 4
              i32.const 10
              i32.store8 offset=32
              local.get 4
              i64.const 7234307576302018670
              i64.store offset=24 align=1
              local.get 4
              i64.const 8028075845441778529
              i64.store offset=16 align=1
              local.get 4
              i32.const 16
              i32.add
              i32.const 17
              call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
              unreachable
              unreachable
            end
            local.get 3
            local.get 7
            i64.store32
          end
          i32.const 0
          local.set 2
        end
        local.get 1
        local.get 1
        i32.load
        i32.const -1
        i32.add
        i32.store
      end
      local.get 4
      i32.const 48
      i32.add
      global.set $__stack_pointer
      local.get 2
      i32.const 65535
      i32.and
    )
    (func $_ZN22wasi_snapshot_preview17Streams16get_write_stream17hc53dc202c6f56113E (;17;) (type 3) (param i32 i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      local.get 1
                      i32.load offset=8
                      i32.const 1
                      i32.eq
                      br_if 0 (;@8;)
                      local.get 1
                      i32.const 32
                      i32.add
                      i32.load8_u
                      br_table 3 (;@5;) 2 (;@6;) 1 (;@7;) 1 (;@7;) 2 (;@6;) 1 (;@7;)
                    end
                    local.get 0
                    local.get 1
                    i32.const 12
                    i32.add
                    i32.load
                    i32.store offset=4
                    i32.const 0
                    local.set 1
                    br 6 (;@1;)
                  end
                  local.get 0
                  i32.const 8
                  i32.store16 offset=2
                  br 3 (;@3;)
                end
                local.get 1
                i32.load offset=16
                local.get 2
                i32.const 8
                i32.add
                call $_ZN22wasi_snapshot_preview18bindings15wasi_filesystem17append_via_stream10wit_import17h6e24b4d9bec1d4d6E
                local.get 2
                i32.load8_u offset=8
                br_if 1 (;@4;)
                br 3 (;@2;)
              end
              local.get 1
              i32.load offset=16
              local.get 1
              i32.const 24
              i32.add
              i64.load
              local.get 2
              i32.const 8
              i32.add
              call $_ZN22wasi_snapshot_preview18bindings15wasi_filesystem16write_via_stream10wit_import17h392936cde63b6360E
              local.get 2
              i32.load8_u offset=8
              i32.eqz
              br_if 2 (;@2;)
              local.get 0
              local.get 2
              i32.load8_u offset=12
              call $_ZN22wasi_snapshot_preview1140_$LT$impl$u20$core..convert..From$LT$wasi_snapshot_preview1..bindings..wasi_filesystem..Errno$GT$$u20$for$u20$wasi..lib_generated..Errno$GT$4from17h663d2adbcb42b1d0E
              i32.store16 offset=2
              br 1 (;@3;)
            end
            local.get 0
            local.get 2
            i32.load8_u offset=12
            call $_ZN22wasi_snapshot_preview1140_$LT$impl$u20$core..convert..From$LT$wasi_snapshot_preview1..bindings..wasi_filesystem..Errno$GT$$u20$for$u20$wasi..lib_generated..Errno$GT$4from17h663d2adbcb42b1d0E
            i32.store16 offset=2
          end
          i32.const 1
          local.set 1
          br 1 (;@1;)
        end
        local.get 2
        i32.load offset=12
        local.set 3
        local.get 1
        i32.const 1
        i32.store offset=8
        local.get 0
        local.get 3
        i32.store offset=4
        local.get 1
        i32.const 12
        i32.add
        local.get 3
        i32.store
        i32.const 0
        local.set 1
      end
      local.get 0
      local.get 1
      i32.store16
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $proc_exit (;18;) (type 0) (param i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 0
      i32.const 0
      i32.ne
      call $_ZN22wasi_snapshot_preview18bindings9wasi_exit4exit17h203d4503a3fb3018E
      local.get 1
      i32.const 32
      i32.store8 offset=38
      local.get 1
      i32.const 1701734764
      i32.store offset=34 align=1
      local.get 1
      i64.const 2338600898263348341
      i64.store offset=26 align=1
      local.get 1
      i64.const 7162263158133189730
      i64.store offset=18 align=1
      local.get 1
      i64.const 7018969289221893749
      i64.store offset=10 align=1
      local.get 1
      i32.const 10
      i32.add
      i32.const 29
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      i32.const 1896
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
      local.get 1
      i32.const 8250
      i32.store16 offset=10 align=1
      local.get 1
      i32.const 10
      i32.add
      i32.const 2
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      local.get 1
      i32.const 2593
      i32.store16 offset=46 align=1
      local.get 1
      i32.const 1953069157
      i32.store offset=42 align=1
      local.get 1
      i64.const 2338537461596644384
      i64.store offset=34 align=1
      local.get 1
      i64.const 7957695015159098981
      i64.store offset=26 align=1
      local.get 1
      i64.const 7882825952909664372
      i64.store offset=18 align=1
      local.get 1
      i64.const 7599935561254793064
      i64.store offset=10 align=1
      local.get 1
      i32.const 10
      i32.add
      i32.const 38
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      unreachable
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview15State3new17hbc72603a22248accE (;19;) (type 2) (result i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 64
      i32.sub
      local.tee 0
      global.set $__stack_pointer
      block ;; label = @1
        call $get_allocation_state
        i32.const 2
        i32.ne
        br_if 0 (;@1;)
        i32.const 3
        call $set_allocation_state
        i32.const 0
        i32.const 0
        i32.const 8
        i32.const 65536
        call $realloc_via_memory_grow
        local.set 1
        i32.const 4
        call $set_allocation_state
        local.get 1
        i64.const 0
        i64.store offset=12 align=4
        local.get 1
        i32.const 560490357
        i32.store offset=8
        local.get 1
        i32.const 20
        i32.add
        i32.const 0
        i32.store
        local.get 1
        i64.const 0
        i64.store offset=65472 align=4
        local.get 1
        i32.const 0
        i32.store offset=65464
        local.get 1
        i32.const 0
        i32.store offset=65196
        local.get 1
        i32.const 0
        i32.store offset=65188
        local.get 1
        i64.const 0
        i64.store offset=65176 align=4
        local.get 1
        i32.const 0
        i32.store offset=6176
        local.get 1
        i32.const 65480
        i32.add
        i64.const 0
        i64.store align=4
        local.get 1
        i32.const 65488
        i32.add
        i64.const 0
        i64.store align=4
        local.get 1
        i32.const 65493
        i32.add
        i64.const 0
        i64.store align=1
        local.get 1
        i32.const 560490357
        i32.store offset=65532
        local.get 1
        i32.const 11822
        i32.store16 offset=65528
        local.get 1
        i32.const 0
        i32.store offset=65520
        local.get 1
        i32.const 0
        i32.store offset=65512
        local.get 1
        i32.const 0
        i32.store offset=65504
        local.get 1
        i32.const -1
        i32.store
        local.get 0
        i32.const 56
        i32.add
        i32.const 2
        i32.store8
        local.get 0
        i32.const 32
        i32.add
        i32.const 0
        i32.store
        local.get 0
        i32.const 0
        i32.store offset=24
        local.get 0
        i32.const 1
        i32.store offset=16
        local.get 1
        i32.const 32
        i32.add
        local.get 0
        i32.const 16
        i32.add
        i32.const 48
        call $memcpy
        drop
        local.get 1
        i32.const 1
        i32.store16 offset=24
        local.get 0
        i32.const 0
        i32.store offset=12
        local.get 0
        i32.const 0
        i32.store16 offset=8
        local.get 0
        i32.const 8
        i32.add
        call $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h99e6fff9e042e614E
        drop
        local.get 0
        i32.const 2
        i32.store offset=16
        block ;; label = @2
          block ;; label = @3
            local.get 1
            i32.load16_u offset=24
            local.tee 2
            i32.const 128
            i32.lt_u
            br_if 0 (;@3;)
            local.get 0
            i32.const 3145729
            i32.store offset=8
            local.get 0
            i32.const 16
            i32.add
            call $_ZN4core3ptr55drop_in_place$LT$wasi_snapshot_preview1..Descriptor$GT$17hfbf47c22913cb6c3E
            br 1 (;@2;)
          end
          local.get 1
          local.get 2
          i32.const 48
          i32.mul
          i32.add
          i32.const 32
          i32.add
          local.get 0
          i32.const 16
          i32.add
          i32.const 48
          call $memcpy
          drop
          local.get 1
          local.get 2
          i32.const 1
          i32.add
          i32.store16 offset=24
          local.get 0
          local.get 2
          i32.store offset=12
          local.get 0
          i32.const 0
          i32.store16 offset=8
        end
        local.get 0
        i32.const 8
        i32.add
        call $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h99e6fff9e042e614E
        drop
        local.get 0
        i32.const 2
        i32.store offset=16
        block ;; label = @2
          block ;; label = @3
            local.get 1
            i32.load16_u offset=24
            local.tee 2
            i32.const 128
            i32.lt_u
            br_if 0 (;@3;)
            local.get 0
            i32.const 3145729
            i32.store offset=8
            local.get 0
            i32.const 16
            i32.add
            call $_ZN4core3ptr55drop_in_place$LT$wasi_snapshot_preview1..Descriptor$GT$17hfbf47c22913cb6c3E
            br 1 (;@2;)
          end
          local.get 1
          local.get 2
          i32.const 48
          i32.mul
          i32.add
          i32.const 32
          i32.add
          local.get 0
          i32.const 16
          i32.add
          i32.const 48
          call $memcpy
          drop
          local.get 1
          local.get 2
          i32.const 1
          i32.add
          i32.store16 offset=24
          local.get 0
          local.get 2
          i32.store offset=12
          local.get 0
          i32.const 0
          i32.store16 offset=8
        end
        local.get 0
        i32.const 8
        i32.add
        call $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h99e6fff9e042e614E
        drop
        local.get 1
        local.get 1
        i32.load
        i32.const 1
        i32.add
        i32.store
        local.get 0
        i32.const 64
        i32.add
        global.set $__stack_pointer
        local.get 1
        return
      end
      local.get 0
      i32.const 32
      i32.store8 offset=44
      local.get 0
      i32.const 1701734764
      i32.store offset=40 align=1
      local.get 0
      i64.const 2338600898263348341
      i64.store offset=32 align=1
      local.get 0
      i64.const 7162263158133189730
      i64.store offset=24 align=1
      local.get 0
      i64.const 7018969289221893749
      i64.store offset=16 align=1
      local.get 0
      i32.const 16
      i32.add
      i32.const 29
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      i32.const 2434
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
      local.get 0
      i32.const 8250
      i32.store16 offset=16 align=1
      local.get 0
      i32.const 16
      i32.add
      i32.const 2
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      local.get 0
      i32.const 10
      i32.store8 offset=32
      local.get 0
      i64.const 7234307576302018670
      i64.store offset=24 align=1
      local.get 0
      i64.const 8028075845441778529
      i64.store offset=16 align=1
      local.get 0
      i32.const 16
      i32.add
      i32.const 17
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      unreachable
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E (;20;) (type 3) (param i32 i32)
      local.get 0
      local.get 1
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print10wit_import17h8b995f35ebf123f0E
    )
    (func $_ZN22wasi_snapshot_preview18bindings9wasi_exit4exit17h203d4503a3fb3018E (;21;) (type 0) (param i32)
      local.get 0
      call $_ZN22wasi_snapshot_preview18bindings9wasi_exit4exit10wit_import17h4d62d60c6af21881E
    )
    (func $_ZN22wasi_snapshot_preview18bindings7wasi_io5write17h1687f6beba0bbfaeE (;22;) (type 5) (param i32 i32 i32 i32)
      (local i32 i64 i64)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      local.get 1
      local.get 2
      local.get 3
      local.get 4
      call $_ZN22wasi_snapshot_preview18bindings7wasi_io5write10wit_import17h2b4c23e9f7f46b96E
      block ;; label = @1
        block ;; label = @2
          local.get 4
          i32.load8_u
          i32.eqz
          br_if 0 (;@2;)
          i64.const 1
          local.set 5
          br 1 (;@1;)
        end
        local.get 4
        i32.const 8
        i32.add
        i64.load
        local.set 6
        i64.const 0
        local.set 5
      end
      local.get 0
      local.get 6
      i64.store offset=8
      local.get 0
      local.get 5
      i64.store
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h99e6fff9e042e614E (;23;) (type 6) (param i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      block ;; label = @1
        local.get 0
        i32.load16_u
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.set 0
        local.get 1
        i32.const 32
        i32.add
        global.set $__stack_pointer
        local.get 0
        return
      end
      local.get 1
      i32.const 32
      i32.store8 offset=31
      local.get 1
      i32.const 1701734764
      i32.store offset=27 align=1
      local.get 1
      i64.const 2338600898263348341
      i64.store offset=19 align=1
      local.get 1
      i64.const 7162263158133189730
      i64.store offset=11 align=1
      local.get 1
      i64.const 7018969289221893749
      i64.store offset=3 align=1
      local.get 1
      i32.const 3
      i32.add
      i32.const 29
      call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
      i32.const 105
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
      unreachable
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview1140_$LT$impl$u20$core..convert..From$LT$wasi_snapshot_preview1..bindings..wasi_filesystem..Errno$GT$$u20$for$u20$wasi..lib_generated..Errno$GT$4from17h663d2adbcb42b1d0E (;24;) (type 6) (param i32) (result i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.set 1
      i32.const 6
      local.set 2
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      block ;; label = @9
                        block ;; label = @10
                          block ;; label = @11
                            block ;; label = @12
                              block ;; label = @13
                                block ;; label = @14
                                  block ;; label = @15
                                    block ;; label = @16
                                      block ;; label = @17
                                        block ;; label = @18
                                          block ;; label = @19
                                            block ;; label = @20
                                              block ;; label = @21
                                                block ;; label = @22
                                                  block ;; label = @23
                                                    block ;; label = @24
                                                      block ;; label = @25
                                                        block ;; label = @26
                                                          block ;; label = @27
                                                            block ;; label = @28
                                                              block ;; label = @29
                                                                block ;; label = @30
                                                                  block ;; label = @31
                                                                    block ;; label = @32
                                                                      block ;; label = @33
                                                                        block ;; label = @34
                                                                          block ;; label = @35
                                                                            block ;; label = @36
                                                                              block ;; label = @37
                                                                                block ;; label = @38
                                                                                  local.get 0
                                                                                  i32.const 255
                                                                                  i32.and
                                                                                  br_table 0 (;@38;) 37 (;@1;) 1 (;@37;) 2 (;@36;) 3 (;@35;) 4 (;@34;) 5 (;@33;) 6 (;@32;) 7 (;@31;) 8 (;@30;) 9 (;@29;) 10 (;@28;) 11 (;@27;) 12 (;@26;) 13 (;@25;) 14 (;@24;) 15 (;@23;) 16 (;@22;) 17 (;@21;) 18 (;@20;) 19 (;@19;) 20 (;@18;) 21 (;@17;) 22 (;@16;) 23 (;@15;) 24 (;@14;) 25 (;@13;) 26 (;@12;) 27 (;@11;) 28 (;@10;) 29 (;@9;) 30 (;@8;) 31 (;@7;) 32 (;@6;) 33 (;@5;) 34 (;@4;) 35 (;@3;) 36 (;@2;) 0 (;@38;)
                                                                                end
                                                                                local.get 1
                                                                                i32.const 2
                                                                                i32.store16 offset=14
                                                                                local.get 1
                                                                                i32.const 14
                                                                                i32.add
                                                                                local.set 0
                                                                                local.get 1
                                                                                i32.load16_u offset=14
                                                                                return
                                                                              end
                                                                              i32.const 7
                                                                              return
                                                                            end
                                                                            i32.const 8
                                                                            return
                                                                          end
                                                                          i32.const 10
                                                                          return
                                                                        end
                                                                        i32.const 16
                                                                        return
                                                                      end
                                                                      i32.const 19
                                                                      return
                                                                    end
                                                                    i32.const 20
                                                                    return
                                                                  end
                                                                  i32.const 22
                                                                  return
                                                                end
                                                                i32.const 25
                                                                return
                                                              end
                                                              i32.const 26
                                                              return
                                                            end
                                                            i32.const 27
                                                            return
                                                          end
                                                          i32.const 28
                                                          return
                                                        end
                                                        i32.const 29
                                                        return
                                                      end
                                                      i32.const 31
                                                      return
                                                    end
                                                    i32.const 32
                                                    return
                                                  end
                                                  i32.const 34
                                                  return
                                                end
                                                i32.const 35
                                                return
                                              end
                                              i32.const 37
                                              return
                                            end
                                            i32.const 43
                                            return
                                          end
                                          i32.const 44
                                          return
                                        end
                                        i32.const 46
                                        return
                                      end
                                      i32.const 48
                                      return
                                    end
                                    i32.const 51
                                    return
                                  end
                                  i32.const 52
                                  return
                                end
                                i32.const 54
                                return
                              end
                              i32.const 55
                              return
                            end
                            i32.const 56
                            return
                          end
                          i32.const 58
                          return
                        end
                        i32.const 59
                        return
                      end
                      i32.const 60
                      return
                    end
                    i32.const 61
                    return
                  end
                  i32.const 63
                  return
                end
                i32.const 64
                return
              end
              i32.const 69
              return
            end
            i32.const 70
            return
          end
          i32.const 74
          return
        end
        i32.const 75
        local.set 2
      end
      local.get 2
    )
    (func $_ZN97_$LT$core..option..Option$LT$T$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h61373a72f0df8506E (;25;) (type 9) (param i32 i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        local.get 0
        br_if 0 (;@1;)
        local.get 2
        i32.const 32
        i32.store8 offset=31
        local.get 2
        i32.const 1701734764
        i32.store offset=27 align=1
        local.get 2
        i64.const 2338600898263348341
        i64.store offset=19 align=1
        local.get 2
        i64.const 7162263158133189730
        i64.store offset=11 align=1
        local.get 2
        i64.const 7018969289221893749
        i64.store offset=3 align=1
        local.get 2
        i32.const 3
        i32.add
        i32.const 29
        call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print17h6ed9b087969beec9E
        i32.const 96
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E
        unreachable
        unreachable
      end
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 1
    )
    (func $_ZN22wasi_snapshot_preview16macros10eprint_u3217h9573f0a949689857E (;26;) (type 0) (param i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          local.get 0
          br_if 0 (;@2;)
          local.get 1
          i32.const 48
          i32.store8 offset=15
          local.get 1
          i32.const 15
          i32.add
          i32.const 1
          call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print10wit_import17h8b995f35ebf123f0E
          br 1 (;@1;)
        end
        local.get 0
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17h4fdf3065e0818ceaE.llvm.5080428440640351465
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17h4fdf3065e0818ceaE.llvm.5080428440640351465 (;27;) (type 0) (param i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      block ;; label = @1
        local.get 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.const 10
        i32.div_u
        local.tee 2
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17h4fdf3065e0818ceaE.llvm.5080428440640351465
        local.get 1
        local.get 0
        local.get 2
        i32.const 10
        i32.mul
        i32.sub
        i32.const 48
        i32.or
        i32.store8 offset=15
        local.get 1
        i32.const 15
        i32.add
        i32.const 1
        call $_ZN22wasi_snapshot_preview18bindings11wasi_stderr5print10wit_import17h8b995f35ebf123f0E
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $get_state_ptr (;28;) (type 2) (result i32)
      global.get $internal_state_ptr
    )
    (func $set_state_ptr (;29;) (type 0) (param i32)
      local.get 0
      global.set $internal_state_ptr
    )
    (func $get_allocation_state (;30;) (type 2) (result i32)
      global.get $allocation_state
    )
    (func $set_allocation_state (;31;) (type 0) (param i32)
      local.get 0
      global.set $allocation_state
    )
    (func $memcpy (;32;) (type 8) (param i32 i32 i32) (result i32)
      local.get 0
      local.get 1
      local.get 2
      call $_ZN17compiler_builtins3mem6memcpy17h27a47417b77282a1E
    )
    (func $_ZN17compiler_builtins3mem6memcpy17h27a47417b77282a1E (;33;) (type 8) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32)
      block ;; label = @1
        block ;; label = @2
          local.get 2
          i32.const 15
          i32.gt_u
          br_if 0 (;@2;)
          local.get 0
          local.set 3
          br 1 (;@1;)
        end
        local.get 0
        i32.const 0
        local.get 0
        i32.sub
        i32.const 3
        i32.and
        local.tee 4
        i32.add
        local.set 5
        block ;; label = @2
          local.get 4
          i32.eqz
          br_if 0 (;@2;)
          local.get 0
          local.set 3
          local.get 1
          local.set 6
          loop ;; label = @3
            local.get 3
            local.get 6
            i32.load8_u
            i32.store8
            local.get 6
            i32.const 1
            i32.add
            local.set 6
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            local.get 5
            i32.lt_u
            br_if 0 (;@3;)
          end
        end
        local.get 5
        local.get 2
        local.get 4
        i32.sub
        local.tee 7
        i32.const -4
        i32.and
        local.tee 8
        i32.add
        local.set 3
        block ;; label = @2
          block ;; label = @3
            local.get 1
            local.get 4
            i32.add
            local.tee 9
            i32.const 3
            i32.and
            local.tee 6
            i32.eqz
            br_if 0 (;@3;)
            local.get 8
            i32.const 1
            i32.lt_s
            br_if 1 (;@2;)
            local.get 9
            i32.const -4
            i32.and
            local.tee 10
            i32.const 4
            i32.add
            local.set 1
            i32.const 0
            local.get 6
            i32.const 3
            i32.shl
            local.tee 2
            i32.sub
            i32.const 24
            i32.and
            local.set 4
            local.get 10
            i32.load
            local.set 6
            loop ;; label = @4
              local.get 5
              local.get 6
              local.get 2
              i32.shr_u
              local.get 1
              i32.load
              local.tee 6
              local.get 4
              i32.shl
              i32.or
              i32.store
              local.get 1
              i32.const 4
              i32.add
              local.set 1
              local.get 5
              i32.const 4
              i32.add
              local.tee 5
              local.get 3
              i32.lt_u
              br_if 0 (;@4;)
              br 2 (;@2;)
            end
          end
          local.get 8
          i32.const 1
          i32.lt_s
          br_if 0 (;@2;)
          local.get 9
          local.set 1
          loop ;; label = @3
            local.get 5
            local.get 1
            i32.load
            i32.store
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            local.get 5
            i32.const 4
            i32.add
            local.tee 5
            local.get 3
            i32.lt_u
            br_if 0 (;@3;)
          end
        end
        local.get 7
        i32.const 3
        i32.and
        local.set 2
        local.get 9
        local.get 8
        i32.add
        local.set 1
      end
      block ;; label = @1
        local.get 2
        i32.eqz
        br_if 0 (;@1;)
        local.get 3
        local.get 2
        i32.add
        local.set 5
        loop ;; label = @2
          local.get 3
          local.get 1
          i32.load8_u
          i32.store8
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          local.get 5
          i32.lt_u
          br_if 0 (;@2;)
        end
      end
      local.get 0
    )
    (func $allocate_stack (;34;) (type 1)
      global.get $allocation_state
      i32.const 0
      i32.eq
      if ;; label = @1
        i32.const 1
        global.set $allocation_state
        i32.const 0
        i32.const 0
        i32.const 8
        i32.const 65536
        call $realloc_via_memory_grow
        i32.const 65536
        i32.add
        global.set $__stack_pointer
        i32.const 2
        global.set $allocation_state
      end
    )
    (global $__stack_pointer (;0;) (mut i32) i32.const 0)
    (global $internal_state_ptr (;1;) (mut i32) i32.const 0)
    (global $allocation_state (;2;) (mut i32) i32.const 0)
    (export "command" (func $command))
    (export "cabi_import_realloc" (func $cabi_import_realloc))
    (export "cabi_export_realloc" (func $cabi_export_realloc))
    (export "fd_write" (func $fd_write))
    (export "proc_exit" (func $proc_exit))
    (start $allocate_stack)
  )
  (core module (;2;)
    (type (;0;) (func (param i32 i32 i32 i32)))
    (type (;1;) (func (param i32 i64 i32)))
    (type (;2;) (func (param i32 i32)))
    (type (;3;) (func (param i32 i32)))
    (type (;4;) (func (param i32)))
    (type (;5;) (func (param i32 i32 i32 i32) (result i32)))
    (func $indirect-wasi-io-write (;0;) (type 0) (param i32 i32 i32 i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      i32.const 0
      call_indirect (type 0)
    )
    (func $indirect-wasi-filesystem-write-via-stream (;1;) (type 1) (param i32 i64 i32)
      local.get 0
      local.get 1
      local.get 2
      i32.const 1
      call_indirect (type 1)
    )
    (func $indirect-wasi-filesystem-append-via-stream (;2;) (type 2) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 2
      call_indirect (type 2)
    )
    (func $indirect-wasi-stderr-print (;3;) (type 3) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 3
      call_indirect (type 3)
    )
    (func $adapt-wasi_snapshot_preview1-proc_exit (;4;) (type 4) (param i32)
      local.get 0
      i32.const 4
      call_indirect (type 4)
    )
    (func $adapt-wasi_snapshot_preview1-fd_write (;5;) (type 5) (param i32 i32 i32 i32) (result i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      i32.const 5
      call_indirect (type 5)
    )
    (table (;0;) 6 6 funcref)
    (export "0" (func $indirect-wasi-io-write))
    (export "1" (func $indirect-wasi-filesystem-write-via-stream))
    (export "2" (func $indirect-wasi-filesystem-append-via-stream))
    (export "3" (func $indirect-wasi-stderr-print))
    (export "4" (func $adapt-wasi_snapshot_preview1-proc_exit))
    (export "5" (func $adapt-wasi_snapshot_preview1-fd_write))
    (export "$imports" (table 0))
  )
  (core module (;3;)
    (type (;0;) (func (param i32 i32 i32 i32)))
    (type (;1;) (func (param i32 i64 i32)))
    (type (;2;) (func (param i32 i32)))
    (type (;3;) (func (param i32 i32)))
    (type (;4;) (func (param i32)))
    (type (;5;) (func (param i32 i32 i32 i32) (result i32)))
    (import "" "0" (func (;0;) (type 0)))
    (import "" "1" (func (;1;) (type 1)))
    (import "" "2" (func (;2;) (type 2)))
    (import "" "3" (func (;3;) (type 3)))
    (import "" "4" (func (;4;) (type 4)))
    (import "" "5" (func (;5;) (type 5)))
    (import "" "$imports" (table (;0;) 6 6 funcref))
    (elem (;0;) (i32.const 0) func 0 1 2 3 4 5)
  )
  (core instance (;0;) (instantiate 2))
  (alias core export 0 "4" (core func (;0;)))
  (alias core export 0 "5" (core func (;1;)))
  (core instance (;1;)
    (export "proc_exit" (func 0))
    (export "fd_write" (func 1))
  )
  (core instance (;2;) (instantiate 0
      (with "wasi_snapshot_preview1" (instance 1))
    )
  )
  (alias core export 2 "memory" (core memory (;0;)))
  (alias core export 2 "_start" (core func (;2;)))
  (core instance (;3;)
    (export "_start" (func 2))
  )
  (core instance (;4;)
    (export "memory" (memory 0))
  )
  (alias core export 0 "0" (core func (;3;)))
  (alias export 1 "drop-input-stream" (func (;0;)))
  (core func (;4;) (canon lower (func 0)))
  (alias export 1 "drop-output-stream" (func (;1;)))
  (core func (;5;) (canon lower (func 1)))
  (core instance (;5;)
    (export "write" (func 3))
    (export "drop-input-stream" (func 4))
    (export "drop-output-stream" (func 5))
  )
  (alias core export 0 "1" (core func (;6;)))
  (alias core export 0 "2" (core func (;7;)))
  (alias export 2 "drop-descriptor" (func (;2;)))
  (core func (;8;) (canon lower (func 2)))
  (core instance (;6;)
    (export "write-via-stream" (func 6))
    (export "append-via-stream" (func 7))
    (export "drop-descriptor" (func 8))
  )
  (alias core export 0 "3" (core func (;9;)))
  (core instance (;7;)
    (export "print" (func 9))
  )
  (alias export 3 "exit" (func (;3;)))
  (core func (;10;) (canon lower (func 3)))
  (core instance (;8;)
    (export "exit" (func 10))
  )
  (core instance (;9;) (instantiate 1
      (with "__main_module__" (instance 3))
      (with "env" (instance 4))
      (with "wasi-io" (instance 5))
      (with "wasi-filesystem" (instance 6))
      (with "wasi-stderr" (instance 7))
      (with "wasi-exit" (instance 8))
    )
  )
  (alias core export 9 "cabi_export_realloc" (core func (;11;)))
  (alias core export 9 "cabi_import_realloc" (core func (;12;)))
  (alias core export 0 "$imports" (core table (;0;)))
  (alias export 1 "write" (func (;4;)))
  (core func (;13;) (canon lower (func 4) (memory 0)))
  (alias export 2 "write-via-stream" (func (;5;)))
  (core func (;14;) (canon lower (func 5) (memory 0)))
  (alias export 2 "append-via-stream" (func (;6;)))
  (core func (;15;) (canon lower (func 6) (memory 0)))
  (alias export 0 "print" (func (;7;)))
  (core func (;16;) (canon lower (func 7) (memory 0) string-encoding=utf8))
  (alias core export 9 "proc_exit" (core func (;17;)))
  (alias core export 9 "fd_write" (core func (;18;)))
  (core instance (;10;)
    (export "$imports" (table 0))
    (export "0" (func 13))
    (export "1" (func 14))
    (export "2" (func 15))
    (export "3" (func 16))
    (export "4" (func 17))
    (export "5" (func 18))
  )
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
)