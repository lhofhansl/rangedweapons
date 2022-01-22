

minetest.register_craftitem("rangedweapons:wooden_shuriken", {
		description = "" ..core.colorize("#35cdff","Wooden shuriken\n") ..core.colorize("#FFFFFF", "Ranged damage: 2\n") ..core.colorize("#FFFFFF", "Accuracy: 80%\n") ..core.colorize("#FFFFFF", "knockback: 5\n") ..core.colorize("#FFFFFF", "Critical chance: 6%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2x\n") ..core.colorize("#FFFFFF", "Shuriken survival rate: 10%\n") ..core.colorize("#FFFFFF", "Projectile gravity: 10\n") ..core.colorize("#FFFFFF", "Throwing cooldown: 0.35\n") ..core.colorize("#FFFFFF", "Projectile velocity: 25"),
	range = 0,
	stack_max= 100,
	wield_scale = {x=0.6,y=0.6,z=0.5},
	inventory_image = "rangedweapons_wooden_shuriken.png",
	RW_throw_capabilities = {
		throw_damage = {fleshy=2,knockback=5},
		throw_crit = 6,
		throw_critEffc = 2.0,
		throw_skill = {"throw_skill",35},
		throw_velocity = 25,
		throw_accuracy = 80,
		throw_cooldown = 0.35,
		throw_projectiles = 1,
		throw_gravity = 10,
		throw_sound = "rangedweapons_throw",
		throw_dps = 0,
		throw_mob_penetration = 0,
		throw_node_penetration = 0,
		throw_entity = "rangedweapons:shot_bullet",
		throw_visual = "wielditem",
		throw_texture = "rangedweapons:wooden_shuriken",
		throw_projectile_size = 0.15,
		throw_glass_breaking = 0,
		has_sparks = 0,
		ignites_explosives = 0,
		throw_door_breaking = 0,
OnCollision = function(player,bullet,target)
if math.random(1, 100) <= 10 then
minetest.add_item(bullet.object:get_pos(), "rangedweapons:wooden_shuriken") end end,
	},
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_yeet(itemstack, user)
return itemstack
	end,
})


minetest.register_craftitem("rangedweapons:stone_shuriken", {
		description = "" ..core.colorize("#35cdff","Stone shuriken\n") ..core.colorize("#FFFFFF", "Ranged damage: 4\n") ..core.colorize("#FFFFFF", "Accuracy: 75%\n") ..core.colorize("#FFFFFF", "knockback: 8\n") ..core.colorize("#FFFFFF", "Critical chance: 7%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2.1x\n") ..core.colorize("#FFFFFF", "Shuriken survival rate: 15%\n") ..core.colorize("#FFFFFF", "Projectile gravity: 15\n") ..core.colorize("#FFFFFF", "Throwing cooldown: 0.35\n") ..core.colorize("#FFFFFF", "Projectile velocity: 20"),
	range = 0,
	stack_max= 125,
	wield_scale = {x=0.6,y=0.6,z=0.5},
	inventory_image = "rangedweapons_stone_shuriken.png",
	RW_throw_capabilities = {
		throw_damage = {fleshy=4,knockback=8},
		throw_crit = 7,
		throw_critEffc = 2.1,
		throw_skill = {"throw_skill",30},
		throw_velocity = 20,
		throw_accuracy = 75,
		throw_cooldown = 0.5,
		throw_projectiles = 1,
		throw_gravity = 15,
		throw_sound = "rangedweapons_throw",
		throw_dps = 0,
		throw_mob_penetration = 0,
		throw_node_penetration = 0,
		throw_entity = "rangedweapons:shot_bullet",
		throw_visual = "wielditem",
		throw_texture = "rangedweapons:stone_shuriken",
		throw_projectile_size = 0.15,
		throw_glass_breaking = 1,
		has_sparks = 0,
		ignites_explosives = 0,
		throw_door_breaking = 0,
OnCollision = function(player,bullet,target)
if math.random(1, 100) <= 15 then
minetest.add_item(bullet.object:get_pos(), "rangedweapons:stone_shuriken") end end,
	},
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_yeet(itemstack, user)
return itemstack
	end,
})


