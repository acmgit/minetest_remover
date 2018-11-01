local modname = minetest.get_current_modname()
local remdir = minetest.get_modpath(modname)

local fast = "fast.lua"
local slow = "slow.lua"

-- magnifier

minetest.register_craftitem(modname .. ":magnifier", {
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
	output = modname .. ":magnifier",
	recipe = {
		{"default:glass", "default:mese_crystal_fragment"},
		{"default:stick", ""}
	}
})

-- Moving from Chathelp to Remover
minetest.register_alias("chathelp:magnifier", modname .. ":magnifier")

-- Now start the Remover
dofile(remdir .. "/" .. fast)
