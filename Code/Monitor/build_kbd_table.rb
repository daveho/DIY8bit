#! /usr/bin/env ruby

SPECIAL = {
  'SPACE' => 32,      # space key
  'RETURN' => 10,     # return key, generates newline
  # TODO: encodings for other special keys
}

def translate(item)
  if item.length == 1
    return item.ord
  else
    if SPECIAL.has_key?(item)
      # translate special key code
      return SPECIAL[item]
    else
      # this is a special key that doesn't have a direct encoding
      # in ASCII, so for now, just return '?'
      return '?'.ord
    end
  end
end

non_shifted = [0] * 64
shifted = [0] * 64

column = nil
row = nil

STDIN.each_line do |line|
  line.strip!
  if m = /^column (\d+)/.match(line)
    column = m[1].to_i
    row = 0
  elsif line != ''
    index = column*8 + row
    items = line.split(/\s+/)
    #puts ";; column=#{column}, row=#{row}, items=#{items.join(',')}"
    non_shifted[index] = translate(items[0])
    shifted[index] = translate(items.length == 2 ? items[1] : items[0])
    row += 1
  end
end

puts "keycode_not_shifted"
non_shifted.each do |code|
  puts "\tFCB #{code}"
end

puts ""

puts "keycode_shifted"
shifted.each do |code|
  puts "\tFCB #{code}"
end
