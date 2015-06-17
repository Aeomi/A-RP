--[[
	--	Name: Character
	-- 	Auth: Aeomi
	-- 	Desc: A class that represents the player's character on the server
--]]

include "actor.lua"
include "stats.lua"


Character = {}
Character.__index = Character
setmetatable(Character, {__index = Actor})

function Character:new(uId, name, statData)
	local obj = {}
	obj.uId = uId	
	obj.name = name
	obj.stats = Stats:new(statData)

	setmetatable(obj, Character)
	return obj
end
