forbidden_ents = {
"",
}


minetest.register_alias("rangedweapons:726mm", "rangedweapons:762mm")

bullet_particles = bullet_particles or "rangedweapons_bullet_fly.png"


minetest.register_craftitem("rangedweapons:shot_bullet_visual", {
	wield_scale = {x=1.0,y=1.0,z=1.0},
	inventory_image = "rangedweapons_bulletshot.png",
})


local rangedweapons_shot_bullet = {
	timer = 0,
initial_properties = {
	physical = true,
	hp_max = 420,
	glow = 100,
	visual = "wielditem",
	visual_size = {x=0.75, y=0.75},
	textures = {"rangedweapons:shot_bullet_visual"},
	lastpos = {},
        collide_with_objects = false,
	collisionbox = {-0.0025, -0.0025, -0.0025, 0.0025, 0.0025, 0.0025},
},
}
rangedweapons_shot_bullet.on_step = function(self, dtime, moveresult)
----------------------------------------
---------------------------------------

if self.owner == nil then
self.object:remove()
end

local sparks = self.sparks or 0
local ignite = self.ignite or 0
local size = self.size or 0.0025

local SBP = self.bullet_particles
if SBP ~= nil then
for i=1,math.random(SBP.amount[1],SBP.amount[2]) do
	minetest.add_particle({
		pos = {x=self.object:get_pos().x+(math.random(-SBP.pos_randomness,SBP.pos_randomness)/100),y=self.object:get_pos().y+(math.random(-SBP.pos_randomness,SBP.pos_randomness)/100),z=self.object:get_pos().z+(math.random(-SBP.pos_randomness,SBP.pos_randomness)/100)},
		velocity = {x=math.random(-SBP.velocity.x,SBP.velocity.x), y=math.random(-SBP.velocity.y,SBP.velocity.y), z=math.random(-SBP.velocity.z,SBP.velocity.z)},
		acceleration = {x=math.random(-SBP.acceleration.x,SBP.acceleration.x), y=math.random(-SBP.acceleration.y,SBP.acceleration.y)-SBP.gravity, z=math.random(-SBP.acceleration.z,SBP.acceleration.z)},
		expirationtime = SBP.lifetime,
		size = math.random(SBP.minsize,SBP.maxsize)/10,
		collisiondetection = SBP.collisiondetection,
		vertical = false,
		texture = SBP.texture,
          animation = {type="vertical_frames", aspect_w=8, aspect_h=8, length = SBP.lifetime+0.1,},
		glow = SBP.glow,
	})
end end


self.timer = self.timer + dtime

if self.timer > 0.06 then
self.object:set_properties({collide_with_objects = true})
self.object:set_properties({collisionbox = {-size, -size, -size, size, size, size}})
end

if self.timer > 10 then
self.object:remove()
end

if moveresult.collides == true then
if moveresult.collisions[1] ~= nil then

local mobPen = self.mobPen or 0
local nodePen = self.nodePen or 0
local door_break = self.door_break or 0
local glass_break = self.glass_break or 0

if moveresult.collisions[1].type == "node" then

minetest.check_for_falling(moveresult.collisions[1].node_pos)


if minetest.registered_nodes[minetest.get_node(moveresult.collisions[1].node_pos).name]  and
minetest.registered_nodes[minetest.get_node(moveresult.collisions[1].node_pos).name].tiles and
minetest.registered_nodes[minetest.get_node(moveresult.collisions[1].node_pos).name].tiles[1]
then

local hit_texture = minetest.registered_nodes[minetest.get_node(moveresult.collisions[1].node_pos).name].tiles[1]

if hit_texture.name ~= nil then
hit_texture = hit_texture.name
end

	minetest.add_particle({
		pos = self.object:get_pos(),
		velocity = {x=0, y=0, z=0},
          	acceleration = {x=0, y=0, z=0},
		expirationtime = 30,
		size = math.random(10,20)/10,
		collisiondetection = false,
		vertical = false,
		texture = "rangedweapons_bullethole.png",
		glow = 0,
	})

	for i=1,math.random(4,8) do
	minetest.add_particle({
		pos = self.object:get_pos(),
		velocity = {x=math.random(-3.0,3.0), y=math.random(2.0,5.0), z=math.random(-3.0,3.0)},
          	acceleration = {x=math.random(-3.0,3.0), y=math.random(-10.0,-15.0), z=math.random(-3.0,3.0)},
		expirationtime = 0.5,
		size = math.random(10,20)/10,
		collisiondetection = true,
		vertical = false,
		texture = ""..hit_texture.."^[resize:4x4".."",
		glow = 0,
	})
	end

