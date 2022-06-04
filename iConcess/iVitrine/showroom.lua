ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end

local firstplaceshowroomsortie = {}
local secondplaceshowroomsortie = {}
local threeplaceshowroomsortie = {}
local fourplaceshowroomsortie = {}
local fiveplaceshowroomsortie = {}
local sixplaceshowroomsortie = {}

function ShowRoomOpenEnBas()
	local ShowroomMain = RageUI.CreateMenu("ShowRoom", "Concessionnaire")
    ShowroomMain:SetRectangleBanner(Concess.ColorMenuR, Concess.ColorMenuG, Concess.ColorMenuB, Concess.ColorMenuA)

        RageUI.Visible(ShowroomMain, not RageUI.Visible(ShowroomMain))
            while ShowroomMain do
            Citizen.Wait(0)
            RageUI.IsVisible(ShowroomMain, true, true, true, function()

                RageUI.Separator("~b~↓ Vitrine ↓")

                if FirstPlaceTake then 
                    RageUI.ButtonWithStyle("~r~Supprimer le 1", nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            supprimervehiculeshowroom1()
                            FirstPlaceTake = false
                        end
                    end)
                else
                    RageUI.ButtonWithStyle("Emplacement 1", nil, {RightLabel = "Libre"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            spawn1()
                        end
                    end)
                end

                if SecondPlaceTake then 
                    RageUI.ButtonWithStyle("~r~Supprimer le 2", nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            supprimervehiculeshowroom2()
                            SecondPlaceTake = false
                        end
                    end)
                else
                    RageUI.ButtonWithStyle("Emplacement 2", nil, {RightLabel = "Libre"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            spawn2()
                        end
                    end)
                end

                if ThreePlaceTake then 
                    RageUI.ButtonWithStyle("~r~Supprimer le 3", nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            supprimervehiculeshowroom3()
                            ThreePlaceTake = false
                        end
                    end)
                else
                    RageUI.ButtonWithStyle("Emplacement 3", nil, {RightLabel = "Libre"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            spawn3()
                        end
                    end)
                end

                if FourPlaceTake then 
                    RageUI.ButtonWithStyle("~r~Supprimer le 4", nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            supprimervehiculeshowroom4()
                            FourPlaceTake = false
                        end
                    end)
                else
                    RageUI.ButtonWithStyle("Emplacement 4", nil, {RightLabel = "Libre"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            spawn4()
                        end
                    end)
                end

                RageUI.Separator("~b~↓ Promotion ↓")

                if FivePlaceTake then 
                    RageUI.ButtonWithStyle("~r~Supprimer le 5", nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            supprimervehiculeshowroom5()
                            FivePlaceTake = false
                        end
                    end)
                else
                    RageUI.ButtonWithStyle("Promo", nil, {RightLabel = "Libre"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            spawn5()
                        end
                    end)
                end

                RageUI.Separator("~b~↓ Podium ↓")

                if SixPlaceTake then 
                    RageUI.ButtonWithStyle("~r~Supprimer le 6", nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            supprimervehiculeshowroom6()
                            SixPlaceTake = false
                        end
                    end)
                else
                    RageUI.ButtonWithStyle("Podium", nil, {RightLabel = "Libre"}, true, function(Hovered, Active, Selected)
                        if Selected then 
                            spawn6()
                        end
                    end)
                end

            end, function()
            end)

            if not RageUI.Visible(ShowroomMain) then
            ShowroomMain = RMenu:DeleteType("ShowroomMain", true)
        end
    end
end

Citizen.CreateThread(function()
    while true do
        local Timer = 500
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'cardealer' and ESX.PlayerData.job.grade_name == 'boss' then
        local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
        local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, Concess.pos.showroom.menu.x, Concess.pos.showroom.menu.y, Concess.pos.showroom.menu.z)
        if jobdist <= 10 then
            Timer = 0
            DrawMarker(6, Concess.pos.showroom.menu.x, Concess.pos.showroom.menu.y, Concess.pos.showroom.menu.z-0.99, nil, nil, nil, -90, nil, nil, 1.0, 1.0, 255, 0, 0, 200)
            end
            if jobdist <= 3.0 then
                Timer = 0   
                RageUI.Text({ message = "Appuyez sur ~b~[E]~s~ pour ouvrir →→ ~b~Showroom", time_display = 1 })
                        if IsControlJustPressed(1,51) then           
                            ShowRoomOpenEnBas()
                    end   
                end
            end 
        Citizen.Wait(Timer)
    end
end)

function supprimervehiculeshowroom1()
	while #firstplaceshowroomsortie > 0 do
		local vehicle = firstplaceshowroomsortie[1]

		ESX.Game.DeleteVehicle(vehicle)
		table.remove(firstplaceshowroomsortie, 1)
	end
end

function supprimervehiculeshowroom2()
	while #secondplaceshowroomsortie > 0 do
        local vehiclede = secondplaceshowroomsortie[1]

		ESX.Game.DeleteVehicle(vehiclede)
		table.remove(secondplaceshowroomsortie, 1)
	end
end

function supprimervehiculeshowroom3()
	while #threeplaceshowroomsortie > 0 do
        local vehicletr = threeplaceshowroomsortie[1]

		ESX.Game.DeleteVehicle(vehicletr)
		table.remove(threeplaceshowroomsortie, 1)
	end
end

function supprimervehiculeshowroom4()
	while #fourplaceshowroomsortie > 0 do
        local vehiclequ = fourplaceshowroomsortie[1]

		ESX.Game.DeleteVehicle(vehiclequ)
		table.remove(fourplaceshowroomsortie, 1)
	end
end

function supprimervehiculeshowroom5()
	while #fiveplaceshowroomsortie > 0 do
        local vehiclefi = fiveplaceshowroomsortie[1]

		ESX.Game.DeleteVehicle(vehiclefi)
		table.remove(fiveplaceshowroomsortie, 1)
	end
end

function supprimervehiculeshowroom6()
	while #sixplaceshowroomsortie > 0 do
        local vehiclesi = sixplaceshowroomsortie[1]

		ESX.Game.DeleteVehicle(vehiclesi)
		table.remove(sixplaceshowroomsortie, 1)
	end
end

function spawn1()
    local modele = KeyboardInput("Entrez le modèle", "", 100)
    RageUI.Popup({ message = "<C>Chargement du véhicule...", time_display = 1 })
    Wait(500)
    local car = GetHashKey(modele)
    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local vehicle = CreateVehicle(car, Concess.pos.showroom.show1.x, Concess.pos.showroom.show1.y, Concess.pos.showroom.show1.z, Concess.pos.showroom.show1.h, true)
    FreezeEntityPosition(vehicle, true)
    SetVehicleDoorsLocked(vehicle, 4)
    SetEntityAsMissionEntity(vehicle, true, true) 
    table.insert(firstplaceshowroomsortie, vehicle)
    FirstPlaceTake = true
end

function spawn2()
    local modelede = KeyboardInput("Entrez le modèle", "", 100)
    RageUI.Popup({ message = "<C>Chargement du véhicule...", time_display = 1 })
    Wait(500)
    local carde = GetHashKey(modelede)
    RequestModel(carde)
    while not HasModelLoaded(carde) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local vehiclede = CreateVehicle(carde, Concess.pos.showroom.show2.x, Concess.pos.showroom.show2.y, Concess.pos.showroom.show2.z, Concess.pos.showroom.show2.h, true)
    FreezeEntityPosition(vehiclede, true)
    SetVehicleDoorsLocked(vehiclede, 4)
    SetEntityAsMissionEntity(vehiclede, true, true) 
    table.insert(secondplaceshowroomsortie, vehiclede)
    SecondPlaceTake = true
end

function spawn3()
    local modeletrois = KeyboardInput("Entrez le modèle", "", 100)
    RageUI.Popup({ message = "<C>Chargement du véhicule...", time_display = 1 })
    Wait(500)
    local cartr = GetHashKey(modeletrois)
    RequestModel(cartr)
    while not HasModelLoaded(cartr) do
        RequestModel(cartr)
        Citizen.Wait(0)
    end

    local vehicletr = CreateVehicle(cartr, Concess.pos.showroom.show3.x, Concess.pos.showroom.show3.y, Concess.pos.showroom.show3.z, Concess.pos.showroom.show3.h, true)
    FreezeEntityPosition(vehicletr, true)
    SetVehicleDoorsLocked(vehicletr, 4)
    SetEntityAsMissionEntity(vehicletr, true, true) 
    table.insert(threeplaceshowroomsortie, vehicletr)
    ThreePlaceTake = true
end

function spawn4()
    local modelequatre = KeyboardInput("Entrez le modèle", "", 100)
    RageUI.Popup({ message = "<C>Chargement du véhicule...", time_display = 1 })
    Wait(500)
    local carqu = GetHashKey(modelequatre)
    RequestModel(carqu)
    while not HasModelLoaded(carqu) do
        RequestModel(carqu)
        Citizen.Wait(0)
    end

    local vehiclequ = CreateVehicle(carqu, Concess.pos.showroom.show4.x, Concess.pos.showroom.show4.y, Concess.pos.showroom.show4.z, Concess.pos.showroom.show4.h, true)
    FreezeEntityPosition(vehiclequ, true)
    SetVehicleDoorsLocked(vehiclequ, 4)
    SetEntityAsMissionEntity(vehiclequ, true, true) 
    table.insert(fourplaceshowroomsortie, vehiclequ)
    FourPlaceTake = true
end

function spawn5()
    local modelecinq = KeyboardInput("Entrez le modèle", "", 100)
    RageUI.Popup({ message = "<C>Chargement du véhicule...", time_display = 1 })
    Wait(500)
    local carfi = GetHashKey(modelecinq)
    RequestModel(carfi)
    while not HasModelLoaded(carfi) do
        RequestModel(carfi)
        Citizen.Wait(0)
    end

    local vehiclefi = CreateVehicle(carfi, Concess.pos.showroom.show5.x, Concess.pos.showroom.show5.y, Concess.pos.showroom.show5.z, Concess.pos.showroom.show5.h, true)
    FreezeEntityPosition(vehiclefi, true)
    SetVehicleDoorsLocked(vehiclefi, 4)
    SetEntityAsMissionEntity(vehiclefi, true, true) 
    table.insert(fiveplaceshowroomsortie, vehiclefi)
    FivePlaceTake = true
end

function spawn6()
    local modelesix = KeyboardInput("Entrez le modèle", "", 100)
    RageUI.Popup({ message = "<C>Chargement du véhicule...", time_display = 1 })
    Wait(500)
    local carsi = GetHashKey(modelesix)
    RequestModel(carsi)
    while not HasModelLoaded(carsi) do
        RequestModel(carsi)
        Citizen.Wait(0)
    end

    local vehiclesi = CreateVehicle(carsi, Concess.pos.showroom.show6.x, Concess.pos.showroom.show6.y, Concess.pos.showroom.show6.z, Concess.pos.showroom.show6.h, true)
    FreezeEntityPosition(vehiclesi, true)
    SetVehicleDoorsLocked(vehiclesi, 4)
    SetEntityAsMissionEntity(vehiclesi, true, true) 
    table.insert(sixplaceshowroomsortie, vehiclesi)
    SixPlaceTake = true
end