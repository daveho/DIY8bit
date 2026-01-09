#! /usr/bin/env ruby

# This is not intended to be generally useful.

$mode = :scan
$code = nil
$bytes = nil

def start(code)
  $mode = :grab
  $code = code
  $bytes = []
end

def out
  raise "Wut?" if $bytes.length != 16

  printf('%04X:', $code)
  $bytes.each do |b|
    raise "Thlabber #{b}" if b < 0 || b > 255
    printf('%02X', b)
  end
  puts ''
  $mode = :scan
  $code = nil
  $bytes = nil
end

def data(line)
  val = 0
  line.each_char do |ch|
    val <<= 1
    if ch != '.'
      val |= 1
    end
  end
  $bytes.push(val)
end

STDIN.each_line do |line|
  line.strip!

  if $mode == :scan
    if m = /^0x([0-9a-f][0-9a-f]):/.match(line)
      start(m[1].to_i(16))
    end
  elsif $mode == :grab
    if line == ''
      out()
    else
      data(line)
    end
  end
end

out() if $mode == :grab
