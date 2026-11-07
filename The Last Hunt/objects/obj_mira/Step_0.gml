var n = sprite_get_number(spr_mira);

// Atirou? O tempo de espera do jogador acabou de subir: a mira fecha de uma vez
if (instance_exists(obj_player)) {
    if (obj_player.cooldown > cooldown_ant) {
        frame = n - 1;
    }
    cooldown_ant = obj_player.cooldown;
} else {
    cooldown_ant = 0;
}

// Depois vai abrindo de novo, devagar
if (frame > 0) {
    frame -= 0.35;
    if (frame < 0) {
        frame = 0;
    }
}