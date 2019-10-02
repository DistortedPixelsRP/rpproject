--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

ESX = nil
local pedindex = {}

Citizen.CreateThread(function()
  while ESX == nil do

    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

    Citizen.Wait(0)
  end
end)

-- saca los servicio npc de policia etc y no deja armas en el piso de los npc.
Citizen.CreateThread(function()
   while true do
	   Wait(0)
	   for i = 1, 12 do
		   Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
	   end
	   SetPlayerWantedLevel(PlayerId(), 0, false)
	   SetPlayerWantedLevelNow(PlayerId(), false)
	   SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)

	   -- No deja armas en el piso de los npc.
	   DisablePlayerVehicleRewards(PlayerId())

	   -- Desabilita los weapon en los NPC
	   SetWeaponDrops()
   end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1) 
		
        for ped in EnumeratePeds() do
            if DoesEntityExist(ped) then
				for i,model in pairs(cfg.peds) do
					if (GetEntityModel(ped) == GetHashKey(model)) then
						veh = GetVehiclePedIsIn(ped, false)
						SetEntityAsNoLongerNeeded(ped)
						SetEntityCoords(ped,10000,10000,10000,1,0,0,1)
						if veh ~= nil then
							SetEntityAsNoLongerNeeded(veh)
							SetEntityCoords(veh,10000,10000,10000,1,0,0,1)
						end
					end
				end
				for i,model in pairs(cfg.noguns) do
					if (GetEntityModel(ped) == GetHashKey(model)) then
						RemoveAllPedWeapons(ped, true)
					end
				end
				for i,model in pairs(cfg.nodrops) do
					if (GetEntityModel(ped) == GetHashKey(model)) then
						SetPedDropsWeaponsWhenDead(ped,false) 
					end
				end
			end
		end
		--[[ WORK IN PROGESS // DOES NOT WORK
        for veh in EnumerateVehicles() do
            if DoesEntityExist(veh) then
				for i,model in pairs(cfg.vehs) do
					if (GetEntityModel(veh) == GetHashKey(model)) then
						SetEntityAsNoLongerNeeded(veh)
						SetEntityCoords(veh,10000,10000,10000,1,0,0,1)
					end
				end
			end
		end
		]]
    end
end)

Citizen.CreateThread(function()
	local player = PlayerPedId()

    while true do
		Citizen.Wait(1)


		SetPedDensityMultiplierThisFrame(cfg.density.peds)
		SetScenarioPedDensityMultiplierThisFrame(cfg.density.peds, cfg.density.peds)
		SetVehicleDensityMultiplierThisFrame(cfg.density.vehicles)
		SetRandomVehicleDensityMultiplierThisFrame(cfg.density.vehicles)
		SetParkedVehicleDensityMultiplierThisFrame(cfg.density.vehicles)

		RemovePeskyVehicles(player, 5000.0)
		SetPedNonCreationArea(-6000.0, -6000.0, -6000.0, 10000.0, 10000.0, 8000.0)

			--local playerPed = GetPlayerPed(-1)
			--local pos = GetEntityCoords(playerPed)
			--RemoveVehiclesFromGeneratorsInArea(pos['x'] - 500.0, pos['y'] - 500.0, pos['z'] - 500.0, pos['x'] + 500.0, pos['y'] + 500.0, pos['z'] + 500.0);
         -- These natives has to be called every frame.
	   
		 
        
    end
end)




function SetWeaponDrops() -- This function will set the closest entity to you as the variable entity.
    local handle, ped = FindFirstPed()
    local finished = false -- FindNextPed will turn the first variable to false when it fails to find another ped in the index
    repeat 
        if not IsEntityDead(ped) then
                pedindex[ped] = {}
        end
        finished, ped = FindNextPed(handle) -- first param returns true while entities are found
    until not finished
    EndFindPed(handle)

    for peds,_ in pairs(pedindex) do
        if peds ~= nil then -- set all peds to not drop weapons on death.
            SetPedDropsWeaponsWhenDead(peds, false) 
        end
    end
end

function RemovePeskyVehicles(player, range)
    local pos = GetEntityCoords(playerPed) 

    RemoveVehiclesFromGeneratorsInArea(
        pos.x - range, pos.y - range, pos.z - range, 
        pos.x + range, pos.y + range, pos.z + range
    );
end