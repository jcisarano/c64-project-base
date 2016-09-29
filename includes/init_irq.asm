//initizes a custom raster interrupt routine which you should call "irq"
//you should stop interrupts by calling sei some time before calling this routine
//and then cli after to restart them

            //turn off existing timer interrupts
            //and clear out unprocessed items in queue
    init_irq:	ldy #$7f
            sty $dc0d		//disable the CIA timer interrupts
            sty $dd0d		//disable the cursor & keyboard interrupt
            lda $dc0d		//now read the same two registers to stop pending irqs
            lda $dd0d		
            
            //set the interrupt request mask
            lda #$01		//$01 indicates irq by raster
            sta $d01a

            //set the raster line the interrupt occurs on
            //it is stored in $d012 and $d011
            lda $00			//this is the raster line number to use
            sta $d012
            lda $d011		//also turn off the high bit here 
            and #$7f		//by getting the current value then "and"-ing it with 01111111
            sta $d011		//and putting it back