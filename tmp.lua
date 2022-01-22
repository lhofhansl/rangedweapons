
minetest.register_tool("rangedweapons:tmp_r", {
	stack_max= 1,
	wield_scale = {x=1.15,y=1.15,z=1.15},
	description = "",
	range = 0,
	rw_next_reload = "rangedweapons:tmp_rr",
	load_sound = "rangedweapons_handgun_mag_in",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_tmp_rld.png",
})

minetest.register_tool("rangedweapons:tmp_rr", {
	stack_max= 1,
	wield_scale = {x=1.15,y=1.15,z=1.15},
	description = "",
	range = 0,
	rw_next_reload = "rangedweapons:tmp_rrr",
	load_sound = "rangedweapons_reload_a",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_tmp.png",
})

minetest.register_tool("rangedweapons:tmp_rrr", {
	stack_max= 1,
	wield_scale = {x=1.15,y=1.15,z=1.15},
	description = "",
	range = 0,
	rw_next_reload = "rangedweapons:tmp",
	load_sound = "rangedweapons_reload_b",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_tmp.png",
})

	minetest.register_tool("rangedweapons:tmp", {
	stack_max= 1,
	wield_scale = {x=1.15,y=1.15,z=1.15},
		description = "" ..core.colorize("#35cdff","Steyr T.M.P.\n") ..core.colorize("#FFFFFF", "Gun damage: 1\n") ..core.colorize("#FFFFFF", "accuracy: 64%\n") ..core.colorize("#FFFFFF", "Gun knockback: 0\n")  ..core.colorize("#FFFFFF", "Gun Critical chance: 4%\n")..core.colorize("#FFFFFF", "Critical efficiency: 1.85x\n")   ..core.colorize("#FFFFFF", "Reload delay: 1.0\n") ..core.colorize("#FFFFFF", "Clip size: 30\n")   ..core.colorize("#FFFFFF", "Ammunition: 9x19mm parabellum\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.066(full-auto)\n") ..core.colorize("#FFFFFF", "Gun type: machine pistol\n") ..core.colorize("#FFFFFF", "Bullet velocity: 20"),
	range = 0,
	inventory_image = "rangedweapons_tmp.png",
	RW_gun_capabilities = {
		automatic_gun = 1,
		gun_damage = {fleshy=1,knockback=0},
		gun_crit = 4,
		gun_critEffc = 1.85,
		suitable_ammo = {{"rangedweapons:9mm",30}},
		gun_skill = {"mp_skill",85},
		gun_magazine = "rangedweapons:machinepistol_mag",
		gun_icon = "rangedweapons_tmp_icon.png",
		gun_unloaded = "rangedweapons:tmp_r",
		gun_velocity = 20,
		gun_accuracy = 64,
		gun_cooldown = 0.066,
		gun_reload = 1.0/4,
		gun_projectiles = 1,
		has_shell = 1,
		gun_gravity = 0,
		gun_durability = 1200,
		gun_smokeSize = 4,
		gun_unload_sound = "rangedweapons_handgun_mag_out",
		gun_sound = "rangedweapons_machine_pistol",
	},
	on_secondary_use = function(itemstack, user, pointed_thing)
rangedweapons_reload_gun(itemstack, user)
return itemstack
end,
})

