fx_version 'cerulean'
game 'gta5'

author 'Sea Collective'
description 'The performant anticheat for FiveM'
version '0.0.1'

client_scripts {
    "configs/cl_config.lua",
    "EFUIEZKFIIFZ.lua",
    "client.lua",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "configs/sv_config.lua",
    "server.lua",
}

exports {
    'getRessource',
}