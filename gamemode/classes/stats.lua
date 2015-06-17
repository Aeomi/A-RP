// Class: Stats

Stats = {}
Stats.__index = Stats

--[[-- Stat Enums --
Stats.STAT_LEVEL 	= 1
Stats.STAT_EXP		= 2
Stats.STAT_HEALTH 	= 3
Stats.STAT_STRENGTH = 4
Stats.STAT_DEFENCE	= 5

Stats.DEFAULT_STATS = {
	1,		-- Level
	0,		-- Exp
	100,	-- Health
	1,		-- Strength
	1		-- Defence
}
]]

Stats.DEFAULT_STATS = {
	level 	 = 1,
	exp		 = 0,
	health	 = 100,	// This will be the character's internal hp
	defence	 = 1,	-- Ignoring default player health and instead applying damage to this via hurt()
	strength = 1
}

// Array of 5 numbers can be used to make a stat object, or default is used
function Stats:new(stats)	-- No check to see if stats is an array of 5 numbers
	local obj = stats or Stats.DEFAULT_STATS
	setmetatable(obj, self)
	return obj
end

