// Só aparece se a escada existe, o jogador existe e o andar está limpo
if (!instance_exists(alvo) || !instance_exists(obj_player)) {
    exit;
}
var limpo = (instance_number(obj_inimigo) == 0 && instance_number(obj_boss) == 0);
if (!limpo || alvo.saindo) {
    exit;
}

// Se o jogador já está perto da escada, a seta some
var dist = point_distance(obj_player.x, obj_player.y, alvo.x, alvo.y);
if (dist < distancia_minima) {
    exit;
}

// A seta fica "orbitando" o jogador, apontando para a escada
var ang = point_direction(obj_player.x, obj_player.y, alvo.x, alvo.y);
var vai_e_vem = sin(current_time / 150);
var raio = 120 + vai_e_vem * 8;
var sx = obj_player.x + lengthdir_x(raio, ang);
var sy = obj_player.y + lengthdir_y(raio, ang);
var esc = 1 + vai_e_vem * 0.08;

draw_sprite_ext(spr_seta, 0, sx, sy, esc, esc, ang, c_white, 1);

// A palavra, sempre reta, em cima da seta
if (texto_seta != "") {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    draw_text_transformed(sx + 2, sy - 44 + 2, texto_seta, 1.6, 1.6, 0);
    draw_set_color(c_white);
    draw_text_transformed(sx, sy - 44, texto_seta, 1.6, 1.6, 0);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}