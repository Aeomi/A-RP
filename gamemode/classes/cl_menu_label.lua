--[[
    --  Name: Label
    --  Auth: Aeomi
    --  Desc: Menu: Label
--]]

_G.Label = nil -- Overwrite default definition

include("a-rp/gamemode/classes/cl_menu_element.lua")


Label = {}
Label.__index = Label
setmetatable(Label, {__index = Element})

Label.create = function(x, y, w, h, text)
    local label = {elm = vgui.Create("DLabel")}
    label.elm:SetPos(x, y)
    label.elm:SetSize(w, h)
    label.elm:SetText(text)
    --label.elm.Visible(true)
    setmetatable(label, Label)
    return label
end

function Label:setText(text)
    self.elm:SetText(text)
end

function Label:setTextColour(color)
    self.elm:SetTextColor(color)
end
