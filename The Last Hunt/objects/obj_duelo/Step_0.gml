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
        flash_cor = c_white;
        sac = 10;
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
        flash_cor = c_white;
        sac = 14;
    } else if (tempo_janela <= 0) {
        estado = 5;    // demorou demais
        flash = 1;
        flash_cor = c_white;
        sac = 10;
    }
}
// 3 = você ganhou
else if (estado == 3) {
    if (eh_final) {
        // ---------- DUELO FINAL: o líder cai, mas Charles também é atingido ----------
        t_final += 1;

        // O líder cai logo depois do seu tiro
        if (t_final > 10) {
            queda_inimigo = min(1, queda_inimigo + 0.04);
        }

        // O tiro do líder acerta: clarão vermelho e tremida forte
        if (t_final == 70) {
            flash = 1;
            flash_cor = c_red;
            sac = 20;
        }
        if (t_final > 70) {
            vermelho = min(0.55, vermelho + 0.01);
            queda_jogador = min(1, queda_jogador + 0.02);
        }

        // A tela vai escurecendo
        if (t_final > 260) {
            escuro = min(1, escuro + 0.02);
        }

        // Fim da cena: segue para a próxima sala
        if (t_final > 340) {
            global.duelo_final = false;
            global.duelo_nivel = 0;
            room_goto(global.sala_depois);
        }
    } else {
        // Duelo comum: Enter continua
        if (keyboard_check_pressed(vk_enter)) {
            if (global.sala_depois == sala_menu) {
                global.duelo_nivel = 0;   // acabou o jogo: o próximo começa do zero
            }
            room_goto(global.sala_depois);
        }
    }
}
// 4 e 5 = você perdeu
else {
    if (keyboard_check_pressed(ord("Q"))) {
        room_restart();
    }
}

// O clarão vai sumindo e a tremida também
if (flash > 0) {
    flash -= 0.08;
}
if (sac > 0.3) {
    sac *= 0.85;
} else {
    sac = 0;
}