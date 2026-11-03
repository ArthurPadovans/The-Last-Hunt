// Ele vê o jogador? (perto e sem parede no meio)
var ve_jogador = false;
if (instance_exists(obj_player)) {
    var parede_no_meio = collision_line(x, y, obj_player.x, obj_player.y, obj_parede, false, true);
    ve_jogador = (distance_to_object(obj_player) < alcance) && !parede_no_meio;
}

if (ve_jogador) {
    var ang = point_direction(x, y, obj_player.x, obj_player.y);
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    image_angle = ang;

    // Mantém distância: recua se você está perto, chega mais perto se está longe
    var mov = 0;
    if (dist < distancia_ideal - 80) {
        mov = -velocidade;
    } else if (dist > distancia_ideal + 80) {
        mov = velocidade;
    }
    var vx = lengthdir_x(mov, ang);
    var vy = lengthdir_y(mov, ang);
    if (!place_meeting(x + vx, y, obj_parede)) {
        x += vx;
    }
    if (!place_meeting(x, y + vy, obj_parede)) {
        y += vy;
    }

    // Joga a dinamite no lugar onde você está agora
    if (recarga <= 0) {
        var d = instance_create_layer(x, y, "Instances", obj_dinamite);
        d.alvo_x = obj_player.x;
        d.alvo_y = obj_player.y;
        recarga = 120;
    }
}

if (recarga > 0) {
    recarga -= 1;
}

// Pisca de vermelho ao levar um tiro
if (piscar > 0) {
    piscar -= 1;
    image_blend = c_red;
} else {
    image_blend = c_white;
}