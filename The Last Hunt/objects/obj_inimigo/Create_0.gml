alcance = 400;        // até onde ele enxerga, em pixels
recarga = 45;         // tempo até o próximo tiro
velocidade = 2.2;     // velocidade quando persegue (patrulhando é 60% disso)

// Tempo que ele leva para reagir depois de te ver (60 = 1 segundo)
// Cada inimigo tem um tempo um pouco diferente
tempo_reacao = irandom_range(60, 100);

estado = 0;           // 0 = patrulhando, 1 = perseguindo
direcao = choose(0, 90, 180, 270);   // direção em que ele patrulha
tempo_perdido = 0;    // há quanto tempo ele não vê o jogador

// Último lugar onde ele viu o jogador
ult_x = x;
ult_y = y;

// ---------- ATORDOAMENTO (quando a porta derruba ele) ----------
atordoado = 0;        // tempo que falta para ele acordar (60 = 1 segundo)
emp_x = 0;            // empurrão que ele recebeu
emp_y = 0;