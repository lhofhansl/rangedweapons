local S = minetest.get_translator("rangedweapons")
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

local skill_list = {
	{id="handgun_skill",name="Handgun"},
	{id="mp_skill",name="Machine Pistol"},
	{id="smg_skill",name="S.M.G."}, 
	{id="shotgun_skill",name="Shotgun"},
	{id="heavy_skill",name="Heavy MG"},
	{id="arifle_skill",name="A.Rifle"},
	{id="revolver_skill",name="Revolver/magnum"},
	{id="rifle_skill",name="Rifle"},
	{id="throw_skill",name="Throwing weapons"},
}

local min_gun_efficiency = tonumber(minetest.settings:get("rangedweapons_min_gun_efficiency")) or 40
local timer = 0
minetest.register_globalstep(function(dtime, player)
	timer = timer + dtime;
	
	if timer > 60 then
		for _, player in pairs(minetest.get_connected_players()) do
			local meta = player:get_meta()
			for _,skill in ipairs(skill_list) do
				if math.random(1, 40) == 1 then
					if meta:get_int(skill.id) > min_gun_efficiency then
						meta:set_int(skill.id, meta:get_int(skill.id) - 1)
						minetest.chat_send_player(player:get_player_name(), minetest.colorize("#ff0000",S("@1 skill degraded!", S(skill.name))))
					end
				end
			end
			
			timer = 0
		end
	end
end)
