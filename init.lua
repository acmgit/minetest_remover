    minetest.register_lbm({
       name = ":lbm2",
       nodenames = { --- farming_plus:strawberry
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
				
				-- Bees
				--"bees:hive_wild",
				
	},
       -- you can add as many entries you need
       action = function(pos)
          minetest.set_node(pos, {name = "air"}) -- replacer node name
       end,
    })

minetest.register_alias("bamboo:bamboo","air")
minetest.register_alias("streets:constructionfence_top","streets:roadwork_traffic_barrier_top_straight")
minetest.register_alias("streets:constructionfence_bottom","streets:roadwork_traffic_barrier_straight")
minetest.register_alias("streets:pole_top", "streets:bigpole_short")
minetest.register_alias("streets:pole_bottom", "streets:bigpole")
minetest.register_alias("streets:streetlamp_basic_top_on", "streets:light_vertical_off")
minetest.register_alias("streets:streetlamp_basic_middle", "streets:bigpole")
minetest.register_alias("streets:streetlamp_basic_bottom", "streets:bigpole")
