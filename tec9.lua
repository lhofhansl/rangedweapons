


minetest.register_craftitem("rangedweapons:tec9_r", {
	stack_max= 1,
	wield_scale = {x=1.25,y=1.25,z=1.50},
	description = "",
	range = 0,
	rw_next_reload = "rangedweapons:tec9_rr",
	load_sound = "rangedweapons_handgun_mag_in",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_tec9_rld.png",
})

minetest.register_craftitem("rangedweapons:tec9_rr", {
	stack_max= 1,
	wield_scale = {x=1.25,y=1.25,z=1.50},
	description = "",
	range = 0,
	rw_next_reload = "rangedweapons:tec9_rrr",
	load_sound = "rangedweapons_reload_a",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_tec9.png",
})

minetest.register_craftitem("rangedweapons:tec9_rrr", {
	stack_max= 1,
	wield_scale = {x=1.25,y=1.25,z=1.50},
	description = "",
	range = 0,
	rw_next_reload = "rangedweapons:tec9",
	load_sound = "rangedweapons_reload_b",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_tec9.png",
})



	minetest.register_craftitem("rangedweapons:tec9", {
	stack_max= 1,
	wield_scale = {x=1.25,y=1.25,z=1.50},
		description = "" ..core.colorize("#35cdff","TEC-9\n") ..core.colorize("#FFFFFF", "Gun damage: 1\n") ..core.colorize("#FFFFFF", "accuracy: 75%\n") ..core.colorize("#FFFFFF", "Gun knockback: 0\n")  ..core.colorize("#FFFFFF", "Gun Critical chance: 9%\n") ..core.colorize("#FFFFFF", "Gun Critical efficiency: 1.9x\n") ..core.colorize("#FFFFFF", "Reload delay: 1.0\n") ..core.colorize("#FFFFFF", "Clip size: 50\n")   ..core.colorize("#FFFFFF", "Ammunition: 9x19mm parabellum\n")  ..core.colorize("#FFFFFF", "Rate of fire: 0.2\n") ..core.colorize("#FFFFFF", "Gun type: machine pistol\n") ..core.colorize("#FFFFFF", "Bullet velocity: 20"),
	range = 0,
	inventory_image = "rangedweapons_tec9.png",
	RW_gun_capabilities = {
		automatic_gun = 1,
		gun_damage = {fleshy=1,knockback=0},
		gun_crit = 9,
		gun_critEffc = 1.9,
		suitable_ammo = {{"rangedweapons:9mm",50}},
		gun_skill = {"mp_skill",80},
		gun_magazine = "rangedweapons:machinepistol_mag",
		gun_icon = "rangedweapons_tec9_icon.png",
		gun_unloaded = "rangedweapons:tec9_r",
		gun_velocity = 20,
		gun_accuracy = 75,
		gun_cooldown = 0.2,
		gun_reload = 1.0/4,
		gun_projectiles = 1,
		has_shell = 1,
		gun_gravity = 0,
		gun_durability = 1100,
		gun_smokeSize = 4,
		gun_unload_sound = "rangedweapons_handgun_mag_out",
		gun_sound = "rangedweapons_machine_pistol",
	},
	on_secondary_use = function(itemstack, user, pointed_thing)
rangedweapons_reload_gun(itemstack, user)
return itemstack
end,
})

