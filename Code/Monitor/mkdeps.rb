#! /usr/bin/env ruby

def usage
  STDERR.puts "Usage: ./mkdeps.rb <target name> < <asm source>"
  STDERR.puts "       ./mkdeps.rb -v <variable name> < <asm source>"
end

mode = :target
if ARGV.length >= 1 && ARGV[0] == '-v'
  # Define a variable rather than 
  ARGV.shift
  mode = :var
end

raise  if ARGV.length != 1 
$name = ARGV[0]

$deps = []
$worklist = [['<STDIN>',STDIN]]
$processed = {}

def scan(f)
  f.each_line do |line|
    line.strip!
    if m = /^\s*INCLUDE "(.*)"$/.match(line)
      filename = m[1]
      if !$processed.has_key?(filename)
        $deps.push(filename)
        #puts "adding #{filename} to worklist"
        $worklist.push([filename, nil])
      end
    end
  end
end

while !$worklist.empty?
  item = $worklist.shift
  #puts "removed #{item[0]} from worklist"
  #puts "$processed=#{$processed}"
  filename = item[0]
  if !$processed.has_key?(filename)
    #puts "not processed yet, initiate scan"
    item[1] = File.open(filename) if item[1].nil?
    scan(item[1])
    $processed[filename] = 1
  end
end

print (mode == :target) ? "#{$name}:" : "#{$name} ="
$deps.each do |dep|
  print " \\\n\t#{dep}"
end
puts ''
