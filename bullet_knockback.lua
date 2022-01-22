function projectile_kb(victim,projectile,kbamount)

if victim:get_pos() and projectile:get_pos() then
rw_proj_kb_pos_x = victim:get_pos().x - projectile:get_pos().x 
rw_proj_kb_pos_y = victim:get_pos().y - projectile:get_pos().y 
rw_proj_kb_pos_z = victim:get_pos().z - projectile:get_pos().z 
else
rw_proj_kb_pos_x = 1
rw_proj_kb_pos_y = 1
rw_proj_kb_pos_z = 1
end

victim:add_player_velocity({x=kbamount*(rw_proj_kb_pos_x*2),y= kbamount*(math.abs(rw_proj_kb_pos_y)/2), z=kbamount*(rw_proj_kb_pos_z*2)})

end