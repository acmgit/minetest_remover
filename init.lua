local modname = minetest.get_current_modname()
local moddir = minetest.get_modpath(modname)

-- Strategies
local strategie = "fast.lua"
-- local strategie = "slow.lua"


print("[".. modname .. "] starts now " .. moddir .. "/" .. strategie
-- Now start the Remover
dofile(moddir .. "/" .. fast)

local remover = {}

remover.green = '#00FF00'
remover.red = '#FF0000'
remover.orange = '#FF6700'
remover.blue = '#0000FF'
remover.yellow = '#FFFF00'
remover.purple = '#FF00FF'
remover.pink = '#FFAAFF'
remover.white = '#FFFFFF'
remover.black = '#000000'
remover.grey = '#888888'
remover.light_blue = '#8888FF'
remover.light_green = '#88FF88'
remover.light_red = '#FF8888'
remover.none = 99

-- magnifier

minetest.register_craftitem(modname .. ":magnifier", {
	description = "Magnifying Glass",
	inventory_image = "remover_magnifier.png",
	stack_max = 1,
	liquids_pointable = true,

	on_use = function(itemstack, user, pointed_thing)
	
		local pos = minetest.get_pointed_thing_position(pointed_thing)
		local name = user:get_player_name()
		
		remover.show_node(name, pos)
	    
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

-- Shows Information about an Item you point on it
function remover.show_node(name, pos)

	if pos then
	
		local node = minetest.get_node(pos)
		local light = minetest.get_node_light(pos)
		local dlight = minetest.get_node_light({x=pos.x, y=pos.y -1, z=pos.z})
		local ulight = minetest.get_node_light({x=pos.x, y=pos.y +1, z=pos.z})
		local nodepos = minetest.pos_to_string(pos)
		local protected = minetest.is_protected(pos, name)
		
		remover.print(name, "Name of the Node: ", remover.purple)
		remover.print(name, node.name, remover.green)
		remover.print(name, "Located at: " .. nodepos, remover.green)
		remover.print(name, "Light on the Node: " .. light .. ".", remover.yellow)
		remover.print(name, "Light above: " .. ulight .. ".", remover.yellow)
		remover.print(name, "Light under: " .. dlight .. ".", remover.yellow)
		
		if(protected) then
			remover.print(name, "Is protected? Yes.", remover.white)
		else
			remover.print(name, "Is protected: No.", remover.white)
		end
		
		if(minetest.registered_nodes[node.name] ~= nil) then
			if(minetest.registered_nodes[node.name].diggable) then
				remover.print(name, "Is diggable.", remover.orange)
			end

			if(minetest.registered_nodes[node.name].walkable) then
				remover.print(name, "Is walkable.", remover.orange)
			end

			if(minetest.registered_nodes[node.name].climbable) then
				remover.print(name, "Is climbable.", remover.orange)
			end

			if(minetest.registered_nodes[node.name].buildable_to) then
				remover.print(name, "Is replaceable.", remover.orange)
			end

			if(minetest.registered_nodes[node.name].liquid_renewable) then
				remover.print(name, "Is regenerateable.", remover.orange)
			end
		
			if(minetest.registered_nodes[node.name].use_texture_alpha) then
				remover.print(name, "Has an alpha-channel.", remover.orange)
				remover.print(name, "With a transparency of " .. 255 - minetest.registered_nodes[node.name].alpha .. " / 255.", remover.light_blue)
			end

			if(minetest.registered_nodes[node.name].sunlight_propagates) then
				remover.print(name, "Light shines trough.", remover.orange)
			end
		
			if(minetest.registered_nodes[node.name].light_source > 0) then
				remover.print(name, "Shines with Lightlevel " .. minetest.registered_nodes[node.name].light_source .. " / 15.", remover.light_blue)
			end
		
			if(minetest.registered_nodes[node.name].damage_per_second > 0) then
				remover.print(name, "Deals with " .. minetest.registered_nodes[node.name].damage_per_second .. " Points Damage per Second.", remover.light_green)
			end
		
			remover.print(name, "Stacks with " .. minetest.registered_nodes[node.name].stack_max .. " Items / Stack.", remover.light_red)
		else
			remover.print(name, "Node unknown!", remover.red)
		end
		
	else
	
		remover.print(name, "Pointed on no Node.", remover.red)
	
	end

end -- remover.show_me()

-- Writes a Message in a specific color or Logs it
function remover.print(name, message, color)

    if(color ~= remover.none) then
        minetest.chat_send_player(name, core.colorize(color, message))
        return
		
    else 
        minetest.chat_send_player(name,  message)
        return
    end
			
end -- print_message()

print("["..modname .. "] loaded.")
