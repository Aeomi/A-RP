include("a-rp/gamemode/shared.lua")

-- Make HUD class
// Load Player HUD

-- Remove hl2 HUD

-- Replace with A-RP HUD

-- Player creation
-- Player Name
include("a-rp/gamemode/arp/client/cl_arp_menu.lua")

function setCharacterName()

    gui.EnableScreenClicker(true)

    //---- Name Window ----//
    local nameFrame = ARP.menu.createFrame(
        'nameFrame',
        "A-RP/Character/Creation - Name",
        (ScrW()/2)-200, (ScrH()/2)-100,
        400, 150,
        nil
    )

    nameFrame:canClose(true)
    nameFrame:canDrag(true)

    local startTime = SysTime()
    nameFrame:style(function(self, w, h)
        ARP.menu.drawBackgroundBlur(self, startTime)
        draw.RoundedBoxEx(8, 0, 0, w, h, Color(225, 235, 255), false, false, true, true )
        draw.RoundedBox(0, 0, 0, w, h-125, Color(50, 50, 50))
    end)


    //---- Submit Button ----//
    local submitButton = ARP.menu.createButton(
        'submitButton',
        "Submit",
        325, 75,
        50, 25,
        nameFrame
    )

    submitButton:clicked(function()
        print("Sending name to server")

        --local str = "Sending name to server"

        --timer.Create("dotdotdot", 1, 3, function() print('.') end)
        --net.SendToServer


        gui.EnableScreenClicker(false)
        ARP.menu.destroyInstance('nameFrame')
    end)

    submitButton:style(function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(150, 175, 255))
    end)


    //---- Informative Text Label ----//
    local infoText = ARP.menu.createLabel(
        'infoText',
        "Enter your character's name:",
        25, 25,
        150, 50,
        nameFrame
    )

    infoText:setTextColour(Color(50, 50, 50))


    //---- Text Field ----//
    local textField = ARP.menu.createTextField(
        'textField',
        25, 75,
        275, 25,
        nameFrame
    )

    nameFrame.elm:MakePopup()

end

setCharacterName( )


--ARP.menu .destroyInstance('nameFrame')
