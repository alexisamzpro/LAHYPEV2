-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- I TOUCHED IT KANERSPS, PLEASE DON'T RAGE AT ME FOR THIS, DRAZIAK --

-- Loading MySQL Class
require "resources/[essential]/essentialmode/lib/MySQL"

-- MySQL:open("IP", "databasname", "user", "password")
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "Police911")

telist = {}

-- tel = { name, surname, identifier, IDsource }

-- THIS IS CALLED AFTER THE CHARACTER CREATION.
-- WE NEED TO UPDATE HIS NAME BECAUSE CITIZEN CITIZEN IS NOT A DECENT NAME FOR SOMEONE!
-- I AM WRITING SINGLE COMMENT LINE
RegisterServerEvent("es:loadAfterCreation")
AddEventHandler("es:loadAfterCreation", function()
	TriggerEvent('es:getPlayerFromId', source, function(user)
		local player = user.identifier
		local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@name'", {['@name'] = player})
		local result = MySQL:getResults(executed_query, {'identifier', 'nom', 'prenom', 'telephone'}, "identifier")
		telist[result[1].telephone] = { IDsource = source }
  end)
end)

RegisterServerEvent("es:deleteTelist")
AddEventHandler("es:deleteTelist", function(source)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		tel = user:getTel()
		telist[tel].IDsource = nil
  end)
end)

AddEventHandler('playerDropped', function()
	TriggerEvent('es:getPlayerFromId', source, function(user)
		tel = user:getTel()
		telist[tel].IDsource = nil

		MySQL:executeQuery("UPDATE users SET `money`='@value' WHERE identifier = '@identifier'",
		{['@value'] = user.money, ['@identifier'] = user.identifier})

		MySQL:executeQuery("UPDATE users SET `dirtymoney`='@value' WHERE identifier = '@identifier'",
			{['@value'] = user.dirtymoney, ['@identifier'] = user.identifier})

		MySQL:executeQuery("UPDATE coordinates SET `x`='@valx',`y`='@valy',`z`='@valz' WHERE identifier = '@identifier'",
		{['@valx'] = user.coords.x, ['@valy'] = user.coords.y, ['@valz'] = user.coords.z, ['@identifier'] = user.identifier})

  end)
end)

RegisterServerEvent("es:getPhonebook")
AddEventHandler("es:getPhonebook", function(source)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		LoadPhonebook(user.identifier, source)
  end)
end)

function LoadPhonebook(identifier, source)
	local phonebook = {}
	local executed_query = MySQL:executeQuery("SELECT * FROM phonebook JOIN users ON `phonebook`.`phonenumber` = `users`.`telephone` WHERE pidentifier = '@username'", { ['@username'] = identifier })
	local result = MySQL:getResults(executed_query, { 'phonenumber', 'nom', 'prenom' }, "pidentifier")
	if (result) then
		for a, v in pairs(result) do
				t = { ["nom"] = v.nom, ["prenom"] = v.prenom, ["identifier"] = a}
				table.insert(phonebook, v.phonenumber, t)
		end
	end

	TriggerClientEvent("tel:getPhonebook", source, phonebook)
end

-- THIS IS THE WHERE WE LOAD THE INFO FROM THE DATABASE. IF YOU NEED IT IN THE MENU -> fivemenu
-- DON'T FORGET THE PLAYER CLASS! CREATE YOUR GETTER AND SETTER BOI!
function LoadUser(identifier, source, new)
	local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@name'", {['@name'] = identifier})
	local result = MySQL:getResults(executed_query, {'permission_level', 'money', 'identifier', 'group', 'dirtymoney', 'job', 'police', 'nom', 'prenom', 'telephone'}, "identifier")

	local executed_query1 = MySQL:executeQuery("SELECT * FROM coordinates WHERE identifier = '@name'", {['@name'] = identifier})
	local result1 = MySQL:getResults(executed_query1, {'x','y','z'}, "identifier")

	local group = groups[result[1].group]
	Users[source] = Player(source, result[1].permission_level, result[1].money, result[1].identifier, group, result[1].dirtymoney, result[1].job, result[1].police, result[1].nom, result[1].prenom, result[1].telephone, { x = result1[1].x, y = result1[1].y, z = result1[1].z})

	-- THE ARRAY THAT WE WILL USE TO COMMUNICATE WITH CELLPHONE, OMAGGAD TECHNOLOGY
	telist[result[1].telephone] = { IDsource = source }

	-- LOADING THE PHONEBOOK OF THE PLAYER
	LoadPhonebook(identifier, source)

	TriggerEvent('es:playerLoaded', source, Users[source])

	if(true)then
		TriggerClientEvent('es:setPlayerDecorator', source, 'rank', Users[source]:getPermissions())
	end

	if(true)then
		TriggerEvent('es:newPlayerLoaded', source, Users[source])
	end
