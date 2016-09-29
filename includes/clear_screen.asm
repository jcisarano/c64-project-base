//clears the screen by writing spaces to every location onscreen
//also inits character color for each screen location

clear_scr:	ldx #$00
cls_loop:	lda #$020		//this is the character to write to each location on the screen, $20 is space	
			sta $0400,x			
			sta $0500,x		
			sta $0600,x		
			sta $06e8,x		//this overlaps the last row a bit to use only one loop 0-255 without going over into non-screen memory			
						
			lda #$00		//this is the color, values run from $00 to $0f and then roll over ($10 == $00)
			sta $d800,x		
			sta $d900,x	
			sta $da00,x	
			sta $dae8,x		//this overlaps, too
				
			inx			
			bne cls_loop			
			
			rts