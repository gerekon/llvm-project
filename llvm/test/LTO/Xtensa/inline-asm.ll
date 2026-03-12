; Check that we don't crash on target-specific inline asm directives.
;
; RUN: llvm-as < %s > %t
; RUN: llvm-lto -mcpu=esp32 -o /dev/null %t

target triple = "xtensa"

module asm ".text"

module asm "addi.n a2, a3, 2"

define i32 @test(i32 %a) #0 {
  ret i32 %a
}

attributes #0 = { "target-cpu"="esp32" }
