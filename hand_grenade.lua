

minetest.register_craftitem("rangedweapons:pin", {
	wield_scale = {x=2.5,y=2.5,z=1.0},
	inventory_image = "rangedweapons_pin.png",
})
local rangedweapons_grenade_pin = {
	physical = false,
	timer = 0,
	visual = "wielditem",
	visual_size = {x=0.15, y=0.15},
	textures = {"rangedweapons:pin"},
	lastpos= {},
	collisionbox = {0, 0, 0, 0, 0, 0},
}
rangedweapons_grenade_pin.on_step = function(self, dtime, pos)
	self.timer = self.timer + dtime
	local pos = self.object:get_pos()
	local node = minetest.get_node(pos)
	if self.lastpos.x ~= nil then
		if minetest.registered_nodes[node.name].walkable then
		self.object:remove()
			minetest.sound_play("rangedweapons_bulletdrop", {pos = self.lastpos, gain = 0.8})
			end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end



minetest.register_entity("rangedweapons:grenade_pin", rangedweapons_grenade_pin)

local grenade_boom = {
	name = "rangedweapons:grenade_explosion",
	--description = "DuN mInD mEh...",
	radius = 3,
	tiles = {
		side = "rangedweapons_invisible.png",
		top = "rangedweapons_invisible.png",
		bottom = "rangedweapons_invisible.png",
		burning = "rangedweapons_invisible.png"
	},
}
	local gtimer = 0
minetest.register_craftitem("rangedweapons:hand_grenade", {
	stack_max= 1,
	wield_scale = {x=1.1,y=1.1,z=1.05},
		description = "" ..core.colorize("#35cdff","Hand grenade\n") ..core.colorize("#FFFFFF", "Explosion radius: 3\n")..core.colorize("#FFFFFF", "Throw force: 12\n")  ..core.colorize("#FFFFFF", "Grenade gravitational pull: 6\n") ..core.colorize("#ffc000", "Right-click to unpin, Left click to throw after unpinning\n") ..core.colorize("#ffc000", "Thrown or not, it will explode after 3 secons from unpinning, be careful!"),
	range = 0,
	inventory_image = "rangedweapons_hand_grenade.png",
	on_secondary_use = function(itemstack, user, pointed_thing)
if minetest.find_node_near(user:get_pos(), 10,"rangedweapons:antigun_block")
then
    minetest.chat_send_player(user:get_player_name(), "" ..core.colorize("#ff0000","Grenades are prohibited in this area!"))
			return itemstack
		end

		gtimer = 0
	minetest.sound_play("rangedweapons_reload_a", {user})
		itemstack = "rangedweapons:hand_grenade_nopin"
local pos = user:get_pos()
pos.y = pos.y + 1.5
local pinEnt = minetest.add_entity(pos, "rangedweapons:grenade_pin")
if pinEnt then
local dir = user:get_look_dir()
local yaw = user:get_look_yaw()
local svertical = user:get_look_vertical()
pinEnt:setvelocity({x=dir.x * -10, y=dir.y * -10, z=dir.z * -10})
pinEnt:setacceleration({x=dir.x * -5, y= -10, z=dir.z * -5})
pinEnt:set_rotation({x=0,y=yaw + math.pi,z=-svertical})
end
	 return itemstack end,
})


minetest.register_craftitem("rangedweapons:hand_grenade_nopin", {
	stack_max= 1,
	wield_scale = {x=1.1,y=1.1,z=1.05},
	description = "***HURRY UP AND THROW IT!!!***",
	range = 0,
	inventory_image = "rangedweapons_hand_grenade_nopin.png",
	groups = {not_in_creative_inventory = 1},

	on_use = function(itemstack, user, pointed_thing)
		local pos = user:get_pos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "rangedweapons:grenade")
			if obj then
				obj:set_velocity({x=dir.x * 12, y=dir.y * 12, z=dir.z * 12})
				obj:set_acceleration({x=0, y=-6, z=0})
				obj:set_yaw(yaw + math.pi)
				btimer = gtimer
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
			itemstack = ""
				end
			end
		end
		return itemstack
	end,
})

tnt.register_tnt(grenade_boom)


minetest.register_globalstep(function(dtime, player, pos)
	gtimer = gtimer + dtime;
	if gtimer >= 3.0 then
	for _, player in pairs(minetest.get_connected_players()) do
	local pos = player:get_pos()
		if player:get_wielded_item():get_name() == "rangedweapons:hand_grenade_nopin" then
		player:set_wielded_item("")
		gtimer = 0
		tnt.boom(pos, grenade_boom)
		end end end end)

local rangedweapons_grenade = {
	physical = true,
	btimer = 0,
	timer = 0,
	hp_max = 420,
	visual = "sprite",
	visual_size = {x=0.5, y=0.5},
	textures = {"rangedweapons_hand_grenade_nopin.png"},
	lastpos= {},
	collisionbox = {-0.1, -0.1, -0.1, 0.1, 0.1, 0.1},
}
rangedweapons_grenade.on_step = function(self, dtime, pos)
	local pos = self.object:get_pos()
	local node = minetest.get_node(pos)
	local btimer = btimer or 0
	self.timer = self.timer + dtime
	if self.timer > (3.0 - btimer) then
	tnt.boom(pos, grenade_boom)
	self.object:remove()
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}

end



minetest.register_entity("rangedweapons:grenade", rangedweapons_grenade)


