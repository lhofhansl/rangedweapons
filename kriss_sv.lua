
minetest.register_tool("rangedweapons:kriss_sv_r", {
	stack_max= 1,
	wield_scale = {x=1.75,y=1.75,z=1.15},
	description = "",
	rw_next_reload = "rangedweapons:kriss_sv_rr",
	load_sound = "rangedweapons_handgun_mag_in",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_kriss_sv_rld.png",
})

minetest.register_tool("rangedweapons:kriss_sv_rr", {
	stack_max= 1,
	wield_scale = {x=1.75,y=1.75,z=1.15},
	description = "",
	rw_next_reload = "rangedweapons:kriss_sv_rrr",
	load_sound = "rangedweapons_reload_a",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_kriss_sv.png",
})

minetest.register_tool("rangedweapons:kriss_sv_rrr", {
	stack_max= 1,
	wield_scale = {x=1.75,y=1.75,z=1.15},
	description = "",
	rw_next_reload = "rangedweapons:kriss_sv",
	load_sound = "rangedweapons_reload_b",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_kriss_sv.png",
})


	minetest.register_tool("rangedweapons:kriss_sv", {
	stack_max= 1,
	wield_scale = {x=1.75,y=1.75,z=1.15},
		description = "" ..core.colorize("#35cdff","Kriss Super V\n") ..core.colorize("#FFFFFF", "Gun damage: 1\n") ..core.colorize("#FFFFFF", "accuracy: 60%\n") ..core.colorize("#FFFFFF", "Gun knockback: 0\n")  ..core.colorize("#FFFFFF", "Gun Critical chance: 6%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 1.85x\n") ..core.colorize("#FFFFFF", "Reload delay: 0.9\n") ..core.colorize("#FFFFFF", "Clip size: 33/33/13\n")   ..core.colorize("#FFFFFF", "Ammunition: 9x19mm parabellum/10mm auto/.45 acp\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.05\n") ..core.colorize("#FFFFFF", "Gun type: machine pistol\n") ..core.colorize("#FFFFFF", "Bullet velocity: 20"),
	range = 0,
	inventory_image = "rangedweapons_kriss_sv.png",
	RW_gun_capabilities = {
		automatic_gun = 1,
		gun_damage = {fleshy=1,knockback=0},
		gun_crit = 6,
		gun_critEffc = 1.95,
		suitable_ammo = {{"rangedweapons:9mm",33},{"rangedweapons:10mm",33},{"rangedweapons:45acp",13}},
		gun_skill = {"mp_skill",90},
		gun_magazine = "rangedweapons:machinepistol_mag",
		gun_icon = "rangedweapons_kriss_sv_icon.png",
		gun_unloaded = "rangedweapons:kriss_sv_r",
		gun_velocity = 20,
		gun_accuracy = 60,
		gun_cooldown = 0.05,
		gun_reload = 0.9/4,
		gun_projectiles = 1,
		has_shell = 1,
		gun_gravity = 0,
		gun_durability = 1750,
		gun_smokeSize = 4,
		gun_unload_sound = "rangedweapons_handgun_mag_out",
		gun_sound = "rangedweapons_machine_pistol",
	},
	on_secondary_use = function(itemstack, user, pointed_thing)
rangedweapons_reload_gun(itemstack, user)
return itemstack
end,
})
