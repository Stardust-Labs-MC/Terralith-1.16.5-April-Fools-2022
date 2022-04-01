import ./book as book

advancement ./enter_end:
    display:
        icon:
            item: "minecraft:sponge"
        title: "♪ Brazil Man ♫"
        description: "A tale to be told"
        show_toast: true
        announce_to_chat: true
        hidden: true
    criteria:
        requirement:
            trigger: 'minecraft:changed_dimension'
            conditions:
                to: 'minecraft:the_end'
    rewards:
        loot:
            - 'minecraft:brazil_man'



loot_table ./brazil_man {
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "minecraft:written_book"
        }
      ],
      "functions": [
        {
          "function": "minecraft:set_nbt",
          "tag": str(book.nbt)
        }
      ]
    }
  ]
}