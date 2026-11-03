view_enabled = false;   // esta sala não usa a câmera que segue o jogador

// Se você abrir esta sala direto para testar, essas variáveis ainda não existem
if (!variable_global_exists("duelo_nivel")) { global.duelo_nivel = 1; }
if (!variable_global_exists("sala_depois")) { global.sala_depois = sala_menu; }

nivel = global.duelo_nivel;

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
flash = 0;