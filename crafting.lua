----------------------------
----------------------------
if rweapons_gun_crafting == "true" then

minetest.register_craft({
	output = "rangedweapons:aa12",
	recipe = {
		{"rangedweapons:gunsteel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:diamondblock", "default:steel_ingot", "rangedweapons:plastic_sheet"},
		{"default:steel_ingot", "dye:black", "rangedweapons:plastic_sheet"},
	}
})

minetest.register_craft({
	output = "rangedweapons:aa12",
	recipe = {
		{"moreores:silver_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:diamondblock", "default:steel_ingot", "rangedweapons:plastic_sheet"},
		{"default:steel_ingot", "dye:black", "rangedweapons:plastic_sheet"},
	}
})

minetest.register_craft({
	output = "rangedweapons:ak47",
	recipe = {
		{"default:diamond", "default:steel_ingot", "default:tree"},
		{"default:tree", "default:mese", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:tree"},
	}
})

minetest.register_craft({
	output = "rangedweapons:awp",
	recipe = {
		{"rangedweapons:gunsteel_ingot", "default:diamondblock", "rangedweapons:gunsteel_ingot"},
		{"rangedweapons:gunsteel_ingot", "rangedweapons:gunsteel_ingot", "rangedweapons:gunsteel_ingot"},
		{"dye:dark_green", "default:diamond", "rangedweapons:plastic_sheet"},
	}
})

minetest.register_craft({
	output = "rangedweapons:benelli",
	recipe = {
		{"rangedweapons:gunsteel_ingot", "default:diamond", "default:steel_ingot"},
		{"rangedweapons:plastic_sheet", "default:diamond", "default:steel_ingot"},
		{"", "default:mese_crystal", ""},
	}
})

minetest.register_craft({
	output = "rangedweapons:beretta",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"", "default:mese_crystal", "rangedweapons:plastic_sheet"},
		{"", "", "rangedweapons:plastic_sheet"},
	}
})

minetest.register_craft({
	output = "rangedweapons:m1991",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"", "default:mese_crystal", "default:tree"},
		{"", "", "default:tree"},
	}
})

