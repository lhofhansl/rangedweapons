

local modpath = minetest.get_modpath(minetest.get_current_modname())

if minetest.global_exists("armor") and armor.attributes then
	table.insert(armor.attributes, "bullet_res")
end
if minetest.global_exists("armor") and armor.attributes then
	table.insert(armor.attributes, "ammo_save")
end
if minetest.global_exists("armor") and armor.attributes then
	table.insert(armor.attributes, "ranged_dmg")
end

minetest.register_node("rangedweapons:antigun_block", {
		description = "" ..core.colorize("#35cdff","Anti-gun block\n")..core.colorize("#FFFFFF", "Prevents people from using guns, in 10 node radius to each side from this block"),
	tiles = {"rangedweapons_antigun_block.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_wood_defaults(),
})
----
---- gun_funcs
----

make_sparks = function(pos)
minetest.sound_play("rengedweapons_ricochet", {pos, gain = 0.75})
	for i=1,9 do
	minetest.add_particle({
		pos = pos, 
		velocity = {x=math.random(-6.0,6.0),  y=math.random(-10.0,15.0),  z=math.random(-6.0,6.0)},
          	acceleration = {x=math.random(-9.0,9.0), y=math.random(-15.0,-3.0), z=math.random(-9.0,9.0)},
		expirationtime = 1.0,
		size = math.random(1,2),
		collisiondetection = true,
		vertical = false,
		texture = "rangedweapons_spark.png",
		glow = 25,
	})
end
end


rangedweapons_gain_skill = function(player,skill,chance)

if math.random(1, chance) == 1 then
	local p_meta = player:get_meta()
local skill_num = p_meta:get_int(skill)
if skill_num < rweapons_max_gun_efficiency then
p_meta:set_int(skill, skill_num + 1)
    minetest.chat_send_player(player:get_player_name(), "" ..core.colorize("#25c200","You've improved your skill with this type of gun!"))
end
end

end


rangedweapons_reload_gun = function(itemstack, player)

GunCaps = itemstack:get_definition().RW_gun_capabilities

if GunCaps ~= nil then
gun_unload_sound = GunCaps.gun_unload_sound or ""
end

minetest.sound_play(gun_unload_sound, {player})


local gun_reload = 0.25

if GunCaps ~= nil then
gun_reload = GunCaps.gun_reload or 0.25
end

local playerMeta = player:get_meta()
local gunMeta = itemstack:get_meta()

gunMeta:set_float("RW_reload_delay",gun_reload)

playerMeta:set_float("rw_cooldown",gun_reload)

local player_has_ammo = 0
local clipSize = 0
local reload_ammo = ""

if GunCaps.suitable_ammo ~= nil then
local inv = player:get_inventory()
for i = 1,inv:get_size("main") do

for _, ammo in pairs(GunCaps.suitable_ammo) do
if inv:get_stack("main",i):get_name() == ammo[1] then
reload_ammo = inv:get_stack("main",i)
clipSize = ammo[2]

player_has_ammo = 1
break
end end

if player_has_ammo == 1 then
break
end

end end

if player_has_ammo == 1 then
local gun_icon = "rangedweapons_emergency_gun_icon.png"

if GunCaps.gun_icon ~= nil then
gun_icon = GunCaps.gun_icon
end

local ammo_icon = "rangedweapons_emergency_ammo_icon.png"

if reload_ammo:get_definition().inventory_image ~= nil then
ammo_icon = reload_ammo:get_definition().inventory_image
end

	player:hud_change(gunimg, "text", gun_icon)
	player:hud_change(ammoimg, "text", ammo_icon)

local gunMeta = itemstack:get_meta()
local ammoCount = gunMeta:get_int("RW_bullets")
local ammoName = gunMeta:get_string("RW_ammo_name")
local inv = player:get_inventory()

inv:add_item("main",ammoName.." "..ammoCount)


if inv:contains_item("main",reload_ammo:get_name().." "..clipSize) then
inv:remove_item("main",reload_ammo:get_name().." "..clipSize)
gunMeta:set_int("RW_bullets",clipSize)
else
gunMeta:set_int("RW_bullets",reload_ammo:get_count())
inv:remove_item("main",reload_ammo:get_name().." "..reload_ammo:get_count())
end

gunMeta:set_string("RW_ammo_name",reload_ammo:get_name())

player:hud_change(gunammo, "text", gunMeta:get_int("RW_bullets"))

if GunCaps.gun_magazine ~= nil then
		local pos = player:get_pos()
		local dir = player:get_look_dir()
		local yaw = player:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.4
local obj = minetest.add_entity(pos,"rangedweapons:mag")
			if obj then
obj:set_properties({textures = {GunCaps.gun_magazine}})
	obj:set_velocity({x=dir.x*2, y=dir.y*2, z=dir.z*2})
	obj:set_acceleration({x=0, y=-5, z=0})
	obj:set_rotation({x=0,y=yaw+math.pi,z=0})
end end end

if GunCaps.gun_unloaded ~= nil then
itemstack:set_name(GunCaps.gun_unloaded)
end


end
end



rangedweapons_single_load_gun = function(itemstack, player)

GunCaps = itemstack:get_definition().RW_gun_capabilities

if GunCaps ~= nil then
gun_unload_sound = GunCaps.gun_unload_sound or ""
end

minetest.sound_play(gun_unload_sound, {player})

local gun_reload = 0.25

if GunCaps ~= nil then
gun_reload = GunCaps.gun_reload or 0.25
end

local playerMeta = player:get_meta()
local gunMeta = itemstack:get_meta()

gunMeta:set_float("RW_reload_delay",gun_reload)

playerMeta:set_float("rw_cooldown",gun_reload)

local player_has_ammo = 0
local clipSize = 0
local reload_ammo = ""

if GunCaps.suitable_ammo ~= nil then
local inv = player:get_inventory()
for i = 1,inv:get_size("main") do

for _, ammo in pairs(GunCaps.suitable_ammo) do
if inv:get_stack("main",i):get_name() == ammo[1] then
reload_ammo = inv:get_stack("main",i)
clipSize = ammo[2]

player_has_ammo = 1
break
end end

if player_has_ammo == 1 then
break
end

end end

if player_has_ammo == 1 then
local gun_icon = "rangedweapons_emergency_gun_icon.png"

if GunCaps.gun_icon ~= nil then
gun_icon = GunCaps.gun_icon
end

local ammo_icon = "rangedweapons_emergency_ammo_icon.png"

if reload_ammo:get_definition().inventory_image ~= nil then
ammo_icon = reload_ammo:get_definition().inventory_image
end

	player:hud_change(gunimg, "text", gun_icon)
	player:hud_change(ammoimg, "text", ammo_icon)

local gunMeta = itemstack:get_meta()
local ammoCount = gunMeta:get_int("RW_bullets")
local ammoName = gunMeta:get_string("RW_ammo_name")
local inv = player:get_inventory()

if ammoName ~= reload_ammo:get_name() then
inv:add_item("main",ammoName.." "..ammoCount)
gunMeta:set_int("RW_bullets",0)
end

if inv:contains_item("main",reload_ammo:get_name()) and 
gunMeta:get_int("RW_bullets") < clipSize then
inv:remove_item("main",reload_ammo:get_name())
gunMeta:set_int("RW_bullets",gunMeta:get_int("RW_bullets")+1)
end

gunMeta:set_string("RW_ammo_name",reload_ammo:get_name())

player:hud_change(gunammo, "text", gunMeta:get_int("RW_bullets"))

if GunCaps.gun_unloaded ~= nil then
itemstack:set_name(GunCaps.gun_unloaded)
end

end
end

rangedweapons_yeet = function(itemstack, player)

if minetest.find_node_near(player:getpos(), 10,"rangedweapons:antigun_block")
then
   minetest.chat_send_player(player:get_player_name(), "" ..core.colorize("#ff0000","throwable weapons are prohibited in this area!"))
else

ThrowCaps = itemstack:get_definition().RW_throw_capabilities
playerMeta = player:get_meta()

if ThrowCaps ~= nil then
throw_cooldown = ThrowCaps.throw_cooldown or 0
end

if playerMeta:get_float("rw_cooldown") <= 0 then

playerMeta:set_float("rw_cooldown", throw_cooldown)

local throw_damage = {fleshy=1}
local throw_sound = "rangedweapons_throw"
local throw_velocity = 20
local throw_accuracy = 100
local throw_cooling = 0
local throw_crit = 0
local throw_critEffc = 1
local throw_mobPen = 0
local throw_nodePen = 0
local throw_dps = 0
local throw_gravity = 0
local throw_door_breaking = 0
local throw_skill = ""
local throw_skillChance =  0
local throw_smokeSize =  0
local throw_ent = "rangedweapons:shot_bullet"
local throw_visual = "wielditem"
local throw_texture = "rangedweapons:shot_bullet_visual"
local throw_glass_breaking = 0
local throw_particles = {}
local throw_sparks = 0
local throw_bomb_ignite = 0
local throw_size = 0
local throw_glow = 0

if ThrowCaps ~= nil then
throw_damage = ThrowCaps.throw_damage or {fleshy=1}
throw_sound = ThrowCaps.throw_sound or "rangedweapons_glock"
throw_velocity = ThrowCaps.throw_velocity or 20
throw_accuracy = ThrowCaps.throw_accuracy or 100
throw_cooling = ThrowCaps.throw_cooling or itemstack:get_name()
throw_crit = ThrowCaps.throw_crit or 0
throw_critEffc = ThrowCaps.throw_critEffc or 1
throw_projectiles = ThrowCaps.throw_projectiles or 1
throw_mobPen = ThrowCaps.throw_mob_penetration or 0
throw_nodePen = ThrowCaps.throw_node_penetration or 0
throw_dps = ThrowCaps.throw_dps or 0
throw_gravity = ThrowCaps.throw_gravity or 0
throw_door_breaking = ThrowCaps.throw_door_breaking or 0
throw_ent = ThrowCaps.throw_entity or "rangedweapons:shot_bullet"
throw_visual = ThrowCaps.throw_visual or "wielditem"
throw_texture = ThrowCaps.throw_texture or "rangedweapons:shot_bullet_visual"
throw_glass_breaking = ThrowCaps.throw_glass_breaking or 0
throw_particles = ThrowCaps.throw_particles or nil
throw_sparks = ThrowCaps.throw_sparks or 0
throw_bomb_ignite = ThrowCaps.ignites_explosives or 0
throw_size = ThrowCaps.throw_projectile_size or 0
throw_glow = ThrowCaps.throw_projectile_glow or 0
OnCollision = ThrowCaps.OnCollision or function()end

if ThrowCaps.throw_skill ~= nil then
throw_skill = ThrowCaps.throw_skill[1] or ""
throw_skillChance = ThrowCaps.throw_skill[2] or 0
else
throw_skill = ""
throw_skillChance = 0
end
end

if throw_skillChance > 0 and throw_skill ~= "" then
rangedweapons_gain_skill(player,throw_skill,throw_skillChance)
end

if throw_skill ~= "" then
skill_value = playerMeta:get_int(throw_skill)/100
else
skill_value = 1
end

rangedweapons_launch_projectile(player,throw_projectiles,throw_damage,throw_ent,throw_visual,throw_texture,throw_sound,throw_velocity,throw_accuracy,skill_value,OnCollision,throw_crit,throw_critEffc,throw_mobPen,throw_nodePen,0,"","","",throw_dps,throw_gravity,throw_door_breaking,throw_glass_breaking,throw_particles,throw_sparks,throw_bomb_ignite,throw_size,0,itemstack:get_wear(),throw_glow)

itemstack:take_item()

end
end

end


rangedweapons_shoot_gun = function(itemstack, player)

if minetest.find_node_near(player:getpos(), 10,"rangedweapons:antigun_block")
then
minetest.sound_play("rangedweapons_empty", {player})
   minetest.chat_send_player(player:get_player_name(), "" ..core.colorize("#ff0000","Guns are prohibited in this area!"))

else

local gun_cooldown = 0
local GunCaps = itemstack:get_definition().RW_gun_capabilities
local gun_ammo_save = 0

if GunCaps ~= nil then
gun_cooldown = GunCaps.gun_cooldown or 0
gun_ammo_save = GunCaps.ammo_saving or 0
end

local gunMeta = itemstack:get_meta()
local playerMeta = player:get_meta()

if gunMeta:get_int("RW_bullets") > 0 and 
playerMeta:get_float("rw_cooldown") <= 0 then

playerMeta:set_float("rw_cooldown", gun_cooldown)

if math.random(1,100) > gun_ammo_save then
gunMeta:set_int("RW_bullets",gunMeta:get_int("RW_bullets")-1)
end

player:hud_change(gunammo, "text", gunMeta:get_int("RW_bullets"))

local gun_icon = "rangedweapons_emergency_gun_icon.png"
if GunCaps.gun_icon ~= nil then
gun_icon = GunCaps.gun_icon
end
	player:hud_change(gunimg, "text", gun_icon)

local OnCollision = function() end

local bulletStack = ItemStack({name = gunMeta:get_string("RW_ammo_name")})
AmmoCaps = bulletStack:get_definition().RW_ammo_capabilities

local gun_damage = {fleshy=1}
local gun_sound = "rangedweapons_glock"
local gun_velocity = 20
local gun_accuracy = 100
local gun_cooling = 0
local gun_crit = 0
local gun_critEffc = 1
local gun_mobPen = 0
local gun_nodePen = 0
local gun_shell = 0
local gun_durability = 0
local gun_dps = 0
local gun_gravity = 0
local gun_door_breaking = 0
local gun_skill = ""
local gun_skillChance =  0
local gun_smokeSize =  0

local bullet_damage = {fleshy=0}
local bullet_velocity = 0
local bullet_ent = "rangedweapons:shot_bullet"
local bullet_visual = "wielditem"
local bullet_texture = "rangedweapons:shot_bullet_visual"
local bullet_crit = 0
local bullet_critEffc = 0
local bullet_projMult = 1
local bullet_mobPen = 0
local bullet_nodePen = 0
local bullet_shell_ent = "rangedweapons:empty_shell"
local bullet_shell_visual = "wielditem"
local bullet_shell_texture = "rangedweapons:shelldrop"
local bullet_dps = 0
local bullet_gravity = 0
local bullet_glass_breaking = 0
local bullet_particles = {}
local bullet_sparks = 0
local bullet_bomb_ignite = 0
local bullet_size = 0
local bullet_glow = 20



if GunCaps ~= nil then
gun_damage = GunCaps.gun_damage or {fleshy=1}
gun_sound = GunCaps.gun_sound or "rangedweapons_glock"
gun_velocity = GunCaps.gun_velocity or 20
gun_accuracy = GunCaps.gun_accuracy or 100
gun_cooling = GunCaps.gun_cooling or itemstack:get_name()
gun_crit = GunCaps.gun_crit or 0
gun_critEffc = GunCaps.gun_critEffc or 1
gun_projectiles = GunCaps.gun_projectiles or 1
gun_mobPen = GunCaps.gun_mob_penetration or 0
gun_nodePen = GunCaps.gun_node_penetration or 0
gun_shell = GunCaps.has_shell or 0
gun_durability = GunCaps.gun_durability or 0
gun_dps = GunCaps.gun_dps or 0
gun_ammo_save = GunCaps.ammo_saving or 0
gun_gravity = GunCaps.gun_gravity or 0
gun_door_breaking = GunCaps.gun_door_breaking or 0
gun_smokeSize = GunCaps.gun_smokeSize or 0

if GunCaps.gun_skill ~= nil then
gun_skill = GunCaps.gun_skill[1] or ""
gun_skillChance = GunCaps.gun_skill[2] or 0
else
gun_skill = ""
gun_skillChance = 0
end

end

if gun_skillChance > 0 and gun_skill ~= "" then
rangedweapons_gain_skill(player,gun_skill,gun_skillChance)
end

local ammo_icon = "rangedweapons_emergency_ammo_icon.png"
if bulletStack:get_definition().inventory_image ~= nil then
ammo_icon = bulletStack:get_definition().inventory_image
end
player:hud_change(ammoimg, "text", ammo_icon)

if AmmoCaps ~= nil then

OnCollision = AmmoCaps.OnCollision or function()end
bullet_damage = AmmoCaps.ammo_damage or {fleshy=1}
bullet_velocity = AmmoCaps.ammo_velocity or 0
bullet_ent = AmmoCaps.ammo_entity or "rangedweapons:shot_bullet"
bullet_visual = AmmoCaps.ammo_visual or "wielditem"
bullet_texture = AmmoCaps.ammo_texture or "rangedweapons:shot_bullet_visual"
bullet_crit = AmmoCaps.ammo_crit or 0
bullet_critEffc = AmmoCaps.ammo_critEffc or 0
bullet_projMult = AmmoCaps.ammo_projectile_multiplier or 1
bullet_mobPen = AmmoCaps.ammo_mob_penetration or 0
bullet_nodePen = AmmoCaps.ammo_node_penetration or 0
bullet_shell_ent = AmmoCaps.shell_entity or "rangedweapons:empty_shell"
bullet_shell_visual = AmmoCaps.shell_visual or "wielditem"
bullet_shell_texture = AmmoCaps.shell_texture or "rangedweapons:shelldrop"
bullet_dps = AmmoCaps.ammo_dps or 0
bullet_gravity = AmmoCaps.ammo_gravity or 0
bullet_glass_breaking = AmmoCaps.ammo_glass_breaking or 0
bullet_particles = AmmoCaps.ammo_particles or nil
bullet_sparks = AmmoCaps.has_sparks or 0
bullet_bomb_ignite = AmmoCaps.ignites_explosives or 0
bullet_size = AmmoCaps.ammo_projectile_size or 0.0025
bullet_glow = AmmoCaps.ammo_projectile_glow or 20
end


local combined_crit = gun_crit + bullet_crit
local combined_critEffc = gun_critEffc + bullet_critEffc
local combined_velocity = gun_velocity + bullet_velocity
local combined_projNum = math.ceil(gun_projectiles * bullet_projMult)
local combined_mobPen = gun_mobPen + bullet_mobPen
local combined_nodePen = gun_nodePen + bullet_nodePen
local combined_dps = gun_dps + bullet_dps
local combined_dmg = {}
local combined_gravity = gun_gravity + bullet_gravity

for _, gunDmg in pairs(gun_damage) do
if bullet_damage[_] ~= nil then
combined_dmg[_] = gun_damage[_] + bullet_damage[_]
else
combined_dmg[_] = gun_damage[_]
end
end
for _, bulletDmg in pairs(bullet_damage) do
if gun_damage[_] == nil then
combined_dmg[_] = bullet_damage[_]
end
end

--minetest.chat_send_all(minetest.serialize(combined_dmg))

if gun_skill ~= "" then
skill_value = playerMeta:get_int(gun_skill)/100
else
skill_value = 1
end

rangedweapons_launch_projectile(player,combined_projNum,combined_dmg,bullet_ent,bullet_visual,bullet_texture,gun_sound,combined_velocity,gun_accuracy,skill_value,OnCollision,combined_crit,combined_critEffc,combined_mobPen,combined_nodePen,gun_shell,bullet_shell_ent,bullet_shell_texture,bullet_shell_visual,combined_dps,combined_gravity,gun_door_breaking,bullet_glass_breaking,bullet_particles,bullet_sparks,bullet_bomb_ignite,bullet_size,gun_smokeSize,0,bullet_glow)

if rweapons_gun_durability == "true" then
itemstack:add_wear(65535/gun_durability)
end
itemstack:set_name(gun_cooling)

end
end end




rangedweapons_shoot_powergun = function(itemstack, player)

if minetest.find_node_near(player:getpos(), 10,"rangedweapons:antigun_block")
then
minetest.sound_play("rangedweapons_empty", {player})
   minetest.chat_send_player(player:get_player_name(), "" ..core.colorize("#ff0000","Guns are prohibited in this area!"))
else
local power_cooldown = 0

PowerCaps = itemstack:get_definition().RW_powergun_capabilities

if PowerCaps ~= nil then
power_cooldown = PowerCaps.power_cooldown or 0
power_consumption = PowerCaps.power_consumption or 0
end

local inv = player:get_inventory()
local playerMeta = player:get_meta()

if inv:contains_item("main", "rangedweapons:power_particle "..PowerCaps.power_consumption) and 
playerMeta:get_float("rw_cooldown") <= 0 then
playerMeta:set_float("rw_cooldown", power_cooldown)

local OnCollision = function() end

local power_damage = {fleshy=1}
local power_sound = "rangedweapons_laser"
local power_velocity = 20
local power_accuracy = 100
local power_cooling = 0
local power_crit = 0
local power_critEffc = 1
local power_mobPen = 0
local power_nodePen = 0
local power_durability = 0
local power_dps = 0
local power_gravity = 0
local power_door_breaking = 0
local power_skill = ""
local power_skillChance =  0
local power_ent = "rangedweapons:shot_bullet"
local power_visual = "wielditem"
local power_texture = "rangedweapons:shot_bullet_visual"
local power_glass_breaking = 0
local power_particles = {}
local power_sparks = 0
local power_bomb_ignite = 0
local power_size = 0
local power_glow = 20

if PowerCaps ~= nil then
power_damage = PowerCaps.power_damage or {fleshy=1}
power_sound = PowerCaps.power_sound or "rangedweapons_glock"
power_velocity = PowerCaps.power_velocity or 20
power_accuracy = PowerCaps.power_accuracy or 100
power_cooling = PowerCaps.power_cooling or itemstack:get_name()
power_crit = PowerCaps.power_crit or 0
power_critEffc = PowerCaps.power_critEffc or 1
power_projectiles = PowerCaps.power_projectiles or 1
power_mobPen = PowerCaps.power_mob_penetration or 0
power_nodePen = PowerCaps.power_node_penetration or 0
power_durability = PowerCaps.power_durability or 0
power_dps = PowerCaps.power_dps or 0
power_gravity = PowerCaps.power_gravity or 0
power_door_breaking = PowerCaps.power_door_breaking or 0
OnCollision = PowerCaps.OnCollision or function()end
power_ent = PowerCaps.power_entity or "rangedweapons:shot_bullet"
power_visual = PowerCaps.power_visual or "wielditem"
power_texture = PowerCaps.power_texture or "rangedweapons:shot_bullet_visual"
power_glass_breaking = PowerCaps.power_glass_breaking or 0
power_particles = PowerCaps.power_particles or nil
power_sparks = PowerCaps.has_sparks or 0
power_bomb_ignite = PowerCaps.ignites_explosives or 0
power_size = PowerCaps.power_projectile_size or 0.0025
power_glow = PowerCaps.power_projectile_glow or 20

if PowerCaps.power_skill ~= nil then
power_skill = PowerCaps.power_skill[1] or ""
power_skillChance = PowerCaps.power_skill[2] or 0
else
power_skill = ""
power_skillChance = 0
end

end

if power_skillChance > 0 and power_skill ~= "" then
rangedweapons_gain_skill(player,power_skill,power_skillChance)
end

if power_skill ~= "" then
skill_value = playerMeta:get_int(power_skill)/100
else
skill_value = 1
end

rangedweapons_launch_projectile(player,power_projectiles,power_damage,power_ent,power_visual,power_texture,power_sound,power_velocity,power_accuracy,skill_value,OnCollision,power_crit,power_critEffc,power_mobPen,power_nodePen,0,"","","",power_dps,power_gravity,power_door_breaking,power_glass_breaking,power_particles,power_sparks,power_bomb_ignite,power_size,0,0,power_glow)

if rweapons_gun_durability == "true" then
itemstack:add_wear(65535/power_durability)
end
itemstack:set_name(power_cooling)

inv:remove_item("main", "rangedweapons:power_particle "..PowerCaps.power_consumption)

end
end end

rangedweapons_launch_projectile = function(player,projNum,projDmg,projEnt,visualType,texture,shoot_sound,combined_velocity,accuracy,skill_value,ColResult,projCrit,projCritEffc,mobPen,nodePen,has_shell,shellEnt,shellTexture,shellVisual,dps,gravity,door_break,glass_break,bullet_particles,sparks,ignite,size,smokeSize,proj_wear,proj_glow)

--minetest.chat_send_all(accuracy)

----------------------------------
		local pos = player:get_pos()
		local dir = player:get_look_dir()
		local yaw = player:get_look_yaw()
		local svertical = player:get_look_vertical()

		if pos and dir and yaw then
		minetest.sound_play(shoot_sound, {player})
		pos.y = pos.y + 1.45

	if has_shell > 0 then
	local shl = minetest.add_entity(pos, shellEnt)
shl:setvelocity({x=dir.x * -10, y=dir.y * -10, z=dir.z * -10})
shl:setacceleration({x=dir.x * -5, y= -10, z=dir.z * -5})
shl:set_rotation({x=0,y=yaw + math.pi,z=-svertical})
shl:set_properties({
textures = {shellTexture},
visual = shellVisual,})
	end	
if smokeSize > 0 then
	minetest.add_particle({
		pos = pos,
		velocity = {x=(dir.x*3)+(math.random(-10,10)/10), y=(dir.y*3)+(math.random(-10,10)/10), z=(dir.z*3)+(math.random(-10,10)/10)} ,
          	acceleration = {x=dir.x * -3, y=2, z=dir.z * -3},
		expirationtime = math.random(5,10)/10,
		size = smokeSize,
		collisiondetection = false,
		vertical = false,
		texture = "tnt_smoke.png",
		glow = 5,
	})
end

	projectiles = projNum or 1
	for i=1,projectiles do
		rndacc = (100 - accuracy) or 0
local spawnpos_x = pos.x + (math.random(-rndacc,rndacc)/100)
local spawnpos_y = pos.y + (math.random(-rndacc,rndacc)/100)
local spawnpos_z = pos.z + (math.random(-rndacc,rndacc)/100)

			local obj = minetest.add_entity({x=spawnpos_x,y=spawnpos_y,z=spawnpos_z}, projEnt)
			local ent = obj:get_luaentity()

obj:set_properties(
{textures = {texture},
visual = visualType,
collisionbox = {-size,-size,-size, size,size,size},
glow = proj_glow,}
)
			ent.owner = player:get_player_name()
			if obj then
			ent.damage = projDmg
			ent.crit = projCrit
			ent.critEffc = projCritEffc
			ent.OnCollision = ColResult
			ent.mobPen = mobPen
			ent.nodePen = nodePen
			ent.dps = dps
			ent.door_break = door_break
			ent.glass_break = glass_break
			ent.skill_value = skill_value
			ent.bullet_particles = bullet_particles
			ent.sparks = sparks
			ent.ignite = ignite
			ent.size = size
			ent.timer = 0 + (combined_velocity/2000)
			ent.wear = proj_wear
				obj:set_velocity({x=dir.x * combined_velocity, y=dir.y * combined_velocity, z=dir.z * combined_velocity})
				acc = ((( 100 - accuracy ) / 10) / skill_value ) or 0
				obj:set_acceleration({x=math.random(-acc,acc), y=math.random(-acc,acc)-gravity, z=math.random(-acc,acc)})
obj:set_rotation({x=0,y=yaw + math.pi,z=-svertical})
	end end end


end

eject_shell = function(itemstack,player,rld_item,rld_time,rldsound,shell)
	itemstack:set_name(rld_item)
		local meta = player:get_meta()
		meta:set_float("rw_cooldown", rld_time)

local gunMeta = itemstack:get_meta()

local bulletStack = ItemStack({name = gunMeta:get_string("RW_ammo_name")})

minetest.sound_play(rldsound, {player})
		local pos = player:get_pos()
		local dir = player:get_look_dir()
		local yaw = player:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "rangedweapons:empty_shell")

