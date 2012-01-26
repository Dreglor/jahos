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
;| Notes: some assembler functions that are required in our C bootloader
;|	        for further stages
;|
;| Date: Jan 24, 2012
;|
;\****************************************************************************/

[BITS 16]

;export the symbol
GLOBAL putc

SECTION .text

;put a character onto the screen
putc:  
    PUSH BP
    MOV BP, SP
    PUSHA
    MOV AL, BYTE [BP + 6] ;get character passed to us
    MOV AH, 0x0E ;set BIOS function
    XOR BX, BX ;clear attribute
    INT 0x10 ;call BIOS
    POPA
    POP BP
    RET
;;
