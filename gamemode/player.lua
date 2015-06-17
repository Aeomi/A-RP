
// Generally only list functions with the intention to override (Avoid mess this way)
// Check base gamemode for stuff to overwrite

function GM:PlayerAuthed(pl, steamID, uniqueID) -- Not sure what to do in here yet
end


// Set Player to default team at spawn
function GM:PlayerInitialSpawn(pl)
	
	-- Remove all bots
	if pl:IsBot() then pl:Kick(); return end
	
	-- Set Player to User (Team)
	pl:SetTeam(1)
	pl:ChatPrint("Welcome "..pl:Nick().." this is your initial spawn for this session")
	
	
	-- if UID not in db, create new player and save them
	local uId  = pl:SteamID64()
	
	
	-- Create or load player
	if ARP.char.exists(uId) then
		pl.char = ARP.char.load(uId) 	-- Load
	else
		pl.char = ARP.char.create(uId) 	-- Create
		pl.char:saveData()				-- Save
	end
	
	
end