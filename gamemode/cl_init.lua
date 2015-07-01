include("a-rp/gamemode/shared.lua")


-- Make HUD class
// Load Player HUD

-- Remove hl2 HUD

-- Replace with A-RP HUD

-- Player creation
-- Player Name
include("a-rp/gamemode/arp/client/cl_arp_menu.lua")

function setCharacterName()

    local nameFrame = ARP.menu.createFrame(
        'nameFrame',
        "A-RP/Character/Creation - Name",
        (ScrW()/2)-200, (ScrH()/2)-100, 400, 200,
        nil
    )

    nameFrame:canClose(true)
    nameFrame:canDrag(false)

    local startTime = SysTime()
    print(startTime)
    nameFrame:style(function(self, w, h)
        ARP.menu.drawBackgroundBlur(self, startTime)
        draw.RoundedBoxEx(8, 0, 0, w, h, Color(225, 235, 255), false, false, true, true )
        draw.RoundedBox(0, 0, 0, w, h-175, Color(50, 50, 50))
    end)


end

setCharacterName()
