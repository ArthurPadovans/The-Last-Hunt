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