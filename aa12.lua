

minetest.register_tool("rangedweapons:aa12_r", {
	stack_max= 1,
	wield_scale = {x=1.9,y=1.9,z=1.4},
	description = "",
	rw_next_reload = "rangedweapons:aa12_rr",
	load_sound = "rangedweapons_rifle_clip_in",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_aa12_rld.png",
})
minetest.register_tool("rangedweapons:aa12_rr", {
	stack_max= 1,
	wield_scale = {x=1.9,y=1.9,z=1.4},
	description = "",
	rw_next_reload = "rangedweapons:aa12_rrr",
	load_sound = "rangedweapons_reload_a",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_aa12.png",
})
minetest.register_tool("rangedweapons:aa12_rrr", {
	stack_max= 1,
	wield_scale = {x=1.9,y=1.9,z=1.4},
	description = "",
	rw_next_reload = "rangedweapons:aa12",
	load_sound = "rangedweapons_reload_b",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_aa12.png",
})
-------------------------------------------

	minetest.register_tool("rangedweapons:aa12", {
	stack_max= 1,
	wield_scale = {x=1.9,y=1.9,z=1.4},
		description = "" ..core.colorize("#35cdff","AA-12\n") ..core.colorize("#FFFFFF", "Ranged damage: 1\n") ..core.colorize("#FFFFFF", "projectiles: 5\n") ..core.colorize("#FFFFFF", "Gun gravity: 4\n") ..core.colorize("#FFFFFF", "accuracy: 40%\n") ..core.colorize("#FFFFFF", "knockback: 5\n") ..core.colorize("#FFFFFF", "Reload delay: 1.5\n")  ..core.colorize("#FFFFFF", "Clip size: 20\n") ..core.colorize("#FFFFFF", "Critical chance: 5%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2.0x\n")  ..core.colorize("#FFFFFF", "Ammunition: 12 gauge shell\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.2 (full-auto)\n") ..core.colorize("#FFFFFF", "Gun type: shotgun\n") ..core.colorize("#FFFFFF", "Bullet velocity: 25"),
	range = 0,
	inventory_image = "rangedweapons_aa12.png",
	RW_gun_capabilities = {
		automatic_gun = 1,
		gun_damage = {fleshy=1,knockback=5},
		gun_crit = 5,
		gun_critEffc = 2.0,
		suitable_ammo = {{"rangedweapons:shell",20}},
		gun_skill = {"shotgun_skill",40},
		gun_magazine = "rangedweapons:drum_mag",
		gun_icon = "rangedweapons_aa12_icon.png",
		gun_unloaded = "rangedweapons:aa12_r",
		gun_velocity = 25,
		gun_accuracy = 40,
		gun_cooldown = 0.2,
		gun_reload = 1.5/4,
		gun_projectiles = 1,
		has_shell = 1,
		gun_durability = 750,
		gun_smokeSize = 8,
		gun_door_breaking = 1,
		gun_projectiles = 5,
		gun_gravity = 4,
		gun_unload_sound = "rangedweapons_rifle_clip_out",
		gun_sound = "rangedweapons_shotgun_shot",
	},
	on_secondary_use = function(itemstack, user, pointed_thing)
rangedweapons_reload_gun(itemstack, user)
return itemstack
end,
})






