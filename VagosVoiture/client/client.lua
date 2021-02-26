print("^0======================================================================^7")
print("^0[^4Author^0] ^7:^0 ^5Tequil^7")
print("^0[^3Version^0] ^7:^0 ^01.0^7")
print("^0======================================================================^7")



local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


ESX = nil 




---------------------------------------------------------------------------------------------------------------------------
                                                                
Citizen.CreateThread(function()

	while ESX == nil do

		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

		Citizen.Wait(0)

	end



	while ESX.GetPlayerData().job2 == nil do

		Citizen.Wait(10)

	end



	PlayerData = ESX.GetPlayerData()

end)



RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)

	PlayerData.job2 = job2

end)

------------------------------------------------------------------------------------------------------------------------------------------- Pour mettre les acces à un menu

_menuPool = NativeUI.CreatePool()
vagosMenu = NativeUI.CreateMenu("Garage Vagos", "Liste des véhicules Vagos", nil, nil, "shopui_title_ie_modgarage", "shopui_title_ie_modgarage")
_menuPool:Add(vagosMenu)



spawnCar = function(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local vehicle = CreateVehicle(car, 320.02, -2034.9, 20.61, 325.21, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleNumberPlateText(vehicle, "Vagos")
    SetVehicleColours(vehicle, 89, 89)

end







function AddVagosMenu(menu)

    local voituremenu = _menuPool:AddSubMenu(menu, "Voiture", nil, nil, "", "")
    voituremenu.Item:SetRightBadge(BadgeStyle.None)

    local motomenu = _menuPool:AddSubMenu(menu, "Moto", nil, nil, "", "")

    local velomenu = _menuPool:AddSubMenu(menu, "Vélo", nil, nil, "", "")

    






    local sultan = NativeUI.CreateItem("Sultan", "Appuyer sur ENTRER pour sortir ce véhicule")
    voituremenu.SubMenu:AddItem(sultan)
    sultan:SetRightBadge(BadgeStyle.Car)

    local chino = NativeUI.CreateItem("Chino", "Appuyer sur ENTRER pour sortir ce véhicule")
    voituremenu.SubMenu:AddItem(chino)
    chino:SetRightBadge(BadgeStyle.Car)

    local factionc = NativeUI.CreateItem("Faction Custom", "Appuyer sur ENTRER pour sortir ce véhicule")
    voituremenu.SubMenu:AddItem(factionc)
    factionc:SetRightBadge(BadgeStyle.Car)

    local moonbeam = NativeUI.CreateItem("Moonbeam Cutom", "Appuyer sur ENTRER pour sortir ce véhicule")
    voituremenu.SubMenu:AddItem(moonbeam)
    moonbeam:SetRightBadge(BadgeStyle.Car)

    local sabreturbocustom = NativeUI.CreateItem("Sabre Turbo Custom", "Appuyer sur ENTRER pour sortir ce véhicule")
    voituremenu.SubMenu:AddItem(sabreturbocustom)
    sabreturbocustom:SetRightBadge(BadgeStyle.Car)

    local voodoocustom = NativeUI.CreateItem("Voodoo Custom", "Appuyer sur ENTRER pour sortir ce véhicule")
    voituremenu.SubMenu:AddItem(voodoocustom)
    voodoocustom:SetRightBadge(BadgeStyle.Car)








    local manchez = NativeUI.CreateItem("Manchez", "Appuyer sur ENTRER pour sortir ce véhicule")
    motomenu.SubMenu:AddItem(manchez)
    manchez:SetRightBadge(BadgeStyle.Bike)










    local bmx = NativeUI.CreateItem("BMX", "Appuyer sur ENTRER pour sortir ce véhicule")
    velomenu.SubMenu:AddItem(bmx)
    bmx:SetRightBadge(BadgeStyle.Bike)

    local cruiser = NativeUI.CreateItem("Cruiser", "Appuyer sur ENTRER pour sortir ce véhicule")
    velomenu.SubMenu:AddItem(cruiser)
    cruiser:SetRightBadge(BadgeStyle.Bike)




  







    voituremenu.SubMenu.OnItemSelect = function(menu, item)
        if item == sultan then 
            ESX.ShowAdvancedNotification("Vagos", "Actions Effectué", "Voici Ton Véhicule Hermano ! Fais gaffe à toi !", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("sultan")
            _menuPool:CloseAllMenus(true)
        elseif item == chino then
            ESX.ShowAdvancedNotification("Vagos", "Actions Effectué", "Voici Ton Véhicule Hermano ! Fais gaffe à toi !", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("chino2")
            _menuPool:CloseAllMenus(true)
        elseif item == factionc then
            ESX.ShowAdvancedNotification("Vagos", "Actions Effectué", "Voici Ton Véhicule Hermano ! Fais gaffe à toi !", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("faction2")
            _menuPool:CloseAllMenus(true)
        elseif item == moonbeam then
            ESX.ShowAdvancedNotification("Vagos", "Actions Effectué", "Voici Ton Véhicule Hermano ! Fais gaffe à toi !", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("moonbeam2")
            _menuPool:CloseAllMenus(true)
        elseif item == sabreturbocustom then
            ESX.ShowAdvancedNotification("Vagos", "Actions Effectué", "Voici Ton Véhicule Hermano ! Fais gaffe à toi !", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("sabregt2")
            _menuPool:CloseAllMenus(true)
        elseif item == voodoocustom then
            ESX.ShowAdvancedNotification("Vagos", "Actions Effectué", "Voici Ton Véhicule Hermano ! Fais gaffe à toi !", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("voodoo")
            _menuPool:CloseAllMenus(true)
        end

    end



    



    motomenu.SubMenu.OnItemSelect = function(menu, item)
        if item == manchez then
            ESX.ShowAdvancedNotification("Vagos", "Actions Effectué", "Voici Ton Véhicule Hermano ! Fais gaffe à toi !", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("manchez")
            _menuPool:CloseAllMenus(true)
        end
    end




    velomenu.SubMenu.OnItemSelect = function(menu, item)
        if item == bmx then
            ESX.ShowAdvancedNotification("Vagos", "Actions Effectué", "Voici Ton Véhicule Hermano ! Fais gaffe à toi !", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("bmx")
            _menuPool:CloseAllMenus(true)
        elseif item == cruiser then
            ESX.ShowAdvancedNotification("Vagos", "Actions Effectué", "Voici Ton Véhicule Hermano ! Fais gaffe à toi !", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("cruiser")
            _menuPool:CloseAllMenus(true)
        end

    end


end

AddVagosMenu(vagosMenu)
_menuPool:RefreshIndex()



local vagos = {
    {x = 314.09, y = -2039.72, z = 20.78},

}





Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false);

        for k in pairs(vagos) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, vagos[k].x, vagos[k].y, vagos[k].z)

            if dist <= 1.2 then
             if PlayerData.job2 ~= nil and PlayerData.job2.name == 'vagos' then 
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour intéragir avec ~b~Carlos")
                if IsControlJustPressed(1,51) then 
                    latestPoint = vagos[k].type 
                    vagosMenu:Visible(not vagosMenu:Visible())
                end
            end
            end
        end
    end
end)






local v1 = vector3(313.55, -2040.48, 21.98)   -- Le nom au dessus du PNJ


function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.30)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local distance = 40

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance then
            Draw3DText(v1.x,v1.y,v1.z, "Carlos")
		end
	end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("g_m_y_mexgoon_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", "g_m_y_mexgoon_01", 313.55, -2040.48, 19.94, 320.33, false, true) --Emplacement du PEDS
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)



