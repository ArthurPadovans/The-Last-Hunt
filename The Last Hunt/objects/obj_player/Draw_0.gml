// Pernas: viradas para onde ele anda
var n = sprite_get_number(spr_player_pernas);
var f_pernas = 0;
if (andando && n > 1) {
    f_pernas = 1 + (floor(pernas_frame) mod (n - 1));
}
draw_sprite_ext(spr_player_pernas, f_pernas, x, y, 1, 1, direcao_pernas, c_white, 1);

// Corpo com a arma: virado para o mouse
draw_sprite_ext(sprites_arma[arma], floor(ataque_frame), x, y, 1, 1, image_angle, c_white, 1);