end 


minetest.sound_play("default_dig_cracky", {self.object:get_pos(), gain = 1.0})

if ignite > 0 then

if minetest.get_node(moveresult.collisions[1].node_pos).name == "rangedweapons:barrel" then
minetest.swap_node(moveresult.collisions[1].node_pos, {name = "air"})
tnt.boom(moveresult.collisions[1].node_pos, {radius = 3})
end 

if minetest.get_node(moveresult.collisions[1].node_pos).name == "tnt:tnt" then
minetest.swap_node(moveresult.collisions[1].node_pos, {name = "tnt:tnt_burning"})
	minetest.sound_play("tnt_ignite", {moveresult.collisions[1].node_pos}, true)
	minetest.get_node_timer(moveresult.collisions[1].node_pos):start(3)
	minetest.check_for_falling(moveresult.collisions[1].node_pos)
end

end


if rweapons_door_breaking == "true" and door_break > 0 then
if string.find(minetest.get_node(moveresult.collisions[1].node_pos).name,"door_wood") then

minetest.swap_node(moveresult.collisions[1].node_pos, {name = "air"})
minetest.add_item(moveresult.collisions[1].node_pos, "default:wood 5")
minetest.sound_play("rangedweapons_woodbreak",{moveresult.collisions[1].node_pos})

end end

if rweapons_glass_breaking == "true" and glass_break > 0 then
	
local nodeName = minetest.get_node(moveresult.collisions[1].node_pos).name

	if nodeName == "default:glass" then
	minetest.swap_node(moveresult.collisions[1].node_pos, {name = "rangedweapons:broken_glass"})
minetest.sound_play("glass_break",{moveresult.collisions[1].node_pos})
	end
	if   nodeName == "xpanes:pane" or
		nodeName == "xpanes:pane_flat" then
minetest.swap_node(moveresult.collisions[1].node_pos, {name = "air"})
minetest.add_item(moveresult.collisions[1].node_pos, "rangedweapons:glass_shards")
minetest.sound_play("glass_break",{moveresult.collisions[1].node_pos})
	end
if string.find(nodeName,"door_glass") then
minetest.swap_node(moveresult.collisions[1].node_pos, {name = "air"})
minetest.add_item(moveresult.collisions[1].node_pos, "vessels:glass_fragments 5")
minetest.sound_play("glass_break",{moveresult.collisions[1].node_pos})
	end
end


if minetest.get_item_group(minetest.get_node(moveresult.collisions[1].node_pos).name, "level") > 1  then
self.object:set_velocity(moveresult.collisions[1].old_velocity)

if sparks > 0 then
make_sparks(self.object:get_pos())
end

local objVel = moveresult.collisions[1].old_velocity
local objRot = self.object:get_rotation()

if objRot and objVel then
if moveresult.collisions[1].axis == "x" then
self.object:set_rotation({x=0,y=objRot.y,z=objRot.z+3})
self.object:set_velocity({x=objVel.x*-1,y=objVel.y,z=objVel.z})
end

if moveresult.collisions[1].axis == "z" then
self.object:set_rotation({x=0,y=objRot.y,z=objRot.z+3})
self.object:set_velocity({x=objVel.x,y=objVel.y,z=objVel.z*-1})
end

if moveresult.collisions[1].axis == "y" then
self.object:set_rotation({x=0,y=objRot.y+3,z=objRot.z+3})
self.object:set_velocity({x=objVel.x,y=objVel.y*-1,z=objVel.z})
end end


else

if math.random(1,100) <= nodePen then
	for i=1,10 do
	minetest.add_particle({
		pos = self.object:get_pos(),
		velocity = {x=1.5, y=1.5, z=1.5} ,
          	acceleration = {x=math.random(-3.0,3.0), y=math.random(-4.0,4.0), z=math.random(-3.0,3.0)},
		expirationtime = 1.25,
		size = math.random(3,6),
		collisiondetection = false,
		vertical = false,
		texture = "tnt_smoke.png",
		glow = 2,
	})
	end
minetest.sound_play("default_dig_cracky", {self.object:get_pos(), gain = 1.0})
self.object:set_properties({collisionbox = {0,0,0,0,0,0}})
--minetest.chat_send_all("hit")
self.object:set_velocity(moveresult.collisions[1].old_velocity)
else

if minetest.get_item_group(minetest.get_node(moveresult.collisions[1].node_pos).name, "leaves") > 0  then

minetest.sound_play("default_dig_snappy", {self.object:get_pos(), gain = 1.5})

