

minetest.register_tool("rangedweapons:beretta_rld", {
	stack_max= 1,
	wield_scale = {x=1.1,y=1.1,z=1.05},
	description = "",
	range = 0,
	loaded_gun = "rangedweapons:beretta",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_beretta_rld.png",
})
minetest.register_tool("rangedweapons:beretta_r", {
	stack_max= 1,
	wield_scale = {x=1.1,y=1.1,z=1.05},
	description = "",
	rw_next_reload = "rangedweapons:beretta",
	load_sound = "rangedweapons_handgun_mag_in",
	range = 0,
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_beretta_rld.png",
})

minetest.register_tool("rangedweapons:beretta", {
		description = "" ..core.colorize("#35cdff","Beretta M9\n") ..core.colorize("#FFFFFF", "Gun damage: 4\n")..core.colorize("#FFFFFF", "Accuracy: 94%\n")  ..core.colorize("#FFFFFF", "gun knockback: 4\n") ..core.colorize("#FFFFFF", "Gun crit chance: 13%\n")..core.colorize("#FFFFFF", "Critical efficiency: 2.1x\n") ..core.colorize("#FFFFFF", "Reload delay: 0.5\n")..core.colorize("#FFFFFF", "Clip size: 15\n") ..core.colorize("#FFFFFF", "Ammunition: 9x19mm Parabellum\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.4\n") ..core.colorize("#FFFFFF", "Gun type: Handgun\n") ..core.colorize("#FFFFFF", "Bullet velocity: 25"),
	wield_scale = {x=1.1,y=1.1,z=1.05},
	range = 0,
	inventory_image = "rangedweapons_beretta.png",
RW_gun_capabilities = {
		gun_damage = {fleshy=4,knockback=4},
		gun_crit = 15,
		gun_critEffc = 2.1,
		suitable_ammo = {{"rangedweapons:9mm",15}},
		gun_skill = {"handgun_skill",43},
		gun_magazine = "rangedweapons:handgun_mag_black",
		gun_icon = "rangedweapons_beretta_icon.png",
		gun_unloaded = "rangedweapons:beretta_r",
		gun_cooling = "rangedweapons:beretta_rld",
		gun_velocity = 25,
		gun_accuracy = 94,
		gun_cooldown = 0.4,
		gun_reload = 0.5,
		gun_projectiles = 1,
		has_shell = 1,
		gun_durability = 1150,
		gun_smokeSize = 5,
		gun_unload_sound = "rangedweapons_handgun_mag_out",
		gun_sound = "rangedweapons_beretta",
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

