
----------------------------------
-- Core Utils réalisé par TEKEL --
----------------------------------

--
--- Suppression Cash/Bank Hud
--

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        HideHudComponentThisFrame(3)
        HideHudComponentThisFrame(4)
        HideHudComponentThisFrame(13)
    end
end)

--
--- Rich Presence
-- 

Citizen.CreateThread(function()
    while true do
        SetRichPresence(GetPlayerName(PlayerId()).. " - " ..#GetActivePlayers().. "/64")
        SetDiscordAppId(978772377867538433)
        SetDiscordRichPresenceAsset('image')
        SetDiscordRichPresenceAssetText('NOM SERVER')
        SetDiscordRichPresenceAssetSmall('image')
        SetDiscordRichPresenceAssetSmallText('Cliquez sur les boutton ci-dessous !')
        SetDiscordRichPresenceAction(0, "🔗 Discord", "")
        SetDiscordRichPresenceAction(1, "Entrer sur l'île", "fivem://connect/cfx.re/join/link")
        Citizen.Wait(4000)
    end
end)

--
--- Desactivation du Chanement de place
--

local disableShuffle = true
function disableSeatShuffle(flag)
	disableShuffle = flag
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) and disableShuffle then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
				if GetIsTaskActive(GetPlayerPed(-1), 165) then
					SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
				end
			end
		end
	end
end)

--
--- Changement de place avec touche (1,2,3,4)
--

Citizen.CreateThread(function()
    while true do
        local plyPed = PlayerPedId()
        if IsPedSittingInAnyVehicle(plyPed) then
            local plyVehicle = GetVehiclePedIsIn(plyPed, false)
			CarSpeed = GetEntitySpeed(plyVehicle) * 3.6 
			if CarSpeed <= 50.0 then 
				if IsControlJustReleased(0, 157) then 
					SetPedIntoVehicle(plyPed, plyVehicle, -1)
					Citizen.Wait(10)
				end
				if IsControlJustReleased(0, 158) then 
					SetPedIntoVehicle(plyPed, plyVehicle, 0)
					Citizen.Wait(10)
				end
				if IsControlJustReleased(0, 160) then
					SetPedIntoVehicle(plyPed, plyVehicle, 1)
					Citizen.Wait(10)
				end
				if IsControlJustReleased(0, 164) then 
					SetPedIntoVehicle(plyPed, plyVehicle, 2)
					Citizen.Wait(10)
				end
			end
		end
		Citizen.Wait(10) 
	end
end)

--
--- Activation des trains
--

Citizen.CreateThread(function()
    SwitchTrainTrack(0, true)
    SwitchTrainTrack(3, true)
    N_0x21973bbf8d17edfa(0, 120000)
    SetRandomTrains(true)
 end)

--
--- Ping Console de vérification
--

Citizen.CreateThread(function()
    while true do
        print("^7[t3kt0n1k] ^4| CoreUtils | ^2Viens de se démarrer !!!")
    end
end)