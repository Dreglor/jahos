set disassembly-flavor intel
target remote localhost:1234
symbol-file boot.elf
break _entry