if AmmoCaps and bulletStack ~= "" then
AmmoCaps = bulletStack:get_definition().RW_ammo_capabilities

local bullet_shell_visual = "wielditem"
local bullet_shell_texture = "rangedweapons:shelldrop"

bullet_shell_visual = AmmoCaps.shell_visual or "wielditem"
bullet_shell_texture = AmmoCaps.shell_texture or "rangedweapons:shelldrop"

obj:set_properties({textures = {bullet_shell_texture}})
obj:set_properties({visual = bullet_shell_visual})

end
			if obj then
obj:set_velocity({x=dir.x*-10, y=dir.y*-10, z=dir.z*-10})
obj:set_acceleration({x=dir.x*-5, y=-10, z=dir.z*-5})
	obj:set_yaw(yaw + math.pi)
	end end end
---------------------------------------------------



dofile(modpath.."/settings.lua")
dofile(modpath.."/cooldown_stuff.lua")
dofile(modpath.."/skills.lua")
dofile(modpath.."/misc.lua")
dofile(modpath.."/bullet_knockback.lua")
dofile(modpath.."/ammo.lua")
dofile(modpath.."/crafting.lua")

if rweapons_shurikens == "true" then
	dofile(modpath.."/shurikens.lua")
end

if rweapons_handguns == "true" then
	dofile(modpath.."/makarov.lua")
	dofile(modpath.."/luger.lua")
	dofile(modpath.."/beretta.lua")
	dofile(modpath.."/m1991.lua")
	dofile(modpath.."/glock17.lua")
	dofile(modpath.."/deagle.lua")
