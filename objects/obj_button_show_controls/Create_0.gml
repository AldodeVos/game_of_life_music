x = room_width - room_width/14;
y = room_height/14;
y_scale = room_width/14/64;
block_height = obj_controls.block_height;
last_browser_size = [browser_width,browser_height];
show_controls = -1;
drag = false; //this is for click_depth in obj_controls
controls_text = "CONTROLS: \n\nLeft-click = place block \n\nRight-click = erase block \n\nBackspace = erase all \n\nSpace/double tap = (un)pause \n\nL and J = speed control \n\nP and I = volume control \n\nT = tonality \n\nH = hold \n\nK = next step (quantized)\n\nG = last step (quantized)";