--[[
	--	Name: Frame
	-- 	Auth: Aeomi
	-- 	Desc: Menu: Frame
--]]

include("a-rp/gamemode/classes/cl_menu_element.lua")


Frame = Frame or {}
Frame.__index = Frame
setmetatable(Frame, {__index = Element})

Frame.create = function(x, y, w, h)
	local frame = {elm = vgui.Create("DFrame")}
	frame.elm:SetPos(x, y)
	frame.elm:SetSize(w, h)
	frame.elm:SetVisible(true)

	setmetatable(frame, Frame)
	return frame
end

-- -- -- --

-- External modifications
function Frame:canDrag(bool)
	self.elm:SetDraggable(bool)
end

function Frame:canClose(bool)
	self.elm:ShowCloseButton(bool)
end

function Frame:setTitle(title)
	self.elm:SetTitle(title)
end
