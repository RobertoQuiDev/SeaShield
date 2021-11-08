

function EnumerateObjects()
  return va(FindFirstObject, FindNextObject, EndFindObject)
end
function EnumeratePeds()
  return va(FindFirstPed, FindNextPed, EndFindPed)
end
function EnumerateVehicles()
  return va(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
function EnumeratePickups()
  return va(FindFirstPickup, FindNextPickup, EndFindPickup)
end
if seaShield.ESX.Active then
  Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent(seaShield.ESX.Trigger, function(a)
        ESX = a
      end)
      Citizen.Wait(10)
    end
  end)
end
Citizen.CreateThread(function()
  while true do
    Wait(0)
    if seaShield.BlacklistWeapon.Active then
      if IsPedArmed(PlayerPedId(), 4) and seaShield.BlacklistWeapon.List[GetSelectedPedWeapon(PlayerPedId())] ~= nil then
        RemoveWeaponFromPed(PlayerPedId(), (GetSelectedPedWeapon(PlayerPedId())))
        if seaShield.BlacklistWeapon.BanActive then
          TriggerServerEvent("seaShield:TuDepop", {
            name = "BlacklistWeapon",
            reason = "Blacklist Weapon"
          })
        end
      end
    end
    if seaShield.AntiSuperJump and IsPedJumping(PlayerPedId()) then
      TriggerServerEvent("seaShield:SuperJump")
      Wait(5000)
    end
    if seaShield.AntiFastRun and not IsPedInAnyVehicle(GetPlayerPed(-1), true) and GetEntitySpeed(GetPlayerPed(-1)) > 10 and not IsPedFalling(GetPlayerPed(-1)) and not IsPedInParachuteFreeFall(GetPlayerPed(-1)) and not IsPedJumpingOutOfVehicle(GetPlayerPed(-1)) and not IsPedRagdoll(GetPlayerPed(-1)) then
      TriggerServerEvent("seaShield:TuDepop", {
        name = "AntiFastRun",
        reason = "Use Fast Run"
      })
      Wait(5000)
    end
    if seaShield.AntiSpectate.Active and NetworkIsInSpectatorMode() then
      if seaShield.AntiSpectate.BanActive then
        TriggerServerEvent("seaShield:TuDepop", {
          name = "AntiSpectate",
          reason = "Anti Spectate"
        })
        Wait(5000)
      else
        TriggerServerEvent("seaShield:TuDepopMoitier", {
          name = "AntiSpectate",
          reason = "Anti Spectate"
        })
        Wait(5000)
      end
    end
    if seaShield.AntiFreecam.Active then
      if GetEntityCoords(GetPlayerPed(-1)) - GetFinalRenderedCamCoord().z < -9 and seaShield.AntiFreecam.MaxSeconds <= va then
        if seaShield.AntiFreecam.BanActive then
          TriggerServerEvent("seaShield:TuDepop", {
            name = "AntiFreecam",
            reason = "Anti Free Cam"
          })
          Wait(5000)
        else
          TriggerServerEvent("seaShield:TuDepopMoitier", {
            name = "AntiFreecam",
            reason = "Anti Free Cam"
          })
          Wait(5000)
        end
      end
    end
    if seaShield.AntiShootPlayerESX and IsPedShooting(GetPlayerPed(-1)) then
      TriggerServerEvent("seaShield:VerifWeaponKillAllESX", GetSelectedPedWeapon(PlayerPedId()))
      Wait(5000)
    end
    if seaShield.AntiShootPlayer and IsPedShooting(GetPlayerPed(-1)) then
      TriggerServerEvent("seaShield:VerifWeaponKillAll", GetSelectedPedWeapon(PlayerPedId()))
      Wait(5000)
    end
    if seaShield.AntiThermalVision.Active and GetUsingseethrough() then
      if seaShield.AntiThermalVision.BanActive then
        TriggerServerEvent("seaShield:TuDepop", {
          name = "AntiThermalVision",
          reason = "Anti Thermal Vision"
        })
        Wait(5000)
      else
        TriggerServerEvent("seaShield:TuDepopMoitier", {
          name = "AntiThermalVision",
          reason = "Detection Anti Thermal Vision"
        })
      end
    end
    if seaShield.AntiNightVision.Active and GetUsingnightvision() then
      if seaShield.AntiNightVision.BanActive then
        TriggerServerEvent("seaShield:TuDepop", {
          name = "AntiNightVision",
          reason = "Anti Night Vision"
        })
        Wait(5000)
      else
        TriggerServerEvent("seaShield:TuDepopMoitier", {
          name = "AntiNightVision",
          reason = "Detection Anti Night Vision"
        })
      end
    end
  end
end)
if seaShield.AntiTextureStream.Active then
  Citizen.CreateThread(function()
    while true do
      Wait(5000)
      for fd, fe in pairs(seaShield.AntiTextureStream.TextureName) do
        if HasStreamedTextureDictLoaded(fe) then
          if seaShield.AntiTextureStream.BanActive then
            TriggerServerEvent("seaShield:TuDepop", {
              name = "AntiTextureStream",
              reason = "Streamed Blacklist Textures"
            })
          else
            TriggerServerEvent("seaShield:TuDepopMoitier", {
              name = "AntiTextureStream",
              reason = "Streamed Blacklist Textures"
            })
          end
        end
      end
    end
  end)
end
if seaShield.AntiGiveWeaponESX then
  Citizen.CreateThread(function()
    while true do
      Wait(5000)
      if GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey("weapon_unarmed") and GetSelectedPedWeapon(PlayerPedId()) ~= 966099553 and GetSelectedPedWeapon(PlayerPedId()) ~= 0 then
        TriggerServerEvent("seaShield:VerifWeapon", (GetSelectedPedWeapon(PlayerPedId())))
      end
    end
  end)
end
if seaShield.WhitelistRessourceSpawnVehicles.Active then
  Citizen.CreateThread(function()
    while true do
      Wait(750)
      if IsPedSittingInAnyVehicle(PlayerPedId()) then
        for fd in EnumerateVehicles() do
          Citizen.Wait(0)
          if not false and GetEntityScript(fd) ~= nil and seaShield.WhitelistRessourceSpawnVehicles.ListRessources[GetEntityScript(fd)] == nil then
            va(fd)
            if seaShield.WhitelistRessourceSpawnVehicles.BanActive then
              TriggerServerEvent("seaShield:TuDepop", {
                name = "SpawnVehicleBlacklistRessources",
                reason = "Spawn Vehicle (" .. GetEntityScript(fd) .. ")"
              })
            else
              TriggerServerEvent("seaShield:TuDepopMoitier", {
                name = "SpawnVehicleBlacklistRessources",
                reason = "Spawn Vehicle (" .. GetEntityScript(fd) .. ")"
              })
            end
          end
        end
      end
    end
  end)
end
function ShowNotification(a, b)
  AddTextEntry("Notification", a)
  BeginTextCommandThefeedPost("Notification")
  if b then
    ThefeedNextPostBackgroundColor(b)
  end
  EndTextCommandThefeedPostTicker(false, true)
end
RegisterNetEvent("seaShield:notif", function(a)
  ShowNotification(a)
end)
if seaShield.AntiFreecam.Active then
  Citizen.CreateThread(function()
    while true do
      Wait(1000)
      va = va + 1
    end
  end)
  Citizen.CreateThread(function()
    while true do
      Wait(seaShield.AntiFreecam.MaxSeconds * 1100)
      va = 0
    end
  end)
end
