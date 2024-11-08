PORTB = $6000
PORTA = $6001
DDRA = $6003 ; Data Direction Register A
DDRB = $6002 ; Data Direction Register B

E = %10000000
RW = %01000000
RS = %00100000

  ; where we are in memory
  .org $8000

reset:
  ; setup A and B as output
  ; PORT A
  ; 7 = E
  ; 6 = RW
  ; 5 = RS 
  lda #%11100000
  sta DDRA

  lda #%11111111
  sta DDRB

  ; ==== setup lcd ====
  ; clear E/RW/RS
  lda #0
  sta PORTA

  ; 8-bit mode; 2-line display; 5x8 font
  lda #%00111000
  sta PORTB

  lda #E
  sta PORTA

  lda #0
  sta PORTA

  ; display on; cursor on; blinking cursor off;
  lda #%00001110
  sta PORTB

  lda #E
  sta PORTA

  lda #0
  sta PORTA ; display on after PORTA back to 0

  ; increment address and not shifted when writing
  lda #%00000110
  sta PORTB

  lda #E
  sta PORTA

  lda #0
  sta PORTA

  ; Write A
  lda #"A"
  sta PORTB

  lda #(RS | E)
  sta PORTA

  lda #0
  sta PORTA

  ; Write n
  lda #"n"
  sta PORTB

  lda #(RS | E)
  sta PORTA

  lda #0
  sta PORTA

  ; Write d
  lda #"d"
  sta PORTB

  lda #(RS | E)
  sta PORTA

  lda #0
  sta PORTA

  ; Write y
  lda #"y"
  sta PORTB

  lda #(RS | E)
  sta PORTA

  lda #0
  sta PORTA


  .org $fffc
  .word reset
  .word $0000


