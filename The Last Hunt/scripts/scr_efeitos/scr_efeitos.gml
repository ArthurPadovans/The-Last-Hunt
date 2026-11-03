// Faz a tela tremer (quanto maior o número, mais forte)
function tremer(_forca) {
    if (instance_exists(obj_controle)) {
        obj_controle.tremor = max(obj_controle.tremor, _forca);
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

// Tudo o que acontece quando alguém morre
function efeito_morte(_x, _y, _ang, _spr) {
    respingo_sangue(_x, _y, _ang, 14);

    // Poça embaixo do corpo
    repeat (4) {
        instance_create_layer(_x + random_range(-8, 8), _y + random_range(-8, 8), "Instances", obj_sangue);
    }

    // O corpo fica no chão
    var corpo = instance_create_layer(_x, _y, "Instances", obj_corpo);
    corpo.sprite_index = _spr;
    corpo.image_angle = _ang + random_range(-30, 30);

    tremer(6);
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