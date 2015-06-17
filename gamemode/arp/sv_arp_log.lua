-- Logging Library
ARP.log = ARP.log or {}

ARP.log.databaseColor = Color(255, 0, 255)

ARP.log.logDB = function(text)
	MsgC(ARP.log.databaseColor, tostring(text).."\n")
end


