minetest.register_globalstep(function(dtime, player)
	for _, player in pairs(minetest.get_connected_players()) do





 local w_item = player:get_wielded_item()


local controls = player:get_player_control()
if w_item:get_definition().weapon_zoom ~= nil then

	if controls.zoom then
player:hud_change(scope_hud, "text", "rangedweapons_scopehud.png")
	else
player:hud_change(scope_hud, "text", "rangedweapons_empty_icon.png")
	end

local wpn_zoom = w_item:get_definition().weapon_zoom
	if player:get_properties().zoom_fov ~= wpn_zoom then
		player:set_properties({zoom_fov = wpn_zoom})

	end

end

if w_item:get_definition().weapon_zoom == nil then
	player:hud_change(scope_hud, "text", "rangedweapons_empty_icon.png")
	if player:get_inventory():contains_item(
			"main", "binoculars:binoculars") then
		local new_zoom_fov = 10
		if player:get_properties().zoom_fov ~= new_zoom_fov then
		   player:set_properties({zoom_fov = new_zoom_fov})
		end
	else 
		local new_zoom_fov = 0
		if player:get_properties().zoom_fov ~= new_zoom_fov then
		   player:set_properties({zoom_fov = new_zoom_fov})
		end
	end
end


local u_meta = player:get_meta()
local cool_down = u_meta:get_float("rw_cooldown") or 0


if u_meta:get_float("rw_cooldown") > 0 then
u_meta:set_float("rw_cooldown", cool_down - dtime)
end

local itemstack = player:get_wielded_item()

if controls.LMB then
if player:get_wielded_item():get_definition().RW_gun_capabilities then
if
player:get_wielded_item():get_definition().RW_gun_capabilities.automatic_gun and player:get_wielded_item():get_definition().RW_gun_capabilities.automatic_gun > 0 then

rangedweapons_shoot_gun(itemstack, player)
player:set_wielded_item(itemstack)
end end

if player:get_wielded_item():get_definition().RW_powergun_capabilities then
if player:get_wielded_item():get_definition().RW_powergun_capabilities.automatic_gun and player:get_wielded_item():get_definition().RW_powergun_capabilities.automatic_gun > 0 then

rangedweapons_shoot_powergun(itemstack, player)
player:set_wielded_item(itemstack)
end end

 end



--minetest.chat_send_all(u_meta:get_float("rw_cooldown"))

if u_meta:get_float("rw_cooldown") <= 0 then
if player:get_wielded_item():get_definition().loaded_gun ~= nil then
	local itemstack = player:get_wielded_item()

if player:get_wielded_item():get_definition().loaded_sound ~= nil then
minetest.sound_play(itemstack:get_definition().loaded_sound, {pos = player:get_pos()})
end
	itemstack:set_name(player:get_wielded_item():get_definition().loaded_gun)
	player:set_wielded_item(itemstack)
end 

if player:get_wielded_item():get_definition().rw_next_reload ~= nil then
	local itemstack = player:get_wielded_item()
	if itemstack:get_definition().load_sound ~= nil then
minetest.sound_play(itemstack:get_definition().load_sound, {pos = player:get_pos()})
	end
	local gunMeta = itemstack:get_meta()
	u_meta:set_float("rw_cooldown",gunMeta:get_float("RW_reload_delay"))
	itemstack:set_name(player:get_wielded_item():get_definition().rw_next_reload)
	player:set_wielded_item(itemstack)
end
end

end end)


