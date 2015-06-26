
-- Logging Library
ARP.log = ARP.log or {}

ARP.log.SERVER_COLOR = Color(0, 255, 255)
ARP.log.DATABASE_COLOR = Color(255, 0, 255)

ARP.log.db = function(text)
	MsgC(ARP.log.DATABASE_COLOR, tostring(text).."\n")
end

ARP.log.sv = function(text)
	MsgC(ARP.log.SERVER_COLOR, tostring(text).."\n")
end

