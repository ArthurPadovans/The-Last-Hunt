if (instance_exists(obj_player)) {
    var foco_x = obj_player.x + (mouse_x - obj_player.x) * olhar_mouse;
    var foco_y = obj_player.y + (mouse_y - obj_player.y) * olhar_mouse;

    var alvo_x = clamp(foco_x - cam_w / 2, 0, room_width - cam_w);
    var alvo_y = clamp(foco_y - cam_h / 2, 0, room_height - cam_h);

    cam_x = lerp(cam_x, alvo_x, 0.15);
    cam_y = lerp(cam_y, alvo_y, 0.15);
}

// Tremida de tela: começa forte e some rápido
var tx = 0;
var ty = 0;
if (tremor > 0.3) {
    tx = random_range(-tremor, tremor);
    ty = random_range(-tremor, tremor);
    tremor *= 0.85;
} else {
    tremor = 0;
}

camera_set_view_pos(camera, cam_x + tx, cam_y + ty);