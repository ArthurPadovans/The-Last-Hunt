tempo += 1;
alfa = min(1, tempo / 90);   // o texto aparece devagar

// Depois de 3 segundos, qualquer clique ou Enter volta ao menu
if (tempo > 180 && (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))) {
    global.duelo_nivel = 0;
    global.duelo_final = false;
    room_goto(sala_menu);
}