  ; where we are in memory
  .org $8000

  ; we first set all lines of Port B as output
  ; by giving %11111111 to Data Direction Register B
reset:
  lda #%11111111
  sta $6002

loop:
  lda #%10000000
  sta $6000
  lda #%01000000
  sta $6000
  lda #%00100000
  sta $6000
  lda #%00010000
  sta $6000
  lda #%00001000
  sta $6000
  lda #%00000100
  sta $6000
  lda #%00000010
  sta $6000
  lda #%00000001
  sta $6000

  ; instead of writing jmp $8005, assembler will calculate the address of the label for us
  jmp loop

  .org $fffc
  .word reset
  .word $0000