end

function stringsplit(self, delimiter)
  local a = self:Split(delimiter)
  local t = {}

  for i = 0, #a - 1 do
     table.insert(t, a[i])
  end

  return t
end

-- PLEASE I HOPE WE CODED THIS FOR NOTHING.
function isIdentifierBanned(id)
	local executed_query = MySQL:executeQuery("SELECT * FROM bans WHERE banned = '@name'", {['@name'] = id})
	local result = MySQL:getResults(executed_query, {'expires', 'reason', 'timestamp'}, "identifier")

	if(result)then
		for k,v in ipairs(result)do
			if v.expires > v.timestamp then
				return true
			end
		end
	end

	return false
end

AddEventHandler('es:getPlayers', function(cb)
	cb(Users)
end)

-- GET ONE
function hasAccount(identifier)
	local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@name'", {['@name'] = identifier})
	local result = MySQL:getResults(executed_query, {'permission_level', 'money'}, "identifier")

	if(result[1] ~= nil) then
		return true
	end
	return false
end

-- YOU MUST
function isLoggedIn(source)
	if(Users[GetPlayerName(source)] ~= nil)then
	if(Users[GetPlayerName(source)]['isLoggedIn'] == 1) then
		return true
	else
		return false
	end
	else
		return false
	end
end

-- REGISTER FOR LE DB
function registerUser(identifier, source)
	if not hasAccount(identifier) then
		--Telephone number
		local telephone = tostring(generateTel(identifier))

		-- Inserting Default User Account Stats
		MySQL:executeQuery("INSERT INTO users (`identifier`, `permission_level`, `money`, `group`, `nom`, `prenom`, `telephone`) VALUES ('@username', '0', '@money', 'user', 'Citizen', 'Citizen', '@telephone')",
		{['@username'] = identifier, ['@telephone'] = telephone, ['@money'] = settings.defaultSettings.startingCash})

		MySQL:executeQuery("INSERT INTO coordinates (`identifier`,`x`,`y`,`z`) VALUES ('@identifier', '@valx', '@valy', '@valz')",
		{['@valx'] = settings.defaultSettings.spawnx, ['@valy'] = settings.defaultSettings.spawny, ['@valz'] = settings.defaultSettings.spawnz, ['@identifier'] = identifier})

		-- SKIN PAR DÉFAUT
		-- USELESS BUT NEEDED
		MySQL:executeQuery("INSERT INTO outfits (`identifier`, `skin`, `face`, `face_text`, `hair`, `hair_text`, `pants`, `pants_text`, `shoes`, `shoes_text`, `torso`, `torso_text`, `shirt`, `shirt_text`, `three`, `three_text`, `seven`, `seven_text`) VALUES ('@username', 'mp_m_freemode_01', '0', '0', '-1', '-1', '24', '5', '18', '0', '29', '5', '31', '0', '12', '0', '29', '2')",
		{['@username'] = identifier, ['@money'] = settings.defaultSettings.startingCash})

		-- INVENTAIRE VIDE
		-- BUILDING AN EMPTY INVENTORY, NEED REWORK UGLY, IM DYING
		for i=1,27 do
			MySQL:executeQuery("INSERT INTO user_inventory (`user_id`, `item_id`, `quantity`) VALUES ('@username', '@item_id', '0')",
			{['@username'] = identifier, ['@item_id'] = i})
		end

		-- VOITURE PAR DÉFAUT
		-- PLATE SYSTEM WITH SOCIAL CLUB ID TASTY AF
		local L = #identifier - 4
		local L1 = #identifier - 3
		local L2 = #identifier - 2
		local L3 = #identifier - 1
		local plateveh = "CTZN" .. identifier[L] .. identifier[L1] .. identifier[L2] .. identifier[L3]
		MySQL:executeQuery("INSERT INTO user_vehicle (`identifier`, `vehicle_name`, `vehicle_model`, `vehicle_price`, `vehicle_plate`, `vehicle_state`, `vehicle_colorprimary`, `vehicle_colorsecondary`, `vehicle_pearlescentcolor`, `vehicle_wheelcolor`) VALUES ('@username', 'Faggio', 'faggio2', '4000','@plate', 'Rentré', '4', '0', '111', '156')",
		{['@username'] = identifier, ['@plate'] = string.upper(plateveh)})

		TriggerClientEvent("ccreation:menu", source)

		LoadUser(identifier, source, true)
	else
		LoadUser(identifier, source)
	end
end

