if keyboard_check(vk_down) or mouse_wheel_down() {
	y_cam += 50
}

if keyboard_check(vk_up) or mouse_wheel_up() {
	y_cam -= 50
}

y_cam = clamp(y_cam, 0, room_height - 1080)

camera_set_view_pos(cam, 0, y_cam)