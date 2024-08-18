local displayText = ""

RegisterCommand('opis', function(source, args)
    displayText = table.concat(args, " ")
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if displayText ~= "" then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local textCoords = vector3(playerCoords.x, playerCoords.y, playerCoords.z + 0.25)
            
            DrawText3D(textCoords, displayText)
        end
    end
end)

function DrawText3D(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
    local scale = 0.45

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextCentre(true)
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
