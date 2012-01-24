;/****************************************************************************\
;|
;| Copyright (c) 2012, Dreglor's Creations
;| All rights reserved.
;| 
;| Redistribution and use in source and binary forms, with or without
;| modification, are permitted provided that the following conditions are met:
;|     * Redistributions of source code must retain the above copyright
;|       notice, this list of conditions and the following disclaimer.
;|     * Redistributions in binary form must reproduce the above copyright
;|       notice, this list of conditions and the following disclaimer in the
;|       documentation and/or other materials provided with the distribution.
;|     * Neither the name of the "Just Another Hobbyist Operating System" nor the
;|       names of its contributors may be used to endorse or promote products
;|       derived from this software without specific prior written permission.
;| 
;| THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
;| ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
;| WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
;| DISCLAIMED. IN NO EVENT SHALL "Dreglor's Creations" BE LIABLE FOR ANY
;| DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
;| (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
;| LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
;| ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
;| (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;| SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;|
;|-----------------------------------------------------------------------------
;|
;| Project: JAHOS
;| Author: Steven 'Dreglor' Garcia
;| Notes: _entry is offically the entry point but this code just prepares
;|	        for further stages
;|
;| Date: Jan 21, 2012
;|
;\****************************************************************************/

[BITS 16] ;the boot sector always starts in 16 bit mode

;linker exports
GLOBAL _entry ;entry point which will be placed at 0x7C00

;constants
STACK_SIZE EQU 0x1000 ;reserve 4k

SECTION .text ;this section hold the code that will prepare for the next stage

_entry:
	;set up segments and jump into _init
	MOV AX, 0x07C0
	MOV DS, AX ;data segment
	MOV ES, AX ;extra segment
	;code segment is already set
	
	;setup stack
	MOV AX, 0x0000
	MOV SS, AX
	MOV SP, stack + STACK_SIZE
	
	CLI
	HLT ;hold execute here indefinatly to show we are loaded
;;

SECTION .bsig ;this section must reside at 0x7DFE (2 bytes short of 0x7E00)
Signature:
DW 0xAA55

SECTION .bss ;should be some where in the 0x500 - 0x7BFF range
ALIGN 4
stack:
RESB STACK_SIZE ;reserve stack space and align it to DWord boundry for later 32bit


