--[[
    --  Name: Text Field
    --  Auth: Aeomi
    --  Desc: Menu/ A field that allows the user to enter text
--]]

include("a-rp/gamemode/classes/cl_menu_element.lua")


TextField = TextField or {}
TextField.__index = TextField
setmetatable(TextField, {__index = Element})

TextField.create = function(x, y, w, h)
    local textField = {elm = vgui.Create("DTextEntry")} -- TODO: change to textentry (do for all)
    textField.elm:SetPos(x, y)
    textField.elm:SetSize(w, h)

    setmetatable(textField, TextField)
    return textField
end

function TextField:setText(text)
    self.elm:SetText(text)
end

function TextField:setActionOnEnter(func)
    self.elm.OnEnter = func
end

function TextField:getValue()
    return self.elm:GetValue()
end

function TextField:editable(bool)
    self.elm:SetEditable(bool)
end
