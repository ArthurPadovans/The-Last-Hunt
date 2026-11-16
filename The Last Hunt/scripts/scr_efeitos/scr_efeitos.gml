// Faz a tela tremer (quanto maior o número, mais forte)
function tremer(_forca) {
    if (instance_exists(obj_controle)) {
        obj_controle.tremor = max(obj_controle.tremor, _forca);
    }
}

// Faz o fundo colorido piscar (1 = piscada completa)
function piscar_fundo(_forca) {
    if (instance_exists(obj_fundo_externo)) {
        if (obj_fundo_externo.piscar_ligado) {
            obj_fundo_externo.piscada = max(obj_fundo_externo.piscada, _forca);
        }
    }
}

// Respingos de sangue, espirrando na direção do tiro
function respingo_sangue(_x, _y, _ang, _qtd) {
    repeat (_qtd) {
        var a = _ang + random_range(-45, 45);
        var d = random_range(4, 50);
        instance_create_layer(_x + lengthdir_x(d, a), _y + lengthdir_y(d, a), "Instances", obj_sangue);
    }
}

// Qual sprite de "morto" combina com cada personagem.
// Para um personagem novo, crie o sprite e acrescente um "case" aqui.
function sprite_do_morto(_spr) {
    switch (_spr) {
        case spr_inimigo:
            return spr_inimigo_morto;
        case spr_player:
            return spr_player_morto;
    }
    return _spr;   // sem sprite de morto: usa o próprio desenho do personagem
}

// Tudo o que acontece quando alguém morre
function efeito_morte(_x, _y, _ang, _spr) {
    respingo_sangue(_x, _y, _ang, 14);

    // Poça embaixo do corpo
    repeat (4) {
        instance_create_layer(_x + random_range(-8, 8), _y + random_range(-8, 8), "Instances", obj_sangue);
    }

    // O corpo fica no chão, com o sprite de morto
    var corpo = instance_create_layer(_x, _y, "Instances", obj_corpo);
    corpo.sprite_index = sprite_do_morto(_spr);
    corpo.image_angle = _ang + random_range(-30, 30);
    corpo.image_yscale = choose(1, -1);   // espelha ao acaso, para os corpos não ficarem todos iguais

    tremer(6);
    piscar_fundo(1);   // o fundo pisca
}

// Dá pontos por uma morte, aumenta o combo e mostra "+pontos" no lugar da morte
function pontuar(_x, _y, _base) {
    if (!instance_exists(obj_controle)) {
        exit;
    }

    with (obj_controle) {
        combo += 1;
        combo_tempo = 180;   // 180 passos = 3 segundos para a próxima morte
        maior_combo = max(maior_combo, combo);

        var ganho = _base * combo;
        pontos += ganho;

        var p = instance_create_layer(_x, _y, "Instances", obj_popup);
        p.texto = "+" + string(ganho);
    }
}