minetest.register_craft({
	output = "rangedweapons:deagle",
	recipe = {
		{"rangedweapons:gunsteel_ingot", "rangedweapons:gunsteel_ingot", "rangedweapons:gunsteel_ingot"},
		{"rangedweapons:gunsteel_ingot", "default:diamond", "rangedweapons:plastic_sheet"},
		{"", "", "rangedweapons:plastic_sheet"},
	}
})
minetest.register_craft({
	output = "rangedweapons:golden_deagle",
	recipe = {
		{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
		{"default:gold_ingot", "rangedweapons:deagle", "default:gold_ingot"},
		{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:deagle",
	recipe = {
		{"moreores:silver_ingot", "moreores:silver_ingot", "moreores:silver_ingot"},
		{"moreores:silver_ingot", "default:diamond", "rangedweapons:plastic_sheet"},
		{"", "", "rangedweapons:plastic_sheet"},
	}
})

minetest.register_craft({
	output = "rangedweapons:python",
	recipe = {
		{"rangedweapons:gunsteel_ingot", "rangedweapons:gunsteel_ingot", "rangedweapons:gunsteel_ingot"},
		{"", "default:diamond", "rangedweapons:tree"},
		{"", "default:mese_crystal", "rangedweapons:tree"},
	}
})
minetest.register_craft({
	output = "rangedweapons:python",
	recipe = {
		{"moreores:silver_ingot", "moreores:silver_ingot", "moreores:silver_ingot"},
		{"", "default:diamond", "rangedweapons:tree"},
		{"", "default:mese_crystal", "rangedweapons:tree"},
	}
})

minetest.register_craft({
	output = "rangedweapons:g36",
	recipe = {
		{"default:diamond", "default:mese", "default:diamond"},
		{"default:steel_ingot", "default:diamond", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:glock17",
	recipe = {
		{"rangedweapons:plastic_sheet", "rangedweapons:plastic_sheet", "rangedweapons:plastic_sheet"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"", "default:diamond", "rangedweapons:plastic_sheet"},
	}
})

minetest.register_craft({
	output = "rangedweapons:jackhammer",
	recipe = {
		{"", "rangedweapons:gunsteel_ingot", "rangedweapons:gunsteel_ingot"},
		{"default:mese", "default:steelblock", "default:diamondblock"},
		{"", "default:mese", "default:diamondblock"},
	}
})

minetest.register_craft({
	output = "rangedweapons:kriss_sv",
	recipe = {
		{"rangedweapons:plastic_sheet", "rangedweapons:plastic_sheet", "rangedweapons:plastic_sheet"},
		{"default:gold_ingot", "default:mese_crystal", "rangedweapons:plastic_sheet"},
		{"rangedweapons:plastic_sheet", "default:gold_ingot", ""},
	}
})

minetest.register_craft({
	output = "rangedweapons:laser_blaster",
	recipe = {
		{"default:steel_ingot", "rangedweapons:gun_power_core", "default:steel_ingot"},
		{"rangedweapons:gunsteel_ingot", "rangedweapons:gunsteel_ingot", "rangedweapons:gunsteel_ingot"},
		{"", "default:mese_crystal_fragment", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:forcegun",
	recipe = {
		{"rangedweapons:gunsteel_ingot", "default:diamondblock", "default:mese"},
		{"rangedweapons:gunsteel_ingot", "rangedweapons:gunsteel_ingot", "rangedweapons:gunsteel_ingot"},
		{"", "rangedweapons:gun_power_core", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:laser_rifle",
	recipe = {
		{"rangedweapons:ultra_gunsteel_ingot", "rangedweapons:gun_power_core", "rangedweapons:ultra_gunsteel_ingot"},
		{"rangedweapons:gun_power_core", "rangedweapons:ultra_gunsteel_ingot", "default:gold_ingot"},
		{"default:gold_ingot", "default:mese", "rangedweapons:ultra_gunsteel_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:laser_shotgun",
	recipe = {
		{"rangedweapons:ultra_gunsteel_ingot", "rangedweapons:gun_power_core", "rangedweapons:ultra_gunsteel_ingot"},
		{"rangedweapons:gun_power_core", "rangedweapons:gun_power_core", "rangedweapons:ultra_gunsteel_ingot"},
		{"", "rangedweapons:ultra_gunsteel_ingot", "rangedweapons:ultra_gunsteel_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:luger",
	recipe = {
		{"", "", "default:mese_crystal_fragment"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"", "default:mese_crystal_fragment", "default:tree"},
	}
})

minetest.register_craft({
	output = "rangedweapons:m16",
	recipe = {
		{"default:diamond", "default:steelblock", "default:steel_ingot"},
		{"default:steel_ingot", "default:diamond", "default:steel_ingot"},
		{"default:steel_ingot", "", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:m60",
	recipe = {
		{"default:diamond", "default:mese", "default:mese"},
		{"default:steel_ingot", "default:steelblock", "default:steelblock"},
		{"dye:black", "default:diamond", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:m79",
	recipe = {
		{"default:steel_ingot", "", "default:mese_crystal"},
		{"default:steelblock", "default:diamond", "default:tree"},
		{"default:tree", "default:tree", "default:tree"},
	}
})

minetest.register_craft({
	output = "rangedweapons:m200",
	recipe = {
		{"default:diamondblock", "default:steel_ingot", "default:diamondblock"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:diamond", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:makarov",
	recipe = {
		{"", "default:steel_ingot", "default:steel_ingot"},
		{"", "default:mese_crystal_fragment", "default:tree"},
		{"", "", "dye:black"},
	}
})

minetest.register_craft({
	output = "rangedweapons:milkor",
	recipe = {
		{"default:diamond", "default:steel_ingot", "default:diamond"},
		{"default:steel_ingot", "default:steelblock", "default:steel_ingot"},
		{"default:steel_ingot", "default:mese", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:minigun",
	recipe = {
		{"", "default:steelblock", "default:mese"},
		{"default:diamondblock", "default:diamondblock", "default:diamondblock"},
		{"default:steelblock", "default:steelblock", "default:steelblock"},
	}
})

minetest.register_craft({
	output = "rangedweapons:mp5",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:diamond", "default:steel_ingot"},
		{"default:steel_ingot", "rangedweapons:plastic_sheet", "dye:black"},
	}
})

minetest.register_craft({
	output = "rangedweapons:thompson",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:diamond"},
		{"default:tree", "default:tree", "default:steel_ingot"},
		{"default:steel_ingot", "default:diamond", "default:tree"},
	}
})

minetest.register_craft({
	output = "rangedweapons:mp40",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"},
		{"default:steel_ingot", "default:mese_crystal_fragment", ""},
	}
})



minetest.register_craft({
	output = "rangedweapons:remington",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:tree", "default:mese_crystal", "default:tree"},
	}
})

minetest.register_craft({
	output = "rangedweapons:rpg",
	recipe = {
		{"default:diamond", "default:steel_ingot", ""},
		{"default:steelblock", "default:tree", "default:diamondblock"},
		{"default:diamond", "default:tree", ""},
	}
})

minetest.register_craft({
	output = "rangedweapons:rpk",
	recipe = {
		{"default:diamond", "rangedweapons:ak47", ""},
		{"default:steel_ingot", "default:steelblock", "default:tree"},
		{"", "default:diamond", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:scar",
	recipe = {
		{"default:diamond", "default:mese", "default:mese"},
		{"default:steel_ingot", "default:steel_ingot", "default:mese"},
		{"rangedweapons:plastic_sheet", "", "default:mese_crystal"},
	}
})

minetest.register_craft({
	output = "rangedweapons:spas12",
	recipe = {
		{"", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:mese", "default:diamond"},
		{"rangedweapons:plastic_sheet", "default:diamond", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:svd",
	recipe = {
		{"default:steel_ingot", "default:diamondblock", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:tree", "default:diamond", "default:tree"},
	}
})

minetest.register_craft({
	output = "rangedweapons:taurus",
	recipe = {
{"rangedweapons:gunsteel_ingot", "default:mese_crystal", "default:mese_crystal_fragment"},
{"rangedweapons:gunsteel_ingot", "default:diamondblock", "rangedweapons:gunsteel_ingot"},
		{"", "rangedweapons:gunsteel_ingot", "rangedweapons:plastic_sheet"},
	}
})

minetest.register_craft({
	output = "rangedweapons:taurus",
	recipe = {
{"moreores:silver_ingot", "default:mese_crystal", "default:mese_crystal_fragment"},
{"moreores:silver_ingot", "default:diamondblock", "moreores:silver_ingot"},
		{"", "moreores:silver_ingot", "rangedweapons:plastic_sheet"},
	}
})

minetest.register_craft({
	output = "rangedweapons:tec9",
	recipe = {
		{"rangedweapons:plastic_sheet", "rangedweapons:plastic_sheet", "rangedweapons:plastic_sheet"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:mese_crystal_fragment", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:tmp",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:mese_crystal_fragment", "default:steel_ingot"},
		{"", "dye:black", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:ump",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"rangedweapons:gunsteel_ingot", "default:diamond", "default:diamond"},
		{"default:steel_ingot", "default:mese_crystal", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:uzi",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:diamond", "rangedweapons:plastic_sheet", "default:steel_ingot"},
		{"", "default:steel_ingot", ""},
	}
})

end
----------------------------------
----------------------------------
if rweapons_other_weapon_crafting == "true" then

minetest.register_craft({
	output = "rangedweapons:barrel",
	recipe = {
		{"default:wood", "tnt:gunpowder", "default:wood"},
		{"default:wood", "tnt:tnt", "default:wood"},
	}
})

minetest.register_craft({
	output = "rangedweapons:hand_grenade",
	recipe = {
		{"", "", "default:mese_crystal_fragment"},
		{"default:steel_ingot", "tnt:gunpowder", ""},
		{"tnt:gunpowder", "tnt:gunpowder", ""},
	}
})

minetest.register_craft({
	output = "rangedweapons:javelin 1",
	recipe = {
		{"default:diamond", "default:steel_ingot", ""},
		{"default:steel_ingot", "", "group:stick"},
		{"", "", "group:stick"},
	}
})

minetest.register_craft({
	output = "rangedweapons:wooden_shuriken 20",
	recipe = {
		{"", "group:wood", ""},
		{"group:wood", "", "group:wood"},
		{"", "group:wood", ""},
	}
})
minetest.register_craft({
	output = "rangedweapons:stone_shuriken 10",
	recipe = {
		{"", "default:cobble", ""},
		{"default:cobble", "", "default:cobble"},
		{"", "default:cobble", ""},
	}
})
minetest.register_craft({
	output = "rangedweapons:steel_shuriken 30",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"", "default:steel_ingot", ""},
	}
})
minetest.register_craft({
	output = "rangedweapons:bronze_shuriken 35",
	recipe = {
		{"", "default:bronze_ingot", ""},
		{"default:bronze_ingot", "", "default:bronze_ingot"},
		{"", "default:bronze_ingot", ""},
	}
})
minetest.register_craft({
	output = "rangedweapons:golden_shuriken 42",
	recipe = {
		{"", "default:gold_ingot", ""},
		{"default:gold_ingot", "", "default:gold_ingot"},
		{"", "default:gold_ingot", ""},
	}
})
minetest.register_craft({
	output = "rangedweapons:mese_shuriken 55",
	recipe = {
		{"", "default:mese_crystal", ""},
		{"default:mese_crystal", "", "default:mese_crystal"},
		{"", "default:mese_crystal", ""},
	}
})
minetest.register_craft({
	output = "rangedweapons:diamond_shuriken 69",
	recipe = {
		{"", "default:diamond", ""},
		{"default:diamond", "", "default:diamond"},
		{"", "default:diamond", ""},
	}
})

end
------------------------------------
------------------------------------
if rweapons_ammo_crafting == "true" then

minetest.register_craft({
	output = "rangedweapons:9mm 40",
	recipe = {
		{"default:steel_ingot", "", ""},
		{"tnt:gunpowder", "", ""},
		{"default:copper_ingot", "", ""},
	}
})
minetest.register_craft({
	output = "rangedweapons:45acp 40",
	recipe = {
		{"","default:bronze_ingot", ""},
		{"default:gold_ingot","tnt:gunpowder", "default:gold_ingot"},
		{"","default:tin_ingot", ""},
	}
})
minetest.register_craft({
	output = "rangedweapons:10mm 60",
	recipe = {
		{"", "default:bronze_ingot", ""},
		{"default:steel_ingot", "tnt:gunpowder", "default:steel_ingot"},
		{"default:steel_ingot", "tnt:gunpowder", "default:steel_ingot"},
	}
})
minetest.register_craft({
	output = "rangedweapons:357 15",
	recipe = {
		{"default:copper_ingot", "", ""},
		{"tnt:gunpowder", "", ""},
		{"default:gold_ingot", "", ""},
	}
})

minetest.register_craft({
	output = "rangedweapons:50ae 15",
	recipe = {
		{"default:bronze_ingot", "default:coal_lump", "default:bronze_ingot"},
		{"default:gold_ingot", "tnt:gunpowder", "default:gold_ingot"},
		{"default:gold_ingot", "tnt:gunpowder", "default:gold_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:44 15",
	recipe = {
		{"default:bronze_ingot", "default:coal_lump", ""},
		{"tnt:gunpowder", "", ""},
		{"default:gold_ingot", "", ""},
	}
})

minetest.register_craft({
	output = "rangedweapons:762mm 50",
	recipe = {
		{"default:bronze_ingot", "tnt:gunpowder", "default:bronze_ingot"},
		{"default:gold_ingot", "tnt:gunpowder", "default:gold_ingot"},
		{"default:gold_ingot", "tnt:gunpowder", "default:gold_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:408cheytac 10",
	recipe = {
		{"default:bronze_ingot", "tnt:gunpowder", "default:bronze_ingot"},
		{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
		{"default:gold_ingot", "tnt:gunpowder", "default:gold_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:556mm 90",
	recipe = {
		{"", "default:gold_ingot", ""},
		{"default:gold_ingot", "tnt:gunpowder", "default:gold_ingot"},
		{"default:gold_ingot", "tnt:gunpowder", "default:gold_ingot"},
	}
})
minetest.register_craft({
	output = "rangedweapons:shell 12",
	recipe = {
		{"default:bronze_ingot", "default:steel_ingot", "default:bronze_ingot"},
		{"default:bronze_ingot", "tnt:gunpowder", "default:bronze_ingot"},
		{"default:gold_ingot", "tnt:gunpowder", "default:gold_ingot"},
	}
})
minetest.register_craft({
	output = "rangedweapons:308winchester 15",
	recipe = {
		{"", "default:steel_ingot", ""},
		{"default:bronze_ingot", "tnt:gunpowder", "default:bronze_ingot"},
		{"default:gold_ingot", "tnt:gunpowder", "default:gold_ingot"},
	}
})
minetest.register_craft({
	output = "rangedweapons:40mm 5",
	recipe = {
		{"", "default:gold_ingot", ""},
		{"default:steel_ingot", "tnt:gunpowder", "default:steel_ingot"},
		{"tnt:gunpowder", "default:bronze_ingot", "tnt:gunpowder"},
	}
})
minetest.register_craft({
	output = "rangedweapons:rocket 1",
	recipe = {
		{"", "", "rangedweapons:40mm"},
		{"", "tnt:gunpowder", ""},
		{"default:steel_ingot", "", ""},
	}
})

end
-------------------------------------
-------------------------------------
if rweapons_item_crafting == "true" then

minetest.register_craft({
	output = "rangedweapons:generator",
	recipe = {
{"default:gold_ingot", "default:gold_ingot", "default:gold_ingot"},
		{"rangedweapons:gunsteel_ingot", "rangedweapons:gun_power_core", "rangedweapons:gunsteel_ingot"},
		{"rangedweapons:gunsteel_ingot", "rangedweapons:gunsteel_ingot", "rangedweapons:gunsteel_ingot"},
	}
})

minetest.register_craft({
	output = "rangedweapons:gunsteel_ingot",
	recipe = {
		{"default:steel_ingot", "default:tin_ingot", "default:coal_lump"},
	}
})

minetest.register_craft({
	output = "rangedweapons:ultra_gunsteel_ingot",
	recipe = {
		{"", "default:mese_crystal", ""},
		{"default:gold_ingot", "rangedweapons:gunsteel_ingot", "default:gold_ingot"},
		{"", "default:diamond", ""},
	}
})

minetest.register_craft({
	output = "rangedweapons:plastic_sheet",
	recipe = {
		{"default:tree", "default:coal_lump", "default:tree"},
		{"default:coal_lump", "default:tree", "default:coal_lump"},
	}
})

minetest.register_craft({
	output = "rangedweapons:gun_power_core",
	recipe = {
		{"rangedweapons:gunsteel_ingot", "default:goldblock", "rangedweapons:gunsteel_ingot"},
		{"default:diamondblock", "default:mese", "default:diamondblock"},
		{"rangedweapons:gunsteel_ingot", "default:goldblock", "rangedweapons:gunsteel_ingot"},
	}
})

end