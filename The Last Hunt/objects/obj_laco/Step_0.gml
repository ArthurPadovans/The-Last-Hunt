// Se o dono morreu, o laço some
if (!instance_exists(dono)) {
    instance_destroy();
    exit;
}

if (estado == 0) {
    // ---------- VOANDO ----------
    // Bateu na parede ou foi longe demais: some
    if (collision_point(x, y, obj_parede, false, true) != noone || point_distance(x, y, inicio_x, inicio_y) > alcance_max) {
        instance_destroy();
        exit;
    }

    // Pegou o jogador?
    var p = collision_circle(x, y, 14, obj_player, false, true);
    if (p != noone) {
        estado = 1;
        alvo = p;
        speed = 0;
        tremer(8);
    }
}
else {
    // ---------- PUXANDO O JOGADOR ----------
    // Se o jogador morreu, solta
    if (!instance_exists(alvo)) {
        instance_destroy();
        exit;
    }

    // O laço fica preso no jogador
    x = alvo.x;
    y = alvo.y;

    // A faca corta o laço
    if (alvo.arma == 2 && mouse_check_button_pressed(mb_left)) {
        tremer(4);
        instance_destroy();
        exit;
    }

    // Puxa o jogador em direção ao boss (sem atravessar paredes)
    var ang = point_direction(alvo.x, alvo.y, dono.x, dono.y);
    var px = lengthdir_x(puxao, ang);
    var py = lengthdir_y(puxao, ang);
    with (alvo) {
        if (!place_meeting(x + px, y, obj_parede)) {
            x += px;
        }
        if (!place_meeting(x, y + py, obj_parede)) {
            y += py;
        }
    }

    // Chegou perto demais do boss: morre
    if (point_distance(alvo.x, alvo.y, dono.x, dono.y) < 45) {
        efeito_morte(alvo.x, alvo.y, point_direction(dono.x, dono.y, alvo.x, alvo.y), alvo.sprite_index);
        with (alvo) {
            instance_destroy();
        }
        instance_destroy();
        exit;
    }

    // O laço cansa e solta sozinho
    tempo -= 1;
    if (tempo <= 0) {
        instance_destroy();
        exit;
    }
}