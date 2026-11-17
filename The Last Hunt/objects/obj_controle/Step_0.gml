// ---------- CARTÃO DE CAPÍTULO: congela o jogo enquanto ele aparece ----------
if (cartao_ativo) {
    if (!cartao_congelou) {
        instance_deactivate_all(true);
        instance_activate_object(obj_titulo_cena);
        cartao_congelou = true;
    }
    else if (!instance_exists(obj_titulo_cena) || obj_titulo_cena.tempo > 170) {
        instance_activate_all();
        cartao_ativo = false;
    }
    exit;
}

// ---------- PAUSA (Esc) ----------
if (pausado) {
    pausa_atualizar();
    exit;
}
if (keyboard_check_pressed(vk_escape)) {
    pausa_iniciar();
    exit;
}

// Enquanto está jogando, verifica se morreu ou venceu
if (estado_jogo == 0) {
    if (!instance_exists(obj_player)) {
        estado_jogo = 1;   // jogador morreu
    }
    // Só vence aqui se for o último andar (o que não tem escada)
    else if (instance_number(obj_inimigo) == 0 && instance_number(obj_boss) == 0 && !instance_exists(obj_escada)) {
        estado_jogo = 2;
    }
}

// O combo vai acabando; se o tempo zerar, o combo volta a zero
if (combo_tempo > 0) {
    combo_tempo -= 1;
    if (combo_tempo <= 0) {
        combo = 0;
    }
}

// Morreu: Q tenta de novo
if (estado_jogo == 1 && keyboard_check_pressed(ord("Q"))) {
    room_restart();
}

// Venceu: Enter leva para o duelo
if (estado_jogo == 2 && keyboard_check_pressed(vk_enter)) {
    // Para onde ir depois do duelo
    var proxima = room_next(room);
    if (proxima == sala_duelo) {
        global.sala_depois = sala_menu;   // era a última fase
    } else {
        global.sala_depois = proxima;
    }

    // Conta os duelos (cada um fica mais difícil)
    if (!variable_global_exists("duelo_nivel")) {
        global.duelo_nivel = 0;
    }
    global.duelo_nivel += 1;

    room_goto(sala_duelo);
}