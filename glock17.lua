

minetest.register_tool("rangedweapons:glock17_rld", {
	stack_max= 1,
	wield_scale = {x=1.1,y=1.1,z=1.05},
	description = "",
	loaded_gun = "rangedweapons:glock17",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_glock17_rld.png",
})


minetest.register_tool("rangedweapons:glock17_r", {
	stack_max= 1,
	wield_scale = {x=1.2,y=1.2,z=1.2},
	description = "",
	rw_next_reload = "rangedweapons:glock17_rr",
	load_sound = "rangedweapons_handgun_mag_in",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_glock17.png",
})

minetest.register_tool("rangedweapons:glock17_rr", {
	stack_max= 1,
	wield_scale = {x=1.2,y=1.2,z=1.2},
	description = "",
	rw_next_reload = "rangedweapons:glock17_rrr",
	load_sound = "rangedweapons_reload_a",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_glock17.png",
})

minetest.register_tool("rangedweapons:glock17_rrr", {
	stack_max= 1,
	wield_scale = {x=1.2,y=1.2,z=1.2},
	description = "",
	rw_next_reload = "rangedweapons:glock17",
	load_sound = "rangedweapons_reload_b",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_glock17_rld.png",
})




minetest.register_tool("rangedweapons:glock17", {
		description = "" ..core.colorize("#35cdff","Glock 17\n") ..core.colorize("#FFFFFF", "Gun damage: 5\n") ..core.colorize("#FFFFFF", "Accuracy: 96%\n") ..core.colorize("#FFFFFF", "Gun knockback: 4\n")  ..core.colorize("#FFFFFF", "Gun Critical chance: 15%\n") ..core.colorize("#FFFFFF", "Gun Critical efficiency: 2.2x\n") ..core.colorize("#FFFFFF", "Reload delay: 0.9\n")..core.colorize("#FFFFFF", "Clip size: 17/17/17\n") ..core.colorize("#FFFFFF", "Ammunition: 9x19mm Parabellum/10mm Auto/.45acp\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.35\n") ..core.colorize("#FFFFFF", "Gun type: Handgun\n") ..core.colorize("#FFFFFF", "Bullet velocity: 30"),
	wield_scale = {x=1.2,y=1.2,z=1.2},
	range = 0,
	inventory_image = "rangedweapons_glock17.png",
RW_gun_capabilities = {
		gun_damage = {fleshy=5,knockback=4},
		gun_crit = 15,
		gun_critEffc = 2.2,
		suitable_ammo = {{"rangedweapons:9mm",17},{"rangedweapons:10mm",17},{"rangedweapons:45acp",17}},
		gun_skill = {"handgun_skill",45},
		gun_magazine = "rangedweapons:handgun_mag_black",
		gun_icon = "rangedweapons_glock17_icon.png",
		gun_unloaded = "rangedweapons:glock17_r",
		gun_cooling = "rangedweapons:glock17_rld",
		gun_velocity = 30,
		gun_accuracy = 96,
		gun_cooldown = 0.35,
		gun_reload = 0.9/4,
		gun_projectiles = 1,
		has_shell = 1,
		gun_durability = 1400,
		gun_smokeSize = 5,
		gun_unload_sound = "rangedweapons_handgun_mag_out",
		gun_sound = "rangedweapons_glock",
	},
	on_secondary_use = function(itemstack, user, pointed_thing)
rangedweapons_reload_gun(itemstack, user)
return itemstack
end,
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_shoot_gun(itemstack, user)
return itemstack
	end,
})
