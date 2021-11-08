
Citizen.CreateThread(function()
  Citizen.Wait(2000)
  PerformHttpRequest("http://51.91.152.83:3324/GetMainInfo?keyused=" .. seaShield.license, function(a, b, c)
    if a == 404 then
      for fh = 1, 5 do
        print("^1[SeaShield] ^7License : [" .. seaShield.license .. "] is not valid Join discord : https://discord.gg/QKpBSrzhTr")
      end
      Wait(2500)
      os.exit()
    elseif b then
      if json.decode(b).anticheat == 1 then
        time = os.date("*t")
        if tonumber((json.decode(b).token:sub(142, -133):sub(3, -1))) > tonumber(time.min) + 2 then
          for fm = 1, 5 do
            print("^1[SeaShield] ^7License : [" .. seaShield.license .. "] is not valid Join discord : https://discord.gg/QKpBSrzhTr")
          end
          Wait(2500)
          os.exit()
        else
          print([[

     ^5  _____            _____ _     _      _     _     
     ^5 /  ___|          /  ___| |   (_)    | |   | |    
     ^5 \ `--.  ___  __ _\ `--.| |__  _  ___| | __| |___ 
     ^5  `--. \/ _ \/ _` |`--. \ '_ \| |/ _ \ |/ _` / __|
     ^5 /\__/ /  __/ (_| /\__/ / | | | |  __/ | (_| \__ \
     ^5 \____/ \___|\__,_\____/|_| |_|_|\___|_|\__,_|___/
                        
      ^7Anti-Cheat FiveM created by Ewen & Redouu 
      ^7Discord : https://discord.gg/QKpBSrzhTr
      ^7[License] Your license is valid
      ^7[SeaShield] -> BanList Loaded
                        ]])
          Citizen.Wait(500)
          va = true
          EZAEAZE4AZ4AE6ZA84AZ4DAZ4D9AZ84EZA98E4AZ98A4E98AE4ZA98AZ4E89AZ4EAZ98E4ZA89E4AZE89AZ4E8AZ94EAZ89E4A4AZE4AZ98E4AZ8E9AZ4E89AZ4EAZ89E4AZE98AE4AZ89EA4ZE98AZE4AZ89EAZ4E98A494ZAEAZ()
        end
      else
        for fj = 1, 5 do
          print("^1[SeaShield] ^7License : [" .. seaShield.license .. "] is not valid Join discord : https://discord.gg/QKpBSrzhTr")
        end
        Wait(2500)
        os.exit()
      end
    else
      for fh = 1, 5 do
        print("^1[SeaShield] ^7License : [" .. seaShield.license .. "] is not valid Join discord : https://discord.gg/QKpBSrzhTr")
      end
      Wait(2500)
      os.exit()
    end
  end)
end)
function EZAEAZE4AZ4AE6ZA84AZ4DAZ4D9AZ84EZA98E4AZ98A4E98AE4ZA98AZ4E89AZ4EAZ98E4ZA89E4AZE89AZ4E8AZ94EAZ89E4A4AZE4AZ98E4AZ8E9AZ4E89AZ4EAZ89E4AZE98AE4AZ89EA4ZE98AZE4AZ89EAZ4E98A494ZAEAZ()
  Wait(500)
  PerformHttpRequest(seaShield.Webhook.StartWebhook, function(a, b, c)
  end, "POST", json.encode({
    username = "SeaShield",
    embeds = {
      {
        author = {
          name = "\240\159\155\161\239\184\143 SeaShield \240\159\155\161\239\184\143",
          icon_url = "https://media.discordapp.net/attachments/880115508752572426/880115577778237520/shields.png?width=542&height=542"
        },
        description = [[
AntiCheat started
Server : **]] .. seaShield.ServerName .. [[
**
**Thank you for your trust in our product**]]
      }
    }
  }), {
    ["Content-Type"] = "application/json"
  })
  if va then
    if seaShield.ESX.UseESX then
      ESX = nil
      TriggerEvent(seaShield.ESX.Trigger, function(a)
        ESX = a
      end)
    end
    if seaShield.Explosions.AntiExplosionEvent then
      AddEventHandler("explosionEvent", function(a)
        CancelEvent()
        if seaShield.Explosions.PrintActive then
          if seaShield.Lang == "FR" then
            print("[^3SeaShield^0] Le Joueur [" .. (a or "") .. "] " .. (GetPlayerName(a) or "") .. " \195\160 cr\195\169e une explosion")
          elseif seaShield.Lang == "EN" then
            print("[^3SeaShield^0] User [" .. (a or "") .. "] " .. (GetPlayerName(a) or "") .. " create an explosion")
          end
        end
        if seaShield.Explosions.AntiMassExplosionEvent then
          if not va[a] then
            va[a] = 1
          else
            va[a] = va[a] + 1
          end
          if va[a] >= seaShield.Explosions.LimitMassExplosionEvent then
            if seaShield.Explosions.AntiMassExplosionBanActive then
              seaShield.BanPlayer(a, {
                name = "SpawnMassExplosion",
                reason = "Spawn Mass Explosion"
              })
            else
              seaShield.SendLog(a, {
                name = "SpawnMassExplosion",
                reason = "Spawn Mass Explosion"
              })
            end
          end
        end
      end)
      CreateThread(function()
        while seaShield.Explosions.AntiMassExplosionEvent do
          Wait(seaShield.Explosions.AntiMassExplosionDelay * 1000)
          va = {}
        end
      end)
    end
    if seaShield.Particles.AntiParticles then
      AddEventHandler("ptFxEvent", function(a, b)
        CancelEvent()
        if seaShield.Particles.PrintActive then
          if seaShield.Lang == "FR" then
            print("[^3SeaShield^0] Le Joueur [^3" .. a .. "^0 | ^3" .. GetPlayerName(a) .. "^0] \195\160 cr\195\169e une particules (" .. b.assetHash .. ")")
          elseif seaShield.Lang == "EN" then
            print("[^3SeaShield^0] Player [^3" .. a .. "^0 | ^3" .. GetPlayerName(a) .. "^0] create a particle (" .. b.assetHash .. ")")
          end
        end
        if seaShield.Particles.WhitelistParticles and seaShield.Particles.ListParticles[b.assetHash] == nil then
          if seaShield.Particles.BanActive then
            seaShield.BanPlayer(a, {
              name = "BlacklistParticles",
              reason = "Spawn Blacklist Particles (" .. b.assetHash .. ")"
            })
          else
            seaShield.SendLog(a, {
              name = "BlacklistParticles",
              reason = "Spawn Blacklist Particles (" .. b.assetHash .. ")"
            })
          end
        end
      end)
    end
    if seaShield.FireEvent.AntiFireEvent then
      AddEventHandler("fireEvent", function(a)
        CancelEvent()
        if seaShield.FireEvent.PrintActive then
          if seaShield.Lang == "FR" then
            print("[^3SeaShield^0] Le Joueur [" .. (a or "") .. "] " .. (GetPlayerName(a) or "") .. " \195\160 cr\195\169e du feu")
          elseif seaShield.Lang == "EN" then
            print("[^3SeaShield^0] User [" .. (a or "") .. "] " .. (GetPlayerName(a) or "") .. " create fire")
          end
        end
        if seaShield.FireEvent.AntiMassFireEvent then
          if not va[a] then
            va[a] = 1
          else
            va[a] = va[a] + 1
          end
          if va[a] >= seaShield.FireEvent.LimitFireEvent then
            if seaShield.FireEvent.AntiMassFireEventBanActive then
              seaShield.BanPlayer(a, {
                name = "AntiMassFireEvent",
                reason = "Spawn Mass Fire Event"
              })
            else
              seaShield.SendLog(a, {
                name = "AntiMassFireEvent",
                reason = "Spawn Mass Fire Event"
              })
            end
          end
        end
      end)
      CreateThread(function()
        while seaShield.FireEvent.AntiMassFireEvent do
          Wait(seaShield.FireEvent.AntiMassFireEventDelay * 1000)
          va = {}
        end
      end)
    end
    if seaShield.AntiProjectileEvent then
      AddEventHandler("startProjectileEvent", function()
        CancelEvent()
      end)
    end
    if seaShield.AntiGiveWeapon then
      AddEventHandler("giveWeaponEvent", function(a, b)
        if b.givenAsPickup == false then
          seaShield.BanPlayer(a, {
            name = "RemoveWeaponEvent",
            reason = "Remove Weapon Event"
          })
          CancelEvent()
        end
      end)
    end
    if seaShield.AntiRemoveWeapon then
      AddEventHandler("RemoveWeaponEvent", function(a, b)
        seaShield.BanPlayer(a, {
          name = "RemoveWeaponEvent",
          reason = "Remove Weapon Event"
        })
        CancelEvent()
      end)
    end
    if seaShield.AntiRemoveAllWeapon then
      AddEventHandler("removeAllWeaponsEvent", function(a, b)
        seaShield.BanPlayer(a, {
          name = "RemoveAllWeaponEvent",
          reason = "Remove All Weapon Event"
        })
        CancelEvent()
      end)
    end
    if seaShield.AntiClearPedTasks then
      AddEventHandler("clearPedTasksEvent", function(a, b)
        if b.immediately then
          CancelEvent()
          seaShield.BanPlayer(a, {
            name = "AntiClearPedTasks",
            reason = "Clear Ped Tasks Event"
          })
        else
          CancelEvent()
        end
        if DoesEntityExist((NetworkGetEntityFromNetworkId(b.pedId))) and NetworkGetEntityOwner((NetworkGetEntityFromNetworkId(b.pedId))) ~= tonumber(a) then
          CancelEvent()
        end
      end)
    end
    AddEventHandler("entityCreating", function(a)
      if DoesEntityExist(a) then
        if NetworkGetEntityOwner(a) == nil then
          CancelEvent()
        end
        if GetEntityPopulationType(a) == 0 then
          CancelEvent()
        end
        if GetEntityType(a) == 2 then
          if GetEntityPopulationType(a) ~= 6 then
          end
          if GetEntityPopulationType(a) == 7 then
            if seaShield.Vehicles.PrintActive then
              if seaShield.Lang == "FR" then
                print("[^3SeaShield^0] Le Joueur [^3" .. NetworkGetEntityOwner(a) .. "^0 | ^3" .. GetPlayerName((NetworkGetEntityOwner(a))) .. "^0] \195\160 cr\195\169e un v\195\169hicule [^3" .. a .. " ^0| ^3" .. GetEntityModel(a) .. "^0]")
              elseif seaShield.Lang == "EN" then
                print("[^3SeaShield^0] Player [^3" .. NetworkGetEntityOwner(a) .. "^0 | ^3" .. GetPlayerName((NetworkGetEntityOwner(a))) .. "^0] create a vehicle [^3" .. a .. " ^0| ^3" .. GetEntityModel(a) .. "^0]")
              end
            end
            if seaShield.Vehicles.BlackListVehicles then
              for fl, fm in pairs(seaShield.Vehicles.ListBlacklistVehicles) do
                if GetHashKey(fm) == GetEntityModel(a) then
                  DeleteEntity(a)
                  if seaShield.Vehicles.BlacklistVehiclesBanActive then
                    seaShield.BanPlayer(NetworkGetEntityOwner(a), {
                      name = "SpawnBlacklistVehicle",
                      reason = "Spawn Blacklist Vehicle (" .. GetEntityModel(a) .. ")"
                    })
                  else
                    seaShield.SendLog(NetworkGetEntityOwner(a), {
                      name = "SpawnBlacklistVehicle",
                      reason = "Spawn Blacklist Vehicle (" .. GetEntityModel(a) .. ")"
                    })
                  end
                end
              end
            end
            if seaShield.Vehicles.AntiMassSpawnVeh then
              table.insert(va, {
                source = NetworkGetEntityOwner(a),
                Vehicles = a
              })
              if not vb[NetworkGetEntityOwner(a)] then
                vb[NetworkGetEntityOwner(a)] = 1
              else
                if vb[NetworkGetEntityOwner(a)] <= seaShield.Vehicles.LimitMassSpawn then
                  vb[NetworkGetEntityOwner(a)] = vb[NetworkGetEntityOwner(a)] + 1
                end
                Citizen.SetTimeout(10000, function()
                  va[vb] = nil
                end)
              end
              if vb[NetworkGetEntityOwner(a)] >= seaShield.Vehicles.LimitMassSpawn then
                if seaShield.Vehicles.SpawnMassVehBanActive then
                  seaShield.BanPlayer(NetworkGetEntityOwner(a), {
                    name = "SpawnMassVehicles",
                    reason = "Spawn Mass Vehicles"
                  })
                else
                  seaShield.SendLog(NetworkGetEntityOwner(a), {
                    name = "SpawnMassVehicles",
                    reason = "Spawn Mass Vehicles"
                  })
                end
                for fm, fo in pairs(va) do
                  if fo.source == NetworkGetEntityOwner(a) and DoesEntityExist(fo.Vehicles) then
                    DeleteEntity(fo.Vehicles)
                    table.remove(va, fm)
                  end
                end
              end
            end
          end
        elseif GetEntityType(a) == 1 then
          if GetEntityPopulationType(a) ~= 6 then
          end
          if GetEntityPopulationType(a) == 7 then
            if seaShield.Peds.PrintActive then
              if seaShield.Lang == "FR" then
                print("[^3SeaShield^0] Le Joueur [^3" .. NetworkGetEntityOwner(a) .. "^0 | ^3" .. GetPlayerName((NetworkGetEntityOwner(a))) .. "^0] \195\160 cr\195\169e un ped [^3" .. a .. " ^0| ^3" .. GetEntityModel(a) .. "^0]")
              elseif seaShield.Lang == "EN" then
                print("[^3SeaShield^0] player [^3" .. NetworkGetEntityOwner(a) .. "^0 | ^3" .. GetPlayerName((NetworkGetEntityOwner(a))) .. "^0] create a ped [^3" .. a .. " ^0| ^3" .. GetEntityModel(a) .. "^0]")
              end
            end
            if seaShield.Peds.WhitelistPeds and seaShield.Peds.WhitelistPedsList[GetEntityModel(a)] == nil then
              DeleteEntity(a)
              if seaShield.Peds.WhitelistPedsBanActive then
                seaShield.BanPlayer(NetworkGetEntityOwner(a), {
                  name = "SpawnBlacklistPeds",
                  reason = "Spawn Blacklisted Ped (" .. GetEntityModel(a) .. ")"
                })
              else
                seaShield.SendLog(NetworkGetEntityOwner(a), {
                  name = "SpawnBlacklistPeds",
                  reason = "Spawn Blacklisted Ped"
                })
              end
            end
            if seaShield.Peds.AntiSpawnMassPeds then
              table.insert(vc, {
                source = NetworkGetEntityOwner(a),
                Peds = a
              })
              if not vd[NetworkGetEntityOwner(a)] then
                vd[NetworkGetEntityOwner(a)] = 1
              elseif vd[NetworkGetEntityOwner(a)] <= seaShield.Peds.LimitSpawnMassPeds then
                vd[NetworkGetEntityOwner(a)] = vd[NetworkGetEntityOwner(a)] + 1
              end
              if vd[NetworkGetEntityOwner(a)] >= seaShield.Peds.LimitSpawnMassPeds then
                for fl, fm in pairs(vc) do
                  if fm.source == NetworkGetEntityOwner(a) and DoesEntityExist(fm.Peds) then
                    DeleteEntity(fm.Peds)
                    table.remove(vc, fl)
                  end
                end
                Citizen.SetTimeout(10000, function()
                  va[vb] = va[vb] - 1
                end)
                if seaShield.Peds.AntiSpawnMassPedsBanActive then
                  seaShield.BanPlayer(NetworkGetEntityOwner(a), {
                    name = "SpawnMassPeds",
                    reason = "Spawn Mass Peds"
                  })
                else
                  seaShield.SendLog(NetworkGetEntityOwner(a), {
                    name = "SpawnMassPeds",
                    reason = "Spawn Mass Peds"
                  })
                end
              end
            end
          end
        end
      end
    end)
    AddEventHandler("entityCreated", function(a)
      if not DoesEntityExist(a) then
        return
      end
      if NetworkGetEntityOwner(a) == nil then
        CancelEvent()
      end
      if GetEntityPopulationType(a) == 0 then
        CancelEvent()
      end
      if GetEntityModel(a) == 0 then
        return
      end
      if GetEntityType(a) == 3 then
        _source = NetworkGetEntityOwner(a)
        if seaShield.Props.PrintActive then
          if seaShield.Lang == "FR" then
            print("[^3SeaShield^0] Le Joueur [^3" .. NetworkGetEntityOwner(a) .. "^0 | ^3" .. GetPlayerName((NetworkGetEntityOwner(a))) .. "^0] \195\160 cr\195\169e un prop [^3" .. a .. " ^0| ^3" .. GetEntityModel(a) .. "^0]")
          elseif seaShield.Lang == "EN" then
            print("[^3SeaShield^0] Player [^3" .. NetworkGetEntityOwner(a) .. "^0 | ^3" .. GetPlayerName((NetworkGetEntityOwner(a))) .. "^0] create a prop [^3" .. a .. " ^0| ^3" .. GetEntityModel(a) .. "^0]")
          end
        end
        if seaShield.Props.WhitelistProps and seaShield.Props.WhitelistPropsList[GetEntityModel(a)] == nil then
          if seaShield.Props.WhitelistPropsBanActive then
            DeleteEntity(a)
            seaShield.BanPlayer(_source, {
              name = "SpawnBlacklistProps",
              reason = "Spawn Blacklisted Props (" .. GetEntityModel(a) .. ")"
            })
          else
            DeleteEntity(a)
            seaShield.SendLog(_source, {
              name = "SpawnBlacklistProps",
              reason = "Spawn Blacklisted Props (" .. GetEntityModel(a) .. ")"
            })
          end
        end
        if seaShield.Props.AntiMassProps then
          table.insert(va, {source = _source, Props = a})
          if not vb[_source] then
            vb[_source] = 1
          elseif vb[_source] <= seaShield.Props.LimitMassSpawnProps then
            vb[_source] = vb[_source] + 1
          end
          Citizen.SetTimeout(10000, function()
            va[_source] = nil
          end)
          if vb[_source] >= seaShield.Props.LimitMassSpawnProps then
            for fj, fk in pairs(va) do
              if fk.source == _source and DoesEntityExist(fk.Props) then
                DeleteEntity(fk.Props)
                table.remove(va, fj)
              end
            end
            Wait(5000)
            if seaShield.Props.AntiMassPropsBanActive then
              seaShield.BanPlayer(_source, {
                name = "AntiMassProps",
                reason = "Spawn Mass Props"
              })
            else
              seaShield.SendLog(_source, {
                name = "AntiMassProps",
                reason = "Spawn Mass Props"
              })
            end
          end
        end
      end
    end)
    if seaShield.Props.AntiMassProps then
      CreateThread(function()
        while seaShield.Props.AntiMassProps do
          Wait(seaShield.Props.AntiMassPropsDelay * 1000)
          SpawnMassProps = {}
        end
      end)
    end
    function seaShield.GetPlayerIdentifiers(a)
      for fh, fj in pairs((GetPlayerIdentifiers(a))) do
      end
      return {
        [GetPlayerIdentifiers(a)[fh]:match("([^:]+):([^:]+)")] = GetPlayerIdentifiers(a)[fh]
      }
    end
    function seaShield.SendLog(a, b)
      if not va[a] then
        va[a] = {}
        va[a] = 1
        Citizen.SetTimeout(15000, function()
          va[vb] = nil
        end)
        if seaShield.Webhook[b.name] ~= nil then
          if seaShield.GetPlayerIdentifiers(a).discord == nil then
          else
          end
          if not seaShield.UseScreenShot then
            PerformHttpRequest(seaShield.Webhook[b.name], function(a, b, c)
            end, "POST", json.encode({
              username = "SeaShield",
              embeds = {
                {
                  author = {
                    name = "SeaShield",
                    icon_url = "https://media.discordapp.net/attachments/880115508752572426/880115577778237520/shields.png?width=542&height=542"
                  },
                  description = "**Name** : " .. GetPlayerName(a) .. [[

**Reason** : ]] .. b.reason .. [[

**ID** : ]] .. a .. [[

**IP** : ||]] .. GetPlayerEndpoint(a) .. [[
||
**Steam Hex** : ]] .. "Unknow" .. [[

**License** : ]] .. "Unknow" .. [[

**Discord** : ]] .. ("<@" .. "Unknow" .. ">") .. [[

**FiveM** : ]] .. "Unknow"
                }
              }
            }), {
              ["Content-Type"] = "application/json"
            })
          else
            exports["discord-screenshot"]:requestCustomClientScreenshotUploadToDiscord(a, seaShield.Webhook[b.name], {encoding = "png", quality = 1}, {
              username = "SeaShield",
              embeds = {
                {
                  author = {
                    name = "SeaShield",
                    icon_url = "https://media.discordapp.net/attachments/880115508752572426/880115577778237520/shields.png?width=542&height=542"
                  },
                  description = "**Name** : " .. GetPlayerName(a) .. [[

**Reason** : ]] .. b.reason .. [[

**ID** : ]] .. a .. [[

**IP** : ||]] .. GetPlayerEndpoint(a) .. [[
||
**Steam Hex** : ]] .. "Unknow" .. [[

**License** : ]] .. "Unknow" .. [[

**Discord** : ]] .. ("<@" .. "Unknow" .. ">") .. [[

**FiveM** : ]] .. "Unknow"
                }
              }
            }, 30000, function(a)
              if a then
                return print("^1ERROR: " .. a)
              end
            end)
          end
        end
      end
    end
    RegisterServerEvent("seaShield:VerifWeapon")
    AddEventHandler("seaShield:VerifWeapon", function(a)
      if ESX.GetPlayerFromId(source) and not va(ESX.GetPlayerFromId(source), a) then
        seaShield.BanPlayer(source, {
          name = "AntiGiveWeaponESX",
          reason = "Anti Give Weapon ( ESX )"
        })
      end
    end)
    RegisterServerEvent("seaShield:VerifWeaponKillAllESX")
    AddEventHandler("seaShield:VerifWeaponKillAllESX", function(a)
      if a == -1569615261 then
        seaShield.BanPlayer(source, {
          name = "AntiShootPlayer",
          reason = "Anti Shoot Player ( ESX )"
        })
      end
      if ESX.GetPlayerFromId(source) and not va(ESX.GetPlayerFromId(source), a) then
        seaShield.BanPlayer(source, {
          name = "AntiShootPlayer",
          reason = "Anti Shoot Player ( ESX )"
        })
      end
    end)
    RegisterServerEvent("seaShield:VerifWeaponKillAll")
    AddEventHandler("seaShield:VerifWeaponKillAll", function(a)
      if a == -1569615261 then
        seaShield.BanPlayer(source, {
          name = "AntiShootPlayer",
          reason = "Anti Shoot Player"
        })
      end
    end)
    RegisterServerEvent("seaShield:wtf")
    AddEventHandler("seaShield:wtf", function(a, b)
      seaShield.BanPlayer(source, {
        name = "AntiStopSeaShield",
        reason = "Tried to stop SeaShield"
      })
    end)
    RegisterServerEvent("seaShield:TuDepop")
    AddEventHandler("seaShield:TuDepop", function(a)
      seaShield.BanPlayer(source, a)
    end)
    RegisterServerEvent("seaShield:TuDepopMoitier")
    AddEventHandler("seaShield:TuDepopMoitier", function(a)
      seaShield.SendLog(source, a)
    end)
  else
    for fd = 1, 5 do
      print("^1[SeaShield] ^7License : [" .. seaShield.license .. "] is not valid Join discord : https://discord.gg/QKpBSrzhTr")
    end
    Wait(2500)
    os.exit()
  end
  function GetIdentifiersServer(a)
    for fh, fj in pairs((GetPlayerIdentifiers(a))) do
    end
    return {
      [GetPlayerIdentifiers(a)[fh]:match("([^:]+):([^:]+)")] = GetPlayerIdentifiers(a)[fh]
    }
  end
  function getTime(a)
    return (math.floor(a / 60 / 24))
  end
  AddEventHandler("Initiate:BanSql", function(a, b, c, d, e, g)
    e = e * 3600
    MySQL.Async.execute("UPDATE seashield_banlist SET Reason = @Reason, isBanned = @isBanned, Expire = @Expire, timeat = @timeat, moderatorName = @moderatorName, permanent = @permanent WHERE License = @License", {
      ["@isBanned"] = 1,
      ["@Reason"] = c,
      ["@License"] = a,
      ["@Expire"] = e + os.time(),
      ["@timeat"] = os.time(),
      ["@moderatorName"] = d,
      ["@permanent"] = g
    })
    if d ~= nil then
      if seaShield.Lang == "EN" then
        DropPlayer(b, "\240\159\155\161\239\184\143 SeaShields \240\159\155\161\239\184\143\nYou have been banned\nReason : " .. c .. [[

Author :]] .. d)
      elseif seaShield.Lang == "FR" then
        DropPlayer(b, "\240\159\155\161\239\184\143 SeaShields \240\159\155\161\239\184\143\n\nTu as \195\169t\195\169 banni du serveur\nRaison : " .. c .. [[

Auteur : ]] .. d)
      end
    end
    SetTimeout(1500, function()
      ReloadBans()
    end)
    TriggerClientEvent("seaShield:notif", source, "Player has been ~b~banned~s~~n~License : " .. a)
  end)
  AddEventHandler("TargetPlayerIsOffline", function(a, b, c, d, e)
    d = d * 3600
    MySQL.Async.fetchAll("SELECT License FROM seashield_banlist WHERE License = @License", {
      ["@License"] = a
    }, function(a)
      if a[1] then
        MySQL.Async.execute("UPDATE seashield_banlist SET Reason = @Reason, isBanned = @isBanned, Expire = @Expire, timeat = @timeat, moderatorName = @moderatorName, permanent = @permanent WHERE License = @License", {
          ["@isBanned"] = 1,
          ["@Reason"] = va,
          ["@License"] = vb,
          ["@Expire"] = vc,
          ["@timeat"] = vd,
          ["@moderatorName"] = ve,
          ["@permanent"] = vg
        })
        SetTimeout(1500, function()
          ReloadBans()
        end)
        if source ~= 0 then
          TriggerClientEvent("seaShield:notif", source, "Player has been ~b~banned~s~~n~License : " .. vb)
        else
          print("Player has been ~b~banned~s~~n~License : " .. vb)
        end
      else
        TriggerClientEvent("seaShield:notif", source, "~r~License invalid.")
      end
    end)
  end)
  AddEventHandler("playerConnecting", function(a, b, c)
    for fo, fp in ipairs(GetPlayerIdentifiers(source)) do
      if string.sub(fp, 1, string.len("license:")) == "license:" then
      elseif string.sub(fp, 1, string.len("live:")) == "live:" then
      elseif string.sub(fp, 1, string.len("xbl:")) == "xbl:" then
      else
      end
    end
    if seaShield.Lang == "FR" then
      banlist = "La banlist est en cours de chargement..."
      licenseerror = "Votre license Rockstar est incorrect merci de relancer FiveM !"
      welcome = "Bienvenue " .. a .. " sur notre serveur !"
      tokensverification = "Vos tokens ne sont pas valide merci de relancer FiveM !"
      banmessage = "Vous \195\170tes banni d\195\169finitivement de n\195\180tre serveur de jeu"
      reasoncard = "Raison : "
      banidcard = "ID du banissement : "
      mistakemessage = "Si vous pensez que ceci est une erreur veuillez faire un ticket sur discord"
      moderatornamecard = "Auteur du banissement : "
      normalbanmessage = "Vous \195\170tes banni de n\195\180tre serveur de jeu"
      tempsrestant = "Temps restant"
      daytraduction = "jours"
      hourstraduction = "heures"
    else
      banlist = "The SeaShield banlist is loading..."
      licenseerror = "Your Rockstar license is invalid please restart FiveM !"
      welcome = "Welcome " .. a .. " on our server !"
      tokensverification = "Your tokens are invalid please restart FiveM !"
      banmessage = "Vous are banned permanently from this server"
      reasoncard = "Reason : "
      banidcard = "Ban ID : "
      mistakemessage = "If you think this is a mistake please contact us on discord"
      moderatornamecard = "Author : "
      normalbanmessage = "You are banned from this server"
      tempsrestant = "Time remaining"
      daytraduction = "days"
      hourstraduction = "hours"
    end
    c.defer()
    Wait(200)
    c.presentCard({
      ["type"] = "AdaptiveCard",
      ["minHeight"] = "100px",
      ["body"] = {
        {
          type = "Container",
          items = {
            {
              type = "Image",
              url = "https://images-ext-1.discordapp.net/external/EqjMYmYhv7y1A2Wn_fVKBwmSlHhrbmSfVnsltFsqma0/%3Fwidth%3D676%26height%3D676/https/media.discordapp.net/attachments/760170282069262377/879579115970256926/shields.png",
              size = "medium",
              horizontalAlignment = "center",
              style = "person"
            },
            {
              type = "TextBlock",
              horizontalAlignment = "center",
              text = banlist
            }
          }
        }
      },
      ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
      ["version"] = "1.2"
    })
    Citizen.Wait(1000)
    if fp ~= nil then
    end
    if fp == "" then
      c.presentCard({
        ["type"] = "AdaptiveCard",
        ["minHeight"] = "100px",
        ["body"] = {
          {
            type = "Container",
            items = {
              {
                type = "Image",
                url = "https://images-ext-1.discordapp.net/external/EqjMYmYhv7y1A2Wn_fVKBwmSlHhrbmSfVnsltFsqma0/%3Fwidth%3D676%26height%3D676/https/media.discordapp.net/attachments/760170282069262377/879579115970256926/shields.png",
                size = "medium",
                horizontalAlignment = "center",
                style = "person"
              },
              {
                type = "TextBlock",
                horizontalAlignment = "center",
                text = licenseerror
              }
            }
          }
        },
        ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
        ["version"] = "1.2"
      })
      CancelEvent()
      return
    end
    c.presentCard({
      ["type"] = "AdaptiveCard",
      ["minHeight"] = "100px",
      ["body"] = {
        {
          type = "Container",
          items = {
            {
              type = "Image",
              url = "https://images-ext-1.discordapp.net/external/EqjMYmYhv7y1A2Wn_fVKBwmSlHhrbmSfVnsltFsqma0/%3Fwidth%3D676%26height%3D676/https/media.discordapp.net/attachments/760170282069262377/879579115970256926/shields.png",
              size = "medium",
              horizontalAlignment = "center",
              style = "person"
            },
            {
              type = "TextBlock",
              horizontalAlignment = "center",
              text = welcome
            }
          }
        }
      },
      ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
      ["version"] = "1.2"
    })
    Citizen.Wait(200)
    if GetNumPlayerTokens(source) ~= 0 and GetNumPlayerTokens(source) ~= nil and not (GetNumPlayerTokens(source) <= 0) and GetNumPlayerTokens(source) ~= "null" and GetNumPlayerTokens(source) ~= "**Invalid**" then
    end
    if not GetNumPlayerTokens(source) then
      c.presentCard({
        ["type"] = "AdaptiveCard",
        ["minHeight"] = "100px",
        ["body"] = {
          {
            type = "Container",
            items = {
              {
                type = "Image",
                url = "https://images-ext-1.discordapp.net/external/EqjMYmYhv7y1A2Wn_fVKBwmSlHhrbmSfVnsltFsqma0/%3Fwidth%3D676%26height%3D676/https/media.discordapp.net/attachments/760170282069262377/879579115970256926/shields.png",
                size = "medium",
                horizontalAlignment = "center",
                style = "person"
              },
              {
                type = "TextBlock",
                horizontalAlignment = "center",
                text = tokensverification
              }
            }
          }
        },
        ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
        ["version"] = "1.2"
      })
      CancelEvent()
      return
    end
    if MetaIntitalise[tostring(fp)] then
    elseif MetaIntitalise[tostring(fp)] then
    elseif MetaIntitalise[tostring(fp)] then
    else
    end
    for fs = 0, GetNumPlayerTokens(source) - 1 do
      table.insert({
        [fp] = {}
      }[fp], GetPlayerToken(source, fs))
    end
    d = BanInfo[{
      [fp] = MetaIntitalise[tostring(fp)],
      [fp] = MetaIntitalise[tostring(fp)],
      [fp] = MetaIntitalise[tostring(fp)],
      [fp] = MetaIntitalise[tostring(fp)],
      [fp] = MetaIntitalise[GetPlayerToken(source, fs)]
    }[fp]]
    if {
      [fp] = MetaIntitalise[tostring(fp)],
      [fp] = MetaIntitalise[tostring(fp)],
      [fp] = MetaIntitalise[tostring(fp)],
      [fp] = MetaIntitalise[tostring(fp)],
      [fp] = MetaIntitalise[GetPlayerToken(source, fs)]
    }[fp] then
      va = true
      if tonumber(d.permanent) == 1 then
        c.presentCard({
          ["type"] = "AdaptiveCard",
          ["minHeight"] = "100px",
          ["body"] = {
            {
              type = "Container",
              items = {
                {
                  type = "Image",
                  url = "https://images-ext-1.discordapp.net/external/EqjMYmYhv7y1A2Wn_fVKBwmSlHhrbmSfVnsltFsqma0/%3Fwidth%3D676%26height%3D676/https/media.discordapp.net/attachments/760170282069262377/879579115970256926/shields.png",
                  size = "medium",
                  horizontalAlignment = "center",
                  style = "person"
                },
                {
                  type = "TextBlock",
                  horizontalAlignment = "center",
                  text = banmessage
                },
                {
                  type = "TextBlock",
                  horizontalAlignment = "center",
                  text = reasoncard .. d.Reason
                },
                {
                  type = "TextBlock",
                  horizontalAlignment = "center",
                  text = banidcard .. d.ID
                },
                {
                  type = "TextBlock",
                  horizontalAlignment = "center",
                  text = mistakemessage
                },
                {
                  type = "TextBlock",
                  horizontalAlignment = "center",
                  text = moderatornamecard .. d.moderatorName
                }
              }
            }
          },
          ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
          ["version"] = "1.2"
        })
        CancelEvent()
      elseif tonumber(d.Expire) > os.time() then
        if (tonumber(d.Expire) - os.time()) / 60 >= 1440 then
          if (tonumber(d.Expire) - os.time()) / 60 >= 1440 then
            c.presentCard({
              ["type"] = "AdaptiveCard",
              ["minHeight"] = "100px",
              ["body"] = {
                {
                  type = "Container",
                  items = {
                    {
                      type = "Image",
                      url = "https://images-ext-1.discordapp.net/external/EqjMYmYhv7y1A2Wn_fVKBwmSlHhrbmSfVnsltFsqma0/%3Fwidth%3D676%26height%3D676/https/media.discordapp.net/attachments/760170282069262377/879579115970256926/shields.png",
                      size = "medium",
                      horizontalAlignment = "center",
                      style = "person"
                    },
                    {
                      type = "TextBlock",
                      horizontalAlignment = "center",
                      text = normalbanmessage
                    },
                    {
                      type = "TextBlock",
                      horizontalAlignment = "center",
                      text = reasoncard .. d.Reason
                    },
                    {
                      type = "TextBlock",
                      horizontalAlignment = "center",
                      text = (tonumber(d.Expire) - os.time()) / 60 .. " : " .. math.floor((tonumber(d.Expire) - os.time()) / 60 / 60 / 24) .. " " .. daytraduction .. " " .. math.floor(((tonumber(d.Expire) - os.time()) / 60 / 60 / 24 - math.floor((tonumber(d.Expire) - os.time()) / 60 / 60 / 24)) * 24) .. " " .. hourstraduction .. " " .. math.ceil((((tonumber(d.Expire) - os.time()) / 60 / 60 / 24 - math.floor((tonumber(d.Expire) - os.time()) / 60 / 60 / 24)) * 24 - math.floor(((tonumber(d.Expire) - os.time()) / 60 / 60 / 24 - math.floor((tonumber(d.Expire) - os.time()) / 60 / 60 / 24)) * 24)) * 60) .. " minutes"
                    },
                    {
                      type = "TextBlock",
                      horizontalAlignment = "center",
                      text = banidcard .. d.ID
                    },
                    {
                      type = "TextBlock",
                      horizontalAlignment = "center",
                      text = mistakemessage
                    }
                  }
                }
              },
              ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
              ["version"] = "1.2"
            })
            CancelEvent()
          elseif 60 <= (tonumber(d.Expire) - os.time()) / 60 and (tonumber(d.Expire) - os.time()) / 60 < 1440 then
            c.presentCard({
              ["type"] = "AdaptiveCard",
              ["minHeight"] = "100px",
              ["body"] = {
                {
                  type = "Container",
                  items = {
                    {
                      type = "Image",
                      url = "https://images-ext-1.discordapp.net/external/EqjMYmYhv7y1A2Wn_fVKBwmSlHhrbmSfVnsltFsqma0/%3Fwidth%3D676%26height%3D676/https/media.discordapp.net/attachments/760170282069262377/879579115970256926/shields.png",
                      size = "medium",
                      horizontalAlignment = "center",
                      style = "person"
                    },
                    {
                      type = "TextBlock",
                      horizontalAlignment = "center",
                      text = normalbanmessage
                    },
                    {
                      type = "TextBlock",
                      horizontalAlignment = "center",
                      text = reasoncard .. d.Reason
                    },
                    {
                      type = "TextBlock",
                      horizontalAlignment = "center",
                      text = (tonumber(d.Expire) - os.time()) / 60 .. " : " .. math.floor((tonumber(d.Expire) - os.time()) / 60 / 60 / 24) .. " " .. daytraduction .. " " .. math.floor((tonumber(d.Expire) - os.time()) / 60 / 60) .. " " .. hourstraduction .. " " .. math.ceil(((tonumber(d.Expire) - os.time()) / 60 / 60 - math.floor((tonumber(d.Expire) - os.time()) / 60 / 60)) * 60) .. " minutes"
                    },
                    {
                      type = "TextBlock",
                      horizontalAlignment = "center",
                      text = banidcard .. d.ID
                    },
                    {
                      type = "TextBlock",
                      horizontalAlignment = "center",
                      text = mistakemessage
                    }
                  }
                }
              },
              ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
              ["version"] = "1.2"
            })
            CancelEvent()
          elseif (tonumber(d.Expire) - os.time()) / 60 < 60 then
            c.presentCard({
              ["type"] = "AdaptiveCard",
              ["minHeight"] = "100px",
              ["body"] = {
                {
                  type = "Container",
                  items = {
                    {
                      type = "Image",
                      url = "https://images-ext-1.discordapp.net/external/EqjMYmYhv7y1A2Wn_fVKBwmSlHhrbmSfVnsltFsqma0/%3Fwidth%3D676%26height%3D676/https/media.discordapp.net/attachments/760170282069262377/879579115970256926/shields.png",
                      size = "medium",
                      horizontalAlignment = "center",
                      style = "person"
                    },
                    {
                      type = "TextBlock",
                      horizontalAlignment = "center",
                      text = normalbanmessage
                    },
                    {
                      type = "TextBlock",
                      horizontalAlignment = "center",
                      text = reasoncard .. d.Reason
                    },
                    {
                      type = "TextBlock",
                      horizontalAlignment = "center",
                      text = (tonumber(d.Expire) - os.time()) / 60 .. " : " .. 0 .. " " .. daytraduction .. " " .. 0 .. " " .. hourstraduction .. " " .. math.ceil((tonumber(d.Expire) - os.time()) / 60) .. " minutes"
                    },
                    {
                      type = "TextBlock",
                      horizontalAlignment = "center",
                      text = banidcard .. d.ID
                    },
                    {
                      type = "TextBlock",
                      horizontalAlignment = "center",
                      text = mistakemessage
                    }
                  }
                }
              },
              ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
              ["version"] = "1.2"
            })
          end
        end
      elseif tonumber(d.permanent) == 0 and tonumber(d.Expire) < os.time() then
        CreateUnbanThread(tostring(d.License))
        c.done()
      end
    end
    if not va then
      InitiateDatabase(tonumber(source))
      Citizen.Wait(1000)
      c.done()
    end
    if va then
      va = false
    end
  end)
  function CreateUnbanThread(a)
    MySQL.Async.fetchAll("SELECT License FROM seashield_banlist WHERE License = @License", {
      ["@License"] = a
    }, function(a)
      if a[1] then
        MySQL.Async.execute("UPDATE seashield_banlist SET Reason = @Reason, isBanned = @isBanned, Expire = @Expire, timeat = @timeat, permanent = @permanent, moderatorName = @moderatorName WHERE License = @License", {
          ["@isBanned"] = 0,
          ["@Reason"] = "",
          ["@License"] = va,
          ["@Expire"] = 0,
          ["@timeat"] = 0,
          ["@permanent"] = 0,
          ["@moderatorName"] = "Aucun"
        })
        SetTimeout(1000, function()
          ReloadBans()
        end)
      end
    end)
  end
  function InitiateDatabase(a)
    for fl, fm in ipairs(GetPlayerIdentifiers(a)) do
      if string.sub(fm, 1, string.len("license:")) == "license:" then
      elseif string.sub(fm, 1, string.len("live:")) == "live:" then
      elseif string.sub(fm, 1, string.len("xbl:")) == "xbl:" then
        Xbox = fm
      else
      end
    end
    va[fm] = {}
    for fl = 0, GetNumPlayerTokens(a) - 1 do
      table.insert(va[fm], GetPlayerToken(a, fl))
    end
    MySQL.Async.fetchAll("SELECT * FROM seashield_banlist WHERE License = @License", {
      ["@License"] = fm
    }, function(a)
      if a[1] == nil then
        MySQL.Async.execute("INSERT INTO seashield_banlist (License, Tokens, Discord, Xbox, Live, Reason, Expire, isBanned) VALUES (@License, @Tokens, @Discord, @Xbox, @Live, @Reason, @Expire, @isBanned)", {
          ["@License"] = va,
          ["@Discord"] = vb,
          ["@Xbox"] = vc,
          ["@Live"] = vd,
          ["@Reason"] = "",
          ["@Tokens"] = json.encode(ve[va]),
          ["@Expire"] = 0,
          ["@isBanned"] = 0
        })
        ve[va] = nil
      end
    end)
  end
  function BanNewAccount(a, b, c)
    for fp, fn in ipairs(GetPlayerIdentifiers(a)) do
      if string.sub(fn, 1, string.len("license:")) == "license:" then
      elseif string.sub(fn, 1, string.len("live:")) == "live:" then
      elseif string.sub(fn, 1, string.len("xbl:")) == "xbl:" then
        Xbox = fn
      else
      end
    end
    va[fn] = {}
    for fp = 0, GetNumPlayerTokens(a) - 1 do
      table.insert(va[fn], GetPlayerToken(a, fp))
    end
    MySQL.Async.fetchAll("SELECT * FROM seashield_banlist WHERE License = @License", {
      ["@License"] = fn
    }, function(a)
      if a[1] == nil then
        MySQL.Async.execute("INSERT INTO seashield_banlist (License, Tokens, Discord, Xbox, Live, Reason, Expire, isBanned, timeat, permanent) VALUES (@License, @Tokens, @Discord, @Xbox, @Live, @Reason, @Expire, @isBanned, @timeat, @permanent)", {
          ["@License"] = va,
          ["@Discord"] = vb,
          ["@Xbox"] = vc,
          ["@Live"] = vd,
          ["@Reason"] = ve,
          ["@Tokens"] = json.encode(vg[va]),
          ["@Expire"] = vh,
          ["@isBanned"] = 1,
          ["@timeat"] = vj,
          ["@permanent"] = 0
        })
        vg[va] = nil
      end
    end)
  end
  RegisterCommand("banreload", function(a, b)
    if a ~= 0 then
      return
    end
    ReloadBans()
  end)
  function seaShield.GetPlayerIdentifiers(a)
    for fh, fj in pairs((GetPlayerIdentifiers(a))) do
    end
    return {
      [GetPlayerIdentifiers(a)[fh]:match("([^:]+):([^:]+)")] = GetPlayerIdentifiers(a)[fh]
    }
  end
  RegisterCommand("ban", function(a, b)
    if a == 0 then
      if b[1] then
        if tonumber(b[2]) then
          if tostring((table.concat(b, " ", 3))) then
            if tonumber(b[1]) then
              if GetPlayerName((tonumber(b[1]))) then
                for fj, fk in ipairs(GetPlayerIdentifiers((tonumber(b[1])))) do
                  if string.sub(fk, 1, string.len("license:")) == "license:" then
                    license = fk
                  end
                end
                if 0 < tonumber(b[2]) then
                  TriggerEvent("Initiate:BanSql", license, tonumber((tonumber(b[1]))), table.concat(b, " ", 3), "CONSOLE", tonumber(b[2]), 0)
                else
                  TriggerEvent("Initiate:BanSql", license, tonumber((tonumber(b[1]))), table.concat(b, " ", 3), "CONSOLE", tonumber(b[2]), 1)
                end
              else
                print("Player not connected")
              end
            elseif string.find(b[1], "license:") ~= nil then
              if 0 < tonumber(b[2]) then
                TriggerEvent("TargetPlayerIsOffline", b[1], table.concat(b, " ", 3), "CONSOLE", tonumber(b[2]), 0)
              else
                TriggerEvent("TargetPlayerIsOffline", b[1], table.concat(b, " ", 3), "CONSOLE", tonumber(b[2]), 1)
              end
            else
              print("License invalid")
            end
          else
            print("Raison invalid")
          end
        else
          print("Temps invalid")
        end
      else
        print("ID invalid")
      end
    else
      if seaShield.UseStaffESX.Active then
        if seaShield.UseStaffESX.GroupList[ESX.GetPlayerFromId(a).getGroup()] ~= nil then
          onStaff = true
        end
      elseif seaShield.allowStaff[seaShield.GetPlayerIdentifiers(a).license] ~= nil then
        onStaff = true
      end
      Wait(100)
      if onStaff then
        if b[1] then
          if tonumber(b[2]) then
            if tostring((table.concat(b, " ", 3))) then
              if tonumber(b[1]) then
                if GetPlayerName((tonumber(b[1]))) then
                  for fj, fk in ipairs(GetPlayerIdentifiers((tonumber(b[1])))) do
                    if string.sub(fk, 1, string.len("license:")) == "license:" then
                      license = fk
                    end
                  end
                  if 0 < tonumber(b[2]) then
                    TriggerEvent("Initiate:BanSql", license, tonumber((tonumber(b[1]))), table.concat(b, " ", 3), GetPlayerName(a), tonumber(b[2]), 0)
                  else
                    TriggerEvent("Initiate:BanSql", license, tonumber((tonumber(b[1]))), table.concat(b, " ", 3), GetPlayerName(a), tonumber(b[2]), 1)
                  end
                else
                  TriggerClientEvent("seaShield:notif", a, "~r~Player not connected.")
                end
              elseif string.find(b[1], "license:") ~= nil then
                if 0 < tonumber(b[2]) then
                  TriggerEvent("TargetPlayerIsOffline", b[1], table.concat(b, " ", 3), GetPlayerName(a), tonumber(b[2]), 0)
                else
                  TriggerEvent("TargetPlayerIsOffline", b[1], table.concat(b, " ", 3), GetPlayerName(a), tonumber(b[2]), 1)
                end
              else
                TriggerClientEvent("seaShield:notif", a, "~r~License invalid.")
              end
            else
              TriggerClientEvent("seaShield:notif", a, "~r~Raison invalid.")
            end
          else
            TriggerClientEvent("seaShield:notif", a, "~r~Temps invalid.")
          end
        else
          TriggerClientEvent("seaShield:notif", a, "~r~ID invalid.")
        end
      end
    end
  end)
  RegisterCommand("unban", function(a, b)
    if a ~= 0 then
      if seaShield.UseStaffESX.Active then
        if seaShield.UseStaffESX.GroupList[ESX.GetPlayerFromId(a).getGroup()] ~= nil then
          onStaff = true
        end
      elseif seaShield.allowStaff[seaShield.GetPlayerIdentifiers(a).license] ~= nil then
        onStaff = true
      end
      Wait(100)
      if onStaff then
        if tonumber(b[1]) then
          MySQL.Async.fetchAll("SELECT License FROM seashield_banlist WHERE ID = @ID", {
            ["@ID"] = b[1]
          }, function(a)
            if a[1] then
              MySQL.Async.execute("UPDATE seashield_banlist SET Reason = @Reason, isBanned = @isBanned, Expire = @Expire, timeat = @timeat, permanent = @permanent, moderatorName = @moderatorName WHERE License = @License", {
                ["@isBanned"] = 0,
                ["@Reason"] = "",
                ["@License"] = a[1].License,
                ["@Expire"] = 0,
                ["@timeat"] = 0,
                ["@permanent"] = 0,
                ["@moderatorName"] = "Aucun"
              })
              ReloadBans()
              TriggerClientEvent("seaShield:notif", va, "License ~b~unbanned~s~.")
            else
              TriggerClientEvent("seaShield:notif", va, "~r~License invalid.")
            end
          end)
        else
          TriggerClientEvent("seaShield:notif", a, "~r~License invalid.")
        end
      end
    elseif tonumber(b[1]) then
      MySQL.Async.fetchAll("SELECT License FROM seashield_banlist WHERE ID = @ID", {
        ["@ID"] = b[1]
      }, function(a)
        if a[1] then
          MySQL.Async.execute("UPDATE seashield_banlist SET isBanned = @isBanned, Reason = @Reason, Expire = @Expire, timeat = @timeat, permanent = @permanent, moderatorName = @moderatorName WHERE License = @License", {
            ["@isBanned"] = 0,
            ["@Reason"] = "",
            ["@License"] = a[1].License,
            ["@Expire"] = 0,
            ["@timeat"] = 0,
            ["@permanent"] = 0,
            ["@moderatorName"] = "Aucun"
          })
          ReloadBans()
          print("^5 La license \195\160 bien \195\169t\195\169 unban.^7")
        else
          print("^4 La license n'est pas correct.^7")
        end
      end)
    else
      print("^4 La license n'est pas correct.^7")
    end
  end)
  function ReloadBans()
    MetaIntitalise = {}
    BanInfo = {}
    MySQL.Async.fetchAll("SELECT * FROM seashield_banlist WHERE isBanned = 1", {}, function(a)
      for fe, fg in pairs(a) do
        MetaIntitalise[fg.License] = fg.ID
        MetaIntitalise[fg.Discord] = fg.ID
        MetaIntitalise[fg.Xbox] = fg.ID
        MetaIntitalise[fg.Live] = fg.ID
        for fl, fm in pairs(json.decode(fg.Tokens)) do
          MetaIntitalise[fm] = fg.ID
        end
        BanInfo[fg.ID] = {
          ID = fg.ID,
          License = fg.License,
          Discord = fg.Discord,
          Xbox = fg.Xbox,
          Live = fg.Live,
          Tokens = fg.Tokens,
          Reason = fg.Reason,
          IsBanned = fg.IsBanned,
          Expire = fg.Expire,
          timeat = fg.timeat,
          permanent = fg.permanent,
          moderatorName = fg.moderatorName
        }
      end
    end)
  end
  Citizen.CreateThread(function()
    ReloadBans()
    WhileTrue()
  end)
  function WhileTrue()
    SetTimeout(120000, function()
      WhileTrue()
      ReloadBans()
    end)
  end
  function seaShield.BanPlayer(a, b)
    if seaShield.UseStaffESX.Active then
    else
      for fp = 1, #seaShield.allowStaff do
      end
    end
    Wait(100)
    if not true then
      if not va[a] then
        va[a] = 1
      elseif va[a] == 1 then
        return
      end
      if seaShield.Lang == "EN" then
      elseif seaShield.Lang == "FR" then
      end
      if seaShield.Webhook[b.name] ~= nil then
        if not seaShield.UseScreenShot then
          PerformHttpRequest(seaShield.Webhook[b.name], function(a, b, c)
          end, "POST", json.encode({
            username = "SeaShield",
            embeds = {
              {
                author = {
                  name = "SeaShield",
                  icon_url = "https://media.discordapp.net/attachments/880115508752572426/880115577778237520/shields.png?width=542&height=542"
                },
                title = "Detection",
                description = "**Name** : " .. GetPlayerName(a) .. [[

**Reason** : ]] .. b.reason .. [[

**ID** : ]] .. a .. [[

**IP** : ||]] .. GetPlayerEndpoint(a) .. [[
||
**Steam Hex** : ]] .. "Aucun" .. [[

**License** : ]] .. "Aucun" .. [[

**Discord** : <@]] .. ("Aucun"):gsub("discord:", "") .. [[
>
**FiveM** : ]] .. "Aucun"
              }
            }
          }), {
            ["Content-Type"] = "application/json"
          })
        else
          exports["discord-screenshot"]:requestCustomClientScreenshotUploadToDiscord(src, seaShield.Webhook[b.name], {encoding = "png", quality = 1}, {
            username = "SeaShield",
            embeds = {
              {
                author = {
                  name = "SeaShield",
                  icon_url = "https://media.discordapp.net/attachments/880115508752572426/880115577778237520/shields.png?width=542&height=542"
                },
                description = "**Name** : " .. GetPlayerName(a) .. [[

**Reason** : ]] .. b.reason .. [[

**ID** : ]] .. a .. [[

**IP** : ||]] .. GetPlayerEndpoint(a) .. [[
||
**Steam Hex** : ]] .. "Aucun" .. [[

**License** : ]] .. "Aucun" .. [[

**Discord** : <@]] .. ("Aucun"):gsub("discord:", "") .. [[
>
**FiveM** : ]] .. "Aucun"
              }
            }
          }, 30000, function(a)
            if a then
              return print("^1ERROR: " .. a)
            end
          end)
          Wait(2500)
        end
      end
      TriggerEvent("Initiate:BanSql", "Aucun", a, b.reason, "SeaShield", 0, 1)
    end
  end
  RegisterNetEvent("seaShield:SuperJump")
  AddEventHandler("seaShield:SuperJump", function()
    if IsPlayerUsingSuperJump(source) then
      seaShield.BanPlayer(source, {
        name = "SuperJump",
        reason = "Use Super Jump"
      })
    end
  end)
end
