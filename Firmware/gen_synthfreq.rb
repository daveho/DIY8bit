#! /usr/bin/env ruby

# This Ruby script reads synthkeys.txt (from standard input) and outputs
# an assembly language table of fine and rough frequency register values
# for the appropriate note.

# Frequency of C3
C3_FREQ = 2.0**((48 - 69) / 12.0) * 440.0

# Pairs of fine and rough frequency values corresponding to each
# keyboard scan code. (These are initially all set to 0, so that
# keys not mapped to a note can be ignored.)
regvals = Array.new(64, [0, 0])

# Covert a note code (which is represented as number of semitones above C3)
# into a frequency
def note_freq(note)
  return (2.0**(note/12.0)) * C3_FREQ
end

STDIN.each_line do |line|
  line.strip!
  next if (line == '' or /^\s*#/.match(line))

  raise "Invalid line #{line}" if !(m = /^(\d+),(\d+),(\d+)$/.match(line))

  column = m[1].to_i
  row = m[2].to_i
  note = m[3].to_i

  scancode = (column << 3) | row

  freq = note_freq(note)

  # TODO: compute actual YM2149F frequency register values

  puts "scancode=#{scancode}, column=#{column}, row=#{row}, freq=#{freq}"
end
