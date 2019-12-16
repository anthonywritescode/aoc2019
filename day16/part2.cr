if ARGV.empty?
    puts "usage: #{__FILE__} FILENAME"
    exit 1
end

contents = File.read(ARGV[0]).strip
ints = contents.chars.map(&.to_i) * 10000
offset = contents[0...7].to_i

100.times do
  partial = ints[offset..-1].sum
  (offset...ints.size).to_a.each do |e|
    numb = partial
    partial -= ints[e]
    ints[e] = numb.abs % 10
  end
end

puts ints[offset...offset+8].join("")
