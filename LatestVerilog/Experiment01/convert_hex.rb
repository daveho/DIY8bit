#! /usr/bin/env ruby

# Convert hex font data into an array of PROGMEM bytes that
# the Arduino sketch can use to upload the font data to
# the display controller.

def format_character_data(ch_data)
  s = ''
  ch_data.each do |value|
    s += ' ' if s != ''
    s += value
    s += ','
  end
  return s
end

# character code to pixel data
data = {}

STDIN.each_line do |line|
  line.strip!

  m = /^([0-9A-F]{4}):([0-9A-F]{32})$/.match(line)
  raise "Invalid format?" if !m
  code = m[1].to_i(16)
  raise "Bad character code #{code}" if code < 0 || code > 255
  ch_data = []
  (0..15).each do |i|
    pixrow = m[2][i*2..(i*2)+1]
    ch_data.push("0x#{pixrow}")
  end
  data[code] = ch_data
end

puts "const PROGMEM uint8_t font_data[] = {"

data.keys.sort.each do |code|
  puts "  // character #{code}"
  puts "  #{format_character_data(data[code])}"
end

puts "};"
