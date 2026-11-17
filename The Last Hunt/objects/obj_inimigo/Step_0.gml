// ---------- ATORDOADO: caído no chão, sem ver nem atirar ----------
if (atordoado > 0) {
    atordoado -= 1;
    image_blend = c_gray;

    // Desliza um pouco com o empurrão, sem atravessar parede
    if (!place_meeting(x + emp_x, y, obj_parede)) {
        x += emp_x;
    }
    if (!place_meeting(x, y + emp_y, obj_parede)) {
        y += emp_y;
    }
    emp_x *= 0.85;
    emp_y *= 0.85;

    // Acordou: já vem atrás do jogador, mas sem atirar na hora
    if (atordoado <= 0) {
        image_blend = c_white;
        estado = 1;
        tempo_perdido = 0;
        recarga = max(recarga, tempo_reacao);
        if (instance_exists(obj_player)) {
            ult_x = obj_player.x;
            ult_y = obj_player.y;
        }
    }
    exit;   // enquanto está caído, ignora todo o resto do evento
}

// Ele vê o jogador? (perto e sem parede no meio)
var ve_jogador = false;

if (instance_exists(obj_player)) {
    var perto = distance_to_object(obj_player) < alcance;
    var parede_no_meio = collision_line(x, y, obj_player.x, obj_player.y, obj_parede, false, true);
    ve_jogador = perto && !parede_no_meio;
}

if (ve_jogador) {
    // Acabou de notar o jogador: demora um pouquinho para reagir
    if (estado == 0) {
                recarga = max(recarga, tempo_reacao);
    }
    estado = 1;
    tempo_perdido = 0;
    ult_x = obj_player.x;
    ult_y = obj_player.y;
}

// ---------- PERSEGUINDO ----------
if (estado == 1) {
    var ang = point_direction(x, y, ult_x, ult_y);
    var distancia = point_distance(x, y, ult_x, ult_y);
    image_angle = ang;

    // Anda até o jogador (mas para a uma certa distância para atirar)
    if ((ve_jogador && distancia > 120) || (!ve_jogador && distancia > 8)) {
        var vx = lengthdir_x(velocidade, ang);
        var vy = lengthdir_y(velocidade, ang);
        if (!place_meeting(x + vx, y, obj_parede)) {
            x += vx;
        }
        if (!place_meeting(x, y + vy, obj_parede)) {
            y += vy;
        }
    }

        // Atira
    if (ve_jogador && recarga <= 0) {
        var bala = instance_create_layer(x, y, "Instances", obj_bala_inimiga);
        bala.direction = image_angle;
        bala.image_angle = image_angle;
        bala.speed = 6;
        tocar_som(snd_revolver, 3, 0.6);    // <- NOVA
        recarga = 60;
    }

    // Perdeu o jogador de vista: depois de 3 segundos, desiste
    if (!ve_jogador) {
        tempo_perdido += 1;
        if (tempo_perdido > 180) {
            estado = 0;
        }
    }
}
// ---------- PATRULHANDO ----------
else {
    image_angle = direcao;

    var px = lengthdir_x(velocidade * 0.6, direcao);
    var py = lengthdir_y(velocidade * 0.6, direcao);

    // Bateu na parede? Vira para outro lado
        if (place_meeting(x + px, y + py, obj_parede) || place_meeting(x + px, y + py, obj_movel)) {
        direcao = (direcao + choose(90, 180, 270)) mod 360;
    } else {
        x += px;
        y += py;
    }
}

// A recarga vai diminuindo
if (recarga > 0) {
    recarga -= 1;
}