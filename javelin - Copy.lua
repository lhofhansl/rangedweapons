


minetest.register_craftitem("rangedweapons:thrown_javelin", {
	wield_scale = {x=2.0,y=2.0,z=1.0},
	inventory_image = "rangedweapons_thrown_javelin.png",
})

minetest.register_craftitem("rangedweapons:javelin", {
		description = "" ..core.colorize("#35cdff","Javelin\n") ..core.colorize("#FFFFFF", "Mele damage: 9\n") ..core.colorize("#FFFFFF", "Mele range: 5\n")..core.colorize("#FFFFFF", "Full punch interval: 1.25\n")  ..core.colorize("#FFFFFF", "Ranged damage: 4-16\n") ..core.colorize("#FFFFFF", "Accuracy: 100%\n") ..core.colorize("#FFFFFF", "Mob knockback: 10\n") ..core.colorize("#FFFFFF", "Critical chance: 15%\n") ..core.colorize("#FFFFFF", "Critical damage: 25-45\n") ..core.colorize("#FFFFFF", "javelin survival rate: 95%\n")..core.colorize("#FFFFFF", "Projectile gravity: 4\n") ..core.colorize("#FFFFFF", "Projectile velocity: 20\n")..core.colorize("#ffc000", "Right-click to throw, Left-click to stab") ,
	wield_scale = {x=2.0,y=2.0,z=1.0},
	range = 5,
	stack_max= 10,
	inventory_image = "rangedweapons_javelin.png",
	on_secondary_use = function(itemstack, user, pointed_thing)
			if not minetest.setting_getbool("creative_mode") then itemstack:take_item()
		end
		if pointed_thing.type ~= "nothing" then
			local pointed = minetest.get_pointed_thing_position(pointed_thing)
			if vector.distance(user:getpos(), pointed) < 8 then
				return itemstack
			end
		end
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir then
			pos.y = pos.y + 1.5
			local obj = minetest.add_entity(pos, "rangedweapons:javelin")
			if obj then
				minetest.sound_play("rangedweapons_throw", {object=obj})
				obj:setvelocity({x=dir.x * 20, y=dir.y * 20, z=dir.z * 20})
				obj:setacceleration({x=dir.x * -1, y=-4, z=dir.z * -1})
				obj:setyaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
				end
			end
		end
		return itemstack
	end,
	tool_capabilities = {
		full_punch_interval = 1.25,
		max_drop_level = 0,
		groupcaps = {
			stabby = {times={[1]=0.25, [2]=0.50, [3]=0.75}, uses=0, maxlevel=1},
		},
		damage_groups = {fleshy=9,knockback=10},
	}
})

local rangedweapons_javelin = {
	physical = false,
	timer = 0,
	visual = "wielditem",
	visual_size = {x=0.5, y=0.5,},
	textures = {"rangedweapons:thrown_javelin"},
	lastpos= {},
	collisionbox = {0, 0, 0, 0, 0, 0},
}
rangedweapons_javelin.on_step = function(self, dtime)
	self.timer = self.timer + dtime
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)

	if self.timer > 0.15 then
		local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "rangedweapons:javelin" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 15 then
					local damage = math.random(25,45)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=20},
					}, nil)
					minetest.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
			if not minetest.setting_getbool("creative_mode") and math.random(1, 100) <= 95 then
				minetest.add_item(self.lastpos, "rangedweapons:javelin")
			end
					else
					local damage = math.random(4,16)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=10},
					}, nil)
					minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
			if not minetest.setting_getbool("creative_mode") and math.random(1, 100) <= 95 then
				minetest.add_item(self.lastpos, "rangedweapons:javelin")
			end
				end
			end
			else

				if math.random(1, 100) <= 15 then
				local damage = math.random(25,45)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					minetest.sound_play("crit", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
			if not minetest.setting_getbool("creative_mode") and math.random(1, 100) <= 95 then
				minetest.add_item(self.lastpos, "rangedweapons:javelin")
			end
				else
				local damage = math.random(4,16)
				obj:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = damage},
				}, nil)
				minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
			if not minetest.setting_getbool("creative_mode") and math.random(1, 100) <= 95 then
				minetest.add_item(self.lastpos, "rangedweapons:javelin")
			end
		end
	end
end
end
	if self.lastpos.x ~= nil then
		if minetest.registered_nodes[node.name].walkable then
			if not minetest.setting_getbool("creative_mode") and math.random(1, 100) <= 95 then
				minetest.add_item(self.lastpos, "rangedweapons:javelin")
			end
			minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
			self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

minetest.register_entity("rangedweapons:javelin", rangedweapons_javelin)



