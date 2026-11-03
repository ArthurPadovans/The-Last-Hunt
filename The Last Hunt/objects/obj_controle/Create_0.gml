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

cam_x = 0;
cam_y = 0;
tremor = 0;