AddEventHandler("es:setPlayerData", function(user, k, v, cb)
	if(Users[user])then
		if(Users[user][k])then

			if(k ~= "money") then
				Users[user][k] = v

				MySQL:executeQuery("UPDATE users SET `@key`='@value' WHERE identifier = '@identifier'",
			    {['@key'] = k, ['@value'] = v, ['@identifier'] = Users[user]['identifier']})
			end

			if(k == "group")then
				Users[user].group = groups[v]
			end

			cb("Player data edited.", true)
		else
			cb("Column does not exist!", false)
		end
	else
		cb("User could not be found!", false)
	end
end)

AddEventHandler("es:setPlayerDataId", function(user, k, v, cb)
	MySQL:executeQuery("UPDATE users SET @key='@value' WHERE identifier = '@identifier'",
	{['@key'] = k, ['@value'] = v, ['@identifier'] = user})

	cb("Player data edited.", true)
end)

AddEventHandler("es:getPlayerFromId", function(user, cb)
	if(Users)then
		if(Users[user])then
			cb(Users[user])
		else
			cb(nil)
		end
	else
		cb(nil)
	end
end)

AddEventHandler("es:getPlayerFromIdentifier", function(identifier, cb)
	local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@name'", {['@name'] = identifier})
	--local result = MySQL:getResults(executed_query, {'permission_level', 'money', 'identifier', 'group', 'dirtymoney', 'job', 'police', 'enService'}, "identifier")
	local result = MySQL:getResults(executed_query, {'permission_level', 'money', 'identifier', 'group', 'dirtymoney', 'job', 'police', 'nom', 'prenom', 'telephone'}, "identifier")

	if(result[1])then
		cb(result[1])
	else
		cb(nil)
	end
end)

AddEventHandler("es:getAllPlayers", function(cb)
	local executed_query = MySQL:executeQuery("SELECT * FROM users", {})
	local result = MySQL:getResults(executed_query, {'permission_level', 'money', 'identifier', 'group'}, "identifier")

	if(result)then
		cb(result)
	else
		cb(nil)
	end
end)

-- GENERATING A CELLPHONE NUMBER, WITH... SOCIAL CLUB ID OMGG AGAIN
function generateTel(identifier)
	local tel = ""
	for i = #identifier, 1, -1 do
	    local c = identifier:sub(i,i)
	    -- do something with c
	    if (#tel) < 8 then
	        c = tonumber(c)
	        if c ~= nil then
	            if string.len(tel) == 3 then
	                tel = tel .. "-"
	            end
	            c = tostring(c)
	            tel = tel .. c
	        end
	    end
	end
	return tel
end

-- GET PLATE NUMBER
RegisterServerEvent("es:getVehPlate")
AddEventHandler("es:getVehPlate", function()
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerClientEvent("es:f_getVehPlate", source, user:getVehicle())
	end)
end)


-- GET THE PLAYER X Y Z READY TO BE SPAWNED
RegisterServerEvent("es:requestingSpawnData")
AddEventHandler("es:requestingSpawnData", function()
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerClientEvent("es:sendingSpawnData", source, user:getCoords())
	end)
end)


-- Function to update player money every 60 seconds.
local function savePlayerMoney()
	SetTimeout(600000, function()
		TriggerEvent("es:getPlayers", function(users)
			for k,v in pairs(users)do
				MySQL:executeQuery("UPDATE users SET `money`='@value' WHERE identifier = '@identifier'",
			    {['@value'] = v.money, ['@identifier'] = v.identifier})
				MySQL:executeQuery("UPDATE users SET `dirtymoney`='@value' WHERE identifier = '@identifier'",
					{['@value'] = v.dirtymoney, ['@identifier'] = v.identifier})
			end
		end)

		savePlayerMoney()
	end)
end

savePlayerMoney()

-- THE FUKED UP CODE THAT IS NOT SUPPOSE TO BE THERE BUT IT IS.

-- TELEPHONE -> TELIST
RegisterServerEvent("tel:sendingMsg")
AddEventHandler("tel:sendingMsg", function(msg, teldest)
	local name = ""
	local surname = ""
	local origin = ""
	  TriggerEvent('es:getPlayerFromId', source, function(user)
			name = user:getNom()
			surname = user:getPrenom()
			origin = user:getTel()
		end)

	if telist[teldest] ~= nil then
		if telist[teldest].IDsource ~= nil then
			local player = telist[teldest].IDsource
			local player2 = telist[origin].IDsource
			TriggerClientEvent("tel:receivingMsg", player, msg, name, surname)
			TriggerClientEvent("es_freeroam:notif", player2, "~g~ Message envoyé")
		else
			TriggerClientEvent("es_freeroam:notif", player2, "~r~ Le joueur n'est pas connecté")
		end
	else
		TriggerClientEvent("es_freeroam:notif", player2, "~r~ Le joueur n'est pas connecté")
	end
end)
