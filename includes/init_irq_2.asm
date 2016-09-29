//another way to set up raster interrupt - maybe a little cleaner?
//same as before, the custom routine should be called "irq"

//TODO: testing, find out if this is truly equivalent to the other init_irq

				//stop the timer interrupt (the CIA timer)
init_irq2:		lda #$7f		//$7f equals %01111111
				sta $dc0d
				
				//set the raster line where the interrupt will occur
				and $d011		//first zero out the most significant bit (uses the $7f mask from above)
				sta $d011
				lda #$d2		//this is the line the interrupt will occur on - $d2 == 210
				sta $d012
				
				lda $01			//tell it to use raster interrupt
				sta $d01a
				
				rts
