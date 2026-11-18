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
espera = 20;      // uma pequena trava antes de aceitar o clique (evita clique sem querer)
comecou = false;  // vira true quando o jogador clica para começar

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
pos_inimigo_x = 0.60;
pos_inimigo_y = 0.66;
pos_jogador_x = 0.20;
pos_jogador_y = 1.00;

// Quadros de cada animação nos sprites dos personagens: [primeiro, último]
// Se você desenhar com outra quantidade de quadros, ajuste aqui.
q_parado = [0, 0];     // quadro 0: parado
q_saca = [1, 1];       // quadro 1: braço levantado, atirando
q_cai = [-1, -1];      // sem quadros de queda: o personagem mantém a pose e tomba por código

// Velocidade de cada animação (maior = mais rápida)
vel_parado = 0.06;
vel_saca = 0.3;
vel_cai = 0.2;

anim_i = 0;   // o que o inimigo está fazendo: 0 = parado, 1 = sacando e atirando, 2 = caindo
anim_j = 0;   // o mesmo, para você
fi = 0;       // quadro atual do inimigo
fj = 0;       // quadro atual seu
tocar_musica(mus_duelo);    // <- NOVA

// ---------- O INIMIGO MUDA CONFORME O DUELO ----------
// Duelo 1: o do laço (azul). Duelo 2: o da dinamite (verde). Duelo 3: o líder (vermelho).
var inimigos_parados = [spr_duelo_inimigo, spr_duelo_inimigo_2, spr_duelo_inimigo_3];
var inimigos_atirando = [spr_duelo_inimigo_atirando, spr_duelo_inimigo_2_atirando, spr_duelo_inimigo_3_atirando];
sprite_inimigo = inimigos_parados[clamp(nivel - 1, 0, 2)];
sprite_inimigo_tiro = inimigos_atirando[clamp(nivel - 1, 0, 2)];

atirou_i = false;   // o inimigo já atirou?
atirou_j = false;   // você já atirou?

// ---------- QUEDA POR CÓDIGO (enquanto não há quadros de queda desenhados) ----------
queda_giro = 80;   // quanto o personagem tomba, em graus (0 = não tomba)
qi = 0;            // quanto o inimigo já tombou (0 a 1)
qj = 0;            // quanto você já tombou (0 a 1)