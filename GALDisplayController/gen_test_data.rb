#! /usr/bin/env ruby

# Generate test VRAM data to exercise the simulation

CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()'

count=0

(0..29).each do |row|
  (0..79).each do |col|
    ch = CHARS[count % CHARS.length]
    attr = count % 256
    print ch.chr
    print attr.chr

    count += 1
  end
end
