minetest.register_craftitem("rangedweapons:blue_ray_visual", {
	wield_scale = {x=1.75,y=1.75,z=1.75},
	inventory_image = "rangedweapons_blue_ray.png",
})

	minetest.register_tool("rangedweapons:laser_blaster", {
	stack_max= 1,
	wield_scale = {x=1.15,y=1.15,z=1.15},
		description = "" ..core.colorize("#35cdff","Laser blaster\n") ..core.colorize("#FFFFFF", "Ranged damage: 15\n") ..core.colorize("#FFFFFF", "accuracy: 100%\n") ..core.colorize("#FFFFFF", "knockback: 0\n")  ..core.colorize("#FFFFFF", "Critical chance: 10%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2.0x\n")  ..core.colorize("#FFFFFF", "Power usage: 10\n") ..core.colorize("#FFFFFF", "Rate of fire: 0.3\n") ..core.colorize("#FFFFFF", "Enemy penetration: 50%\n") ..core.colorize("#FFFFFF", "Gun type: power pistol\n") ..core.colorize("#FFFFFF", "Bullet velocity: 65"),
	range = 0,
	inventory_image = "rangedweapons_laser_blaster.png",
RW_powergun_capabilities = {
		power_damage = {fleshy=15,knockback=0},
		power_crit = 10,
		power_critEffc = 2.0,
		power_skill = {"",1},
		power_cooling = "rangedweapons:laser_blaster",
		power_velocity = 65,
		power_accuracy = 100,
		power_cooldown = 0.3,
		power_projectiles = 1,
		power_durability = 5000,
		power_sound = "rangedweapons_laser",
		power_glass_breaking = 1,
		power_door_breaking = 1,
		power_dps = 0,
		power_mob_penetration = 50,
		power_node_penetration = 0,
		power_dps = 0,
		power_consumption = 10,
		power_entity = "rangedweapons:shot_bullet",
		power_visual = "wielditem",
		power_texture = "rangedweapons:blue_ray_visual",
		power_projectile_size = 0.1,
		has_sparks = 0,
		ignites_explosives = 1,
	},
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_shoot_powergun(itemstack, user)
return itemstack
	end,

})