end

if rweapons_forceguns == "true" then
	dofile(modpath.."/forcegun.lua")
end

if rweapons_javelins == "true" then
	dofile(modpath.."/javelin.lua")
end

if rweapons_power_weapons == "true" then
	dofile(modpath.."/generator.lua")
	dofile(modpath.."/laser_blaster.lua")
	dofile(modpath.."/laser_rifle.lua")
	dofile(modpath.."/laser_shotgun.lua")
end

if rweapons_machine_pistols == "true" then
	dofile(modpath.."/tmp.lua")
	dofile(modpath.."/tec9.lua")
	dofile(modpath.."/uzi.lua")
	dofile(modpath.."/kriss_sv.lua")
end
if rweapons_shotguns == "true" then
	dofile(modpath.."/remington.lua")
	dofile(modpath.."/spas12.lua")
	dofile(modpath.."/benelli.lua")
end
if rweapons_auto_shotguns == "true" then
	dofile(modpath.."/jackhammer.lua")
	dofile(modpath.."/aa12.lua")
end
if rweapons_smgs == "true" then
	dofile(modpath.."/mp5.lua")
	dofile(modpath.."/ump.lua")
	dofile(modpath.."/mp40.lua")
	dofile(modpath.."/thompson.lua")
end
if rweapons_rifles == "true" then
	dofile(modpath.."/awp.lua")
	dofile(modpath.."/svd.lua")
	dofile(modpath.."/m200.lua")
