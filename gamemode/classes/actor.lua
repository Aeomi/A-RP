--[[
	--	Name: Actor
	-- 	Auth: Aeomi
	-- 	Desc: An abstract class used as the base to its various sub-classes.
--]]

include "../arp/sv_arp_db.lua"	-- Load A-RP!Database
include "stats.lua"


Actor = {} or Actor		-- Actor is abstract and thus should not be used to create object
//Actor.__index = Actor	-- No need, actor is essentially a namespace

-- Default values and methods --
Actor.name = "_unset_"	-- Underscore to symbolize that the name is unset.
					-- Players will not be able to use underscores when naming their characters.


-- Save/Load an ALREADY INSTANCED player's Name + Stats
// Overwrite Character's data in database
function Actor:saveData()
	local path = "database\\actors\\"..self.uId..".txt"
	local data = {self.uId, self.name, self.stats}
	return ARP.db.set(path, data)
end

// Load last saved Character data from database
function Actor:loadData()
	local path = "database\\actors\\"..self.uId..".txt"
	return ARP.db.get(path) -- Decodes JSon file at that path and returns a lua table
end


function Actor:saveStats()
end

function Actor:loadStats()
end


-- Combat --
function Actor:damage()		-- Outgoing damage calculations
end

function Actor:hurt()		-- Incoming damage calculations
end















