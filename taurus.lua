
minetest.register_tool("rangedweapons:taurus_rld", {
	stack_max= 1,
	range = 0,
	wield_scale = {x=1.25,y=1.25,z=1.1},
	description = "",
	loaded_gun = "rangedweapons:taurus",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_taurus_rld.png",
})


minetest.register_tool("rangedweapons:taurus", {
		description = "" ..core.colorize("#35cdff","Taurus raging bull \n") ..core.colorize("#FFFFFF", "Ranged damage: 14\n")..core.colorize("#FFFFFF", "Accuracy: 97%\n") ..core.colorize("#FFFFFF", "Gun knockback: 8\n") ..core.colorize("#FFFFFF", "Critical chance: 22%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 3.1x\n") ..core.colorize("#FFFFFF", "Ammunition: .44 Magnum rounds\n") ..core.colorize("#FFFFFF", "Reload time: 0.25\n") ..core.colorize("#FFFFFF", "Clip Size: 6\n") ..core.colorize("#FFFFFF", "Block penetration: 8%\n")
..core.colorize("#FFFFFF", "penetration: 24%\n") ..core.colorize("#FFFFFF", "Gun type: Revolver\n") ..core.colorize("#FFFFFF", "Bullet velocity: 64"),
	range = 0,
	wield_scale = {x=1.25,y=1.25,z=1.1},
	inventory_image = "rangedweapons_taurus.png",
RW_gun_capabilities = {
		gun_damage = {fleshy=14,knockback=8},
		gun_crit = 22,
		gun_critEffc = 3.1,
		suitable_ammo = {{"rangedweapons:44",6}},
		gun_skill = {"revolver_skill",40},
		gun_icon = "rangedweapons_taurus_icon.png",
		gun_unloaded = "rangedweapons:taurus_rld",
		gun_cooling = "rangedweapons:taurus",
		gun_velocity = 55,
		gun_accuracy = 97,
		gun_cooldown = 0.2,
		gun_reload = 0.4,
		gun_projectiles = 1,
		gun_durability = 1750,
		gun_smokeSize = 7,
		gun_mob_penetration = 24,
		gun_node_penetration = 8,
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


