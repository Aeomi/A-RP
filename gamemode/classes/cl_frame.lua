--[[
	--	Name: Frame
	-- 	Auth: Aeomi
	-- 	Desc: Clientside Window class
--]]

include("a-rp/gamemode/classes/cl_element.lua")	-- might not need this at all


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

function Frame:destroy()
	self.elm:Remove()
end

-- External modifications
function Frame:getPos()
	local x, y = self.elm:GetPos()
	return {x=x, y=y}
end

function Frame:setPos(x, y)
	self:SetPos(x, y)
end

function Frame:canDrag(bool)
	self.elm:SetDraggable(bool)
end

function Frame:canClose(bool)
	self.elm:ShowCloseButton(bool)
end

function Frame:setTitle(title)
	self.elm:SetTitle(title)
end

function Frame:setParent(parent)
	self.elm:SetParent(parent)
end

function Frame:shown(bool)
	if bool and self.elm:IsVisible() then return end
	if bool and !self.elm:IsVisible() then
		self.elm:SetVisible(bool)
		self.elm:MakePopup()	-- This brings the frame to the front; remove if undesired
	end
end

function Frame:style(func)
	self.elm.Paint = func
end

function Frame:clicked(func)
	self.elm.OnMousePressed = func
end
