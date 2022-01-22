minetest.register_tool("rangedweapons:benelli_rld", {
	stack_max= 1,
	range = 0,
	wield_scale = {x=1.9,y=1.9,z=1.1},
	description = "",
	loaded_gun = "rangedweapons:benelli",
	loaded_sound = "rangedweapons_shotgun_reload_b",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "rangedweapons_benelli_rld.png",
})

minetest.register_tool("rangedweapons:benelli", {
		description = "" ..core.colorize("#35cdff","benelli m3\n") ..core.colorize("#FFFFFF", "Ranged damage: 2\n") ..core.colorize("#FFFFFF", "projectiles: 5\n") ..core.colorize("#FFFFFF", "Gun gravity: 4\n") ..core.colorize("#FFFFFF", "Accuracy: 48%\n")..core.colorize("#FFFFFF", "knockback: 6\n") ..core.colorize("#FFFFFF", "Critical chance: 6%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2.0x\n") ..core.colorize("#FFFFFF", "Ammunition: 12 gauge shells\n") ..core.colorize("#FFFFFF", "Pump delay: 0.6\n")..core.colorize("#FFFFFF", "Clip size: 7\n") ..core.colorize("#27a600", "Gun is ready to fire!\n") ..core.colorize("#fff21c", "Right-click to load in a bullet!\n")  ..core.colorize("#FFFFFF", "Gun type: shotgun\n") ..core.colorize("#FFFFFF", "Bullet velocity: 26"),
	range = 0,
	wield_scale = {x=1.9,y=1.9,z=1.1},
	inventory_image = "rangedweapons_benelli.png",
RW_gun_capabilities = {
		gun_damage = {fleshy=2,knockback=6},
		gun_crit = 6,
		gun_critEffc = 2.0,
		suitable_ammo = {{"rangedweapons:shell",7}},
		gun_skill = {"shotgun_skill",20},
		gun_icon = "rangedweapons_benelli_icon.png",
		gun_unloaded = "rangedweapons:benelli_rld",
		gun_cooling = "rangedweapons:benelli_uld",
		gun_velocity = 25,
		gun_accuracy = 48,
		gun_cooldown = 0.6,
		gun_gravity = 4,
		gun_reload = 0.25,
		gun_projectiles = 5,
		has_shell = 0,
		gun_durability = 325,
		gun_smokeSize = 14,
		gun_door_breaking = 1,
		gun_sound = "rangedweapons_shotgun_shot",
		gun_unload_sound = "rangedweapons_shell_insert",
	},
	on_secondary_use = function(itemstack, user, pointed_thing)
rangedweapons_single_load_gun(itemstack, user, "")
return itemstack
end,
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_shoot_gun(itemstack, user)
return itemstack
	end,
})

minetest.register_tool("rangedweapons:benelli_uld", {
	stack_max= 1,
	wield_scale = {x=1.9,y=1.9,z=1.1},
	range = 0,
		description = "" ..core.colorize("#35cdff","benelli m3\n") ..core.colorize("#FFFFFF", "Ranged damage: 2\n") ..core.colorize("#FFFFFF", "projectiles: 5\n") ..core.colorize("#FFFFFF", "Gun gravity: 4\n") ..core.colorize("#FFFFFF", "Accuracy: 48%\n")..core.colorize("#FFFFFF", "knockback: 6\n") ..core.colorize("#FFFFFF", "Critical chance: 6%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2.0x\n") ..core.colorize("#FFFFFF", "Ammunition: 12 gauge shells\n") ..core.colorize("#FFFFFF", "Pump delay: 0.6\n")..core.colorize("#FFFFFF", "Clip size: 7\n") ..core.colorize("#be0d00", "Right-click, to eject the empty shell!\n") ..core.colorize("#fff21c", "Right-click to load in a bullet!\n")  ..core.colorize("#FFFFFF", "Gun type: shotgun\n") ..core.colorize("#FFFFFF", "Bullet velocity: 25"),
	inventory_image = "rangedweapons_benelli.png",
	groups = {not_in_creative_inventory = 1},
	on_use = function(user)
		minetest.sound_play("rangedweapons_empty", {user})
	end,
on_secondary_use = function(itemstack, user, pointed_thing)
eject_shell(itemstack,user,"rangedweapons:benelli_rld",0.6,"rangedweapons_shotgun_reload_a","rangedweapons:empty_shell")
return itemstack
end,
})