for i = 1,math.random(3,6) do
	minetest.add_particle({
		pos = self.object:get_pos(),
		velocity = {x=math.random(-2,2), y=math.random(3,6), z=math.random(-2,2)},
          acceleration = {x=math.random(-2,2), y=math.random(-3,-6), z=math.random(-2,2)},
		expirationtime = math.random(2,4), 
		size = math.random(6,9), 
		collisiondetection = true,
		collision_removal = false,
		vertical = false,
		texture = "rangedweapons_leaf.png",
          animation = {type="vertical_frames", aspect_w=8, aspect_h=8, length = 0.8,},
		glow = 15,
	})
end

self.object:set_properties({collisionbox = {0,0,0,0,0,0}})
self.object:set_velocity(moveresult.collisions[1].old_velocity)

else
if self.OnCollision ~= nil then
self.OnCollision(self.owner,self,moveresult.collisions[1])
end
self.object:remove()
end
end
end

end

if moveresult.collisions[1].type == "object" then


local actualDamage = self.damage or {fleshy=1}
local damage = {}
local crit = self.crit or 0
local critEffc = self.critEffc or 1
local owner = minetest.get_player_by_name(self.owner)
local hit_texture = "rangedweapons_hit.png"
local dps = self.dps or 0
local skill = self.skill_value or 1

for _, dmg in pairs(actualDamage) do
damage[_] = actualDamage[_]
end

if moveresult.collisions[1].object:is_player() then
for _, player_dmg in pairs(damage) do
damage[_] = damage[_] * rweapons_player_dmg_multiplier
end
if self.object:get_pos().y - moveresult.collisions[1].object:get_pos().y > 1.5 then
for _, hs_dmg in pairs(damage) do
damage[_] = damage[_] * rweapons_headshot_dmg_multiplier
end
end 
knockback = damage.knockback or 0
projectile_kb(moveresult.collisions[1].object,self.object,knockback)
else
for _, mob_dmg in pairs(damage) do
damage[_] = damage[_] * rweapons_mob_dmg_multiplier
end
end

for _, bonus_dmg in pairs(damage) do
damage[_] = (damage[_]*skill) + (self.dps*self.timer)
end

--minetest.chat_send_all(critEffc)
if math.random(1,100) <= crit+((skill*10)-10) then
for _, critDmg in pairs(damage) do
damage[_] = damage[_] * critEffc
end


entpos = self.object:get_pos()
minetest.add_particle	({
pos = entpos, velocity = 0, acceleration = {x=0, y=5, z=0},
expirationtime = 0.75, size = 12, collisiondetection = false,
vertical = false, texture = "rangedweapons_crit.png", glow = 30,})
hit_texture = "rangedweapons_crithit.png"
end

moveresult.collisions[1].object:punch(owner, 1.0, {
		full_punch_interval = 1.0,
		damage_groups = damage,}, nil)
owner:hud_change(hit, "text", hit_texture)

	for i=1,math.random(math.ceil(rweapons_bloodyness*0.66),math.ceil(rweapons_bloodyness*1.5)) do
	minetest.add_particle({
		pos = self.object:get_pos(),
		velocity = {x=math.random(-15.0,15.0)/10, y=math.random(2.0,5.0), z=math.random(-15.0,15.0)/10},
          	acceleration = {x=math.random(-3.0,3.0), y=math.random(-10.0,-15.0), z=math.random(-3.0,3.0)},
		expirationtime = 0.75,
		size = math.random(10,20)/10,
		collisiondetection = true,
		vertical = false,
		texture = "rangedweapons_blood.png",
          animation = {type="vertical_frames", aspect_w=8, aspect_h=8, length = 0.8,},
		glow = 0,
	})
	end


if math.random(1,100) <= mobPen then
	for i=1,10 do
	minetest.add_particle({
		pos = self.object:get_pos(),
		velocity = {x=1.5, y=1.5, z=1.5} ,
          	acceleration = {x=math.random(-3.0,3.0), y=math.random(-4.0,4.0), z=math.random(-3.0,3.0)},
		expirationtime = 1.25,
		size = math.random(3,6),
		collisiondetection = false,
		vertical = false,
		texture = "tnt_smoke.png",
		glow = 2,
	})
	end
minetest.sound_play("default_dig_cracky", {self.object:get_pos(), gain = 1.0})
self.object:set_properties({collisionbox = {0,0,0,0,0,0}})
self.object:set_velocity(moveresult.collisions[1].old_velocity)
else
if self.OnCollision ~= nil then
self.OnCollision(self.owner,self,moveresult.collisions[1])
end
self.object:remove()
end
end


