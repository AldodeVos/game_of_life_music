draw_set_alpha(0.5);
draw_line_width_color(begin_point_x,y,begin_point_x+button_range,y,global.scale*10,$999999,$999999);
draw_set_alpha(1);
draw_line_width_color(begin_point_x,y,x,y,global.scale*10,$999999,$999999);
draw_self();

draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_set_font(font2);
draw_text_ext_transformed_color(begin_point_x,y-(room_height/20),"VOLUME: " + string(round(volume_goal)),5,room_width,global.scale*0.75,global.scale*0.75,0,$999999,$999999,$999999,$999999,1);
