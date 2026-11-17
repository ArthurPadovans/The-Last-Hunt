pausado = false;    // o menu de pausa está aberto?

estado_jogo = 0;   // 0 = jogando, 1 = morreu, 2 = venceu

// ---------- PONTOS ----------
pontos = 0;
combo = 0;
combo_tempo = 0;
maior_combo = 0;

// ---------- CÂMERA ----------
cam_w = 1280;
cam_h = 720;
olhar_mouse = 0.2;

camera = camera_create_view(0, 0, cam_w, cam_h);
view_enabled = true;
view_visible[0] = true;
view_camera[0] = camera;
view_wport[0] = 1280;
view_hport[0] = 720;

cam_x = 0;     // posição "de verdade" da câmera, sem tremida
cam_y = 0;
tremor = 0;    // força da tremida atual

// Balanço lento da câmera (como no Hotline Miami)
balanco_forca = 2.5;   // quantos graus ela gira para cada lado (0 = sem balanço)
balanco_vel = 2500;    // maior = balança mais devagar

// ---------- FUNDO DE FORA DO MAPA ----------
var bg = layer_get_id("Background");
if (layer_exists(bg)) {
    layer_set_visible(bg, false);
}
instance_create_depth(0, 0, 20000, obj_fundo_externo);

// ---------- ENTRADA: a tela clareia a partir do preto ----------
instance_create_depth(0, 0, -5000, obj_fade_entrada);

// ---------- CARTÃO DE CAPÍTULO (tela preta com o nome da fase) ----------
cartao_ativo = false;      // o cartão está na tela?
cartao_congelou = false;   // o jogo já foi congelado por ele?

if (!variable_global_exists("capitulo_visto")) {
    global.capitulo_visto = -1;
}

var cap = "";
var nome_fase = "";
switch (room) {
    case Sala_fase1:
        cap = "CAPÍTULO 1";
        nome_fase = "Velho Saloon";
        break;
    case Sala_fase2:
        cap = "CAPÍTULO 2";
        nome_fase = "Minas Abandonadas";
        break;
    case Sala_fase3:
        cap = "CAPÍTULO 3";
        nome_fase = "Mansão Red Jays";
        break;
}

// Só mostra na primeira vez que chega na fase (não de novo ao reiniciar com Q)
if (cap != "" && global.capitulo_visto != room) {
    global.capitulo_visto = room;
    instance_destroy(obj_fade_entrada);    // o cartão já faz a tela clarear sozinho
    var cartao = instance_create_depth(0, 0, -6000, obj_titulo_cena);
    cartao.texto = cap;
    cartao.subtitulo = nome_fase;
    cartao_ativo = true;
}

// ---------- MÚSICA DA FASE ----------
switch (room) {
    case Sala_fase1:
    case Sala_fase1b:
        tocar_musica(mus_fase1);
        break;
    case Sala_fase2:
    case Sala_fase2b:
    case Sala_fase2c:
        tocar_musica(mus_fase2);    // <- NOVA
        break;
    case Sala_fase3:
    case Sala_fase3b:
        tocar_musica(mus_fase3);    // <- NOVA
        break;
}