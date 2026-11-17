// ================= MENU DE PAUSA =================
// Estas funções rodam dentro do obj_controle.

function pausa_iniciar() {
    audio_iniciar();    // garante que os volumes existem

    pausado = true;
    window_set_cursor(cr_default);    // mostra a setinha do mouse

    // "Foto" da tela, para servir de fundo do menu
    p_foto = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);

    p_espera = 3;         // ignora teclas e cliques nos primeiros passos
    p_fechando = 0;       // contagem para fechar o menu
    p_destino = noone;    // sala para onde ir ao fechar (noone = continua jogando)
    p_tela = 0;           // 0 = menu, 1 = volume, 2 = ajuda
    p_arrastando = -1;    // qual barra de volume está sendo arrastada

    var w = display_get_gui_width();
    var h = display_get_gui_height();

    p_nomes = ["CONTINUAR", "VOLUME", "AJUDA", "VOLTAR AO MENU"];
    p_btn_larg = 460;
    p_btn_alt = 64;
    p_btn_x = w / 2 - p_btn_larg / 2;
    p_btn_y0 = h * 0.30;
    p_btn_esp = 84;

    p_sl_x1 = w * 0.32;
    p_sl_x2 = w * 0.68;
    p_sl_y = [h * 0.40, h * 0.56];
    p_sl_nomes = ["MÚSICA", "EFEITOS"];

    p_voltar_larg = 300;
    p_voltar_alt = 60;
    p_voltar_x = w / 2 - p_voltar_larg / 2;
    p_voltar_y = h * 0.85;

    p_ajuda_teclas = ["W A S D", "MOUSE", "BOTÃO ESQUERDO", "E", "R", "Q", "ESC", "ENTER", "DUELO"];
    p_ajuda_texto = [
        "Andar",
        "Mirar",
        "Atirar / golpear com a faca",
        "Pegar a arma do chão",
        "Recarregar",
        "Reiniciar o andar",
        "Pausar o jogo",
        "Seguir para o duelo, ao vencer",
        "Clique só depois do meio-dia"
    ];

    // Congela tudo, menos o obj_controle (que é quem desenha o menu)
    instance_deactivate_all(true);
}

function pausa_atualizar() {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    // Fechando: espera uns passos para o clique não virar um tiro
    if (p_fechando > 0) {
        p_fechando -= 1;
        if (p_fechando == 0) {
            sprite_delete(p_foto);
            pausado = false;
            instance_activate_all();
            window_set_cursor(cr_none);
            if (p_destino != noone) {
                room_goto(p_destino);
            }
        }
        return;
    }

    // Nos primeiros passos, ignora teclas e cliques
    if (p_espera > 0) {
        p_espera -= 1;
        return;
    }

    var clique = mouse_check_button_pressed(mb_left);
    var esc = keyboard_check_pressed(vk_escape);

    // ---------- MENU PRINCIPAL ----------
    if (p_tela == 0) {
        if (esc) { p_fechando = 2; }

        for (var i = 0; i < array_length(p_nomes); i++) {
            var by = p_btn_y0 + i * p_btn_esp;
            if (clique && point_in_rectangle(mx, my, p_btn_x, by, p_btn_x + p_btn_larg, by + p_btn_alt)) {
                if (i == 0) { p_fechando = 2; }                          // continuar
                if (i == 1) { p_tela = 1; }                              // volume
                if (i == 2) { p_tela = 2; }                              // ajuda
                if (i == 3) { p_destino = sala_menu; p_fechando = 2; }   // voltar ao menu
            }
        }
    }
    // ---------- VOLUME ----------
    else if (p_tela == 1) {
        if (esc) { p_tela = 0; }

        if (clique) {
            for (var j = 0; j < 2; j++) {
                if (point_in_rectangle(mx, my, p_sl_x1 - 20, p_sl_y[j] - 30, p_sl_x2 + 20, p_sl_y[j] + 30)) {
                    p_arrastando = j;
                }
            }
            if (point_in_rectangle(mx, my, p_voltar_x, p_voltar_y, p_voltar_x + p_voltar_larg, p_voltar_y + p_voltar_alt)) {
                p_tela = 0;
            }
        }

        // Soltou o mouse: para de arrastar (nos efeitos, toca um tiro de teste)
        if (!mouse_check_button(mb_left) && p_arrastando != -1) {
            if (p_arrastando == 1) { tocar_som(snd_revolver, 6); }
            p_arrastando = -1;
        }

        // Arrastando: o volume acompanha o mouse
        if (p_arrastando != -1) {
            var v = clamp((mx - p_sl_x1) / (p_sl_x2 - p_sl_x1), 0, 1);
            if (p_arrastando == 0) {
                global.vol_musica = v;
                if (variable_global_exists("musica_id") && global.musica_id != -1) {
                    var base = variable_global_exists("musica_base") ? global.musica_base : 0.5;
                    audio_sound_gain(global.musica_id, base * global.vol_musica, 0);
                }
            } else {
                global.vol_som = v;
            }
        }
    }
    // ---------- AJUDA ----------
    else if (p_tela == 2) {
        if (esc) { p_tela = 0; }
        if (clique && point_in_rectangle(mx, my, p_voltar_x, p_voltar_y, p_voltar_x + p_voltar_larg, p_voltar_y + p_voltar_alt)) {
            p_tela = 0;
        }
    }
}

