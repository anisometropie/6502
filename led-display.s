PORTB = $6000
PORTA = $6001
DDRB = $6002
DDRA = $6003

  ; where we are in memory
  .org $8000

reset:
  ; Data Direction Register B
  lda #%11111111
  sta DDRB
  ; Data Direction Register A
  lda #%11100000
  sta DDRA

  lda #%00000000 ; select instruction register & write
  sta PORTA

  lda #%00111000
  sta PORTB

  .org $fffc
  .word reset
  .word $0000


