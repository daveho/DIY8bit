#! /usr/bin/env ruby

# Read tms9918a_font.txt and output an assembly language module
# with the encoded font data for ASCII values 0-127.
# Each character requires 8 bytes (one byte for each line),
# so the entire font will occupy 1K of ROM space.

data = []

# For now, character codes 0-31 are just empty
(32*8).times do
  data.push(0)
end

# Read font data

File.open('tms9918a_font.txt') do |f|
  f.each_line do |line|
    next if /^#/.match(line)
    next if /^\s*$/.match(line)

    bytes = line.split(/,/)
    raise "Huh?" if bytes.length != 8

    bytes.each do |b|
      raise "Wut?" if !b.start_with?('0x')
      val = b[2..-1].to_i(16)
      data.push(val)
    end
  end
end

#puts "#{data.length} thingies"
raise "Wrong number of bytes?" if data.length != 1024

File.open('tms9918a_font.asm', 'w') do |outf|
  outf.puts ";; TMS9918A text font"
  outf.puts ";; Shamelessly stolen from Dr. Volt:"
  outf.puts ";;   https://github.com/michalin/TMS9918_Arduino/blob/main/src/patterns.h"
  outf.puts ""
  outf.puts "tms9918a_font"

  i = 0
  while i < 1024
    ch_data = []
    8.times do
      ch_data.push("$#{data[i].to_s(16).upcase}")
      i += 1
    end
    outf.puts "\tFCB #{ch_data.join(', ')}"
  end

  outf.puts ""
  colon = ':'
  outf.puts ";; vim#{colon}ft=asm6809#{colon}"
end
