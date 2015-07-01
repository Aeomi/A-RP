AddCSLuaFile()	--do not need dis?


if SERVER then
	ARP = ARP or {}
	ARP.loader = {}

	-- Load shared and server nodes on the servierside realm
	-- Mark shared and client files as downloads
	ARP.loader.loadNodes = function()
		-- Get server, client, and shared nodes

		ARP.loader.serverNodes = file.Find("a-rp/gamemode/arp/server/*.lua", 'LUA')
		ARP.loader.clientNodes = file.Find("a-rp/gamemode/arp/client/*.lua", 'LUA')
		ARP.loader.sharedNodes = (function()
			local i = 1
			local nodes = {}
			-- Add shared files to nodes and prepare to return to sharedNodes
			for _, file in ipairs(file.Find("a-rp/gamemode/arp/*.lua", 'LUA')) do
				if (string.sub(file, 1, 3) == 'sh_') then
					nodes[i] = file
					i = i + 1
				end
			end
			return nodes
		end)()

		-- Include server and shared nodes
		for _, node in ipairs(ARP.loader.sharedNodes) do
			print("\tInclude: " .. node)
			include("a-rp/gamemode/arp/" .. node)
		end
		for _, node in ipairs(ARP.loader.serverNodes) do
			print("\tInclude: " .. node)
			include("a-rp/gamemode/arp/server/" .. node)
		end


		-- Mark client nodes as downloads
		for _, node in ipairs(ARP.loader.sharedNodes) do
			print("\tMark: " .. node)
			AddCSLuaFile("a-rp/gamemode/arp/" .. node)
		end
		for _, node in ipairs(ARP.loader.clientNodes) do
			print("\tMark: " .. node)
			AddCSLuaFile("a-rp/gamemode/arp/client/" .. node)
		end

		-- Mark clientside classes to download
		local classes = file.Find("a-rp/gamemode/classes/*.lua", 'LUA')

		for _, class in ipairs(classes) do
			if (string.sub(class, 1, 3) == "cl_") then
				print("\tMark Class: " .. class)
				AddCSLuaFile("a-rp/gamemode/classes/" .. class)
			end
		end


	end

end


if CLIENT then
	ARP = ARP or {}
	ARP.loader = {}

	-- Load shared and client nodes on Clientside realm
	ARP.loader.loadNodes = function()

		-- Get client and shared nodes
		ARP.loader.clientNodes = file.Find("a-rp/gamemode/arp/client/*.lua", 'LUA')
		ARP.loader.sharedNodes = (function()
			local i = 1
			local nodes = {}
			-- Add shared files to nodes and prepare to return to sharedNodes
			for _, file in ipairs(file.Find("a-rp/gamemode/arp/*.lua", 'LUA')) do
				if (string.sub(file, 1, 3) == 'sh_') then
					nodes[i] = file
					i = i + 1
				end
			end
			return nodes
		end)()


		for _, node in ipairs(ARP.loader.clientNodes) do
			print("\tInclude: " .. node)
			include("a-rp/gamemode/arp/client/" .. node)
		end
		for _, node in ipairs(ARP.loader.sharedNodes) do
			print("\tInclude: " .. node)
			include("a-rp/gamemode/arp/" .. node)
		end

	end


end
