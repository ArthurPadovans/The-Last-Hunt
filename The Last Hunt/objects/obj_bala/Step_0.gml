// Se a bala saiu da sala, ela some
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}

// Se bater na parede, some
if (place_meeting(x, y, obj_parede)) {
	instance_destroy();
}

// Contagem do tempo de vida
vida -= 1;
if (vida <= 0) {
    instance_destroy();
}