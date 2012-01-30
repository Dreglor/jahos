ENTRY(_entry)

SECTIONS
{
   
    /**************************************************************
        Begin by describing low memory for general use
        0x500 to 0x7C00 is dropped in the file but still vaild
        to be used by .text or other executable sections.
    ***************************************************************/
    
    . = 0x500;
    /* place uninitilized space here and stack is included */        
    .bss ALIGN(4) : 
    {
        
        __STACK = .; /*define a stack symbol so we can point to it */
        . += 0x1000; /*reserve 4k for the stack */
        __STACK_END = .;
        *(COMMON)
        *(.bss)
    }
    
    /* 
       data is stored here however any data must be set from the text section (code) 
       any data that is initilized will be placed here and dropped from the file
    */ 
    .data ALIGN(4) :
    {
        *(.data)
    }

    /******************************* 
        Sector 1
    ********************************/
    
	. = 0x7C00; /* start at 0x7C00 */
    .text : AT(0x7C00) 
    {
        *(.init)     /* runtime setup */
        *(.text)     /* C code */
        *(.rodata*)  /* const strings */
    }
        
    . = 0x7DFE; /* make sure we pad to the signiture */
    .bsig : AT(0x7DFE)
    {
        SHORT(0xAA55); /* place boot signiture */ 
    }
    
    /* throw away unneeded sections */
    /DISCARD/ : 
    {
        *(.comment) 
        *(.eh_frame) /* runtime exception support will be thrown out */
    }
}
