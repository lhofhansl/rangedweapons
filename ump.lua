


minetest.register_tool("rangedweapons:ump_r", {
	stack_max= 1,
	wield_scale = {x=1.9,y=1.9,z=1.25},
	description = "",
	rw_next_reload = "rangedweapons:ump_rr",
	load_sound = "rangedweapons_handgun_mag_in",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_ump_rld.png",
})
minetest.register_tool("rangedweapons:ump_rr", {
	stack_max= 1,
	wield_scale = {x=1.9,y=1.9,z=1.25},
	description = "",
	rw_next_reload = "rangedweapons:ump_rrr",
	load_sound = "rangedweapons_reload_a",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_ump.png",
})
minetest.register_tool("rangedweapons:ump_rrr", {
	stack_max= 1,
	wield_scale = {x=1.9,y=1.9,z=1.25},
	description = "",
	rw_next_reload = "rangedweapons:ump",
	load_sound = "rangedweapons_reload_b",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_ump.png",
})
-------------------------------------------

	minetest.register_tool("rangedweapons:ump", {
	stack_max= 1,
	wield_scale = {x=1.9,y=1.9,z=1.25},
		description = "" ..core.colorize("#35cdff","UMP-9\n") ..core.colorize("#FFFFFF", "Ranged damage: 5\n") ..core.colorize("#FFFFFF", "accuracy: 79%\n") ..core.colorize("#FFFFFF", "knockback: 1\n") ..core.colorize("#FFFFFF", "Reload delay: 1.25\n")  ..core.colorize("#FFFFFF", "Clip size: 25/25\n") ..core.colorize("#FFFFFF", "Critical chance: 9%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2.0x\n")  ..core.colorize("#FFFFFF", "Ammunition: 9x19mm parabellum/.45acp\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.115 (full-auto)\n") ..core.colorize("#FFFFFF", "Gun type: smg\n") ..core.colorize("#FFFFFF", "Bullet velocity: 32"),
	range = 0,
	inventory_image = "rangedweapons_ump.png",
	RW_gun_capabilities = {
		automatic_gun = 1,
		gun_damage = {fleshy=5,knockback=1},
		gun_crit = 9,
		gun_critEffc = 2.0,
		suitable_ammo = {{"rangedweapons:9mm",25},{"rangedweapons:45acp",25}},
		gun_skill = {"smg_skill",60},
		gun_magazine = "rangedweapons:machinepistol_mag",
		gun_icon = "rangedweapons_ump_icon.png",
		gun_unloaded = "rangedweapons:ump_r",
		gun_velocity = 32,
		gun_accuracy = 79,
		gun_cooldown = 0.115,
		gun_reload = 1.25/4,
		gun_projectiles = 1,
		has_shell = 1,
		gun_gravity = 0,
		gun_durability = 1500,
		gun_smokeSize = 4,
		gun_unload_sound = "rangedweapons_handgun_mag_out",
		gun_sound = "rangedweapons_smg",
	},
	on_secondary_use = function(itemstack, user, pointed_thing)
rangedweapons_reload_gun(itemstack, user)
return itemstack
end,
})


