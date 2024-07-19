#! /usr/bin/env ruby

raise "Usage: ./mkdeps.rb <make var name> < <asm source>" if ARGV.length != 1 
varname = ARGV[0]

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

print "#{varname} = "
$deps.each do |dep|
  print " \\\n\t#{dep}"
end
puts ''
