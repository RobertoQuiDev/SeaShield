CreateThread(function()
    while not va do
      Wait(0)
    end
    while true do
      Wait(80)
      vb = vb + 1
      exports.seaShield:getRessource(vb)
    end
  end)
  function getRessource(a)
    if va == a or va + 1 == a or va - 1 == a then
    else
      TriggerServerEvent("seaShield:wtf")
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
  RegisterNetEvent("eazlodaooe:loaded")
  AddEventHandler("eazlodaooe:loaded", function()
    va = true
  end)
  AddEventHandler("onClientResourceStop", function(a)
    TriggerServerEvent("seaShield:wtf")
  end)
  AddEventHandler("onResourceStop", function(a)
    TriggerServerEvent("seaShield:wtf")
  end)