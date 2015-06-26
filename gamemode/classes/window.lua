--[[
	--	Name: Window
	-- 	Auth: Aeomi
	-- 	Desc: Clientside Window class
--]]

Window = {}
Window.__index = Window

Window:create(x, y, w, h)
	local window = {
		_x = x,
		_y = y,
		_w = w,
		_y = y
	}
	
	setmetatable(window, Window)
	return window
end


function Window:update()
	
end

function Window:draw()

end
