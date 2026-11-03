// Enquanto está jogando, verifica se morreu ou venceu
if (estado_jogo == 0) {
    if (!instance_exists(obj_player)) {
        estado_jogo = 1;   // jogador morreu
    }
    else if (instance_number(obj_inimigo) == 0 && instance_number(obj_boss) == 0) {
        estado_jogo = 2;   // não sobrou ninguém
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