AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

include("shared.lua")
include("arp/sh_arp.lua")	-- Load ARP

include("player.lua")		-- Manage player

function GM:Initialize()
	// Load Database
	local databaseLoaded = ARP.db.verifyDB()
	ARP.log.logDB("Database Exists: "..tostring(databaseLoaded))
	if !databaseLoaded then -- Create database
		ARP.db.createDB()
		ARP.log.logDB("Database created")
	end
	ARP.log.logDB("Database Loaded")
	
end




