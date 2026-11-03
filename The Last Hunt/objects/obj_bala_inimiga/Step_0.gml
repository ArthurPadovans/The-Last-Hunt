// Some se sair da sala
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}

// Some se bater na parede
if (place_meeting(x, y, obj_parede)) {
	instance_destroy();
}