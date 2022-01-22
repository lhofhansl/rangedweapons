
minetest.register_tool("rangedweapons:scar_r", {
	stack_max= 1,
	wield_scale = {x=1.7,y=1.7,z=1.25},
	description = "",
	rw_next_reload = "rangedweapons:scar_rr",
	load_sound = "rangedweapons_rifle_clip_in",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_scar_rld.png",
})

minetest.register_tool("rangedweapons:scar_rr", {
	stack_max= 1,
	wield_scale = {x=1.7,y=1.7,z=1.25},
	description = "",
	rw_next_reload = "rangedweapons:scar_rrr",
	load_sound = "rangedweapons_rifle_reload_a",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_scar.png",
})

minetest.register_tool("rangedweapons:scar_rrr", {
	stack_max= 1,
	wield_scale = {x=1.7,y=1.7,z=1.25},
	description = "",
	rw_next_reload = "rangedweapons:scar",
	load_sound = "rangedweapons_rifle_reload_b",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_scar.png",
})

	minetest.register_tool("rangedweapons:scar", {
	stack_max= 1,
	wield_scale = {x=1.7,y=1.7,z=1.25},
		description = "" ..core.colorize("#35cdff","FN SCAR 16\n") ..core.colorize("#FFFFFF", "Ranged damage: 9\n") ..core.colorize("#FFFFFF", "Accuracy: 85%\n") ..core.colorize("#FFFFFF", "Gun knockback: 6\n")..core.colorize("#FFFFFF", "Critical chance: 11%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2.75x\n") ..core.colorize("#FFFFFF", "Ammunition: 7.62mm rounds/5.56mm rounds\n") ..core.colorize("#FFFFFF", "Reload delay: 1.2\n") ..core.colorize("#FFFFFF", "Clip size: 20/30\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.15\n") ..core.colorize("#FFFFFF", "Block penetration: 7%\n")
..core.colorize("#FFFFFF", "penetration: 20%\n") ..core.colorize("#FFFFFF", "Gun type: Assault rifle\n") ..core.colorize("#FFFFFF", "Bullet velocity: 45"),
	range = 0,
	inventory_image = "rangedweapons_scar.png",
	RW_gun_capabilities = {
		automatic_gun = 1,
		gun_damage = {fleshy=9,knockback=6},
		gun_crit = 11,
		gun_critEffc = 2.75,
		suitable_ammo = {{"rangedweapons:762mm",20},{"rangedweapons:556mm",30}},
		gun_skill = {"arifle_skill",50},
		gun_magazine = "rangedweapons:assaultrifle_mag",
		gun_icon = "rangedweapons_scar_icon.png",
		gun_unloaded = "rangedweapons:scar_r",
		gun_velocity = 45,
		gun_accuracy = 85,
		gun_cooldown = 0.15,
		gun_reload = 1.2/4,
		gun_projectiles = 1,
		has_shell = 1,
		gun_gravity = 0,
		gun_durability = 1600,
		gun_smokeSize = 5,
		gun_mob_penetration = 20,
		gun_node_penetration = 7,
		gun_unload_sound = "rangedweapons_rifle_clip_out",
		gun_sound = "rangedweapons_ak",
	},
	on_secondary_use = function(itemstack, user, pointed_thing)
rangedweapons_reload_gun(itemstack, user)
return itemstack
end,
	inventory_image = "rangedweapons_scar.png",
})




