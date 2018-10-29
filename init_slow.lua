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