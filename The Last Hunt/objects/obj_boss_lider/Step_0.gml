// ---------- DERROTADO: fica parado e depois vai para o duelo final ----------
if (derrotado) {
    image_blend = c_gray;
    contador_fim -= 1;
    if (contador_fim <= 0) {
        global.duelo_final = true;    // avisa a sala do duelo que é o duelo final
        global.duelo_nivel = 3;       // o mais difícil
        global.sala_depois = sala_flashback;   // provisório: depois vai para o flashback
        room_goto(sala_duelo);
    }
    exit;
}

// Fase da luta: muda conforme a vida cai
var nova_fase = 1;
if (vida <= vida_max * 2 / 3) {
    nova_fase = 2;
}
if (vida <= vida_max / 3) {
    nova_fase = 3;
}
if (nova_fase != fase_boss) {
    fase_boss = nova_fase;
    tremer(14);
    piscar = 25;
}

// Ele vê o jogador? (perto e sem parede no meio)
var ve_jogador = false;
if (instance_exists(obj_player)) {
    var parede_no_meio = collision_line(x, y, obj_player.x, obj_player.y, obj_parede, false, true);
    ve_jogador = (distance_to_object(obj_player) < alcance) && !parede_no_meio;
}

if (ve_jogador) {
    if (!acordou) {
        acordou = true;
        tremer(10);
    }

    var ang = point_direction(x, y, obj_player.x, obj_player.y);
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    image_angle = ang;

    // ---------- MOVIMENTO: mantém distância e anda de lado ----------
    var vel = velocidade + (fase_boss - 1) * 0.5;

    tempo_lado -= 1;
    if (tempo_lado <= 0) {
        lado = -lado;
        tempo_lado = irandom_range(60, 150);
    }

    var radial = 0;
    if (dist < distancia_ideal - 80) {
        radial = -vel;
    } else if (dist > distancia_ideal + 80) {
        radial = vel;
    }

    var vx = lengthdir_x(radial, ang) + lengthdir_x(vel * 0.7 * lado, ang + 90);
    var vy = lengthdir_y(radial, ang) + lengthdir_y(vel * 0.7 * lado, ang + 90);

    if (place_meeting(x + vx, y, obj_parede) || place_meeting(x, y + vy, obj_parede)) {
        lado = -lado;   // bateu na parede: vai para o outro lado
    }
    if (!place_meeting(x + vx, y, obj_parede)) {
        x += vx;
    }
    if (!place_meeting(x, y + vy, obj_parede)) {
        y += vy;
    }

    // ---------- ATAQUE 1: rajada de tiros ----------
    if (rajada > 0) {
        tempo_rajada -= 1;
        if (tempo_rajada <= 0) {
            var tiro = instance_create_layer(x, y, "Instances", obj_bala_inimiga);
            tiro.direction = ang + random_range(-6, 6);
            tiro.image_angle = tiro.direction;
            tiro.speed = 7;
            rajada -= 1;
            tempo_rajada = 8;
            if (rajada <= 0) {
                recarga = 120 - fase_boss * 15;   // descanso entre as rajadas
            }
        }
    } else if (recarga <= 0) {
        rajada = 2 + fase_boss;   // 3, 4 ou 5 tiros
        tempo_rajada = 20;        // um instante de preparação antes do primeiro
    }

    // ---------- ATAQUE 2: dinamite (a partir da fase 2) ----------
    if (fase_boss >= 2 && recarga_dinamite <= 0) {
        var n = 1;
        if (fase_boss == 3) {
            n = 2;
        }
        for (var i = 0; i < n; i++) {
            var d = instance_create_layer(x, y, "Instances", obj_dinamite);
            // A primeira cai em você. A segunda cai por perto.
            d.alvo_x = obj_player.x + i * random_range(-90, 90);
            d.alvo_y = obj_player.y + i * random_range(-90, 90);
        }
        recarga_dinamite = 300 - fase_boss * 60;
    }
}

// Os tempos de espera vão diminuindo (a rajada pausa o tempo da recarga)
if (recarga > 0 && rajada <= 0) {
    recarga -= 1;
}
if (recarga_dinamite > 0) {
    recarga_dinamite -= 1;
}

// Pisca de vermelho ao levar um tiro
if (piscar > 0) {
    piscar -= 1;
    image_blend = c_red;
} else {
    image_blend = c_white;
}