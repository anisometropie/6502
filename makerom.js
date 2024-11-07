const { Buffer } = require('node:buffer');
const fs = require('fs')
const { exec } = require('child_process');

const program = [
  // we first set all lines of Port B as output
  // by giving %11111111 to Data Direction Register B
  0xa9, 0b11111111, // lda #%11111111
  0x8d, 0x02, 0x60, // sta $6002

  0xa9, 0b10000000,
  0x8d, 0x00, 0x60,
  0xa9, 0b01000000,
  0x8d, 0x00, 0x60,
  0xa9, 0b00100000,
  0x8d, 0x00, 0x60,
  0xa9, 0b00010000,
  0x8d, 0x00, 0x60,
  0xa9, 0b00001000,
  0x8d, 0x00, 0x60,
  0xa9, 0b00000100,
  0x8d, 0x00, 0x60,
  0xa9, 0b00000010,
  0x8d, 0x00, 0x60,
  0xa9, 0b00000001,
  0x8d, 0x00, 0x60,

  0x4c, 0x05, 0x80
];

const rest = Array.from({ length: 0x8000 - program.length }).map(() => 0xea);
const rom = [...program, ...rest];

rom[0x7ffc] = 0x00 // 0xfffc
rom[0x7ffd] = 0x80 // 0xfffd

const buffer = Buffer.from(rom);

fs.writeFile('rom.bin', buffer, 'binary', (err) => {
  if (err) {
    console.log(err);
  } else {
    console.log('file generated\n')
    exec('hexdump -C rom.bin', (err, stdout) => {
      console.log(stdout)
    });
  }
})