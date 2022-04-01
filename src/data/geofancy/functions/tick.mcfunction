from ./utils import blocks, helper, rng, random, temp, chance
from ./funny import messages
from random import randint

block_tag ./air {"values": ["minecraft:air", "minecraft:cave_air", "minecraft:void_air"]}

def raycast(name):
    callback = generate_path(name)
    function generate_path(f"{name}/loop"):
        unless block ~ ~ ~ #geofancy:air function callback
        if block ~ ~ ~ #geofancy:air positioned ~ ~-1 ~ function callback
    return callback

at @r as helper function ./player:
    spreadplayers ~ ~ 0 128 false @s
    at @s tp @s ~ ~-1 ~  # assume world height is 255

    if predicate chance(20) function ./change_y_level:
        scoreboard players set $y_level random 200
        y_level = rng("$y_level")
        store result entity @s Pos[1] double 1 scoreboard players get y_level random
    
    at @s function ./place_block:
        scoreboard players set $block random len(blocks)
        block_rng = rng("$block")
        execute run function generate_path("set_random_block"):
            for node in generate_tree(blocks):
                append function node.parent:
                    if node.partition(8):
                        if score block_rng random matches node.range function node.children
                    else:
                        if score block_rng random matches node.range setblock ~ ~ ~ node.value
    tp @s 0.0 0.0 0.0 # reset

    if score $speed temp matches 200.. function ./msg:
        scoreboard players set $m random len(messages)

        m = rng("$m")
        for i in range(len(messages)):
            if score m random matches i
                data modify storage geofancy:temp current_msg set from storage geofancy:main msgs[i]
        
        scoreboard players set $c random len(messages)
        c = rng("$c")
        for i in range(len(messages)):
            if score c random matches i
                data modify storage geofancy:temp current_color set from storage geofancy:main colors[i]
        
        scoreboard players set $t random 100
        t = rng("$t")
        json = [
            {"storage": "geofancy:temp", "nbt": "current_color", "interpret": true},
            {"storage": "geofancy:temp", "nbt": "current_msg"}
        ]
        if score t random matches 50..69 tellraw @a json
        if score t random matches 70..90 title @a actionbar json
        if score t random matches 91..98 title @a subtitle json
        if score t random matches 99..100 title @a title json



scoreboard players add $speed temp 1
if score $speed temp matches ..10 schedule function ./tick 2s replace
if score $speed temp matches 11..30 schedule function ./tick 1s replace
if score $speed temp matches 31..100 schedule function ./tick 10t replace
if score $speed temp matches 101..1000 schedule function ./tick 5t replace
if score $speed temp matches 1001..10000 schedule function ./tick 2t replace
if score $speed temp matches 10001..50000 schedule function ./tick 1t replace

if score $speed temp matches 50001.. schedule function ./tick 1t
if score $speed temp matches 50001.. schedule function ./tick 1t
