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

function find_biome_root(file_path)
    -- Extract the directory from the file path
    local current_dir = vim.fn.fnamemodify(file_path, ":p:h")

    while current_dir do
        -- Use shell command to check for package.json
        local biome_json_path = current_dir .. "/biome.json"
        local exists = vim.fn.system("test -f " .. biome_json_path .. " && echo 'exists' || echo ''")

        if vim.trim(exists) == "exists" then
            return current_dir
        end

        -- Move to parent directory
        local parent_dir = current_dir:match("(.+)/[^/]+$")
        if not parent_dir or parent_dir == current_dir then
            -- Root directory reached
            return nil
        end
        current_dir = parent_dir
    end
end
