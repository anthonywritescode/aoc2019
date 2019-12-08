if #arg ~= 1 then
  print(string.format("usage: %s FILENAME", arg[0]))
  os.exit(1)
end

local fh = assert(io.open(arg[1], "r"))
local contents = assert(fh:read("a"))
fh:close()

for y=0,5 do
  for x=0,24 do
    for layer=0,99 do
      local i = 1 + (6 * 25 * layer) + (25 * y) + x
      local c = contents:sub(i,i)
      if c ~= "2" then
        c = c:gsub("0", " ")
        io.write(c)
        break
      end
    end
  end
  io.write("\n")
end
