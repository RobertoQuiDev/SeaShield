seaShield = {}

seaShield.BlacklistWeapon = {
    Active = true,
    List = {
        [GetHashKey('WEAPON_RPG')] = true,
    },
    BanActive = true,
}

seaShield.AntiShootPlayer = false -- Anti Taze, Anti Kill All ext...
seaShield.AntiSuperJump = true
seaShield.AntiFastRun = true
seaShield.AntiFreecam = {
    Active = true,
    BanActive = true,
    MaxSeconds = 10,
}
seaShield.AntiSpectate = {
    Active = true,
    BanActive = true,
}

seaShield.WhitelistRessourceSpawnVehicles = {
    Active = false,
    ListRessources = {
        ['es_extended'] = true,
    },
    BanActive = true,
}

seaShield.AntiTextureStream = {
    Active = false,
    BanActive = true,
    TextureName = {
        'commonmenu',
        'yourtexturename',
    }
}

seaShield.AntiThermalVision  = {
    Active = true,
    BanActive = true,
}

seaShield.AntiNightVision  = {
    Active = true,
    BanActive = true,
}

-- ESX
seaShield.ESX = {
    Active = true,
    Trigger = '::{korioz#0110}::esx:getSharedObject'
}
seaShield.AntiGiveWeaponESX = true
seaShield.AntiShootPlayerESX = true -- Anti Taze, Anti Kill All ext...