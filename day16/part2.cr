if ARGV.empty?
    puts "usage: #{__FILE__} FILENAME"
    exit 1
end

contents = File.read(ARGV[0]).strip
ints = contents.chars.map(&.to_i) * 10000
offset = contents[0...7].to_i
ints = ints[offset..]

100.times do
  restsum = ints.sum
  ints.each_with_index do |num,i|
    ints[i] = restsum.abs % 10
    restsum -= num
  end
end

puts ints[...8].join("")
