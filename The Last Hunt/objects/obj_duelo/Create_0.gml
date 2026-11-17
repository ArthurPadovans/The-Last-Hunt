// Acabou a fase: a próxima começa de novo sem arma levada
global.arma_levada = -1;
global.municao_levada = 0;

view_enabled = false;   // esta sala não usa a câmera que segue o jogador

// Se você abrir esta sala direto para testar, essas variáveis ainda não existem
if (!variable_global_exists("duelo_nivel")) { global.duelo_nivel = 1; }
if (!variable_global_exists("sala_depois")) { global.sala_depois = sala_menu; }
if (!variable_global_exists("duelo_final")) { global.duelo_final = false; }

nivel = global.duelo_nivel;
eh_final = global.duelo_final;   // é o duelo final contra o líder?

// Tempo que você tem para atirar depois do meio-dia (60 = 1 segundo)
// Duelo 1: 29, duelo 2: 24, duelo 3: 19. Nunca menos que 16.
janela = max(16, 34 - nivel * 5);

estado = 0;     // 0 = começando, 1 = ponteiro andando, 2 = meio-dia, 3 = ganhou, 4 = atirou cedo, 5 = muito lento
espera = 90;    // 1,5 segundo de suspense antes de começar

// O ponteiro: 0 = meio-dia, e gira para a direita até chegar em 360 (meio-dia de novo)
angulo = random_range(200, 260);
velocidade_ponteiro = 1.2;
alvo_tensao = random_range(325, 345);   // onde ele vai "engasgar"
tempo_tensao = irandom_range(30, 90);   // por quanto tempo
parou_tensao = false;
pausa = 0;

tempo_janela = 0;
tempo_reacao = 0;

// Efeitos de tela
flash = 0;              // clarão (1 = tela toda colorida, vai sumindo)
flash_cor = c_white;
sac = 0;                // tremida do cenário

// Depois do tiro
t_pos = 0;              // conta o tempo depois que o duelo acaba
t_final = 0;            // o mesmo, só para o duelo final
vermelho = 0;           // quanto a tela está avermelhada
escuro = 0;             // fade para preto

// ---------- ARTE E ANIMAÇÃO ----------
esc_arte = 4;           // quanto a arte é ampliada (320 x 180 vira 1280 x 720)
esc_inimigo = 1.5;   // tamanho do inimigo (4 = igual ao cenário, 3 = um pouco menor, 2 = bem menor)
esc_jogador = 3;   // tamanho do Charles
// Onde cada personagem fica na tela (0 a 1 = proporção da tela; é onde ficam os PÉS)
pos_inimigo_x = 0.70;
pos_inimigo_y = 0.66;
pos_jogador_x = 0.20;
pos_jogador_y = 1.00;

// Quadros de cada animação nos sprites dos personagens: [primeiro, último]
// Se você desenhar com outra quantidade de quadros, ajuste aqui.
q_parado = [0, 1];
q_saca = [2, 5];
q_cai = [6, 9];

// Velocidade de cada animação (maior = mais rápida)
vel_parado = 0.06;
vel_saca = 0.3;
vel_cai = 0.2;

anim_i = 0;   // o que o inimigo está fazendo: 0 = parado, 1 = sacando e atirando, 2 = caindo
anim_j = 0;   // o mesmo, para você
fi = 0;       // quadro atual do inimigo
fj = 0;       // quadro atual seu
tocar_musica(mus_duelo);    // <- NOVA