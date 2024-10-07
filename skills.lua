local S = minetest.get_translator("rangedweapons")

local skill_list = {
	{id="handgun_skill",name="Handgun",img="rangedweapons_handgun_img"},
	{id="mp_skill",name="Machine Pistol",img="rangedweapons_machinepistol_img"},
	{id="smg_skill",name="S.M.G.",img="rangedweapons_smg_img"}, 
	{id="shotgun_skill",name="Shotgun",img="rangedweapons_shotgun_img"},
	{id="heavy_skill",name="Heavy MG",img="rangedweapons_heavy_img"},
	{id="arifle_skill",name="A.Rifle",img="rangedweapons_arifle_img"},
	{id="revolver_skill",name="Revolver/magnum",img="rangedweapons_revolver_img"},
	{id="rifle_skill",name="Rifle",img="rangedweapons_rifle_img"},
	{id="throw_skill",name="Throwing weapons",img="rangedweapons_yeetable_img"},
}

local min_gun_efficiency = tonumber(minetest.settings:get("rangedweapons_min_gun_efficiency")) or 40
local max_gun_efficiency = tonumber(minetest.settings:get("rangedweapons_max_gun_efficiency")) or 300
local skill_system = minetest.settings:get_bool("rangedweapons.skill_system",true)
local timer = 0

minetest.register_chatcommand("gunskills", {
	func = function(name, param)
		local meta = minetest.get_player_by_name(name):get_meta()
		local t = {"formspec_version[3]size[11,7]label[1,1;"}
		table.insert(t,S("Gun efficiency: increases damage, accuracy and crit chance."))
		table.insert(t,"]")
		for i,skill in ipairs(skill_list) do
			local x = i>5 and 6 or 1
			local y = (i-1)%5+1.5
			table.insert(t,"image[")
			table.insert(t,x)
			table.insert(t,",")
			table.insert(t,y)
			table.insert(t,";1,1;")
			table.insert(t,skill.img)
			table.insert(t,".png]")
			x=x+1.2
			y=y+0.5
			table.insert(t,"label[")
			table.insert(t,x)
			table.insert(t,",")
			table.insert(t,y)
			table.insert(t,";")
			table.insert(t,skill.name)
			table.insert(t,": ")
			table.insert(t,meta:contains(skill.id) and meta:get_int(skill.id) or 100)
			table.insert(t,"%]")
		end
		table.insert(t,"button_exit[9,6;2,1;exit;"..S("Done").."]")
		minetest.show_formspec(name, "rangedweapons:gunskills_form",table.concat(t))
	end
})

if skill_system then
	minetest.register_globalstep(function(dtime, player)
		timer = timer + dtime;
		
		if timer > 60 then
			for _, player in pairs(minetest.get_connected_players()) do
				local meta = player:get_meta()
				for _,skill in ipairs(skill_list) do
					if math.random(1, 40) == 1 then
						local skill_value = meta:contains(skill.id) and meta:get_int(skill.id) or 100
						if skill_value > min_gun_efficiency then
							meta:set_int(skill.id, skill_value - 1)
							minetest.chat_send_player(player:get_player_name(), minetest.colorize("#ff0000",S("@1 skill degraded!", S(skill.name))))
						end
					end
				end
				
				timer = 0
			end
		end
	end)
end

local skill_name_from_id = {}
for _,skill in ipairs(skill_list) do
	skill_name_from_id[skill.id] = skill.name
end
rangedweapons_gain_skill = function(player,skill,chance)
	if skill_system then
		if math.random(1, chance) == 1 then
			local meta = player:get_meta()
			local skill_value = meta:contains(skill) and meta:get_int(skill) or 100
			if skill_value < max_gun_efficiency then
				meta:set_int(skill, skill_value + 1)
				minetest.chat_send_player(player:get_player_name(), "" ..core.colorize("#25c200",S("You've improved your @1 skill!", S(skill_name_from_id[skill]))))
			end
		end
	end
end

if not skill_system then
	minetest.register_on_joinplayer(function(player)
		local meta = player:get_meta()
		for _,skill in ipairs(skill_list) do
			meta:set_string(skill.id, "")
		end
	end)
end