function pausa_desenhar() {
    var w = display_get_gui_width();
    var h = display_get_gui_height();
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    // Fundo: a foto do jogo parado, escurecida
    if (sprite_exists(p_foto)) {
        draw_sprite_stretched(p_foto, 0, 0, 0, w, h);
    }
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, w, h, false);
    draw_set_alpha(1);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);

    // ---------- MENU PRINCIPAL ----------
    if (p_tela == 0) {
        draw_text_transformed(w / 2, h * 0.16, "PAUSADO", 4, 4, 0);

        for (var i = 0; i < array_length(p_nomes); i++) {
            var by = p_btn_y0 + i * p_btn_esp;
            var sobre = point_in_rectangle(mx, my, p_btn_x, by, p_btn_x + p_btn_larg, by + p_btn_alt);
            draw_set_color(sobre ? make_color_rgb(140, 30, 30) : make_color_rgb(40, 40, 40));
            draw_rectangle(p_btn_x, by, p_btn_x + p_btn_larg, by + p_btn_alt, false);
            draw_set_color(c_white);
            draw_rectangle(p_btn_x, by, p_btn_x + p_btn_larg, by + p_btn_alt, true);
            draw_text_transformed(w / 2, by + p_btn_alt / 2, p_nomes[i], 2, 2, 0);
        }
    }
    // ---------- VOLUME ----------
    else if (p_tela == 1) {
        draw_text_transformed(w / 2, h * 0.16, "VOLUME", 4, 4, 0);

        var valores = [global.vol_musica, global.vol_som];
        for (var j = 0; j < 2; j++) {
            var yy = p_sl_y[j];
            var px = p_sl_x1 + (p_sl_x2 - p_sl_x1) * valores[j];

            draw_set_color(c_white);
            draw_set_halign(fa_left);
            draw_text_transformed(p_sl_x1, yy - 40, p_sl_nomes[j], 2, 2, 0);
            draw_set_halign(fa_right);
            draw_text_transformed(p_sl_x2, yy - 40, string(round(valores[j] * 100)) + "%", 2, 2, 0);

            draw_set_color(make_color_rgb(70, 70, 70));
            draw_rectangle(p_sl_x1, yy - 6, p_sl_x2, yy + 6, false);
            draw_set_color(make_color_rgb(190, 40, 40));
            draw_rectangle(p_sl_x1, yy - 6, px, yy + 6, false);
            draw_set_color(c_white);
            draw_circle(px, yy, 16, false);
        }
        draw_set_halign(fa_center);
    }
    // ---------- AJUDA ----------
    else if (p_tela == 2) {
        draw_text_transformed(w / 2, h * 0.12, "COMANDOS", 4, 4, 0);

        for (var k = 0; k < array_length(p_ajuda_teclas); k++) {
            var ly = h * 0.26 + k * 42;
            draw_set_halign(fa_right);
            draw_set_color(c_yellow);
            draw_text_transformed(w * 0.40, ly, p_ajuda_teclas[k], 2, 2, 0);
            draw_set_halign(fa_left);
            draw_set_color(c_white);
            draw_text_transformed(w * 0.43, ly, p_ajuda_texto[k], 2, 2, 0);
        }

        draw_set_halign(fa_center);
        draw_set_color(c_ltgray);
        draw_text_transformed(w / 2, h * 0.78, "Dica: a escada só abre quando todos os inimigos morrem. Se o laço te prender, use a faca e clique.", 1.4, 1.4, 0);
    }

    // ---------- BOTÃO VOLTAR (volume e ajuda) ----------
    if (p_tela != 0) {
        var sobre_v = point_in_rectangle(mx, my, p_voltar_x, p_voltar_y, p_voltar_x + p_voltar_larg, p_voltar_y + p_voltar_alt);
        draw_set_halign(fa_center);
        draw_set_color(sobre_v ? make_color_rgb(140, 30, 30) : make_color_rgb(40, 40, 40));
        draw_rectangle(p_voltar_x, p_voltar_y, p_voltar_x + p_voltar_larg, p_voltar_y + p_voltar_alt, false);
        draw_set_color(c_white);
        draw_rectangle(p_voltar_x, p_voltar_y, p_voltar_x + p_voltar_larg, p_voltar_y + p_voltar_alt, true);
        draw_text_transformed(w / 2, p_voltar_y + p_voltar_alt / 2, "VOLTAR", 2, 2, 0);
    }

    // Devolve o desenho ao normal
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_set_alpha(1);
}