else

self.object:remove()

end
end

end

minetest.register_entity("rangedweapons:shot_bullet", rangedweapons_shot_bullet) 



---
--- actual mags
---

---
--- visual drop mags
---

minetest.register_craftitem("rangedweapons:drum_mag", {
	wield_scale = {x=1.0,y=1.0,z=1.5},
	inventory_image = "rangedweapons_drum_mag.png",
})

minetest.register_craftitem("rangedweapons:handgun_mag_black", {
	wield_scale = {x=0.6,y=0.6,z=0.8},
	inventory_image = "rangedweapons_magazine_handgun.png",
})
local rangedweapons_mag = {
	physical = false,
	timer = 0,
	visual = "wielditem",
	visual_size = {x=0.3, y=0.3},
	textures = {"rangedweapons:handgun_mag_black"},
	lastpos= {},
	collisionbox = {0, 0, 0, 0, 0, 0},
}
rangedweapons_mag.on_step = function(self, dtime, pos)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = minetest.get_node(pos)
	if self.lastpos.y ~= nil then
		if minetest.registered_nodes[node.name] ~= nil then
		if minetest.registered_nodes[node.name].walkable then
	local vel = self.object:get_velocity()
	local acc = self.object:get_acceleration()
	self.object:set_velocity({x=0, y=0, z=0})
	self.object:set_acceleration({x=0, y=0, z=0})
			end end
	end
	if self.timer > 2.0 then
		self.object:remove()

	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

minetest.register_entity("rangedweapons:mag", rangedweapons_mag)

minetest.register_craftitem("rangedweapons:handgun_mag_white", {
	wield_scale = {x=0.6,y=0.6,z=0.8},
	inventory_image = "rangedweapons_handgun_mag_white.png",
})

minetest.register_craftitem("rangedweapons:machinepistol_mag", {
	wield_scale = {x=0.6,y=0.6,z=0.8},
	inventory_image = "rangedweapons_machinepistol_mag.png",
})

minetest.register_craftitem("rangedweapons:assaultrifle_mag", {
	wield_scale = {x=0.6,y=0.6,z=0.8},
	inventory_image = "rangedweapons_assaultrifle_mag.png",
})

minetest.register_craftitem("rangedweapons:rifle_mag", {
	wield_scale = {x=0.6,y=0.6,z=0.8},
	inventory_image = "rangedweapons_rifle_mag.png",
})

minetest.register_craftitem("rangedweapons:9mm", {
	stack_max= 500,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff","9x19mm Parabellum\n")..core.colorize("#FFFFFF", "Bullet damage: 1 \n") ..core.colorize("#FFFFFF", "Bullet crit efficiency: 0.25 \n") ..core.colorize("#FFFFFF", "Bullet crit chance: 1% \n") ..core.colorize("#FFFFFF", "Bullet velocity: 25 \n") ..core.colorize("#FFFFFF", "Bullet knockback: 1 \n")   ..core.colorize("#FFFFFF", "Ammunition for some guns"),
	inventory_image = "rangedweapons_9mm.png",
	RW_ammo_capabilities = {
		ammo_damage = {fleshy=1,knockback=1},
		ammo_critEffc = 0.25,
		ammo_crit = 1,
		ammo_velocity = 25,
		ammo_glass_breaking = 1,
		ammo_entity = "rangedweapons:shot_bullet",
		ammo_visual = "wielditem",
		ammo_texture = "rangedweapons:shot_bullet_visual",
		shell_entity = "rangedweapons:empty_shell",
		shell_visual = "wielditem",
		shell_texture = "rangedweapons:shelldrop",
		ammo_projectile_size = 0.0025,
		has_sparks = 1,
		ignites_explosives = 1,
	}
})
minetest.register_craftitem("rangedweapons:45acp", {
	stack_max= 450,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff",".45ACP catridge\n")..core.colorize("#FFFFFF", "Bullet damage: 2 \n") ..core.colorize("#FFFFFF", "Bullet crit efficiency: 0.50 \n") ..core.colorize("#FFFFFF", "Bullet crit chance: 2% \n")
..core.colorize("#FFFFFF", "Bullet velocity: 20 \n") 
..core.colorize("#FFFFFF", "Bullet knockback: 2 \n") ..core.colorize("#FFFFFF", "Ammunition for some guns"),
	inventory_image = "rangedweapons_45acp.png",
	RW_ammo_capabilities = {
		ammo_damage = {fleshy=2,knockback=1},
		ammo_critEffc = 0.50,
		ammo_crit = 1,
		ammo_velocity = 20,
		ammo_glass_breaking = 1,
		ammo_entity = "rangedweapons:shot_bullet",
		ammo_visual = "wielditem",
		ammo_texture = "rangedweapons:shot_bullet_visual",
		shell_entity = "rangedweapons:empty_shell",
		shell_visual = "wielditem",
		shell_texture = "rangedweapons:shelldrop",
		ammo_projectile_size = 0.0025,
		has_sparks = 1,
		ignites_explosives = 1,
	},
})
minetest.register_craftitem("rangedweapons:10mm", {
	stack_max= 400,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff","10mm Auto\n")..core.colorize("#FFFFFF", "Bullet damage: 2 \n") ..core.colorize("#FFFFFF", "Bullet crit efficiency:0.30 \n") ..core.colorize("#FFFFFF", "Bullet velocity: 25 \n") 
..core.colorize("#FFFFFF", "Bullet knockback: 1 \n")  ..core.colorize("#FFFFFF", "Bullet crit chance: 1% \n") ..core.colorize("#FFFFFF", "Ammunition for some guns"),
	inventory_image = "rangedweapons_10mm.png",
	RW_ammo_capabilities = {
		ammo_damage = {fleshy=2,knockback=1},
		ammo_critEffc = 0.3,
		ammo_crit = 1,
		ammo_velocity = 25,
		ammo_glass_breaking = 1,
		ammo_entity = "rangedweapons:shot_bullet",
		ammo_visual = "wielditem",
		ammo_texture = "rangedweapons:shot_bullet_visual",
		shell_entity = "rangedweapons:empty_shell",
		shell_visual = "wielditem",
		shell_texture = "rangedweapons:shell_whitedrop",
		ammo_projectile_size = 0.0025,
		has_sparks = 1,
		ignites_explosives = 1,
	}
})


