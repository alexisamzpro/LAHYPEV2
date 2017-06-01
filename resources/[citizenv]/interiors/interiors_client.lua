local interiors = {}

distance = 50.5999 -- distance to draw
timer = 0
current_int = 0

AddEventHandler("playerSpawned", function()
  TriggerServerEvent("interiors:sendData_s")
end)

-- Active this when you restart resource. If you don't want to close the server
TriggerServerEvent("interiors:sendData_s")

RegisterNetEvent("interiors:f_sendData")
AddEventHandler("interiors:f_sendData", function(t1)
	-- Tyler1 my boy
  interiors = t1
end)

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
		N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			if timer > 0 and current_int > 0 then DrawAdvancedText(0.707, 0.77, 0.005, 0.0028, 1.89, "~b~"..interiors[current_int].name, 255, 255, 255, 255, 1, 1) end
			for i=1, #interiors do
				if not IsEntityDead(PlayerPedId()) then
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < distance then
						DrawMarker(1,interiors[i].xe,interiors[i].ye,interiors[i].ze-1.0001, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
						if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
							if timer == 0 then
								DoScreenFadeOut(1000)
								while IsScreenFadingOut() do Citizen.Wait(0) end
								NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
								Wait(1000)
								SetEntityCoords(GetPlayerPed(-1), interiors[i].xo,interiors[i].yo,interiors[i].zo)
								SetEntityHeading(GetPlayerPed(-1), interiors[i].ho)
								NetworkFadeInEntity(GetPlayerPed(-1), 0)
								Wait(1000)
								current_int = i
								timer = 5
								SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
								DoScreenFadeIn(1000)
								while IsScreenFadingIn() do Citizen.Wait(0)	end
							end
						end
					end
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < distance then
						DrawMarker(1,interiors[i].xo,interiors[i].yo,interiors[i].zo-1.0001, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
						if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < 1.599 then
							if timer == 0 then
								DoScreenFadeOut(1000)
								while IsScreenFadingOut() do Citizen.Wait(0) end
								NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
								Wait(1000)
								SetEntityCoords(GetPlayerPed(-1), interiors[i].xe,interiors[i].ye,interiors[i].ze)
								SetEntityHeading(GetPlayerPed(-1), interiors[i].ho)
								NetworkFadeInEntity(GetPlayerPed(-1), 0)
								Wait(1000)
								current_int = i
								timer = 5
								SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
								DoScreenFadeIn(1000)
								while IsScreenFadingIn() do Citizen.Wait(0)	end
							end
						end
					end
				end
			end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(1000)
		if timer > 0 then
			timer=timer-1
			if timer == 0 then current_int = 0 end
		end
	end
end)
