image_speed = 0;   // para os quadros não ficarem trocando sozinhos

// Mouse em cima? Mostra o quadro 2. Senão, o quadro 1
if (position_meeting(mouse_x, mouse_y, id)) {
    image_index = 1;
} else {
    image_index = 0;
}