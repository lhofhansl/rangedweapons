minetest.register_tool("rangedweapons:rpg_rld", {
		description = "" ..core.colorize("#35cdff","rpg7\n") ..core.colorize("#FFFFFF", "Direct contact damage: 20\n")..core.colorize("#FFFFFF", "Accuracy: 100%\n")  ..core.colorize("#FFFFFF", "direct contact knockback: 35\n") ..core.colorize("#FFFFFF", "Gun crit chance: 10%\n")..core.colorize("#FFFFFF", "Critical efficiency: 3x\n") ..core.colorize("#FFFFFF", "Reload delay: 1.0\n")..core.colorize("#FFFFFF", "Clip size: 1\n") ..core.colorize("#FFFFFF", "Gun gravity: 5\n")..core.colorize("#FFFFFF", "Ammunition: rockets\n")..core.colorize("#FFFFFF", "Gun type: rocket launcher\n") ..core.colorize("#FFFFFF", "Bullet velocity: 25"),
	range = 0,
	wield_scale = {x=2.5,y=2.5,z=3.75},
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_rpg_rld.png",
	RW_gun_capabilities = {
		gun_damage = {fleshy=20,knockback=35},
		gun_crit = 10,
		gun_critEffc = 3.0,
		suitable_ammo = {{"rangedweapons:rocket",1}},
		gun_skill = {"",1},
		gun_icon = "rangedweapons_rpg_icon.png",
		gun_unloaded = "rangedweapons:rpg_rld",
		gun_cooling = "rangedweapons:rpg",
		gun_velocity = 25,
		gun_accuracy = 100,
		gun_cooldown = 1.0,
		gun_reload = 1.0,
		gun_projectiles = 1,
		gun_smokeSize = 15,
		gun_durability = 150,
		gun_unload_sound = "",
		gun_sound = "rangedweapons_rocket",
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

minetest.register_tool("rangedweapons:rpg", {
		description = "" ..core.colorize("#35cdff","rpg7\n") ..core.colorize("#FFFFFF", "Direct contact damage: 20\n")..core.colorize("#FFFFFF", "Accuracy: 100%\n")  ..core.colorize("#FFFFFF", "direct contact knockback: 35\n") ..core.colorize("#FFFFFF", "Gun crit chance: 10%\n")..core.colorize("#FFFFFF", "Critical efficiency: 3x\n") ..core.colorize("#FFFFFF", "Reload delay: 1.0\n")..core.colorize("#FFFFFF", "Clip size: 1\n") ..core.colorize("#FFFFFF", "Gun gravity: 5\n")..core.colorize("#FFFFFF", "Ammunition: rockets\n")..core.colorize("#FFFFFF", "Gun type: rocket launcher\n") ..core.colorize("#FFFFFF", "Bullet velocity: 25"),
	range = 0,
	wield_scale = {x=2.5,y=2.5,z=3.75},
	inventory_image = "rangedweapons_rpg.png",
	RW_gun_capabilities = {
		gun_damage = {fleshy=20,knockback=35},
		gun_crit = 10,
		gun_critEffc = 3.0,
		suitable_ammo = {{"rangedweapons:rocket",1}},
		gun_skill = {"",1},
		gun_icon = "rangedweapons_rpg_icon.png",
		gun_unloaded = "rangedweapons:rpg_rld",
		gun_cooling = "rangedweapons:rpg",
		gun_velocity = 25,
		gun_accuracy = 100,
		gun_cooldown = 1.0,
		gun_reload = 1.0,
		gun_projectiles = 1,
		gun_smokeSize = 15,
		gun_durability = 150,
		gun_unload_sound = "",
		gun_sound = "rangedweapons_rocket",
		gun_unload_sound = "rangedweapons_shell_insert",
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





