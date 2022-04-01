execute at @r as 35ff2c25-4656-5e64-afa9-479d96819e79 run function geofancy:player
scoreboard players add $speed 3mi4ruevehss6 1
execute if score $speed 3mi4ruevehss6 matches ..10 run schedule function geofancy:tick 2s replace
execute if score $speed 3mi4ruevehss6 matches 11..30 run schedule function geofancy:tick 1s replace
execute if score $speed 3mi4ruevehss6 matches 31..100 run schedule function geofancy:tick 10 replace
execute if score $speed 3mi4ruevehss6 matches 101..1000 run schedule function geofancy:tick 5 replace
execute if score $speed 3mi4ruevehss6 matches 1001..10000 run schedule function geofancy:tick 2 replace
execute if score $speed 3mi4ruevehss6 matches 10001..50000 run schedule function geofancy:tick 1 replace
execute if score $speed 3mi4ruevehss6 matches 50001.. run schedule function geofancy:tick 1
execute if score $speed 3mi4ruevehss6 matches 50001.. run schedule function geofancy:tick 1
