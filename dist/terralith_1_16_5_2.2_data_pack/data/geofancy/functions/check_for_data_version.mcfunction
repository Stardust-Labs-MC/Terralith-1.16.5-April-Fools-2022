execute unless score $data.version 3mi4ruevehss6 = $data.version 3mi4ruevehss6 store result score $data.version 3mi4ruevehss6 run data get entity @s DataVersion
execute if score $data.version 3mi4ruevehss6 matches 2578..2586 run function geofancy:check_advancements
execute unless score $data.version 3mi4ruevehss6 matches 2578..2586 run function geofancy:wrong_version
