minetest.register_node("rangedweapons:broken_glass", {
	description = "Broken glass",
	drawtype = "glasslike",
	tiles = {
		"rangedweapons_broken_glass.png"
	},
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	liquidtype = "source",
	liquid_alternative_flowing = "rangedweapons:broken_glass",
	liquid_alternative_source = "rangedweapons:broken_glass",
	liquid_viscosity = 7,
	alpha = 160,
	liquid_range= 0,
	liquid_renewable = false,
	damage_per_second = 2,
	groups = {oddly_breakable_by_hand = 3},
})

