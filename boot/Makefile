# Copyright (c) 2012, Dreglor's Creations
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the "Just Another Hobbyist Operating System" nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL "Dreglor's Creations" BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#Just Another Hobbyist Operating System Boot
#Make File

#Command Macros
ASM = nasm
CC = gcc
CPP = g++
LINK = ld
OBJCOPY = objcopy

#Path Macros
SRCDIR = ./src
INCDIR += -I. \
		  -I./inc
		  
OBJDIR = ./obj
OBJECTS = $(OBJDIR)/init.o

OUTDIR = ./bin
OUT = $(OUTDIR)/boot.bin

#parameters
DEFINE += 
AFLAGS += -f elf
LFLAGS += -T ./link.ld 
OFLAGS += --strip-debug -O binary -j .text -j .bsig

#Targets
build: $(OUT)
	
clean:
	rm -rf $(OUTDIR) $(OBJDIR)
	
#intermident targets
MKDR:
	mkdir -p $(OUTDIR) $(OBJDIR)

$(OUT): MKDR $(OBJECTS)
	$(LINK) $(LFLAGS) -o $(OUTDIR)/boot.elf $(OBJECTS)
	$(OBJCOPY) $(OFLAGS) $(OUTDIR)/boot.elf $(OUT) 
	
$(OBJDIR)/init.o: $(SRCDIR)/init.s
	$(ASM) $(AFLAGS) -o $@ $<

