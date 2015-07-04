include("a-rp/gamemode/classes/cl_menu_frame.lua")
include("a-rp/gamemode/classes/cl_menu_button.lua")
include("a-rp/gamemode/arp/sh_arp_log.lua")

ARP.menu = ARP.menu or {
    instances = {}
}

/*
    -   Calling a menu->create function will insert it into the instances table;
        registered with its instance ID.

    -   When a menu instance is no longer needed,
        it must be destroyed via calling destroy upon the instance member.
*/

ARP.menu.createFrame = function(insId, title, x, y, width, height, parent)
    if (ARP.menu.instances[insId] != nil) then ARP.menu.instances[insId]:destroy() end

    local frame = Frame.create(x, y, width, height)
    frame.id = insId
    frame:setTitle(title)
    if (parent) then frame:setParent(parent) end
    frame:shown(true)

    ARP.menu.instances[insId] = frame
    return frame
end


ARP.menu.createButton = function(insId, text, x, y, width, height, parent)
    if (ARP.menu.instances[insId] != nil) then ARP.menu.instances[insId]:destroy() end

    local button = Button.create(x, y, width, height)
    button.id = insId
    if (parent) then button:setParent(parent) end   -- CHANGE THIS TO INS ID
    button:setText(text)

    ARP.menu.instances[insId] = button
    return button
end

ARP.menu.getInstance = function(insId)
    local ins = ARP.menu.instances

    if ins[insId] != nil then
        return ins[insId]
    else
        ARP.log.err("[ARP/Menu/getInstance] Attempted to retrieve a null instance from [ARP/Menu/Instances]")
        return false
    end
end

ARP.menu.destroyInstance = function(insId)
    ARP.menu.instances[insId]:destroy()
    ARP.menu.instances[insId] = nil
end

-- Blurry background (goes in .Paint!)
ARP.menu.blurMat = Material("pp/blurscreen")
function ARP.menu.drawBackgroundBlur(panel, startTime)
    local fade = 0

    if ( startTime ) then
        local timeFromStart = (SysTime() - startTime) / .2
    	fade = math.Clamp(timeFromStart, 0, 1)
    end

    -- --
	local x, y = panel:LocalToScreen(0, 0)
	DisableClipping(true)
	surface.SetMaterial(ARP.menu.blurMat)
	surface.SetDrawColor(255, 255, 255, 255)
	for i = 0.33, 1, 0.33 do
		ARP.menu.blurMat:SetFloat("$blur", 3 * i)
		ARP.menu.blurMat:Recompute()
		if (render) then render.UpdateScreenEffectTexture() end
		surface.DrawTexturedRect(x * -1, y * -1, ScrW(), ScrH())
	end
    -- --

	surface.SetDrawColor(10, 10, 255, 15 * fade)
	surface.DrawRect(x * -1, y * -1, ScrW(), ScrH())

    -- --
	DisableClipping(false)
end
