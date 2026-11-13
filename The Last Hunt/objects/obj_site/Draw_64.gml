var w = display_get_gui_width();
var h = display_get_gui_height();

// ---------- FUNDO DA PAGINA ----------
draw_set_color(make_color_rgb(244, 238, 226));
draw_rectangle(0, 0, w, h, false);

// ---------- BARRA DO NAVEGADOR ----------
draw_set_color(make_color_rgb(50, 50, 56));
draw_rectangle(0, 0, w, 90, false);

// Botoes da janela
draw_set_color(make_color_rgb(230, 90, 80));
draw_circle(28, 22, 8, false);
draw_set_color(make_color_rgb(235, 190, 70));
draw_circle(56, 22, 8, false);
draw_set_color(make_color_rgb(90, 200, 100));
draw_circle(84, 22, 8, false);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

// Nome da aba
draw_set_color(make_color_rgb(200, 200, 205));
draw_text_transformed(120, 22, "Charles Logan - Lendas do Oeste", 1.1, 1.1, 0);

// Barra de endereco
draw_set_color(make_color_rgb(235, 235, 238));
draw_rectangle(20, 48, w - 20, 80, false);
draw_set_color(make_color_rgb(70, 70, 76));
draw_text_transformed(36, 64, "https://www.lendasdooeste.com/personagens/charles-logan", 1.2, 1.2, 0);

// ---------- CABECALHO DO SITE ----------
draw_set_color(make_color_rgb(92, 62, 40));
draw_rectangle(0, 90, w, 150, false);
draw_set_color(make_color_rgb(244, 232, 205));
draw_text_transformed(80, 120, "LENDAS DO OESTE", 2, 2, 0);
draw_set_halign(fa_right);
draw_text_transformed(w - 80, 120, "Inicio      Personagens      Gangues      Mapas", 1.2, 1.2, 0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// ---------- TITULO E ARTIGO ----------
draw_set_color(make_color_rgb(40, 30, 25));
draw_text_transformed(80, 175, titulo_site, 4, 4, 0);

draw_set_color(make_color_rgb(130, 95, 60));
draw_text_transformed(80, 250, subtitulo_site, 1.8, 1.8, 0);

draw_set_color(make_color_rgb(200, 180, 150));
draw_line_width(80, 292, 780, 292, 2);

draw_set_color(make_color_rgb(55, 45, 40));
var py = 310;
var esc = 1.4;
var larg = 700 / esc;
for (var i = 0; i < array_length(paragrafos); i++) {
    draw_text_ext_transformed(80, py, paragrafos[i], -1, larg, esc, esc, 0);
    py += string_height_ext(paragrafos[i], -1, larg) * esc + 14;
}

// ---------- A FOTO (o rosto do Charles, em tom antigo) ----------
draw_set_color(c_white);
draw_rectangle(860, 175, 1200, 475, false);
draw_set_color(make_color_rgb(205, 205, 205));
draw_rectangle(860, 175, 1200, 475, true);
draw_set_color(make_color_rgb(214, 192, 158));
draw_rectangle(874, 189, 1186, 435, false);

var esc_foto = 240 / sprite_get_height(spr_rosto_charles);
draw_sprite_ext(spr_rosto_charles, 0, 1030, 312, esc_foto, esc_foto, 0, make_color_rgb(190, 165, 130), 0.9);

draw_set_halign(fa_center);
draw_set_color(make_color_rgb(110, 100, 90));
draw_text_transformed(1030, 455, "Retrato ilustrativo de Charles Logan", 1, 1, 0);
draw_set_halign(fa_left);

// ---------- COMENTARIOS ----------
draw_set_color(make_color_rgb(40, 30, 25));
draw_text_transformed(860, 505, "Comentarios (1.204)", 1.6, 1.6, 0);

draw_set_color(make_color_rgb(130, 95, 60));
draw_text_transformed(860, 545, "ana_do_texas", 1.2, 1.2, 0);
draw_set_color(make_color_rgb(55, 45, 40));
draw_text_ext_transformed(860, 568, "Meu bisavo contava essa historia para a gente dormir.", -1, 340 / 1.2, 1.2, 1.2, 0);

draw_set_color(make_color_rgb(130, 95, 60));
draw_text_transformed(860, 625, "joao_p", 1.2, 1.2, 0);
draw_set_color(make_color_rgb(55, 45, 40));
draw_text_ext_transformed(860, 648, "Imagina fazer tudo isso sabendo que estava morrendo.", -1, 340 / 1.2, 1.2, 1.2, 0);

// ---------- DICA PISCANDO ----------
if ((current_time div 500) mod 2 == 0) {
    draw_set_halign(fa_center);
    draw_set_color(make_color_rgb(120, 110, 100));
    draw_text(w / 2, h - 24, "Clique ou aperte ENTER para continuar");
    draw_set_halign(fa_left);
}

draw_set_color(c_white);