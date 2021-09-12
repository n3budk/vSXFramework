local Proxy = module("vsx", "lib/Proxy")

vSX = Proxy.getInterface("vSX")

function AddLicense(target, type, cb)
	local xPlayer = vSX.getUserId({target})
	if xPlayer then
		MySQL.Async.execute("INSERT INTO vsx_user_licenses (type, owner) VALUES (@type, @owner)", {
			["@type"] = type,
			["@owner"] = xPlayer
		}, function(rowsChanged)
			if cb then
				cb()
			end
		end)
	else
		if cb then
			cb()
		end
	end
end

function RemoveLicense(target, type, cb)
	local xPlayer = vSX.getUserId({target})
	if xPlayer then
		MySQL.Async.execute("DELETE FROM vsx_user_licenses WHERE type = @type AND owner = @owner", {
			["@type"] = type,
			["@owner"] = xPlayer
		}, function(rowsChanged)
			if cb then
				cb()
			end
		end)
	else
		if cb then
			cb()
		end
	end
end

function GetLicense(type, cb)
	MySQL.Async.fetchAll("SELECT label FROM vsx_licenses WHERE type = @type", {
		["@type"] = type
	}, function(result)
		local data = {type = type, label = result[1].label}
		cb(data)
	end)
end

function GetLicenses(target, cb)
	local xPlayer = vSX.getUserId({target})
	MySQL.Async.fetchAll("SELECT type FROM vsx_user_licenses WHERE owner = @owner", {
		["@owner"] = xPlayer
	}, function(result)
		local licenses, asyncTasks = {}, {}
		for i = 1, #result, 1 do
			local scope = function(type)
				table.insert(asyncTasks, function(cb)
					MySQL.Async.fetchAll("SELECT label FROM vsx_licenses WHERE type = @type", {
						["@type"] = type
					}, function(result2)
						table.insert(licenses, {type = type, label = result2[1].label})
						cb()
					end)
				end)
			end
			scope(result[i].type)
		end
		Async.parallel(asyncTasks, function(results)
			cb(licenses)
		end)
	end)
end

function CheckLicense(target, type, cb)
	local xPlayer = vSX.getUserId({target})
	if xPlayer then
		MySQL.Async.fetchAll("SELECT COUNT(*) as count FROM vsx_user_licenses WHERE type = @type AND owner = @owner", {
			["@type"] = type,
			["@owner"] = xPlayer
		}, function(result)
			if tonumber(result[1].count) > 0 then
				cb(true)
			else
				cb(false)
			end
		end)
	else
		cb(false)
	end
end

function GetLicensesList(cb)
	MySQL.Async.fetchAll("SELECT type, label FROM vsx_licenses", {
		["@type"] = type
	}, function(result)
		local licenses = {}
		for i = 1, #result, 1 do
			table.insert(licenses, {type = result[i].type, label = result[i].label})
		end
		cb(licenses)
	end)
end

RegisterNetEvent("vsx_license:addLicense")
AddEventHandler("vsx_license:addLicense", function(target, type, cb)
	AddLicense(target, type, cb)
end)

RegisterNetEvent("vsx_license:removeLicense")
AddEventHandler("vsx_license:removeLicense", function(target, type, cb)
	RemoveLicense(target, type, cb)
end)

AddEventHandler("vsx_license:getLicense", function(type, cb)
	GetLicense(type, cb)
end)

AddEventHandler("vsx_license:getLicenses", function(target, cb)
	GetLicenses(target, cb)
end)

AddEventHandler("vsx_license:checkLicense", function(target, type, cb)
	CheckLicense(target, type, cb)
end)

AddEventHandler("vsx_license:getLicensesList", function(cb)
	GetLicensesList(cb)
end)

VSX.RegisterServerCallback("vsx_license:getLicense", function(source, cb, type)
	GetLicense(type, cb)
end)

VSX.RegisterServerCallback("vsx_license:getLicenses", function(source, cb, target)
	GetLicenses(target, cb)
end)

VSX.RegisterServerCallback("vsx_license:checkLicense", function(source, cb, target, type)
	CheckLicense(target, type, cb)
end)

VSX.RegisterServerCallback("vsx_license:getLicensesList", function(source, cb)
	GetLicensesList(cb)
end)

AddEventHandler("vSX:playerSpawn", function(user_id, source, first_spawn)
	TriggerEvent("vsx_license:getLicenses", source, function(licenses)
		TriggerClientEvent("vsx_dmvschool:loadLicenses", source, licenses)
	end)
end)