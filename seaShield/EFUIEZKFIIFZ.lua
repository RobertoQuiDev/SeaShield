function getRessource(a)
    if va == a or va + 1 == a or va - 1 == a then
    else
      TriggerServerEvent("seaShield:wtf", va, a)
      while true do
      end
    end
  end
  CreateThread(function()
    while not va do
      Wait(0)
    end
    while true do
      Wait(80)
      vb = vb + 1
    end
  end)
  CreateThread(function()
    while not va do
      Wait(0)
    end
    while true do
      Wait(80)
      vb = vb + 1
      exports.abso:getRessource(vb)
    end
  end)
  RegisterNetEvent("eazlodaooe:loaded")
  AddEventHandler("eazlodaooe:loaded", function()
    va = true
  end)
  Citizen.CreateThread(function()
    Wait(1500)
    TriggerEvent("eazlodaooe:loaded")
  end)
  AddEventHandler("onClientResourceStop", function(a)
    TriggerServerEvent("seaShield:wtf")
  end)
  AddEventHandler("onResourceStop", function(a)
    TriggerServerEvent("seaShield:wtf")
  end)