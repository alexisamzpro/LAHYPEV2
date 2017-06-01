ITEMS = {}
-- flag to keep track of whether player died to prevent
-- multiple runs of player dead code
local playerdead = false
local maxCapacity = 64

-- register events, only needs to be done once
RegisterNetEvent("item:reset")
RegisterNetEvent("item:getItems")
RegisterNetEvent("item:updateQuantity")
RegisterNetEvent("item:setItem")
RegisterNetEvent("item:sell")
RegisterNetEvent("gui:getItems")
RegisterNetEvent("player:receiveItem")
RegisterNetEvent("player:looseItem")
RegisterNetEvent("player:sellItem")
RegisterNetEvent("player:getQuantity")

-- handles when a player spawns either from joining or after death
AddEventHandler("playerSpawned", function()
    TriggerServerEvent("item:getItems")
    -- reset player dead flag
    playerdead = false
end)

AddEventHandler("gui:getItems", function(THEITEMS)
    ITEMS = {}
    ITEMS = THEITEMS
end)

AddEventHandler("player:getQuantity", function(itemId)
    local _amount = 0
    _amount = ITEMS[tonumber(itemId)].quantity
    TriggerServerEvent("player:cbgetQuantity", _amount)
end)

AddEventHandler("player:receiveItem", function(item, quantity)
    if (getPods() + quantity <= maxCapacity) then
        item = tonumber(item)
        if (ITEMS[item] == nil) then
            new(item, quantity)
        else
            add({ item, quantity })
        end
    end
end)

AddEventHandler("player:looseItem", function(item, quantity)
    item = tonumber(item)
    if (ITEMS[item].quantity >= quantity) then
        delete({ item, quantity })
    end
end)

AddEventHandler("player:sellItem", function(item, price)
    item = tonumber(item)
    if (ITEMS[item].quantity > 0) then
        sell({ item, price })
    end
end)

function sell(arg)
    local itemId = tonumber(arg[1])
    local price = arg[2]
    local item = ITEMS[itemId]
    item.quantity = item.quantity - 1
    TriggerServerEvent("item:sell", itemId, item.quantity, price)
    InventoryMenu()
end

function delete(arg)
    local itemId = tonumber(arg[1])
    local qty = arg[2]
    local item = ITEMS[itemId]
    item.quantity = item.quantity - qty
    TriggerServerEvent("item:updateQuantity", item.quantity, itemId)
    InventoryMenu()
end

function add(arg)
    local itemId = tonumber(arg[1])
    local qty = arg[2]
    local item = ITEMS[itemId]
    item.quantity = item.quantity + qty
    TriggerServerEvent("item:updateQuantity", item.quantity, itemId)
    InventoryMenu()
end

function new(item, quantity)
    TriggerServerEvent("item:setItem", item, quantity)
    TriggerServerEvent("item:getItems")
end

function getQuantity(itemId)
    return ITEMS[tonumber(itemId)].quantity
end

function getPods()
    local pods = 0
    for _, v in pairs(ITEMS) do
        pods = pods + v.quantity
    end
    return pods
end

function notFull()
    if (getPods() < maxCapacity) then return true end
end

function InventoryMenu()
    ped = GetPlayerPed(-1);
    MenuTitle = "Items: " .. (getPods() or 0) .. "/" .. maxCapacity
    ClearMenu()
    for ind, value in pairs(ITEMS) do
        if (value.quantity > 0) then
            Menu.addButton(tostring(value.libelle) .. " : " .. tostring(value.quantity), "ItemMenu", ind)
        end
    end
end

function ItemMenu(itemId)
    ClearMenu()
    MenuTitle = "Details:"
    Menu.addButton("Utiliser", "use", itemId)
    Menu.addButton("Donner", "give", itemId)
end

function give(item)
    local player = getNearPlayer()
    if (player ~= nil) then
        DisplayOnscreenKeyboard(1, "Quantité :", "", "", "", "", "", 30)
        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0);
            Wait(0);
        end
        if (GetOnscreenKeyboardResult()) then
            local res = tonumber(GetOnscreenKeyboardResult())
            if (ITEMS[item].quantity - res >= 0) then
                TriggerServerEvent("player:giveItem", item, ITEMS[item].libelle, res, GetPlayerServerId(player))
            end
        end
    end
end

function use(item)
    if (ITEMS[item].quantity - 1 >= 0) then
        -- Nice var swap for nothing
        TriggerEvent("player:looseItem", item, 1)
        -- Calling the Hunger/Thirst
        if ITEMS[item].type == 2 then
            TriggerEvent("food:eat", ITEMS[item])
        elseif ITEMS[item].type == 1 then
            TriggerEvent("food:drink", ITEMS[item])
        else
            -- Any other type? Drugs??????
            Toxicated()
            Citizen.Wait(7000)
            ClearPedTasks(GetPlayerPed(-1))
            Reality()
        end
    end
end




--------------------------------------------------------
function Toxicated()
	  Citizen.Wait(5000)
	  DoScreenFadeOut(1000)
	  Citizen.Wait(1000)
	  ClearPedTasksImmediately(GetPlayerPed(-1))
	  SetTimecycleModifier("spectator5")
	  SetPedMotionBlur(GetPlayerPed(-1), true)
	  SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	  SetPedIsDrunk(GetPlayerPed(-1), true)
	  DoScreenFadeIn(1000)
end

function Reality()
  Citizen.Wait(50000)
  DoScreenFadeOut(1000)
  Citizen.Wait(1000)
  DoScreenFadeIn(1000)
  ClearTimecycleModifier()
  ResetScenarioTypesEnabled()
  ResetPedMovementClipset(GetPlayerPed(-1), 0)
  SetPedIsDrunk(GetPlayerPed(-1), false)
  SetPedMotionBlur(GetPlayerPed(-1), false)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 311) then
            InventoryMenu() -- Menu to draw
            Menu.hidden = not Menu.hidden -- Hide/Show the menu
        end
        Menu.renderGUI() -- Draw menu on each tick if Menu.hidden = false
        if IsEntityDead(PlayerPedId()) then
            PlayerIsDead()
            -- prevent the death check from overloading the server
            playerdead = true
        end
    end
end)

function PlayerIsDead()
    -- do not run if already ran
    if playerdead then
        return
    end
    TriggerServerEvent("item:reset")
end

function getPlayers()
    local playerList = {}
    for i = 0, 32 do
        local player = GetPlayerFromServerId(i)
        if NetworkIsPlayerActive(player) then
            table.insert(playerList, player)
        end
    end
    return playerList
end

function getNearPlayer()
    local players = getPlayers()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local pos2
    local distance
    local minDistance = 3
    local playerNear
    for _, player in pairs(players) do
        pos2 = GetEntityCoords(GetPlayerPed(player))
        distance = GetDistanceBetweenCoords(pos["x"], pos["y"], pos["z"], pos2["x"], pos2["y"], pos2["z"], true)
        if (pos ~= pos2 and distance < minDistance) then
            playerNear = player
            minDistance = distance
        end
    end
    if (minDistance < 3) then
        return playerNear
    end
end
