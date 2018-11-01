local old_nodes = { --- farming_plus:strawberry
				"farming_plus:strawberry", 
				"farming_plus:strawberry_1", 
				"farming_plus:strawberry_2", 
				"farming_plus:strawberry_3", 
				"farming_plus:strawberry_4", 
				"farming_plus:strawberry_5", 
				"farming_plus:strawberry_6",
				
				--- farming_plus:raspberry
				"farming_plus:raspberry", 
				"farming_plus:raspberry_1", 
				"farming_plus:raspberry_2", 
				"farming_plus:raspberry_3", 
				"farming_plus:raspberry_4", 
				"farming_plus:raspberry_5", 
				"farming_plus:raspberry_6",

				--- farming:blueberry
				"farming:blueberry",
				"farming:blueberry_1", 
				"farming:blueberry_2",
				"farming:blueberry_3",
				"farming:blueberry_4",

				--- farming_plus:strawberry
				"farming:strawberry", 
				"farming:strawberry_1", 
				"farming:strawberry_2", 
				"farming:strawberry_3", 
				"farming:strawberry_4", 
				"farming:strawberry_5", 
				"farming:strawberry_6",
				
				--- farming_plus:raspberry
				"farming:raspberry", 
				"farming:raspberry_1", 
				"farming:raspberry_2", 
				"farming:raspberry_3", 
				"farming:raspberry_4", 
				"farming:raspberry_5", 
				"farming:raspberry_6",
				
				--- Dmobs
				--"dmobs:hive",
				
				-- Bees
				"bees:hive_wild",

                -- vines
                "vines:side_middle",
                "vines:side_end",
                "vines:willow_middle",
                "vines:willow_end",
                "vines:jungle_middle",
                "vines:jungle_end",
                "vines:vine_middle",
                "vines:vine_end",
                "vines:root_middle",
                "vines:root_end",

                -- Bamboo
                "bamboo:bamboo"
}

local old_entities = {
				"dmobs:dragon",
				"dmobs:pig",
				"dmobs:wasp",
				"dmobs:panda",
				"dmobs:nyan",
				"dmobs:treeman"
}

for _,node_name in ipairs(old_nodes) do
    minetest.register_node(":"..node_name, {
        groups = {old=1},
    })
end

minetest.register_abm({
    nodenames = {"group:old"},
    interval = 1,
    chance = 1,
    action = function(pos, node)
        minetest.env:remove_node(pos)
    end,
})

for _,entity_name in ipairs(old_entities) do
    minetest.register_entity(":"..entity_name, {
        on_activate = function(self, staticdata)
            self.object:remove()
        end,
    })
end

-- magnifier
minetest.register_craftitem("remover:magnifier", {
	description = "Magnifying Glass",
	inventory_image = "remover_magnifier.png",
	stack_max = 1,
	liquids_pointable = true,

	on_use = function(itemstack, user, pointed_thing)
	
		local pos = minetest.get_pointed_thing_position(pointed_thing)
		local name = user:get_player_name()
		
		chathelp.show_node(name, pos)
	    
	end,
})

minetest.register_craft({
	output = "remover:magnifier",
	recipe = {
		{"default:glass", "default:mese_crystal_fragment"},
		{"default:stick", ""}
	}
})

-- Moving from Chathelp to Remover
minetest.register_alias("chathelp:magnifier", "remover:magnifier")
