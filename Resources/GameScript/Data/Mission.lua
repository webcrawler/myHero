DATA_Mission = {}

local _data

function DATA_Mission:set(data)
	_data = data
	dump(data)
end

function DATA_Mission:get(...)
	local result = _data
	for i = 1, arg["n"] do
		result = result[arg[i]]
		if not result then
--			dump(_data[arg[1]])
--			dump(arg)		
			print(arg[i],"取到resut为空")
			break
		end
	end
	return result
end