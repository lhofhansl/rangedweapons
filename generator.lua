

minetest.register_node("rangedweapons:generator", {
		description = "" ..core.colorize("#35cdff","Power particle generator\n")..core.colorize("#FFFFFF", "generates 1 power particle every 3 seconds (can hold up to 200). Punch to harvest them"),
	tiles = {
		"rangedweapons_generator_top.png",
		"rangedweapons_generator_bottom.png",
		"rangedweapons_generator_side.png",
		"rangedweapons_generator_side.png",
		"rangedweapons_generator_side.png",
		"rangedweapons_generator_side.png"
	},
	paramtype = "light",
	light_source = 9,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	on_timer = function(pos, elapsed)
		minetest.get_node_timer(pos):start(3)
	local nodemeta = minetest.get_meta(pos)
if nodemeta:get_int("power_generated") < 200 then
	nodemeta:set_int("power_generated",nodemeta:get_int("power_generated")+1)
	nodemeta:set_string("infotext", "currently generated power:"..nodemeta:get_int("power_generated"))
end
	end,
	on_punch = function(pos, node, puncher)
local nodemeta = minetest.get_meta(pos)
local inv = puncher:get_inventory()
inv:add_item("main", "rangedweapons:power_particle "..nodemeta:get_int("power_generated")) 
nodemeta:set_int("power_generated",0)
nodemeta:set_string("infotext", "currently generated power:"..nodemeta:get_int("power_generated"))
	end,
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(3)
	end,
	sounds = default.node_sound_wood_defaults(),
})




