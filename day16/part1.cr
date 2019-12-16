if ARGV.empty?
  puts "usage: #{__FILE__} FILENAME"
  exit 1
end

ints = File.read(ARGV[0]).strip.chars.map(&.to_i)

PATTERN = [0, 1, 0, -1]

100.times do
  next_ints = [] of Int32

  (0...ints.size).each do |idx|
    pattern = [] of Int32
    [0, 1, 0, -1].each do |i|
      (0..idx).each do
        pattern << i
      end
    end

    sum = 0
    pattern.cycle.skip(1).each_with_index do |y,i|
      if i >= ints.size
        break
      end
      sum += y * ints[i]
    end
    next_ints << sum.abs % 10
  end
  ints = next_ints
end

puts ints.first(8).join("")
