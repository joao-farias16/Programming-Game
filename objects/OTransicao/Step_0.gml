if indo {
	image_alpha += 0.05
	
	if image_alpha >= 1 {
		image_alpha = 1
		room_goto(proxima_sala)
		indo = false
	}
}
else {
	if image_alpha > 0 {
		image_alpha -= 0.05
	}
}