minetest.register_craftitem("rangedweapons:steel_shuriken", {
		description = "" ..core.colorize("#35cdff","Steel shuriken\n") ..core.colorize("#FFFFFF", "Ranged damage: 6\n") ..core.colorize("#FFFFFF", "Accuracy: 85%\n") ..core.colorize("#FFFFFF", "knockback: 3\n") ..core.colorize("#FFFFFF", "Critical chance: 8%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2.2x\n") ..core.colorize("#FFFFFF", "Shuriken survival rate: 35%\n") ..core.colorize("#FFFFFF", "Projectile gravity: 8\n") ..core.colorize("#FFFFFF", "Throwing cooldown: 0.25\n") ..core.colorize("#FFFFFF", "Projectile velocity: 30"),
	range = 0,
	stack_max= 150,
	wield_scale = {x=0.6,y=0.6,z=0.5},
	inventory_image = "rangedweapons_steel_shuriken.png",
	RW_throw_capabilities = {
		throw_damage = {fleshy=6,knockback=3},
		throw_crit = 8,
		throw_critEffc = 2.2,
		throw_skill = {"throw_skill",40},
		throw_velocity = 30,
		throw_accuracy = 85,
		throw_cooldown = 0.25,
		throw_projectiles = 1,
		throw_gravity = 8,
		throw_sound = "rangedweapons_throw",
		throw_dps = 0,
		throw_mob_penetration = 0,
		throw_node_penetration = 0,
		throw_entity = "rangedweapons:shot_bullet",
		throw_visual = "wielditem",
		throw_texture = "rangedweapons:steel_shuriken",
		throw_projectile_size = 0.15,
		throw_glass_breaking = 0,
		has_sparks = 1,
		ignites_explosives = 0,
		throw_door_breaking = 0,
OnCollision = function(player,bullet,target)
if math.random(1, 100) <= 35 then
minetest.add_item(bullet.object:get_pos(), "rangedweapons:steel_shuriken") end end,
	},
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_yeet(itemstack, user)
return itemstack
	end,
})

minetest.register_craftitem("rangedweapons:bronze_shuriken", {
		description = "" ..core.colorize("#35cdff","Bronze shuriken\n") ..core.colorize("#FFFFFF", "Ranged damage: 6\n") ..core.colorize("#FFFFFF", "Accuracy: 85%\n") ..core.colorize("#FFFFFF", "knockback: 3\n") ..core.colorize("#FFFFFF", "Critical chance: 8%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2.2x\n") ..core.colorize("#FFFFFF", "Shuriken survival rate: 30%\n") ..core.colorize("#FFFFFF", "Projectile gravity: 8\n") ..core.colorize("#FFFFFF", "Throwing cooldown: 0.25\n") ..core.colorize("#FFFFFF", "Projectile velocity: 30"),
	range = 0,
	stack_max= 150,
	wield_scale = {x=0.6,y=0.6,z=0.5},
	inventory_image = "rangedweapons_bronze_shuriken.png",
	RW_throw_capabilities = {
		throw_damage = {fleshy=6,knockback=3},
		throw_crit = 8,
		throw_critEffc = 2.2,
		throw_skill = {"throw_skill",40},
		throw_velocity = 30,
		throw_accuracy = 85,
		throw_cooldown = 0.25,
		throw_projectiles = 1,
		throw_gravity = 8,
		throw_sound = "rangedweapons_throw",
		throw_dps = 0,
		throw_mob_penetration = 0,
		throw_node_penetration = 0,
		throw_entity = "rangedweapons:shot_bullet",
		throw_visual = "wielditem",
		throw_texture = "rangedweapons:bronze_shuriken",
		throw_projectile_size = 0.15,
		throw_glass_breaking = 0,
		has_sparks = 1,
		ignites_explosives = 0,
		throw_door_breaking = 0,
OnCollision = function(player,bullet,target)
if math.random(1, 100) <= 30 then
minetest.add_item(bullet.object:get_pos(), "rangedweapons:bronze_shuriken") end end,
	},
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_yeet(itemstack, user)
return itemstack
	end,
})

minetest.register_craftitem("rangedweapons:golden_shuriken", {
		description = "" ..core.colorize("#35cdff","Golden shuriken\n") ..core.colorize("#FFFFFF", "Ranged damage: 8\n") ..core.colorize("#FFFFFF", "Accuracy: 75%\n") ..core.colorize("#FFFFFF", "knockback: 10\n") ..core.colorize("#FFFFFF", "Critical chance: 12%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2.5x\n") ..core.colorize("#FFFFFF", "Shuriken survival rate: 25%\n") ..core.colorize("#FFFFFF", "Projectile gravity: 15\n") ..core.colorize("#FFFFFF", "Throwing cooldown: 0.4\n") ..core.colorize("#FFFFFF", "Projectile velocity: 25"),
	range = 0,
	stack_max= 175,
	wield_scale = {x=0.6,y=0.6,z=0.5},
	inventory_image = "rangedweapons_golden_shuriken.png",
	RW_throw_capabilities = {
		throw_damage = {fleshy=8,knockback=10},
		throw_crit = 12,
		throw_critEffc = 2.5,
		throw_skill = {"throw_skill",35},
		throw_velocity = 25,
		throw_accuracy = 75,
		throw_cooldown = 0.4,
		throw_projectiles = 1,
		throw_gravity = 15,
		throw_sound = "rangedweapons_throw",
		throw_dps = 0,
		throw_mob_penetration = 0,
		throw_node_penetration = 0,
		throw_entity = "rangedweapons:shot_bullet",
		throw_visual = "wielditem",
		throw_texture = "rangedweapons:golden_shuriken",
		throw_projectile_size = 0.15,
		throw_glass_breaking = 1,
		has_sparks = 1,
		ignites_explosives = 0,
		throw_door_breaking = 0,
OnCollision = function(player,bullet,target)
if math.random(1, 100) <= 25 then
minetest.add_item(bullet.object:get_pos(), "rangedweapons:golden_shuriken") end end,
	},
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_yeet(itemstack, user)
return itemstack
	end,
})

