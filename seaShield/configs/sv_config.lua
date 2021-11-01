seaShield = {}
seaShield.Lang = 'FR' -- FR OR EN !
seaShield.ServerName = 'YourNameServer'
seaShield.license = 'Roberto#8622'
seaShield.UseStaffESX = {
    Active = true,
    GroupList = {
        ['fondateur'] = true,
        ['superadmin'] = true,
        ['admin'] = true,
    },
    DefaultGroupName = 'user',
}

seaShield.allowStaff = { -- IF UseStaffESX is active don't use this !
    ["yourlicense"] = true,
}

-- IF YOU USE ESX
seaShield.ESX = {
    UseESX = true,
    Trigger = '::{korioz#0110}::esx:getSharedObject'
}

seaShield.Webhook = {
    ['StartWebhook'] = '',
    ['SpawnBlacklistVehicle'] = '',
    ['AntiClearPedTasks'] = '',
    ['AntiMassProps'] = '',
    ['SpawnBlacklistProps'] = '',
    ['RemoveAllWeaponEvent'] = '',
    ['RemoveWeaponEvent'] = '',
    ['giveWeaponEvent'] = '',
    ['AntiMassFireEvent'] = '',
    ['BlacklistParticles'] = '',
    ['SpawnMassExplosion'] = '',
    ['SpawnMassVehicles'] = '',
    ['SpawnMassPeds'] = '',
    ['SpawnBlacklistPeds'] = '',
    ['AntiGiveWeapon'] = '',
    ['AntiGiveWeaponESX'] = '',
    ['AntiShootPlayer'] = '',
    ['AntiStopSeaShield'] = '',
    ['ManualBan'] = '',
    ['AntiThermalVision'] = '',
    ['AntiNightVision'] = '',
    ['AntiTextureStream'] = '',
    ['BlacklistWeapon'] = '',
    ['AntiFastRun'] = '',
    ['SuperJump'] = '',
    ['AntiFreecam'] = '',
    ['AntiSpectate'] = '',
}

seaShield.UseScreenShot = false
seaShield.Vehicles = {
    PrintActive = true,
    AntiMassSpawnVeh = true,
    LimitMassSpawn = 15,
    SpawnMassVehBanActive = true,
    BlackListVehicles = true,
    ListBlacklistVehicles = {
        'submersible',
        'submersible2',
        'tug',
        'avisa',
        'dinghy5',
        'kosatka',
        'patrolboat',
        'cerberus',
        'cerberus2',
        'cerberus3',
        'hauler',
        'hauler2',
        'phantom2',
        'stockade3',
        'terbyte',
        'issi6',
        'issi5',
        'issi4',
        'riot2',
        'akula',
        'annihilator',
        'annihilator2',
        'buzzard',
        'cargobob',
        'cargobob2',
        'cargobob3',
        'cargobob4',
        'hunter',
        'savage',
        'skylift',
        'valkyrie',
        'valkyrie2',
        'bulldozer',
        'cutter',
        'dump',
        'handler',
        'apc',
        'barrage',
        'chernobog',
        'halftrack',
        'khanjali',
        'minitank',
        'rhino',
        'scarab',
        'scarab2',
        'scarab3',
        'thruster',
        'trailersmall2',
        'deathbike',
        'deathbike2',
        'deathbike3',
        'oppressor',
        'oppressor2',
        'blazer5',
        'bruiser',
        'bruiser2',
        'bruiser3',
        'brutus',
        'brutus2',
        'brutus3',
        'dune2',
        'dune3',
        'dune4',
        'dune5',
        'insurgent',
        'insurgent2',
        'insurgent3',
        'marshall',
        'monster',
        'monster3',
        'monster4',
        'monster5',
        'menacer',
        'nightshark',
        'technical',
        'technical2',
        'technical3',
        'zhaba',
        'avenger',
        'avenger2',
        'besra',
        'blimp',
        'blimp2',
        'blimp3',
        'bombushka',
        'cargoplane',
        'hydra',
        'jet',
        'lazer',
        'molotok',
        'nokota',
        'pyro',
        'rogue',
        'starling',
        'strikeforce',
        'titan',
        'volatol',
        'alkonost',
        'baller6',
        'squaddie',
        'brickade',
        'pbus2',
        'rallytruck',
        'tourbus',
        'wastelander',
        'zr380',
        'zr3802',
        'zr3803',
        'toreador',
        'vigilante',
        'armytanker',
        'armytrailer',
        'armytrailer2',
        'baletrailer',
        'boattrailer',
        'cablecar',
        'docktrailer',
        'freighttrailer',
        'graintrailer',
        'proptrailer',
        'raketrailer',
        'tr2',
        'tr3',
        'tr4',
        'trflat',
        'tvtrailer',
        'tanker',
        'tanker2',
        'trailerlarge',
        'trailerlogs',
        'trailersmall',
        'trailers',
        'trailers2',
        'trailers3',
        'trailers4',
        'freight',
        'freightcar',
        'freightcont1',
        'freightcont2',
        'freightgrain',
        'metrotrain',
        'tankercar',
    },
    BlacklistVehiclesBanActive = true,
}

-- EXPLOSIONS

seaShield.Explosions = {
    PrintActive = true,
    AntiExplosionEvent = true,
    AntiMassExplosionEvent = true,
    LimitMassExplosionEvent = 5,
    AntiMassExplosionBanActive = true,
    AntiMassExplosionDelay = 10 -- secondes
}

-- PEDS 

seaShield.Peds = {
    PrintActive = true,
    AntiSpawnMassPeds = true,
    LimitSpawnMassPeds = 10,
    AntiSpawnMassPedsBanActive = true,
    WhitelistPeds = true,
    WhitelistPedsList = {
        [GetHashKey('a_f_o_soucent_01')] = true
    },
    WhitelistPedsBanActive = false
}

-- PROPS

seaShield.Props = {
    PrintActive = true,
    WhitelistProps = true,
    WhitelistPropsList = {
        [GetHashKey('prop_logpile_06b')] = true,
    },
    WhitelistPropsBanActive = false,
    AntiMassProps = true,
    LimitMassSpawnProps = 15,
    AntiMassPropsDelay = 10, -- secondes
    AntiMassPropsBanActive = false
}

-- PARTICLES

seaShield.Particles = {
    AntiParticles = true,
    PrintActive = false,
    WhitelistParticles = true,
    ListParticles = {
        [GetHashKey('water_splash_plane_trail')] = true
    },
    BanActive = true
}

-- FIRE EVENT

seaShield.FireEvent = {
    PrintActive = true,
    AntiFireEvent = true,
    AntiMassFireEvent = true,
    LimitFireEvent = 10,
    AntiMassFireEventDelay = 10, -- secondes
    AntiMassFireEventBanActive = true,
}

-- OTHERS

seaShield.AntiProjectileEvent = true
seaShield.AntiGiveWeapon = true
seaShield.AntiRemoveWeapon = true
seaShield.AntiRemoveAllWeapon = true
seaShield.AntiClearPedTasks = true
