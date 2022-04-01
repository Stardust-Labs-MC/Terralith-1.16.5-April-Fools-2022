from ./utils import random, temp, chance, load_msg
from ./message import funny

TERRALITH_1_16_5 = "2578..2586"

function_tag minecraft:load {"values": ["geofancy:load"]}

function ./load:
    scoreboard players set $multiplier random 1630111353
    scoreboard players set $increment random 1623164762
    scoreboard players set $modulus random 2147483647

    scoreboard players set #16 random 16

    forceload add 0 0
    
    # 35ff2c25-4656-5e64-afa9-479d96819e79
    unless entity 35ff2c25-4656-5e64-afa9-479d96819e79 summon area_effect_cloud 0.0 0.0 0.0 {
        UUID: [I;905915429, 1180065380, -1347860579, -1769890183],
        Age: -2147483648,
        Duration: -1,
        WaitTime: -2147483648
    }

    funny()

    schedule function ./wait_for_player 1s replace

function ./wait_for_player:
    unless entity @r run schedule function ./wait_for_player 1s replace
    as @r function ./check_for_data_version:
        unless score $data.version temp = $data.version temp
            store result score $data.version temp
            data get entity @s DataVersion

        if score $data.version temp matches TERRALITH_1_16_5 function ./check_advancements:
            unless score $is_new_world temp = $is_new_world temp 
                store success score $is_new_world temp
                if entity @a[advancements={minecraft:story/root=true}]
            unless score $is_new_world temp matches 1..
                schedule function ./tick 1t replace
            
            tellraw @a [load_msg, {"text": " Reforged Fabric-tized - star-dust- et. alt f4"}]
        unless score $data.version temp matches TERRALITH_1_16_5 function ./wrong_version:
            function ./msg
            schedule function ./wrong_version 2t replace

biome minecraft:the_void {
  "surface_builder": "minecraft:nope",
  "depth": 0.1,
  "scale": 0.2,
  "temperature": 0.5,
  "downfall": 0.5,
  "precipitation": "none",
  "category": "none",
  "player_spawn_friendly": false,
  "effects": {
    "sky_color": 8103167,
    "fog_color": 12638463,
    "water_color": 4159204,
    "water_fog_color": 329011,
    "mood_sound": {
      "sound": "minecraft:ambient.cave",
      "tick_delay": 6000,
      "block_search_extent": 8,
      "offset": 2
    }
  },
  "starts": [],
  "spawners": {
    "monster": [],
    "creature": [],
    "ambient": [],
    "water_creature": [],
    "water_ambient": [],
    "misc": []
  },
  "spawn_costs": {},
  "carvers": {},
  "features": [
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [
      "minecraft:void_start_platform"
    ]
  ]
}

