global.fullscreen = !global.fullscreen

window_set_fullscreen(global.fullscreen)

if !global.fullscreen {
	var base_w = 1920
	var base_h = 1080
	
	var display_w = display_get_width()
	var display_h = display_get_height()
	
	var scale = min(display_w / base_w, display_h / base_h)
	
	var final_w = base_w * scale
	var final_h = base_h * scale
	
	window_set_size(final_w, final_h)
	window_center()
}