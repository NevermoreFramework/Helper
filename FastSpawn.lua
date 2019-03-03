-- Spawns a new thread without waiting one step

local ArgsBindable = Instance.new("BindableEvent")
local VoidBindable = Instance.new("BindableEvent")

ArgsBindable.Event:Connect(function(callback, argsPointer)
	callback(argsPointer())
end)
VoidBindable.Event:Connect(function(callback)
	callback()
end)

local function FastSpawn(Func, ...)
    --- Spawns a new thread to run a function on without waiting one step
    -- @param function Func The function to run on a new thread
	-- @{...} parameters to pass to Func

	if ... ~= nil then
		local t = {...}
		local pointer = function() return unpack(t) end
		ArgsBindable:Fire(Func, pointer)
	else
		VoidBindable.Fire(Func)
	end
end

return FastSpawn
