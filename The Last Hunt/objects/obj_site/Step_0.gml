// Espera o cartão "HOJE" acabar
if (instance_exists(obj_titulo_cena)) {
    exit;
}

// Clique, Enter ou espaço: vai para a tela final
if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    room_goto(sala_fim);
}