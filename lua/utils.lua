function string.startswith(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function copyFile(inFilePath, outFilePath)
  infile = io.open(inFilePath, "r")
  instr = infile:read("*a")
  infile.close()

  outfile = io.open(outFilePath, "w")
  outfile:write(instr)
  outfile:close()
end

function readFileAsString(inFilePath)
  infile = io.open(inFilePath, "r")
  instr = infile:read("*a")
  infile.close()
  return instr
end

local function secureRand()
  local urandom = assert(io.open('/dev/urandom', 'rb'))
  local res = 0
  for i = 1, 8 do
    local r = urandom:read(1):byte(1)
    res = res * 256 + r
  end
  urandom:close()
  return res
end
function uuid()
  math.randomseed(secureRand(), secureRand())
  local template ='RRRRRRRR-RRRR-4RRR-rRRR-RRRRRRRRRRRR'
  return string.gsub(template, '[Rr]', function (c)
    return string.format('%x', (c == 'R') and math.random(0, 0xf) or math.random(8, 0xb))
  end)
end