minetest.register_craftitem("rangedweapons:357", {
	stack_max= 150,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff",".357 magnum round\n")..core.colorize("#FFFFFF", "Bullet damage: 4 \n") ..core.colorize("#FFFFFF", "Bullet crit efficiency: 0.6 \n") ..core.colorize("#FFFFFF", "Bullet crit chance: 3% \n") ..core.colorize("#FFFFFF", "Bullet knockback: 5 \n") ..core.colorize("#FFFFFF", "Bullet enemy Penetration: 5%\n") ..core.colorize("#FFFFFF", "Bullet velocity: 45 \n")    ..core.colorize("#FFFFFF", "Ammunition for some guns"),
	inventory_image = "rangedweapons_357.png",
	RW_ammo_capabilities = {
		ammo_damage = {fleshy=4,knockback=5},
		ammo_critEffc = 0.6,
		ammo_crit = 3,
		ammo_velocity = 45,
		ammo_glass_breaking = 1,
		ammo_mob_penetration = 5,
		ammo_entity = "rangedweapons:shot_bullet",
		ammo_visual = "wielditem",
		ammo_texture = "rangedweapons:shot_bullet_visual",
		shell_entity = "rangedweapons:empty_shell",
		shell_visual = "wielditem",
		shell_texture = "rangedweapons:shelldrop",
		ammo_projectile_size = 0.0025,
		has_sparks = 1,
		ignites_explosives = 1,
	}
})

minetest.register_craftitem("rangedweapons:50ae", {
	stack_max= 100,
	wield_scale = {x=0.6,y=0.6,z=1.5},
		description = "" ..core.colorize("#35cdff",".50AE catridge\n")..core.colorize("#FFFFFF", "Bullet damage: 8 \n") ..core.colorize("#FFFFFF", "Bullet crit efficiency: 0.9 \n") ..core.colorize("#FFFFFF", "Bullet crit chance: 6% \n") ..core.colorize("#FFFFFF", "Bullet knockback: 10 \n") ..core.colorize("#FFFFFF", "Bullet enemy Penetration: 15%\n") ..core.colorize("#FFFFFF", "Bullet velocity: 55 \n")    ..core.colorize("#FFFFFF", "Ammunition for some guns"),
	inventory_image = "rangedweapons_50ae.png",
	RW_ammo_capabilities = {
		ammo_damage = {fleshy=8,knockback=10},
		ammo_critEffc = 0.9,
		ammo_crit = 6,
		ammo_velocity = 55,
		ammo_glass_breaking = 1,
		ammo_mob_penetration = 15,
		ammo_entity = "rangedweapons:shot_bullet",
		ammo_visual = "wielditem",
		ammo_texture = "rangedweapons:shot_bullet_visual",
		shell_entity = "rangedweapons:empty_shell",
		shell_visual = "wielditem",
		shell_texture = "rangedweapons:shelldrop",
		ammo_projectile_size = 0.0025,
		has_sparks = 1,
		ignites_explosives = 1,
	}
})

