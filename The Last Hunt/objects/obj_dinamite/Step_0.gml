if (!pousou) {
    // Voa até o ponto marcado
    var dist = point_distance(x, y, alvo_x, alvo_y);
    if (dist <= velocidade_d) {
        x = alvo_x;
        y = alvo_y;
        pousou = true;
    } else {
        var ang = point_direction(x, y, alvo_x, alvo_y);
        x += lengthdir_x(velocidade_d, ang);
        y += lengthdir_y(velocidade_d, ang);
    }
    image_angle += 15;   // gira no ar
} else {
    // Pavio queimando: pisca e explode
    pavio -= 1;
    if (pavio mod 10 < 5) {
        image_blend = c_red;
    } else {
        image_blend = c_white;
    }
    if (pavio <= 0) {
        instance_create_layer(x, y, "Instances", obj_explosao);
        instance_destroy();
    }
}