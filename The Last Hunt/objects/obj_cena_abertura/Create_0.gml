event_inherited();   // pega as configurações padrão do obj_dialogo

// ---------- NOMES (troque aqui, se quiser) ----------
var gangue = "Red Jays";
var lider = "Silas Mercer";

falas = [
    ["xerife", "Entao e verdade. Charles Logan, em carne e osso, na minha porta."],
    ["charles", "Disseram que o senhor tinha um trabalho para mim."],
    ["xerife", "Tenho. O maior que ja ofereci a alguem."],
    ["xerife", "Voce ja ouviu falar nos " + gangue + "?"],
    ["charles", "Todo mundo ja ouviu. Dizem que nunca perderam uma briga."],
    ["xerife", "Sete bancos, tres trens e dois xerifes. Ninguem que foi atras deles voltou para contar."],
    ["xerife", "O homem que manda neles se chama " + lider + ". Eu quero ele. Vivo ou morto."],
    ["charles", "E a recompensa?"],
    ["xerife", "Dez mil dolares. Mais do que voce juntou em toda a sua vida."],
    ["charles", "Nao e pelo dinheiro."],
    ["xerife", "Entao e pelo que, Logan?"],
    ["charles", "Digamos que e a minha ultima cacada."],
    ["xerife", "Pois nao tenha pressa. Leve o tempo que precisar."],
    ["charles", "Tempo e a unica coisa que eu nao tenho de sobra."],
    ["charles", "Eu aceito."],
    ["charles", "*tosse* Poeira da estrada. Nao se preocupe."],
    ["xerife", "Boa sorte, Logan. Voce vai precisar."],
    ["charles", "Eles e que vao precisar."]
];

proxima_sala = noone;   // depois da cena, vai para a próxima sala da Ordem das salas