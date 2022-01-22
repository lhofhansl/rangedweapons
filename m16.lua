

minetest.register_tool("rangedweapons:m16_r", {
	stack_max= 1,
	wield_scale = {x=1.75,y=1.75,z=1.3},
	description = "",
	rw_next_reload = "rangedweapons:m16_rr",
	load_sound = "rangedweapons_handgun_mag_in",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_m16_rld.png",
})

minetest.register_tool("rangedweapons:m16_rr", {
	stack_max= 1,
	wield_scale = {x=1.75,y=1.75,z=1.3},
	description = "",
	rw_next_reload = "rangedweapons:m16_rrr",
	load_sound = "rangedweapons_rifle_reload_a",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_m16.png",
})

minetest.register_tool("rangedweapons:m16_rrr", {
	stack_max= 1,
	wield_scale = {x=1.75,y=1.75,z=1.3},
	description = "",
	rw_next_reload = "rangedweapons:m16",
	load_sound = "rangedweapons_rifle_reload_b",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_m16.png",
})


	minetest.register_tool("rangedweapons:m16", {
	stack_max= 1,
	wield_scale = {x=1.75,y=1.75,z=1.3},
		description = "" ..core.colorize("#35cdff","m16\n") ..core.colorize("#FFFFFF", "Gun damage: 6\n") ..core.colorize("#FFFFFF", "accuracy: 75%\n") ..core.colorize("#FFFFFF", "Gun knockback: 4\n")  ..core.colorize("#FFFFFF", "Gun Critical chance: 11%\n")..core.colorize("#FFFFFF", "Critical efficiency: 2.75x\n")  ..core.colorize("#FFFFFF", "Reload delay: 1.0\n") ..core.colorize("#FFFFFF", "Clip size: 20\n")   ..core.colorize("#FFFFFF", "Ammunition: 5.56mm rounds\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.067(full-auto)\n") ..core.colorize("#FFFFFF", "Gun type: assault rifle\n")
..core.colorize("#FFFFFF", "Enemy penetration: 10%\n") ..core.colorize("#FFFFFF", "Bullet velocity: 35"),
	range = 0,
	inventory_image = "rangedweapons_m16.png",
	RW_gun_capabilities = {
		automatic_gun = 1,
		gun_damage = {fleshy=6,knockback=4},
		gun_crit = 11,
		gun_critEffc = 2.75,
		suitable_ammo = {{"rangedweapons:556mm",20}},
		gun_skill = {"arifle_skill",55},
		gun_magazine = "rangedweapons:assaultrifle_mag",
		gun_icon = "rangedweapons_m16_icon.png",
		gun_unloaded = "rangedweapons:m16_r",
		gun_velocity = 35,
		gun_accuracy = 75,
		gun_cooldown = 0.067,
		gun_reload = 1.0/4,
		gun_projectiles = 1,
		has_shell = 1,
		gun_gravity = 0,
		gun_durability = 1350,
		gun_smokeSize = 5,
		gun_mob_penetration = 10,
		gun_unload_sound = "rangedweapons_handgun_mag_out",
		gun_sound = "rangedweapons_smg",
	},
	on_secondary_use = function(itemstack, user, pointed_thing)
rangedweapons_reload_gun(itemstack, user)
return itemstack
end,

	inventory_image = "rangedweapons_m16.png",
})