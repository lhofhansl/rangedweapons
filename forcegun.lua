minetest.register_tool("rangedweapons:forcegun", {
		description = "" ..core.colorize("#35cdff","Force gun\n") ..core.colorize("#FFFFFF", "Completelly harmless... by itself...\n")..core.colorize("#FFFFFF", "It's projectile will push either the entity it hits directly, or everyone near the node it collides with far away.\n")  ..core.colorize("#FFFFFF", "Perfect for rocket-jumping or YEETing enemies away.\n")..core.colorize("#FFFFFF", "Power usage: 40\n")..core.colorize("#FFFFFF", "Gun type:Power Special-gun\n") ..core.colorize("#FFFFFF", "Bullet velocity: 60"),
	range = 0,
	wield_scale = {x=2.0,y=2.0,z=1.75},
	inventory_image = "rangedweapons_forcegun.png",
	on_use = function(itemstack, user, pointed_thing)

		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		local inv = user:get_inventory()
if  inv:contains_item("main", "rangedweapons:power_particle 40") then
		if pos and dir then
		inv:remove_item("main", "rangedweapons:power_particle 25")
			pos.y = pos.y + 1.5
			local obj = minetest.add_entity(pos, "rangedweapons:forceblast")
			if obj then
				minetest.sound_play("rangedweapons_rocket", {object=obj})
				obj:set_velocity({x=dir.x * 60, y=dir.y * 60, z=dir.z * 60})

				obj:setyaw(yaw + math.pi)
				proj_dir = dir
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
				end
			end
		end
		end
	end,
})

local rangedweapons_forceblast = {
	timer = 0,
initial_properties = {
	physical = true,
	hp_max = 420,
	glow = 30,
	visual = "sprite",
	visual_size = {x=0.4, y=0.4,},
	textures = {"rangedweapons_force_bullet.png"},
	lastpos = {},
     collide_with_objects = false,
	collisionbox = {-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
},

}
rangedweapons_forceblast.on_step = function(self, dtime, moveresult)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	proj_dir = proj_dir or ({x=0,y=0,z=0})


if self.timer > 10 then
self.object:remove()
end

if self.timer > 0.05 then
self.object:set_properties({collide_with_objects = true})
end

if moveresult.collides == true then
if moveresult.collisions[1] ~= nil then

if moveresult.collisions[1].type == "object" then
if moveresult.collisions[1].object:is_player() then

moveresult.collisions[1].object:add_player_velocity({x=proj_dir.x * 20, y=5+ (proj_dir.y * 20), z=proj_dir.z * 20})
			else
moveresult.collisions[1].object:add_velocity({x=proj_dir.x * 20, y=5+ (proj_dir.y * 20), z=proj_dir.z * 20})

end
	minetest.add_particle({
		pos = ({x = pos.x, y = pos.y, z = pos.z}),
		velocity ={x=0,y=0,z=0},
          	acceleration ={x=0,y=0,z=0},
		expirationtime = 0.20,
		size = 16,
		collisiondetection = true,
		collision_removal = false,
		vertical = false,
		texture = "rangedweapons_force_blast.png",
		glow = 20,
          animation = {type="vertical_frames", aspect_w=64, aspect_h=64, length = 0.20,},
	})
	self.object:remove()
end

if moveresult.collisions[1].type == "node" then

local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 7)
		for k, obj in pairs(objs) do

if obj:get_pos() then
posd_x = pos.x - obj:get_pos().x 
posd_y = pos.y - obj:get_pos().y 
posd_z = pos.z - obj:get_pos().z 
else
posd_x = 1
posd_y = 1
posd_z = 1
end


if posd_y < 0 and posd_y > -1 then posd_y = -1 end
if posd_y > 0 and posd_y < 1 then posd_y = 1 end

if posd_y > 0 then posd_y=posd_y*3 end

posd_y = (posd_y + 0.5) * (((math.abs(posd_x)+0.5)+(math.abs(posd_z)+0.5))/2)

if posd_y > -1.0 and posd_y < 0 then posd_y = -1.0 end

			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:forceblast" then
	obj:add_velocity({x=10*(-posd_x), y=30*(-1/posd_y), z=10*(-posd_z)})
		self.object:remove()
end
			else
	obj:add_player_velocity({x=30*((-posd_x)/(1+math.abs(posd_x))), y=25*(-1/posd_y), z=30*((-posd_z)/(1+math.abs(posd_z)))})
		self.object:remove()
 
end
end

	minetest.add_particle({
		pos = ({x = pos.x, y = pos.y, z = pos.z}),
		velocity ={x=0,y=0,z=0},
          	acceleration ={x=0,y=0,z=0},
		expirationtime = 0.20,
		size = 128,
		collisiondetection = true,
		collision_removal = false,
		vertical = false,
		texture = "rangedweapons_force_blast.png",
		glow = 20,
          animation = {type="vertical_frames", aspect_w=64, aspect_h=64, length = 0.20,},
	})
			self.object:remove()
		end

	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end
end
end	


minetest.register_entity("rangedweapons:forceblast", rangedweapons_forceblast)
