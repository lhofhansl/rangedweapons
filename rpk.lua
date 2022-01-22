
minetest.register_tool("rangedweapons:rpk_r", {
	stack_max= 1,
	wield_scale = {x=1.75,y=1.75,z=1.3},
	description = "",
	rw_next_reload = "rangedweapons:rpk_rr",
	load_sound = "rangedweapons_rifle_clip_in",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_rpk_rld.png",
})

minetest.register_tool("rangedweapons:rpk_rr", {
	stack_max= 1,
	wield_scale = {x=1.75,y=1.75,z=1.3},
	description = "",
	rw_next_reload = "rangedweapons:rpk_rrr",
	load_sound = "rangedweapons_rifle_reload_a",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_rpk.png",
})

minetest.register_tool("rangedweapons:rpk_rrr", {
	stack_max= 1,
	wield_scale = {x=1.75,y=1.75,z=1.3},
	description = "",
	rw_next_reload = "rangedweapons:rpk",
	load_sound = "rangedweapons_rifle_reload_b",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_rpk.png",
})


	minetest.register_tool("rangedweapons:rpk", {
	stack_max= 1,
	wield_scale = {x=1.75,y=1.75,z=1.3},
		description = "" ..core.colorize("#35cdff","rpk\n") ..core.colorize("#FFFFFF", "Gun damage: 7\n") ..core.colorize("#FFFFFF", "accuracy: 60%\n") ..core.colorize("#FFFFFF", "Gun knockback: 6\n")  ..core.colorize("#FFFFFF", "Gun Critical chance: 12%\n")..core.colorize("#FFFFFF", "Critical efficiency: 3.0x\n")  ..core.colorize("#FFFFFF", "Reload delay: 2.0\n") ..core.colorize("#FFFFFF", "Clip size: 75\n")   ..core.colorize("#FFFFFF", "Ammunition: 7.62mm rounds\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.10(full-auto)\n") ..core.colorize("#FFFFFF", "Gun type: heavy machinegun\n") ..core.colorize("#FFFFFF", "Block penetration: 10%\n")
..core.colorize("#FFFFFF", "Enemy penetration: 25%\n") ..core.colorize("#FFFFFF", "Bullet velocity: 55"),
	range = 0,
	inventory_image = "rangedweapons_rpk.png",
	RW_gun_capabilities = {
		automatic_gun = 1,
		gun_damage = {fleshy=7,knockback=6},
		gun_crit = 12,
		gun_critEffc = 3.0,
		suitable_ammo = {{"rangedweapons:762mm",75}},
		gun_skill = {"heavy_skill",55},
		gun_magazine = "rangedweapons:drum_mag",
		gun_icon = "rangedweapons_rpk_icon.png",
		gun_unloaded = "rangedweapons:rpk_r",
		gun_velocity = 55,
		gun_accuracy = 70,
		gun_cooldown = 0.1,
		gun_reload = 2.0/4,
		gun_projectiles = 1,
		has_shell = 1,
		gun_gravity = 0,
		gun_durability = 2250,
		gun_smokeSize = 5,
		gun_mob_penetration = 25,
		gun_node_penetration = 10,
		gun_unload_sound = "rangedweapons_rifle_clip_out",
		gun_sound = "rangedweapons_ak",
	},
	on_secondary_use = function(itemstack, user, pointed_thing)
rangedweapons_reload_gun(itemstack, user)
return itemstack
end,

	inventory_image = "rangedweapons_rpk.png",
})



