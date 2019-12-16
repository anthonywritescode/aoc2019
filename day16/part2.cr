if ARGV.empty?
    puts "usage: #{__FILE__} FILENAME"
    exit 1
end

contents = File.read(ARGV[0]).strip
ints = contents.chars.map(&.to_i) * 10000
offset = contents[0...7].to_i

PATTERN = [0, 1, 0, -1]

(0...100).each do |i|
    sums = [ints[-1]]
    ints[offset...-1].reverse.each do |n|
        sums.push(sums[-1] + n)
    end
    sums = [0] * offset + sums.reverse

    next_ints = ints[0...offset]
    (offset...ints.size).each do |idx|
        next_ints.push(sums[idx].abs % 10)
    end
    ints = next_ints
end
ints[offset...offset+8].each do |n|
    print n
end
puts
