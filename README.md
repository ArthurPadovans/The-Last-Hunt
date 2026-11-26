# The Last Hunt

---

## 1. Identificação

| Item | Informação |
|---|---|
| Jogo | The Last Hunt |
| Grupo | Arthur Padovan e Vitor Caçador |
| Disciplina | Usabilidade, desenvolvimento web, mobile e jogos |
| Professores | Fabio Tadeu Doro e Patricia Vitorino Gomes |

**Integrantes**

| Nome | RA |
|---|---|
| Arthur Padovan  | 826179652 |
| Vitor Caçador  | 826178644 |

---

## 2. Descrição

The Last Hunt é um jogo de ação 2D com visão de cima, no estilo de Hotline Miami, ambientado no Velho Oeste de 1870. O jogador controla Charles Logan, que atravessa três capítulos (Velho Saloon, Minas Abandonadas e Mansão Red Jays), eliminando inimigos com revólver, espingarda e faca. Quanto mais mortes seguidas, maior o combo e a pontuação. Pelo caminho há chefes com mecânicas próprias (laço e dinamite), e a história termina em um duelo ao meio-dia contra o líder da gangue.

**Premissa:** Charles Logan é um caçador de recompensas doente, com uma pneumonia em estado avançado, que sabe que não viverá muito. Mesmo assim, aceita seu último trabalho: perseguir a gangue Red Jays, comandada por Silas Mercer. Sozinho, derruba os capangas e enfrenta o líder em um duelo. A história dele sobrevive depois como lenda.

---

## 3. Como rodar

O jogo foi feito em **GameMaker**, e não em Python. Por isso os comandos `pip install -r requirements.txt` e `python main.py` não se aplicam: não há dependências externas a instalar.

**Pré-requisitos**
- Windows
- GameMaker instalado, versão **2026.0.0.16** ou mais nova (o projeto foi criado nessa versão).

**Rodando pelo código-fonte**
1. Baixe ou clone o repositório: `git clone https://github.com/ArthurPadovans/The-Last-Hunt.git`
2. Abra o GameMaker e escolha **Open**.
3. Selecione o arquivo `The Last Hunt/The Last Hunt.yyp`.
4. Aperte **F5** (Run) para jogar.

**Rodando o executável**
O executável do jogo esta no arquivo .zip

---

## 4. Controles

| Tecla / botão | Ação |
|---|---|
| W A S D | Andar |
| Mouse | Mirar |
| Botão esquerdo do mouse | Atirar ou golpear com a arma na mão |
| E | Pegar a arma do chão (troca pela atual) |
| R | Recarregar |
| Q | Reiniciar o andar |
| Esc | Abrir o menu de pausa (continuar, volume de música e efeitos, ajuda, voltar ao menu) |
| Enter | Ao completar a fase, seguir para o duelo; nos diálogos, avançar |
| Espaço | Nos diálogos, avançar |
| Segurar botão direito | Nos diálogos, pular a cena |
| Botão esquerdo (duelo) | Atirar no duelo, só depois que o ponteiro bate meio-dia |

---

## 5. Regras

**Como ganhar**
1. Elimine todos os inimigos e chefes do andar. Só então a escada abre.
2. Suba ou desça a escada para o próximo andar. A arma e a munição são levadas junto.
3. No último andar de cada fase, ao eliminar todos os inimigos aparece "FASE COMPLETA"; aperte **Enter** para ir ao duelo.
4. Vença o duelo final contra Silas Mercer para ver o desfecho da história.

**Como perder**
- O jogador morre com um tiro inimigo ou ao ser pego por uma explosão. Aperte **Q** para tentar de novo.
- No duelo, perde quem atirar antes do meio-dia ou demorar demais para atirar.

**Como pontuar**
- Cada inimigo eliminado vale pontos base: 100 pelo tiro ou explosão, 150 pela faca e 1000 por chefe.
- O ponto base é multiplicado pelo **combo**. Cada morte em sequência aumenta o combo, e o jogador tem cerca de 3 segundos entre uma morte e a próxima para mantê-lo.
- A tela de fim de fase mostra a pontuação total e o maior combo.

