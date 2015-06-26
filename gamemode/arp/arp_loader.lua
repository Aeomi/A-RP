AddCSLuaFile()

// ARP nodes are pathed relative to the 'arp' folder
local arpNodes = {
	sv = {
		"arp/server/sv_arp_char.lua",
		"arp/server/sv_arp_db.lua"
	},
	
	cl = {"arp/client/cl_arp_menu.lua"},
	
	sh = {"arp/sh_arp_log.lua"}
}


if SERVER then
	ARP = ARP or {}
	ARP.loader = {}


	-- Load sh & sv on Serverside instance
	ARP.loader.loadNodes = function()
		-- Load nodes
		for ins, nodes in pairs(arpNodes) do
			if (ins == 'sh' or ins == 'sv') then	
				for _, node in ipairs(nodes) do
					print("\t"..node)
					include(node)
				end
			end
			
			--! Mark shared and client files to be downloaded by the client
			if (ins == 'sh' or ins == 'cl') then
				for _, node in ipairs(nodes) do
					AddCSLuaFile(node)	-- Mark node for client
				end
			end
			
			
		end
		
	end

end


if CLIENT then
	ARP = ARP or {}
	ARP.loader = {}
	
	
	-- Load sh & and cl on Clientside instance
	ARP.loader.loadNodes = function()
		-- Load nodes
		for ins, nodes in pairs(arpNodes) do
			if (ins == 'sh' or ins == 'cl') then	
				for _, node in ipairs(nodes) do
					print("\t"..node)
					include(node)		-- Include node for client
				end
			end
		end
		
	end
	
	
end












