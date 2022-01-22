



minetest.register_tool("rangedweapons:python_rld", {
	stack_max= 1,
	range = 0,
	wield_scale = {x=1.25,y=1.25,z=1.1},
	description = "",
	loaded_gun = "rangedweapons:python",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_python_rld.png",
})


minetest.register_tool("rangedweapons:python", {
		description = "" ..core.colorize("#35cdff","Colt Python \n") ..core.colorize("#FFFFFF", "Ranged damage: 10\n")..core.colorize("#FFFFFF", "Accuracy: 95%\n") ..core.colorize("#FFFFFF", "Gun knockback: 6\n") ..core.colorize("#FFFFFF", "Critical chance: 19%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2.5x\n") ..core.colorize("#FFFFFF", "Ammunition: .357 Magnum rounds\n") ..core.colorize("#FFFFFF", "Reload time: 0.25\n") ..core.colorize("#FFFFFF", "Clip Size: 6\n")..core.colorize("#FFFFFF", "Gun type: Revolver\n")..core.colorize("#FFFFFF", "Block penetration: 5%\n")
..core.colorize("#FFFFFF", "penetration: 15%\n") ..core.colorize("#FFFFFF", "Bullet velocity: 55"),
	range = 0,
	wield_scale = {x=1.25,y=1.25,z=1.1},
	inventory_image = "rangedweapons_python.png",
RW_gun_capabilities = {
		gun_damage = {fleshy=10,knockback=6},
		gun_crit = 19,
		gun_critEffc = 2.2,
		suitable_ammo = {{"rangedweapons:357",6}},
		gun_skill = {"revolver_skill",40},
		gun_icon = "rangedweapons_python_icon.png",
		gun_unloaded = "rangedweapons:python_rld",
		gun_cooling = "rangedweapons:python",
		gun_velocity = 55,
		gun_accuracy = 95,
		gun_cooldown = 0.2,
		gun_reload = 0.4,
		gun_projectiles = 1,
		gun_durability = 1000,
		gun_smokeSize = 7,
		gun_mob_penetration = 15,
		gun_node_penetration = 5,
		gun_unload_sound = "rangedweapons_shell_insert",
		gun_sound = "rangedweapons_deagle",
	},
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_shoot_gun(itemstack, user)
return itemstack
	end,
	on_secondary_use = function(itemstack, user, pointed_thing)
rangedweapons_single_load_gun(itemstack, user)
return itemstack
end,
})

