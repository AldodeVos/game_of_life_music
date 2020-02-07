image_alpha = 0.5;
draw_self();

draw_set_alpha(1);
draw_set_valign(fa_center);
draw_set_halign(fa_middle);
draw_set_font(font2);
draw_text_transformed(x+global.scale*2,y+global.scale*3,"?",global.scale,global.scale,0);

if (show_controls)
{
	draw_set_font(font2);
	box_width = string_width(controls_text)*min(global.scale*0.8,y_scale*0.8)+room_height/7;
	
	draw_set_color($999999);
	draw_set_alpha(0.8);
	draw_rectangle( max(block_height,x - (box_width + block_height*0.5)),
					y + (block_height*0.5),
					x - (block_height*0.5),
					room_height - block_height*1.5,
					false);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_text_transformed(  max(block_height,x - (box_width - block_height*0.5)),
							y+block_height*1.5,
							controls_text,
							min(y_scale*0.8,global.scale*0.8),
							min(y_scale*0.8,global.scale*0.8),
							0);
}