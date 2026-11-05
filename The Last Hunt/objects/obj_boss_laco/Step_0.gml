// Ele vê o jogador? (perto e sem parede no meio)
var ve_jogador = false;
if (instance_exists(obj_player)) {
    var parede_no_meio = collision_line(x, y, obj_player.x, obj_player.y, obj_parede, false, true);
    ve_jogador = (distance_to_object(obj_player) < alcance) && !parede_no_meio;
}

if (mirando > 0) {
    // ---------- MIRANDO O LAÇO (ele fica parado) ----------
    mirando -= 1;

    // Acompanha o jogador, mas trava a mira nos últimos 15 passos (dá tempo de desviar)
    if (mirando > 15 && instance_exists(obj_player)) {
        ang_laco = point_direction(x, y, obj_player.x, obj_player.y);
    }
    image_angle = ang_laco;

    // Acabou a mira: joga o laço
    if (mirando <= 0) {
        laco = instance_create_layer(x, y, "Instances", obj_laco);
        laco.dono = id;
        laco.direction = ang_laco;
        laco.speed = 11;
        recarga = 150;
    }
}
else if (ve_jogador) {
    // ---------- ANDA E MANTÉM DISTÂNCIA ----------
    var ang = point_direction(x, y, obj_player.x, obj_player.y);
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    image_angle = ang;

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

    // Começa a mirar o laço (só se não tiver um no ar)
    if (recarga <= 0 && !instance_exists(laco)) {
        mirando = 45;   // 0,75 segundo de mira
        ang_laco = ang;
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