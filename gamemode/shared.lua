GM.Name 	= "A-RP"
GM.Author 	= "A-RP DevTeam"
GM.Email	= "-@gmail.com"
GM.Website	= "aeomi.github.io/A-RP"

GM.IsSandboxDerived = false
GM.TeamBased 		= false


-- Default "User" team and player class
TEAM_DEFAULT = 1
team.SetUp(TEAM_DEFAULT, "User", Color(155, 155, 155))


// Load ARP for client and server (two different versions (cl and sv))
// After loading: _G.ARP should be defined globally
include("a-rp/gamemode/arp/arp_loader.lua")	-- Include ARP loader

if SERVER then
	print("\\________________________________________")
	print("Loading ARP Server Nodes:")

	ARP.loader.loadNodes()

	print("\\________________________________________")
end


if CLIENT then
	print("\\________________________________________")
	print("Loading ARP Client Nodes:")

	ARP.loader.loadNodes()

	print("\\________________________________________")
end
