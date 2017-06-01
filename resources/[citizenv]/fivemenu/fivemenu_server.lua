require "resources/[essential]/essentialmode/lib/MySQL"
MySQL:open(database.host, database.name, database.username, database.password)


RegisterServerEvent('vmenu:getUpdates')
AddEventHandler('vmenu:getUpdates', function(openMenu)
	--print("-[FiveMenu]- Updating Menu...")
	-- Requêtes SQL ou autre ici...
	MenuOpts = {
		BottlesNumber = 42,
	}
	if openMenu then
		MenuOpts.openMenu = true
	else
		TriggerEvent('es:getPlayerFromId', source, function(user)
			if user ~= nil then
				TriggerEvent('es:getPlayerFromIdentifier', user.identifier, function(user)
					MenuOpts.user = user
				end)
			end
		end)
	end
	--------------------------------

	MenuOpts.firstLoad = true
	-- Envoie des données et Ouverture du Menu...
	TriggerClientEvent("vmenu:serverOpenMenu", source, MenuOpts)

end)

RegisterServerEvent('vmenu:updateUser')
AddEventHandler('vmenu:updateUser', function(openMenu)
	--print("-[FiveMenu]- Updating User...")

	local userInfos = {}

	TriggerEvent('es:getPlayerFromId', source, function(user)
		if user ~= nil then
			TriggerEvent('es:getPlayerFromIdentifier', user.identifier, function(user)
				userInfos = user
			end)
			userInfos["vehicle"] = user:getVehicle()
			userInfos["telephone"] = user:getTel()
			userInfos["enService"] = user:getenService()
		end
	end)
	--print(userInfos.identifier)
	--print(userInfos.group)
	--print(userInfos.police)
	userInfos.Loaded = true
	-- Envoie des données et Ouverture du Menu...
	TriggerClientEvent("vmenu:setUser", source, userInfos)
end)

RegisterServerEvent('es:getVehPlate_s')
AddEventHandler('es:getVehPlate_s', function()
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerClientEvent("es:f_getVehPlate", source, user:getVehicle())
	end)
end)

RegisterServerEvent("vmenu:cleanCash_s")
AddEventHandler("vmenu:cleanCash_s", function()
	TriggerEvent('es:getPlayerFromId', source, function(user)
		local dcash = tonumber(user:getDMoney())
		local cash = tonumber(user:getMoney())
		local washedcash = dcash * 0.3
		user:setDMoney(0)
		local total = cash + washedcash
		user:setMoney(total)
	end)
end)
