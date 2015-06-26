AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

include("shared.lua")

include("player.lua")		-- Manage player

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