minetest.register_craftitem("rangedweapons:44", {
	stack_max= 150,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff",".44 magnum round\n")..core.colorize("#FFFFFF", "Bullet damage: 4 \n") ..core.colorize("#FFFFFF", "Bullet crit efficiency: 0.7 \n") ..core.colorize("#FFFFFF", "Bullet crit chance: 4% \n") ..core.colorize("#FFFFFF", "Bullet knockback: 6 \n") ..core.colorize("#FFFFFF", "Bullet enemy Penetration: 6%\n") ..core.colorize("#FFFFFF", "Bullet velocity: 50 \n")  ..core.colorize("#FFFFFF", "Ammunition for some guns"),
	inventory_image = "rangedweapons_44.png",
	RW_ammo_capabilities = {
		ammo_damage = {fleshy=4,knockback=6},
		ammo_critEffc = 0.7,
		ammo_crit = 4,
		ammo_velocity = 50,
		ammo_glass_breaking = 1,
		ammo_mob_penetration = 6,
		ammo_entity = "rangedweapons:shot_bullet",
		ammo_visual = "wielditem",
		ammo_texture = "rangedweapons:shot_bullet_visual",
		shell_entity = "rangedweapons:empty_shell",
		shell_visual = "wielditem",
		shell_texture = "rangedweapons:shelldrop",
		ammo_projectile_size = 0.0025,
		has_sparks = 1,
		ignites_explosives = 1,
	}
})
minetest.register_craftitem("rangedweapons:762mm", {
	stack_max= 250,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff","7.62mm round\n")..core.colorize("#FFFFFF", "Bullet damage: 4 \n") ..core.colorize("#FFFFFF", "Bullet crit efficiency: 0.5 \n") ..core.colorize("#FFFFFF", "Bullet crit chance: 2% \n") ..core.colorize("#FFFFFF", "Bullet velocity: 40 \n") ..core.colorize("#FFFFFF", "Bullet knockback: 4 \n") ..core.colorize("#FFFFFF", "Bullet enemy Penetration: 5%\n")   ..core.colorize("#FFFFFF", "Ammunition for some guns"),
	inventory_image = "rangedweapons_762mm.png",
	RW_ammo_capabilities = {
		ammo_damage = {fleshy=4,knockback=4},
		ammo_critEffc = 0.5,
		ammo_crit = 2,
		ammo_velocity = 40,
		ammo_glass_breaking = 1,
		ammo_entity = "rangedweapons:shot_bullet",
		ammo_visual = "wielditem",
		ammo_texture = "rangedweapons:shot_bullet_visual",
		shell_entity = "rangedweapons:empty_shell",
		shell_visual = "wielditem",
		shell_texture = "rangedweapons:shelldrop",
		ammo_mob_penetration = 5,
		ammo_projectile_size = 0.0025,
		has_sparks = 1,
		ignites_explosives = 1,
	},
})
minetest.register_craftitem("rangedweapons:556mm", {
	stack_max= 300,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff","5.56mm round\n")..core.colorize("#FFFFFF", "Bullet damage: 3 \n") ..core.colorize("#FFFFFF", "Bullet crit efficiency: 0.4 \n") ..core.colorize("#FFFFFF", "Bullet crit chance: 2% \n") ..core.colorize("#FFFFFF", "Bullet velocity: 35 \n") ..core.colorize("#FFFFFF", "Bullet knockback: 3 \n")    ..core.colorize("#FFFFFF", "Ammunition for some guns"),
	inventory_image = "rangedweapons_556mm.png",
	RW_ammo_capabilities = {
		ammo_damage = {fleshy=3,knockback=3},
		ammo_critEffc = 0.4,
		ammo_crit = 2,
		ammo_velocity = 35,
		ammo_glass_breaking = 1,
		ammo_entity = "rangedweapons:shot_bullet",
		ammo_visual = "wielditem",
		ammo_texture = "rangedweapons:shot_bullet_visual",
		shell_entity = "rangedweapons:empty_shell",
		shell_visual = "wielditem",
		shell_texture = "rangedweapons:shelldrop",
		ammo_projectile_size = 0.0025,
		has_sparks = 1,
		ignites_explosives = 1,
	},
})
minetest.register_craftitem("rangedweapons:shell", {
	stack_max= 50,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff","12 Gauge shell\n")..core.colorize("#FFFFFF", "Bullet damage: 2 \n") ..core.colorize("#FFFFFF", "Bullet crit efficiency: 0.15 \n") ..core.colorize("#FFFFFF", "Bullet crit chance: 1% \n") ..core.colorize("#FFFFFF", "Bullet velocity: 20 \n") ..core.colorize("#FFFFFF", "Bullet knockback: 4 \n") ..core.colorize("#FFFFFF", "Bullet gravity: 5 \n")  ..core.colorize("#FFFFFF", "Bullet projectile multiplier: 1.5x\n")   ..core.colorize("#FFFFFF", "Ammunition for some guns"),
	inventory_image = "rangedweapons_shell.png",
	RW_ammo_capabilities = {
		ammo_damage = {fleshy=2,knockback=4},
		ammo_projectile_multiplier = 1.5,
		ammo_critEffc = 0.15,
		ammo_crit = 1,
		ammo_velocity = 20,
		ammo_glass_breaking = 1,
		ammo_entity = "rangedweapons:shot_bullet",
		ammo_visual = "sprite",
		ammo_texture = "rangedweapons_buckball.png",
		shell_entity = "rangedweapons:empty_shell",
		shell_visual = "wielditem",
		shell_texture = "rangedweapons:shell_shotgundrop",
		ammo_gravity = 5,
		ammo_projectile_size = 0.00175,
		ammo_projectile_glow = 0,
		has_sparks = 1,
		ignites_explosives = 1,
	},
})
minetest.register_craftitem("rangedweapons:308winchester", {
	stack_max= 75,
	wield_scale = {x=0.4,y=0.4,z=1.2},
		description = "" ..core.colorize("#35cdff",".308 winchester round\n")..core.colorize("#FFFFFF", "Bullet damage: 8 \n") ..core.colorize("#FFFFFF", "Bullet crit efficiency: 0.75 \n") ..core.colorize("#FFFFFF", "Bullet crit chance: 4% \n") ..core.colorize("#FFFFFF", "Bullet velocity: 60 \n") ..core.colorize("#FFFFFF", "Bullet knockback: 10 \n") ..core.colorize("#FFFFFF", "Damage gain over 1 sec of flight time: 40 \n") ..core.colorize("#FFFFFF", "Bullet enemy Penetration: 20%\n") ..core.colorize("#FFFFFF", "Bullet node Penetration: 10%\n")      ..core.colorize("#FFFFFF", "Ammunition for some guns"),
	inventory_image = "rangedweapons_308winchester.png",
	RW_ammo_capabilities = {
		ammo_damage = {fleshy=8,knockback=10},
		ammo_critEffc = 0.75,
		ammo_crit = 2,
		ammo_velocity = 60,
		ammo_glass_breaking = 1,
		ammo_entity = "rangedweapons:shot_bullet",
		ammo_visual = "wielditem",
		ammo_texture = "rangedweapons:shot_bullet_visual",
		shell_entity = "rangedweapons:empty_shell",
		shell_visual = "wielditem",
		shell_texture = "rangedweapons:shelldrop",
		ammo_mob_penetration = 20,
		ammo_node_penetration = 10,
		ammo_projectile_size = 0.0025,
		ammo_dps = 40,
		has_sparks = 1,
		ignites_explosives = 1,
	},
})

