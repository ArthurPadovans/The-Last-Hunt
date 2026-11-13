// Cria o cartão de título uma vez, se a cena tiver um
if (!titulo_criado) {
    titulo_criado = true;
    if (titulo != "") {
        var cartao = instance_create_layer(0, 0, "Instances", obj_titulo_cena);
        cartao.texto = titulo;
        cartao.subtitulo = subtitulo;
    }
}

// Enquanto o cartão de título está na tela, o diálogo espera
if (instance_exists(obj_titulo_cena)) {
    exit;
}

var ir_embora = false;
var texto = falas[indice][1];

// As letras vão aparecendo
if (caractere < string_length(texto)) {
    caractere += velocidade_texto;
}

// Clique, Enter ou espaço: completa a fala, ou passa para a próxima
if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    if (caractere < string_length(texto)) {
        caractere = string_length(texto);
    } else {
        indice += 1;
        caractere = 0;
        if (indice >= array_length(falas)) {
            indice = array_length(falas) - 1;   // fica na última até trocar de sala
            ir_embora = true;
        }
    }
}

// Segurar o botão direito pula a cena inteira
if (mouse_check_button(mb_right)) {
    pular += 1;
    if (pular > 40) {
        ir_embora = true;
    }
} else {
    pular = 0;
}

if (ir_embora) {
    if (proxima_sala == noone) {
        room_goto_next();
    } else {
        room_goto(proxima_sala);
    }
}