---

## 6. Divisão de tarefas

| Integrante | O que fez |
|---|---|
| Arthur Padovan | Programação, Documentação, apresentação de slides. |
| Vitor Cacador | História do jogo. Todas as artes, sprites, animações. Procura de todas as músicas e sons. Programação |

---

## 7. Créditos

### O que o grupo criou
Os elementos de código, lógica de jogo, sprites, integração das mecânicas e demais conteúdos foram produzidos pela equipe

### Sons e músicas de terceiros

| Arquivo no projeto | Autor | Link | Licença |
|---|---|---|---|
| Música fase 1 | Nene | https://opengameart.org/content/short-theme-rockmetal | CC0 |
| Música fase 2 | Fato_Shadow_music | https://opengameart.org/content/fight-theme-metal | CC-BY 3.0 |
| Música fase 3 | Tri-Tachyon | https://opengameart.org/content/heavy-metal-riffs-monolith | CC-BY 4.0 |
| Música Titulo | Linxiaoma | https://opengameart.org/content/spaghetti-western-theme-orchestral | CC-BY 4.0 |
| Música Duelo | Shalpin | https://opengameart.org/content/western |  |
| Música Cutscene | ShggothSlave | https://opengameart.org/content/western-rock-metal-song | CC0 |
| Efeito Sonoros | ElevenLabs Sound Effects | https://elevenlabs.io/sound-effects | Uso não comercial, conforme os termos de serviço da ElevenLabs. Créditos atribuídos à ElevenLabs. |

### Imagens de terceiros

| Arquivo | Autor | Link | Licença |
|---|---|---|---|
| spr_duelo_fundo | Cayetano Gil | https://unsplash.com/pt-br/fotografias/vila-do-oeste-selvagem-3d--6jy4gGfJ54 | Imagem de domínio público do Unsplash |
| spr_menu_fundo | Getty Images | https://unsplash.com/pt-br/fotografias/buttes-de-arenito-em-paisagem-desertica-rguHxZmOF5U | Imagem de domínio público do Unsplash |



---

## 8. Tecnologia

- **Linguagem:** GML (GameMaker Language)
- **Ferramenta:** GameMaker, versão 2026.0.0.16
- **Bibliotecas externas:** nenhuma
- **Por que não pygame:** Porque o GameMaker traz editor de salas, sprites, áudio e depuração integrados, o que facilitou montar fases, cenas e menus. Além de termos nos inspirado em um jogo ja feito no GameMaker

---

## 9. Uso de IA

**Foi utilizada IA neste projeto.**

- **Ferramenta:** ElevenLabs Sound Effects.
- **Para quê:** A IA fez os efeitos sonoros, como os de tiro, explosão, dentre outros

**Trechos e arquivos em que a IA foi usada**

| Recurso | Arquivos |
| Efeitos sonoros | `sounds` |
| Sistema de áudio (funções de tocar som e música, volumes separados) | `scr_audio` |
| Chamadas de som e música no jogo | `obj_player` (Step), `obj_inimigo` (Step), `obj_boss_lider` (Step), `obj_porta` (Step), `obj_dinamite` (Create e Step), `obj_explosao` (Create), `obj_duelo` (Create e Step), `obj_controle` (Create), `obj_menu_titulo` (Create), cenas (`obj_cena_abertura`, `obj_cena_flashback`, `obj_epilogo_saloon`, `obj_epilogo_acampamento`, `obj_epilogo_cidade`) |

---

## 10. Capturas de tela

**[PREENCHER: coloque pelo menos 2 imagens do jogo rodando na pasta `docs/capturas/` do repositório e ajuste os nomes abaixo.]**

![Tela de título](docs/capturas/titulo.png)

![Fase em andamento](docs/capturas/fase.png)

![Duelo](docs/capturas/duelo.png)