minetest.register_craftitem("rangedweapons:408cheytac", {
	stack_max= 40,
	wield_scale = {x=0.65,y=0.65,z=1.5},
		description = "" ..core.colorize("#35cdff",".408 chey tac\n")..core.colorize("#FFFFFF", "Bullet damage: 10 \n") ..core.colorize("#FFFFFF", "Bullet crit efficiency: 0.8 \n") ..core.colorize("#FFFFFF", "Bullet crit chance: 5% \n") ..core.colorize("#FFFFFF", "Bullet velocity: 70 \n") ..core.colorize("#FFFFFF", "Bullet knockback: 15 \n") ..core.colorize("#FFFFFF", "Damage gain over 1 sec of flight time: 80 \n") ..core.colorize("#FFFFFF", "Bullet enemy Penetration: 45%\n") ..core.colorize("#FFFFFF", "Bullet node Penetration: 20%\n")      ..core.colorize("#FFFFFF", "Ammunition for some guns"),
	inventory_image = "rangedweapons_408cheytac.png",
	RW_ammo_capabilities = {
		ammo_damage = {fleshy=10,knockback=15},
		ammo_critEffc = 0.8,
		ammo_crit = 5,
		ammo_velocity = 70,
		ammo_glass_breaking = 1,
		ammo_entity = "rangedweapons:shot_bullet",
		ammo_visual = "wielditem",
		ammo_texture = "rangedweapons:shot_bullet_visual",
		shell_entity = "rangedweapons:empty_shell",
		shell_visual = "wielditem",
		shell_texture = "rangedweapons:shelldrop",
		ammo_mob_penetration = 45,
		ammo_node_penetration = 20,
		ammo_projectile_size = 0.0025,
		ammo_dps = 80,
		has_sparks = 1,
		ignites_explosives = 1,
	},
})

