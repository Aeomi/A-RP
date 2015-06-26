-- Database library

ARP.db = ARP.db or {
	paths = {
		"database",
		"database\\actors"
	}
}

ARP.db.verifyDB = function()	
	for _, v in ipairs(ARP.db.paths) do
		local isValid = file.IsDir(v, "DATA")
		if not isValid then return false end
	end
	return true
end

ARP.db.createDB = function()
	for _, v in ipairs(ARP.db.paths) do
		file.CreateDir(v)
	end
end


ARP.db.loadFile = function(path)
	return file.Read(path, "DATA")
end

ARP.db.writeFile = function(path, text)
	local f = file.Open(path, 'w', "DATA")
	if f == nil then return false end

	f:Write(text)
	f:Close()
	return true
end


ARP.db.set = function(path, data)
	return ARP.db.writeFile(path, util.TableToJSON(data, true))
end

ARP.db.get = function(path)
	local data = file.Read(path, "DATA")

--	local data = ARP.db.loadFile(path)
	return util.JSONToTable(data)
end