end
if rweapons_heavy_machineguns == "true" then
	dofile(modpath.."/m60.lua")
	dofile(modpath.."/rpk.lua")
	dofile(modpath.."/minigun.lua")
end
if rweapons_revolvers == "true" then
	dofile(modpath.."/python.lua")
	dofile(modpath.."/taurus.lua")
end
if rweapons_assault_rifles == "true" then
	dofile(modpath.."/m16.lua")
	dofile(modpath.."/g36.lua")
	dofile(modpath.."/ak47.lua")
	dofile(modpath.."/scar.lua")
end

if rweapons_explosives == "true" then
	dofile(modpath.."/explosives.lua")
	dofile(modpath.."/m79.lua")
	dofile(modpath.."/milkor.lua")
	dofile(modpath.."/rpg.lua")
	dofile(modpath.."/hand_grenade.lua")
end


if rweapons_glass_breaking == "true" then
	dofile(modpath.."/glass_breaking.lua")
end
if not minetest.settings:get_bool("glass_breaking") then
minetest.register_abm({
	nodenames = {"rangedweapons:broken_glass"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		if minetest.get_node(pos).name == "rangedweapons:broken_glass" then
			node.name = "default:glass"
			minetest.set_node(pos, node)
		end
	end
})
end

local rangedweapons_empty_shell = {
	physical = false,
	timer = 0,
	visual = "wielditem",
	visual_size = {x=0.3, y=0.3},
	textures = {"rangedweapons:shelldrop"},
	lastpos= {},
	collisionbox = {0, 0, 0, 0, 0, 0},
}
rangedweapons_empty_shell.on_step = function(self, dtime, pos)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = minetest.get_node(pos)
	if self.lastpos.y ~= nil then
		if minetest.registered_nodes[node.name]~= nil then
		if minetest.registered_nodes[node.name].walkable then
	local vel = self.object:get_velocity()
	local acc = self.object:get_acceleration()
	self.object:set_velocity({x=vel.x*-0.3, y=vel.y*-0.75, z=vel.z*-0.3})
			minetest.sound_play("rangedweapons_shellhit", {pos = self.lastpos, gain = 0.8})
	self.object:set_acceleration({x=acc.x, y=acc.y, z=acc.z})
			end end
	end
	if self.timer > 1.69 then
			minetest.sound_play("rangedweapons_bulletdrop", {pos = self.lastpos, gain = 0.8})
		self.object:remove()

	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

minetest.register_entity("rangedweapons:empty_shell", rangedweapons_empty_shell )


minetest.register_abm({
	nodenames = {"doors:hidden"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		pos.y = pos.y-1
		if minetest.get_node(pos).name == "air" then
		pos.y = pos.y+1
			node.name = "air"
			minetest.set_node(pos, node)
		end
	end
})

minetest.register_on_joinplayer(function(player)
 gunammo = 
	player:hud_add({
	hud_elem_type = "text",
	name = "gunammo",
	text = "",
	number = 0xFFFFFF,
	scale = {x = 100, y = 20},
	position = {x = 0.7, y = 0.1},
	offset = {x = 30, y = 100},
	alignment = {x = 0, y = -1}
	})
 gunimg = 
	player:hud_add({
	hud_elem_type = "image",
	text = "rangedweapons_empty_icon.png",
	scale = {x = 2, y = 2},
	position = {x = 0.7, y = 0.065},
	offset = {x = 30, y = 100},
	alignment = {x = 0, y = -1}
	})
 ammoimg = 
	player:hud_add({
	hud_elem_type = "image",
	text = "rangedweapons_empty_icon.png",
	scale = {x = 1.5, y = 1.5},
	position = {x = 0.725, y = 0.1},
	offset = {x = 30, y = 100},
	alignment = {x = 0, y = -1}
	})
 hit = 
	player:hud_add({
	hud_elem_type = "image",
	text = "rangedweapons_empty_icon.png",
	scale = {x = 2, y = 2},
	position = {x = 0.5, y = 0.5},
	offset = {x = 0, y = 0},
	alignment = {x = 0, y = 0}
	})
scope_hud = 
	player:hud_add({
	hud_elem_type = "image",
	position = { x=0.5, y=0.5 },
	scale = { x=-100, y=-100 },
	text = "rangedweapons_empty_icon.png",
	})
end)

	local timer = 0
minetest.register_globalstep(function(dtime, player)
	timer = timer + dtime;
	if timer >= 1.0 then
	for _, player in pairs(minetest.get_connected_players()) do
player:hud_change(hit, "text", "rangedweapons_empty_icon.png")
	timer = 0
			end
			end
				end)

