  ; Here we talk to the 65c22. set Port B pinsas output
  ; then we write %10000000 to port B
  ; where we are in memory
  .org $8000

reset:
  ; $6000 to 600F are connected to register select pins RS0, RS1, RS2, RS3
  ; set all pins of Port B as output
  ; by giving %11111111 to Data Direction Register B
  lda #%11111111
  sta $6002

  lda #%10000000
  sta $6000

loop:
  ror
  sta $6000

  ; instead of writing jmp $8005, assembler will calculate the address of the label for us
  jmp loop

  .org $fffc
  .word reset
  .word $0000


