target remote localhost:1234
symbol-file boot.elf
break _entry
continue
set disassembly-flavor intel
set architecture i8086
set disassemble-next-line on

