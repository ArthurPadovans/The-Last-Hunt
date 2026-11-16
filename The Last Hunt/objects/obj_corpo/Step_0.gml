// Quando a animação de queda chega no último quadro, o corpo para ali
if (image_index >= image_number - 1) {
    image_index = image_number - 1;
    image_speed = 0;
}