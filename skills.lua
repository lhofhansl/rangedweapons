minetest.register_on_joinplayer(function(player)
local meta = player:get_meta()
if meta:get_int("handgun_skill") == 0
then
	meta:set_int("handgun_skill",100)
end
if meta:get_int("mp_skill") == 0
then
	meta:set_int("mp_skill",100)
end
if meta:get_int("smg_skill") == 0
then
	meta:set_int("smg_skill",100)
end
if meta:get_int("shotgun_skill") == 0
then
	meta:set_int("shotgun_skill",100)
end
if meta:get_int("heavy_skill") == 0
then
	meta:set_int("heavy_skill",100)
end
if meta:get_int("arifle_skill") == 0
then
	meta:set_int("arifle_skill",100)
end
if meta:get_int("revolver_skill") == 0
then
	meta:set_int("revolver_skill",100)
end
if meta:get_int("rifle_skill") == 0
then
	meta:set_int("rifle_skill",100)
end
if meta:get_int("throw_skill") == 0
then
	meta:set_int("throw_skill",100)
end
end)


minetest.register_chatcommand("gunskills", {
	func = function(name, param)
	for _, player in pairs(minetest.get_connected_players()) do
	local meta = player:get_meta()
local handguns = meta:get_int("handgun_skill")
local mps = meta:get_int("mp_skill") 
local smgs = meta:get_int("smg_skill")  
local shotguns = meta:get_int("shotgun_skill") 
local heavy = meta:get_int("heavy_skill") 
local arifle = meta:get_int("arifle_skill")
local revolver = meta:get_int("revolver_skill")
local rifle = meta:get_int("rifle_skill")
local throw = meta:get_int("throw_skill")
		minetest.show_formspec(name, "rangedweapons:gunskills_form",
"size[11,7]"..
"label[0,0;Gun efficiency: increases damage, accuracy and crit chance.]"..
"image[0,1;1,1;rangedweapons_handgun_img.png]"..
"label[1,1.2;Handgun efficiency: " .. handguns .. "%]"..
"image[0,2;1,1;rangedweapons_machinepistol_img.png]"..
"label[1,2.2;M.Pistol efficiency: " .. mps .. "%]"..
"image[0,3;1,1;rangedweapons_smg_img.png]"..
"label[1,3.2;S.M.G efficiency: " .. smgs .. "%]"..
"image[0,4;1,1;rangedweapons_shotgun_img.png]"..
"label[1,4.2;Shotgun efficiency: " .. shotguns .. "%]"..
"image[0,5;1,1;rangedweapons_heavy_img.png]"..
"label[1,5.2;Heavy.MG efficiency: " .. heavy .. "%]"..
"image[0,6;1,1;rangedweapons_arifle_img.png]"..
"label[1,6.2;A.rifle efficiency: " .. arifle .. "%]"..
"image[5,1;1,1;rangedweapons_revolver_img.png]"..
"label[6,1.2;Revl./mgn. efficiency: " .. revolver .. "%]"..
"image[5,2;1,1;rangedweapons_rifle_img.png]"..
"label[6,2.2;Rifle efficiency: " .. rifle .. "%]"..
"image[5,3;1,1;rangedweapons_yeetable_img.png]"..
"label[6,3.2;Throwing efficiency: " .. throw .. "%]"..
"button_exit[9,0;2,1;exit;Done]")

end
	end
})

	local timer = 0
minetest.register_globalstep(function(dtime, player)
	timer = timer + dtime;
	if timer >= 60.0 then
	for _, player in pairs(minetest.get_connected_players()) do
	local meta = player:get_meta()
local handguns = meta:get_int("handgun_skill")
local mps = meta:get_int("mp_skill") 
local smgs = meta:get_int("smg_skill")  
local shotguns = meta:get_int("shotgun_skill") 
local heavy = meta:get_int("heavy_skill") 
local arifle = meta:get_int("arifle_skill")
local revolver = meta:get_int("revolver_skill")
local rifle = meta:get_int("rifle_skill")
local throw = meta:get_int("throw_skill")
if math.random(1, 40) == 1 then
if handguns > rweapons_min_gun_efficiency then
	meta:set_int("handgun_skill", handguns - 1) 	
    minetest.chat_send_player(player:get_player_name(), "" ..core.colorize("#ff0000","Handgun skill degraded! "))
		end
		end
if math.random(1, 40) == 1 then
if mps > rweapons_min_gun_efficiency then
	meta:set_int("mp_skill", mps - 1) 	
    minetest.chat_send_player(player:get_player_name(), "" ..core.colorize("#ff0000","Machine Pistol skill degraded! "))
		end
		end
if math.random(1, 40) == 1 then
if smgs > rweapons_min_gun_efficiency then
	meta:set_int("smg_skill", smgs - 1) 	
    minetest.chat_send_player(player:get_player_name(), "" ..core.colorize("#ff0000","S.M.G skill degraded! "))
		end
		end
if math.random(1, 40) == 1 then
if shotguns > rweapons_min_gun_efficiency then
	meta:set_int("shotgun_skill", shotguns - 1) 	
    minetest.chat_send_player(player:get_player_name(), "" ..core.colorize("#ff0000","Shotgun skill degraded! "))
		end
		end
if math.random(1, 40) == 1 then
if heavy > rweapons_min_gun_efficiency then
	meta:set_int("heavy_skill", heavy - 1) 	
    minetest.chat_send_player(player:get_player_name(), "" ..core.colorize("#ff0000","Heavy.MG skill degraded! "))
		end
		end
if math.random(1, 40) == 1 then
if arifle > rweapons_min_gun_efficiency then
	meta:set_int("arifle_skill", arifle - 1) 	
    minetest.chat_send_player(player:get_player_name(), "" ..core.colorize("#ff0000","A.Rifle skill degraded! "))
		end
		end
if math.random(1, 40) == 1 then
if revolver > rweapons_min_gun_efficiency then
	meta:set_int("revolver_skill", revolver - 1) 	
    minetest.chat_send_player(player:get_player_name(), "" ..core.colorize("#ff0000","Revolver/magnum skill degraded! "))
		end
		end
if math.random(1, 40) == 1 then
if rifle > rweapons_min_gun_efficiency then
	meta:set_int("rifle_skill", rifle - 1) 	
    minetest.chat_send_player(player:get_player_name(), "" ..core.colorize("#ff0000","Rifle skill degraded! "))
		end
		end
if math.random(1, 40) == 1 then
if throw > rweapons_min_gun_efficiency then
	meta:set_int("throw_skill", throw - 1) 	
    minetest.chat_send_player(player:get_player_name(), "" ..core.colorize("#ff0000","Throwing skill degraded! "))
		end
		end
			timer = 0
			end
				end
				end)
