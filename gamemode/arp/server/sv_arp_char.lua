include("../../classes/character.lua")

-- Character Managment
ARP.char = ARP.char or {}

ARP.char.exists = function(uId)
	local path = "database\\actors\\"..tostring(uId)..".txt"
	return file.Exists(path, "DATA")
end

// Create new Character from nothing
ARP.char.create = function(uId)
	local name = nil	-- Trigger clientside to show derma character maker
	-- hook.Run("arp/char/creation_menu")
	
	local char = Character:new(uId, name)
	return char
end

// Load an existing Character from database
ARP.char.load = function(uId)
	local path = "database\\actors\\"..tostring(uId)..".txt"
	local data = ARP.db.get(path)
	
	local char = Character:new(uid, data.name, data.stats)
	return char
end