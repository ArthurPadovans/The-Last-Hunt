// Cria os volumes do jogo na primeira vez que for preciso (0 = mudo, 1 = máximo)
function audio_iniciar() {
    if (!variable_global_exists("vol_som")) {
        global.vol_som = 1;       // volume dos efeitos
        global.vol_musica = 1;    // volume da música
    }
}

// Efeito sonoro: toca uma vez. Prioridade maior = mais importante.
function tocar_som(_som, _prioridade = 5, _volume = 1) {
    audio_iniciar();
    var s = audio_play_sound(_som, _prioridade, false);
    audio_sound_gain(s, _volume * global.vol_som, 0);
    audio_sound_pitch(s, random_range(0.92, 1.08));
    return s;
}

// Música de fundo em loop. Se já está tocando a mesma, não reinicia.
function tocar_musica(_musica, _volume = 0.5) {
    audio_iniciar();
    if (!variable_global_exists("musica_id")) {
        global.musica_id = -1;
        global.musica_atual = -1;
        global.musica_base = _volume;
    }
    if (global.musica_atual == _musica && audio_is_playing(global.musica_id)) {
        global.musica_base = _volume;
        audio_sound_gain(global.musica_id, _volume * global.vol_musica, 300);
        return;
    }
    parar_musica();
    global.musica_atual = _musica;
    global.musica_base = _volume;
    global.musica_id = audio_play_sound(_musica, 0, true);
    audio_sound_gain(global.musica_id, _volume * global.vol_musica, 0);
}

function parar_musica() {
    if (variable_global_exists("musica_id") && global.musica_id != -1) {
        audio_stop_sound(global.musica_id);
    }
    global.musica_id = -1;
    global.musica_atual = -1;
}