	minetest.register_tool("rangedweapons:laser_shotgun", {
	stack_max= 1,
	wield_scale = {x=2.0,y=2.0,z=1.75},
		description = "" ..core.colorize("#35cdff","Laser shotgun\n") ..core.colorize("#FFFFFF", "Ranged damage: 10\n") ..core.colorize("#FFFFFF", "accuracy: 40%\n") ..core.colorize("#FFFFFF", "projectiles: 6\n") ..core.colorize("#FFFFFF", "knockback: 0\n")  ..core.colorize("#FFFFFF", "Critical chance: 8%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2.2x\n")  ..core.colorize("#FFFFFF", "Power usage: 30\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.5\n") ..core.colorize("#FFFFFF", "Enemy penetration: 40%\n") ..core.colorize("#FFFFFF", "Gun type: power pistol\n") ..core.colorize("#FFFFFF", "Bullet velocity: 55"),
	range = 0,
	inventory_image = "rangedweapons_laser_shotgun.png",
RW_powergun_capabilities = {
		power_damage = {fleshy=10,knockback=0},
		power_crit = 8,
		power_critEffc = 2.2,
		power_skill = {"",1},
		power_cooling = "rangedweapons:laser_shotgun",
		power_velocity = 55,
		power_accuracy = 40,
		power_cooldown = 0.5,
		power_projectiles = 1,
		power_durability = 2000,
		power_sound = "rangedweapons_laser",
		power_glass_breaking = 1,
		power_door_breaking = 1,
		power_dps = 0,
		power_mob_penetration = 40,
		power_node_penetration = 0,
		power_dps = 0,
		power_consumption = 30,
		power_entity = "rangedweapons:shot_bullet",
		power_visual = "sprite",
		power_texture = "rangedweapons_green_ray.png",
		power_projectile_size = 0.005,
		power_projectiles = 6,
		has_sparks = 0,
		ignites_explosives = 1,
	},
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_shoot_powergun(itemstack, user)
return itemstack
	end,

})