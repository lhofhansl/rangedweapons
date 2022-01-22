

minetest.register_tool("rangedweapons:thompson_r", {
	stack_max= 1,
	wield_scale = {x=1.9,y=1.9,z=1.25},
	description = "",
	rw_next_reload = "rangedweapons:thompson_rr",
	load_sound = "rangedweapons_handgun_mag_in",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_thompson_rld.png",
})
minetest.register_tool("rangedweapons:thompson_rr", {
	stack_max= 1,
	wield_scale = {x=1.9,y=1.9,z=1.25},
	description = "",
	rw_next_reload = "rangedweapons:thompson_rrr",
	load_sound = "rangedweapons_reload_a",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_thompson.png",
})
minetest.register_tool("rangedweapons:thompson_rrr", {
	stack_max= 1,
	wield_scale = {x=1.9,y=1.9,z=1.25},
	description = "",
	rw_next_reload = "rangedweapons:thompson",
	load_sound = "rangedweapons_reload_b",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_thompson.png",
})
-------------------------------------------

	minetest.register_tool("rangedweapons:thompson", {
	stack_max= 1,
	wield_scale = {x=1.9,y=1.9,z=1.25},
		description = "" ..core.colorize("#35cdff","Thompson SMG\n") ..core.colorize("#FFFFFF", "Ranged damage: 4\n") ..core.colorize("#FFFFFF", "accuracy: 75%\n") ..core.colorize("#FFFFFF", "knockback: 1\n") ..core.colorize("#FFFFFF", "Reload delay: 1.4\n")  ..core.colorize("#FFFFFF", "Clip size: 30/30\n") ..core.colorize("#FFFFFF", "Critical chance: 8%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2.0x\n")  ..core.colorize("#FFFFFF", "Ammunition: 10mm auto/.45acp\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.1 (full-auto)\n") ..core.colorize("#FFFFFF", "Gun type: smg\n") ..core.colorize("#FFFFFF", "Bullet velocity: 30"),
	range = 0,
	inventory_image = "rangedweapons_thompson.png",
	RW_gun_capabilities = {
		automatic_gun = 1,
		gun_damage = {fleshy=4,knockback=1},
		gun_crit = 8,
		gun_critEffc = 2.0,
		suitable_ammo = {{"rangedweapons:10mm",30},{"rangedweapons:45acp",30}},
		gun_skill = {"smg_skill",65},
		gun_magazine = "rangedweapons:machinepistol_mag",
		gun_icon = "rangedweapons_thompson_icon.png",
		gun_unloaded = "rangedweapons:thompson_r",
		gun_velocity = 30,
		gun_accuracy = 75,
		gun_cooldown = 0.1,
		gun_reload = 1.4/4,
		gun_projectiles = 1,
		has_shell = 1,
		gun_gravity = 0,
		gun_durability = 1250,
		gun_smokeSize = 4,
		gun_unload_sound = "rangedweapons_handgun_mag_out",
		gun_sound = "rangedweapons_smg",
	},
	on_secondary_use = function(itemstack, user, pointed_thing)
rangedweapons_reload_gun(itemstack, user)
return itemstack
end,
})