minetest.register_craftitem("rangedweapons:mese_shuriken", {
		description = "" ..core.colorize("#35cdff","MESE shuriken\n") ..core.colorize("#FFFFFF", "Ranged damage: 7\n") ..core.colorize("#FFFFFF", "Accuracy: 90%\n") ..core.colorize("#FFFFFF", "knockback: 2\n") ..core.colorize("#FFFFFF", "Critical chance: 9%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2.3x\n") ..core.colorize("#FFFFFF", "Shuriken survival rate: 50%\n") ..core.colorize("#FFFFFF", "Projectile gravity: 5\n") ..core.colorize("#FFFFFF", "Throwing cooldown: 0.2\n") ..core.colorize("#FFFFFF", "Enemy penetration: 25%\n")  ..core.colorize("#FFFFFF", "Projectile velocity: 35"),
	range = 0,
	stack_max= 175,
	wield_scale = {x=0.6,y=0.6,z=0.5},
	inventory_image = "rangedweapons_mese_shuriken.png",
	RW_throw_capabilities = {
		throw_damage = {fleshy=7,knockback=2},
		throw_crit = 9,
		throw_critEffc = 2.3,
		throw_skill = {"throw_skill",45},
		throw_velocity = 35,
		throw_accuracy = 90,
		throw_cooldown = 0.2,
		throw_projectiles = 1,
		throw_gravity = 5,
		throw_sound = "rangedweapons_throw",
		throw_dps = 0,
		throw_mob_penetration = 25,
		throw_node_penetration = 0,
		throw_entity = "rangedweapons:shot_bullet",
		throw_visual = "wielditem",
		throw_texture = "rangedweapons:mese_shuriken",
		throw_projectile_size = 0.15,
		throw_glass_breaking = 1,
		has_sparks = 1,
		ignites_explosives = 0,
		throw_door_breaking = 0,
OnCollision = function(player,bullet,target)
if math.random(1, 100) <= 50 then
minetest.add_item(bullet.object:get_pos(), "rangedweapons:mese_shuriken") end end,
	},
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_yeet(itemstack, user)
return itemstack
	end,
})

minetest.register_craftitem("rangedweapons:diamond_shuriken", {
		description = "" ..core.colorize("#35cdff","Diamond shuriken\n") ..core.colorize("#FFFFFF", "Ranged damage: 8\n") ..core.colorize("#FFFFFF", "Accuracy: 95%\n") ..core.colorize("#FFFFFF", "knockback: 2\n") ..core.colorize("#FFFFFF", "Critical chance: 10%\n") ..core.colorize("#FFFFFF", "Critical efficiency: 2.4x\n") ..core.colorize("#FFFFFF", "Shuriken survival rate: 60%\n") ..core.colorize("#FFFFFF", "Projectile gravity: 5\n") ..core.colorize("#FFFFFF", "Throwing cooldown: 0.15\n") ..core.colorize("#FFFFFF", "Enemy penetration: 33%\n")  ..core.colorize("#FFFFFF", "Projectile velocity: 40"),
	range = 0,
	stack_max= 200,
	wield_scale = {x=0.6,y=0.6,z=0.5},
	inventory_image = "rangedweapons_diamond_shuriken.png",
	RW_throw_capabilities = {
		throw_damage = {fleshy=8,knockback=2},
		throw_crit = 10,
		throw_critEffc = 2.4,
		throw_skill = {"throw_skill",50},
		throw_velocity = 40,
		throw_accuracy = 95,
		throw_cooldown = 0.15,
		throw_projectiles = 1,
		throw_gravity = 5,
		throw_sound = "rangedweapons_throw",
		throw_dps = 0,
		throw_mob_penetration = 33,
		throw_node_penetration = 0,
		throw_entity = "rangedweapons:shot_bullet",
		throw_visual = "wielditem",
		throw_texture = "rangedweapons:diamond_shuriken",
		throw_projectile_size = 0.15,
		throw_glass_breaking = 1,
		has_sparks = 1,
		ignites_explosives = 0,
		throw_door_breaking = 0,
OnCollision = function(player,bullet,target)
if math.random(1, 100) <= 60 then
minetest.add_item(bullet.object:get_pos(), "rangedweapons:diamond_shuriken") end end,
	},
	on_use = function(itemstack, user, pointed_thing)
rangedweapons_yeet(itemstack, user)
return itemstack
	end,
})