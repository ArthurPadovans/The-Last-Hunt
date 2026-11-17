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
        // ---------- DUELO FINAL: o líder, ferido, também atira ----------
        t_final += 1;

        // O tiro do líder acerta: clarão vermelho e tremida forte
        if (t_final == 62) {
            flash = 1;
            flash_cor = c_red;
            sac = 20;
        }
        if (t_final > 62) {
            vermelho = min(0.55, vermelho + 0.01);
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
        // Duelo comum: Enter continua (depois da animação da queda)
        if (t_pos > 40 && keyboard_check_pressed(vk_enter)) {
            if (global.sala_depois == sala_menu) {
                global.duelo_nivel = 0;   // acabou o jogo: o próximo começa do zero
            }
            room_goto(global.sala_depois);
        }
    }
}
// 4 e 5 = você perdeu (Q tenta de novo, depois da animação)
else {
    if (t_pos > 70 && keyboard_check_pressed(ord("Q"))) {
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

// ---------- ANIMAÇÃO DOS PERSONAGENS ----------
if (estado >= 3) {
    t_pos += 1;
}

// Você ganhou (duelo comum): você atira e o inimigo cai
if (estado == 3 && !eh_final) {
    if (t_pos == 1) { anim_j = 1; }
    if (t_pos == 16) { anim_i = 2; }
}
// Duelo final: você atira, o líder ferido saca e atira também, os dois caem
if (estado == 3 && eh_final) {
    if (t_pos == 1) { anim_j = 1; }
    if (t_pos == 45) { anim_i = 1; }
    if (t_pos == 66) { anim_j = 2; }
    if (t_pos == 95) { anim_i = 2; }
}
// Atirou cedo demais: você atira, o inimigo responde e você cai
if (estado == 4) {
    if (t_pos == 1) { anim_j = 1; }
    if (t_pos == 16) { anim_i = 1; }
    if (t_pos == 36) { anim_j = 2; }
}
// Muito lento: o inimigo saca e você cai
if (estado == 5) {
    if (t_pos == 1) { anim_i = 1; }
    if (t_pos == 20) { anim_j = 2; }
}

// Avança os quadros de cada um
fi = duelo_anim(anim_i, fi, q_parado, q_saca, q_cai, vel_parado, vel_saca, vel_cai);
fj = duelo_anim(anim_j, fj, q_parado, q_saca, q_cai, vel_parado, vel_saca, vel_cai);