minetest.register_craftitem("rangedweapons:40mm", {
	stack_max= 25,
	wield_scale = {x=0.8,y=0.8,z=2.4},
		description = "" ..core.colorize("#35cdff",".40mm grenade\n")..core.colorize("#FFFFFF", "Bullet damage: 10 \n") ..core.colorize("#FFFFFF", "Bullet crit efficiency: 1.0 \n") ..core.colorize("#FFFFFF", "Bullet crit chance: 1% \n") ..core.colorize("#FFFFFF", "Bullet velocity: 15 \n") ..core.colorize("#FFFFFF", "Bullet knockback: 10 \n") ..core.colorize("#FFFFFF", "Bullet gravity: 5 \n")  ..core.colorize("#FFFFFF", "explodes on impact with a radius of 2\n")  ..core.colorize("#FFFFFF", "Ammunition for grenade launchers"),
	inventory_image = "rangedweapons_40mm.png",
	RW_ammo_capabilities = {
		ammo_damage = {fleshy=10,knockback=15},
		ammo_critEffc = 1.0,
		ammo_crit = 1,
		ammo_velocity = 15,
		ammo_glass_breaking = 1,
		ammo_entity = "rangedweapons:shot_bullet",
		ammo_visual = "sprite",
		ammo_texture = "rangedweapons_rocket_fly.png",
		shell_entity = "rangedweapons:empty_shell",
		shell_visual = "wielditem",
		shell_texture = "rangedweapons:shell_grenadedrop",
		ammo_projectile_size = 0.15,
		has_sparks = 1,
		ammo_gravity = 5,
		ignites_explosives = 1,

OnCollision = function(player,bullet,target)
	tnt.boom(bullet.object:get_pos(), {radius = 2})
end,
ammo_particles = {
	velocity = {x=1,y=1,z=1},
	acceleration = {x=1,y=1,z=1},
	collisiondetection = true,
	lifetime = 1,
	texture = "tnt_smoke.png",
	minsize = 50,
	maxsize = 75,
	pos_randomness = 50,
	glow = 20,
	gravity = 10,
	amount = {1,1}
},
},
})

minetest.register_craftitem("rangedweapons:rocket", {
	stack_max= 15,
	wield_scale = {x=1.2,y=1.2,z=2.4},
		description = "" ..core.colorize("#35cdff","rocket\n")..core.colorize("#FFFFFF", "Bullet damage: 15 \n") ..core.colorize("#FFFFFF", "Bullet crit efficiency: 1.0 \n") ..core.colorize("#FFFFFF", "Bullet crit chance: 1% \n") ..core.colorize("#FFFFFF", "Bullet velocity: 20 \n") ..core.colorize("#FFFFFF", "Bullet knockback: 20 \n") ..core.colorize("#FFFFFF", "Bullet gravity: 5 \n")  ..core.colorize("#FFFFFF", "explodes on impact with a radius of 3\n")  ..core.colorize("#FFFFFF", "Ammunition for rocket launchers"),
	inventory_image = "rangedweapons_rocket.png",
	RW_ammo_capabilities = {
		ammo_damage = {fleshy=15,knockback=20},
		ammo_critEffc = 1.0,
		ammo_crit = 1,
		ammo_velocity = 20,
		ammo_glass_breaking = 1,
		ammo_entity = "rangedweapons:shot_bullet",
		ammo_visual = "sprite",
		ammo_texture = "rangedweapons_rocket_fly.png",
		ammo_projectile_size = 0.15,
		has_sparks = 1,
		ignites_explosives = 1,

OnCollision = function(player,bullet,target)
	tnt.boom(bullet.object:get_pos() , {radius = 3})
end,
ammo_particles = {
	velocity = {x=1,y=1,z=1},
	acceleration = {x=1,y=1,z=1},
	collisiondetection = true,
	lifetime = 1,
	texture = "tnt_smoke.png",
	minsize = 50,
	maxsize = 75,
	pos_randomness = 50,
	glow = 20,
	gravity = 10,
	amount = {1,1}
},
},
})
