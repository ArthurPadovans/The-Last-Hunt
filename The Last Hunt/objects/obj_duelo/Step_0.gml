// 0 = o duelo vai começar
if (estado == 0) {
    espera -= 1;
    if (espera <= 0) {
        estado = 1;
    }
}
// 1 = o ponteiro anda
else if (estado == 1) {
    if (mouse_check_button_pressed(mb_left)) {
        estado = 4;    // atirou antes da hora
        flash = 1;
    } else {
        if (pausa > 0) {
            pausa -= 1;
        } else {
            angulo += velocidade_ponteiro;

            // Chegou no ponto de tensão: para um tempo e depois dispara
            if (!parou_tensao && angulo >= alvo_tensao) {
                parou_tensao = true;
                pausa = tempo_tensao;
                velocidade_ponteiro = 7;
            }

            // Bateu meio-dia
            if (angulo >= 360) {
                angulo = 360;
                estado = 2;
                tempo_janela = janela;
            }
        }
    }
}
// 2 = meio-dia: atire agora
else if (estado == 2) {
    tempo_janela -= 1;
    if (mouse_check_button_pressed(mb_left)) {
        tempo_reacao = (janela - tempo_janela) / 60;
        estado = 3;
        flash = 1;
    } else if (tempo_janela <= 0) {
        estado = 5;    // demorou demais
        flash = 1;
    }
}
// 3 = você ganhou
else if (estado == 3) {
    if (keyboard_check_pressed(vk_enter)) {
        if (global.sala_depois == sala_menu) {
            global.duelo_nivel = 0;   // acabou o jogo: o próximo começa do zero
        }
        room_goto(global.sala_depois);
    }
}
// 4 e 5 = você perdeu
else {
    if (keyboard_check_pressed(ord("Q"))) {
        room_restart();
    }
}

// O clarão branco do tiro vai sumindo
if (flash > 0) {
    flash -= 0.08;
}