velocidade = 4.5;

arma = 0;   // arma na mão: 0 = revolver, 1 = espingarda, 2 = faca
nome_arma = ["Revolver", "Espingarda", "Faca"];
max_municao = [6, 2, 0];   // capacidade de cada arma
municao = max_municao[arma];   // munição da arma que está na mão

recarregando = false;
tempo_recarga = 0;
cooldown = 0;

// ---------- ANIMAÇÃO ----------
sprites_arma = [spr_player_revolver, spr_player_espingarda, spr_player_faca];

pernas_frame = 0;      // quadro atual da caminhada
direcao_pernas = 0;    // para onde as pernas estão viradas agora
alvo_pernas = 0;       // para onde elas querem virar
andando = false;

ataque_frame = 0;      // 0 = parado; maior que 0 = tocando a animação de ataque
cooldown_ant = 0;