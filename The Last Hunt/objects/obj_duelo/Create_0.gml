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

// ---------- FINAL DO DUELO FINAL ----------
t_final = 0;            // conta o tempo depois do tiro
queda_inimigo = 0;      // 0 = em pé, 1 = caído
queda_jogador = 0;
vermelho = 0;           // quanto a tela está avermelhada
escuro = 0;             // fade para preto