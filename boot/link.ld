ENTRY(_entry)

SECTIONS
{
    . = 0x500;
    /**************************************************************
        Begin by describing low memory for general use
        0x500 to 0x7C00 is dropped in the file but still vaild
        to be used by .text or other executable sections.
    ***************************************************************/
    
    /* place uninitilized space here and stack is included */        
    .bss ALIGN(4) : 
    {
        *(.bss)
    }

    /******************************* 
        Sector 1
    ********************************/
    
	. = 0x7C00;
	.text ALIGN(1) : 
    {
        *(.text) /* bootloader code */
    }
    
    . = 0x7DFE;      /* pad or report error if we are not at or over the end of sector 1 */
    .bsig ALIGN(1) : 
    {
        *(.bsig)     /* place boot signiture */   
    }
}
