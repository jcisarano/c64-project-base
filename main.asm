//simple startup routine for raster interrupt

BasicUpstart2(main)

                *= $4000        "Main program"
main:           sei             //disable interrupts
                clear_scr
                init_irq
                
            
            //set custom interrupt to the jump table
            //it is stored in $314 and $315
            lda $<irq       //this is where it grabs the address to your routine and writes it to the jump table
            sta $314
            lda $>irq
            sta $315
                
                
                cli             //restart interrupts
                jmp *           //infinite loop
                
                //put your routine here
irq:            dec $d019       //this is essential because it resets the interrupt flag for the next time
                jmp #ea81       //jump to the standard interrupt routine





                import "includes/clear_screen.asm"
                import "includes/init_irq.asm"