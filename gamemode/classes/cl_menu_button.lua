--[[
    --  Name: Button
    --  Auth: Aeomi
    --  Desc: Menu: Button
--]]

include("a-rp/gamemode/classes/cl_menu_element.lua")


Button = Button or {}
Button.__index = Button
setmetatable(Button, {__index = Element})

Button.create = function(x, y, w, h)
    local button = {elm = vgui.Create("DButton")}
    button.elm:SetPos(x, y)
    button.elm:SetSize(w, h)
    button.elm:SetVisible(true)

    setmetatable(button, Button)
    return button
end

-- -- -- --

-- External modifications
function Button:clicked(func)
    self.elm.DoClick = func
end

function Button:setText(text)
    self.elm:SetText(text)
end

function Button:setTextColour(color)
    self.elm:SetTextColor(color)
end
