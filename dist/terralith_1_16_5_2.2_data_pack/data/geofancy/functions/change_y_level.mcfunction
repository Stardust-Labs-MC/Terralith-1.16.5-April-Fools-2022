scoreboard players set $y_level 351t7vmr4ren3 200
scoreboard players operation $range 351t7vmr4ren3 = $y_level 351t7vmr4ren3
function geofancy:random
execute store result entity @s Pos[1] double 1 run scoreboard players get $output 351t7vmr4ren3
