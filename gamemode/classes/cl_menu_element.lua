--[[
	--	Name: Element
	-- 	Auth: Aeomi
	-- 	Desc: Menu element is the base class for all deriving menu features
--]]

//include("a-rp/gamemode/arp/client/cl_arp_menu.lua")

Element = {}
Element.__index = Element

-- -- -- --

function Element:destroy()
	self.elm:Remove()
end

function Element:getPos()
	local x, y = self.elm:GetPos()
	return {x=x, y=y}
end

function Element:setPos(x, y)
	self.elm:SetPos(x, y)
end

function Element:setParent(parent)
	self.elm:SetParent(parent.elm)
end

function Element:shown(bool)
	if bool and self.elm:IsVisible() then return end
	if bool and !self.elm:IsVisible() then
		self.elm:SetVisible(bool)
		self.elm:MakePopup()	-- This brings the frame to the front; remove if undesired
	end
end

function Element:style(func)
	self.elm.Paint = func
end

function Element:clicked(func)
	self.elm.OnMousePressed = func
end
