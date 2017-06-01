require "resources/[essential]/essentialmode/lib/MySQL"
MySQL:open(database.host, database.name, database.username, database.password)

function updateHair(player, e, v)
  local hair = e
  local haircolor = v
  MySQL:executeQuery("UPDATE outfits SET `hair`='@hair' WHERE identifier='@user'",{['@hair'] = hair, ['@user'] = player})
  MySQL:executeQuery("UPDATE outfits SET `hair_text`='@hairc' WHERE identifier='@user'",{['@hairc'] = haircolor, ['@user'] = player})
end

RegisterServerEvent('vmenu:getHair')
AddEventHandler('vmenu:getHair', function(hair, haircolor)
    TriggerEvent('es:getPlayerFromId', source, function(user)
        local player = user.identifier
        updateHair(player, hair, haircolor)
    end)
end)

function updateFace(player, e, v, t)
  local sexe = "mp_m_freemode_01"
  if e == 0 then
  	sexe = "mp_m_freemode_01"
  else
  	sexe = "mp_f_freemode_01"
  end
  local face = v
  local face_text = t
  MySQL:executeQuery("UPDATE outfits SET `skin`='@skin' WHERE identifier='@user'",{['@skin'] = sexe, ['@user'] = player})
  MySQL:executeQuery("UPDATE outfits SET `face`='@face' WHERE identifier='@user'",{['@face'] = face, ['@user'] = player})
  MySQL:executeQuery("UPDATE outfits SET `face_text`='@face_text' WHERE identifier='@user'",{['@face_text'] = face_text, ['@user'] = player})
end

RegisterServerEvent('vmenu:getFace')
AddEventHandler('vmenu:getFace', function(e, v, t)
    TriggerEvent('es:getPlayerFromId', source, function(user)
        local player = user.identifier
        updateFace(player, e, v, t)
    end)
end)

function updateOutfit(player, e)
	-- face 0, hair 2, three 3, pants 4, parachute 5, shoes 6, par dessus torso 8, armure 9, badges 10 (8-0,1,2,3 Police badges), torso 11, shirt 8,
  -- Format pour comprendre le contenu de la table
  local three = ""..e[1]
  local ttext = ""..e[2]
  local pants = ""..e[3]
  local ptext = e[4]
  local shoes = e[5]
  local shtext = e[6]
  local seven = e[7]
  local stext = e[8]
  local shirt = e[9]
  local shitext = e[10]
  local torso = e[11]
  local totext = e[12]

	MySQL:executeQuery("UPDATE outfits SET `three`='@three',`three_text`='@ttext',`pants`='@pants',`pants_text`='@ptext',`shoes`='@shoes',`shoes_text`='@shtext',`seven`='@seven',`seven_text`='@stext',`shirt`='@shirt',`shirt_text`='@shitext',`torso`='@torso',`torso_text`='@totext' WHERE identifier='@user'",{['@ttext'] = ttext, ['@three'] = three, ['@pants'] = pants, ['@ptext'] = ptext,['@shoes'] = shoes, ['@shtext'] = shtext,['@seven'] = seven, ['@stext'] = stext,['@shirt'] = shirt, ['@shitext'] = shitext, ['@torso'] = torso, ['@totext'] = totext, ['@user'] = player})

end

RegisterServerEvent('vmenu:getOutfit')
AddEventHandler('vmenu:getOutfit', function(e)
    TriggerEvent('es:getPlayerFromId', source, function(user)
        local player = user.identifier
        updateOutfit(player, e)
    end)
end)

---- RELOCALISER

-- RÉCUPÉRATION DES COMP DU PED DANS LA BDD
RegisterServerEvent('vmenu:lastChar')
AddEventHandler('vmenu:lastChar', function()
    TriggerEvent('es:getPlayerFromId', source, function(user)
	    local player = user.identifier
        local executed_query = MySQL:executeQuery("SELECT skin,face,face_text,hair,hair_text,pants,pants_text,shoes,shoes_text,torso,torso_text,shirt,shirt_text,three,three_text,seven,seven_text FROM outfits WHERE identifier='@user'",{['@user']=player})
        local result = MySQL:getResults(executed_query, {'skin','face','face_text','hair','hair_text','pants','pants_text','shoes','shoes_text','torso','torso_text','shirt','shirt_text','three','three_text','seven','seven_text'}, "identifier")
        TriggerClientEvent("vmenu:updateChar",source,{result[1].face,result[1].face_text,result[1].hair,result[1].hair_text,result[1].pants,result[1].pants_text,result[1].shoes,result[1].shoes_text,result[1].torso,result[1].torso_text,result[1].shirt,result[1].shirt_text,result[1].three,result[1].three_text,result[1].seven,result[1].seven_text,result[1].skin})
    end)
end)

RegisterServerEvent('vmenu:lastCharInShop')
AddEventHandler('vmenu:lastCharInShop', function(model)
    TriggerEvent('es:getPlayerFromId', source, function(user)
	    local player = user.identifier
        local executed_query = MySQL:executeQuery("SELECT skin,face,face_text,hair,hair_text,pants,pants_text,shoes,shoes_text,torso,torso_text,shirt,shirt_text,three,three_text,seven,seven_text FROM outfits WHERE identifier='@user'",{['@user']=player})
        local result = MySQL:getResults(executed_query, {'skin','face','face_text','hair','hair_text','pants','pants_text','shoes','shoes_text','torso','torso_text','shirt','shirt_text','three','three_text','seven','seven_text'}, "identifier")
        TriggerClientEvent("vmenu:updateCharInShop",source,{result[1].face,result[1].face_text,result[1].hair,result[1].hair_text,result[1].pants,result[1].pants_text,result[1].shoes,result[1].shoes_text,result[1].torso,result[1].torso_text,result[1].shirt,result[1].shirt_text,result[1].three,result[1].three_text,result[1].seven,result[1].seven_text,model})
    end)
end)

-- APPELÉ DU SERVEUR, BESOIN D'UN PARAMÈTRE
RegisterServerEvent('vmenu:fromSlastChar')
AddEventHandler('vmenu:fromSlastChar', function(source)
    TriggerEvent('es:getPlayerFromId', source, function(user)
	    local player = user.identifier
        local executed_query = MySQL:executeQuery("SELECT skin,face,face_text,hair,hair_text,pants,pants_text,shoes,shoes_text,torso,torso_text,shirt,shirt_text,three,three_text,seven,seven_text FROM outfits WHERE identifier='@user'",{['@user']=player})
        local result = MySQL:getResults(executed_query, {'skin','face','face_text','hair','hair_text','pants','pants_text','shoes','shoes_text','torso','torso_text','shirt','shirt_text','three','three_text','seven','seven_text'}, "identifier")
        TriggerClientEvent("vmenu:updateChar",source,{result[1].face,result[1].face_text,result[1].hair,result[1].hair_text,result[1].pants,result[1].pants_text,result[1].shoes,result[1].shoes_text,result[1].torso,result[1].torso_text,result[1].shirt,result[1].shirt_text,result[1].three,result[1].three_text,result[1].seven,result[1].seven_text,result[1].skin})
    end)
end)
