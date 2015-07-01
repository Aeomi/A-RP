AddCSLuaFile("a-rp/gamemode/shared.lua")
AddCSLuaFile("a-rp/gamemode/cl_init.lua")

include("a-rp/gamemode/shared.lua")

include("a-rp/gamemode/player.lua")		-- Manage player


function GM:Initialize()

	// Load Database
	print('\n')
	local databaseLoaded = ARP.db.verifyDB()
	ARP.log.sv("Database Exists: "..tostring(databaseLoaded))
	if !databaseLoaded then -- Create database
		ARP.db.createDB()
		ARP.log.sv("Database created")
	end
	ARP.log.sv("Database Loaded\n")

end
