var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

if (mouse_check_button_pressed(mb_left)) {
	if (point_in_rectangle(mx, my, 641, 16, 654, 29)) {
        with OTransicao {
			indo = true
			proxima_sala = TelaNiveis
		}
    }
}