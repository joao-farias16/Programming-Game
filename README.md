# PyQuest — Programming Game

Jogo educacional para o ensino de **lógica de programação** e **fundamentos de Python**, desenvolvido em **GameMaker** como Trabalho de Conclusão de Curso (TCC) do curso técnico de Informática.

> O repositório e o projeto do GameMaker se chamam **Programming Game**; o executável gerado para Windows se chama **PyQuest**.

---

## Sumário

- [Sobre o projeto](#sobre-o-projeto)
- [Objetivo](#objetivo)
- [Contexto](#contexto)
- [Principais funcionalidades](#principais-funcionalidades)
- [Conteúdos abordados](#conteúdos-abordados)
- [Tecnologias utilizadas](#tecnologias-utilizadas)
- [Como o jogo funciona](#como-o-jogo-funciona)
  - [Navegação entre telas](#navegação-entre-telas)
  - [Fases](#fases)
  - [Modo Desafio](#modo-desafio)
  - [Sistema de dicas](#sistema-de-dicas)
  - [Pontuação e nota](#pontuação-e-nota)
  - [Salvamento do progresso](#salvamento-do-progresso)
- [Estrutura do projeto](#estrutura-do-projeto)
- [Scripts](#scripts)
- [Pré-requisitos](#pré-requisitos)
- [Como executar](#como-executar)
- [Gerando o executável](#gerando-o-executável)
- [Controles](#controles)
- [Status do projeto](#status-do-projeto)
- [Integrantes](#integrantes)

---

## Sobre o projeto

O **PyQuest** é um jogo em que o jogador aprende Python resolvendo pequenos exercícios de código. Em cada fase é apresentado um trecho de programa incompleto, e o jogador precisa digitar a parte que falta (um operador, uma palavra-chave, uma função etc.) para que o código fique correto.

O jogo é dividido em duas partes:

- **32 fases** sequenciais, organizadas em blocos de conteúdo;
- **Modo Desafio**, com 8 desafios em que o jogador escreve programas completos, liberado após a conclusão de todas as fases.

Durante o jogo, o jogador conta com dicas progressivas, uma tela de ajuda com explicações dos conceitos, barra de progresso e um sistema de pontuação que gera uma nota de 0 a 10.

## Objetivo

Oferecer uma forma mais dinâmica e prática de estudar conteúdos introdutórios de programação, usando elementos de jogos (fases, desbloqueio, pontuação, feedback imediato e dicas) para incentivar o aluno a praticar a escrita de código Python.

## Contexto

Quem está começando a programar costuma ter dificuldade com a sintaxe e com a lógica dos primeiros conceitos, e muitas vezes o estudo fica restrito à teoria. O PyQuest propõe que o aluno pratique desde o início: cada fase exige que ele leia um código, entenda o que está faltando e complete a resposta, recebendo retorno na hora sobre o acerto ou o erro.

## Principais funcionalidades

- **Tela inicial** com acesso a Jogar, Modo Desafio, Configurações e Sair.
- **Seleção de fases** com 32 níveis, ícones que indicam se a fase está bloqueada, liberada ou concluída, e barra de progresso (`x/32`).
- **Desbloqueio sequencial**: cada fase só é liberada após a conclusão da anterior.
- **Área de resposta interativa**: o jogador clica na lacuna, digita a resposta, pode mover o cursor com as setas e apagar com Backspace.
- **Fases com mais de uma lacuna**, que só são concluídas quando todas as respostas estão corretas.
- **Feedback visual** de acerto e erro, com transição suave entre os estados.
- **Mini tutorial** nas duas primeiras fases, explicando a função dos botões da interface.
- **Telas de bloco concluído** ao final de cada grupo de fases e tela de parabéns ao concluir a última fase.
- **Tela de ajuda** com 23 explicações sobre os conteúdos, com rolagem pela roda do mouse ou setas do teclado.
- **Modo Desafio** com 8 exercícios de código completo, editor com várias linhas e tela de conclusão.
- **Sistema de dicas** em três níveis (leve, intermediária e direta).
- **Pontuação por fase** e **nota geral** de 0 a 10, exibida na seleção de fases e na seleção de desafios.
- **Configurações**: ligar/desligar som, volume (baixo, médio e alto), tela cheia e reset do progresso com confirmação.
- **Salvamento automático** do progresso e das configurações em arquivo JSON.
- **Transição em fade** entre as telas.
- **Ajuste automático da janela** à resolução do monitor, mantendo a proporção 16:9 (base 1920×1080).

## Conteúdos abordados

Pelos exercícios implementados nas fases e nos desafios, o jogo trabalha os seguintes conteúdos de Python:

| Conteúdo | Exemplos presentes no jogo |
|---|---|
| Saída de dados | `print` |
| Comentários | `#` |
| Variáveis e strings | atribuição de valores, textos entre aspas |
| Operadores aritméticos | `+`, `/`, `%` |
| Operadores relacionais e lógicos | `>`, `>=`, `==`, `and` |
| Estruturas condicionais | `if`, `elif`, `else` |
| Estruturas de repetição | `for`, `while`, `in`, `range`, `break` |
| Funções nativas | `len`, `int` |
| Listas e fatiamento | `[3, 7, 2, 9, 4]`, `palavra[::-1]` |

## Tecnologias utilizadas

| Tecnologia | Uso no projeto |
|---|---|
| [GameMaker](https://gamemaker.io/) | Engine e IDE de desenvolvimento (projeto criado na versão `2024.14.4.222`) |
| GML (GameMaker Language) | Linguagem usada em toda a lógica do jogo |
| JSON | Formato do arquivo de salvamento (`save.json`) |
| Git e GitHub | Versionamento e colaboração entre os integrantes |

O projeto não utiliza banco de dados, API externa nem sistema de login. Todos os dados ficam salvos localmente no computador do jogador.

## Como o jogo funciona

O jogo é construído com os recursos padrão do GameMaker:

- **Rooms (salas)**: cada tela do jogo é uma sala (menu, seleção de fases, cada fase, cada desafio, telas de conclusão etc.);
- **Objects (objetos)**: botões, áreas de resposta, lâmpadas de dica, cabeçalhos e controladores, com a lógica escrita em eventos GML (`Create`, `Step`, `Draw`, `Mouse`, `Alarm`);
- **Scripts**: funções reutilizáveis para pontuação, nota, validação de código e salvamento;
- **Sprites**: todas as imagens do jogo, incluindo fundos das fases, botões, ícones e dicas.

O objeto `OGlobal` é **persistente** e fica na sala inicial. Ele cria as variáveis globais (fases desbloqueadas/concluídas, desafios concluídos, configurações e pontuação), ajusta o tamanho da janela e carrega o save existente.

### Navegação entre telas

```text
TelaInicial
├── Jogar ───────────► TelaNiveis
│                      ├── Fase 1 … Fase 32
│                      │     ├── ao final de cada bloco ──► BlocoXConcluido
│                      │     └── após a fase 32 ─────────► Parabens
│                      └── Ajuda ──► TelaHelp
├── Modo Desafio
│     ├── 32 fases concluídas ──► TelaDesafio ──► Desafio 1 … 8 ──► DesafiosConcluidos
│     └── caso contrário ──────► TelaDesafioBloqueado
├── Configurações ───► TelaSettings
└── Sair
```

### Fases

Cada fase mostra um código Python com uma ou duas lacunas. O jogador:

1. clica na área de resposta e digita o que falta;
2. confirma com **Enter** ou pelo botão **Confirmar**;
3. recebe o feedback de **correto** ou **errado**;
4. em caso de erro, a área volta ao estado inicial após 1 segundo para uma nova tentativa;
5. em caso de acerto, confirma novamente para avançar.

Ao concluir uma fase, ela é marcada como concluída, a próxima é desbloqueada e o progresso é salvo. As fases são agrupadas em blocos, e ao terminar cada bloco é exibida uma tela de conclusão antes de seguir para o próximo.

### Modo Desafio

Liberado somente depois que as 32 fases forem concluídas. São 8 desafios em que o jogador escreve um programa inteiro em um editor de várias linhas:

| Desafio | Tema |
|---|---|
| 1 | Verificar se uma palavra é palíndromo |
| 2 | Sequência de Fibonacci |
| 3 | Percorrer uma lista comparando valores |
| 4 | Soma dos números pares |
| 5 | Contagem regressiva com `while` |
| 6 | Classificação de nota com `if` / `elif` / `else` |
| 7 | Contagem de vogais e consoantes |
| 8 | Tabuada do 7 |

Antes da verificação, o código digitado é **normalizado** pelo script `scr_normalizar_codigo`: comentários (`#`), espaços, tabulações e quebras de linha são removidos e o texto é convertido para minúsculas. Depois disso, a validação acontece de duas formas:

- **Comparação com a resposta esperada** (desafios 1, 5 e 6);
- **Verificação de estrutura** pelo script `scr_validar_desafio` (desafios 2, 3, 4, 7 e 8), que confere se o código contém os elementos necessários, como `for`, `range(`, `if`, `print(`, operadores e uma quantidade mínima de atribuições. Isso permite aceitar soluções escritas de formas diferentes.

### Sistema de dicas

Cada fase e cada desafio possui uma **lâmpada** que libera dicas em três níveis:

| Dica | Tipo | Liberação automática | Desconto na pontuação |
|---|---|---|---|
| 1 | Leve | após 2 erros | −200 pontos |
| 2 | Intermediária | após 4 erros | −300 pontos |
| 3 | Direta | após 6 erros | −400 pontos |

O jogador também pode liberar as dicas antes, clicando na lâmpada. O desconto é o mesmo nos dois casos.

### Pontuação e nota

- Cada fase e cada desafio começa com **3000 pontos**.
- Cada resposta errada desconta **100 pontos**.
- Cada dica liberada desconta os valores da tabela acima.
- A pontuação nunca fica negativa.

A **nota** exibida nas telas de seleção de fases e de desafios é calculada pelo script `scr_calcular_nota`:

```text
nota = (pontuação total / (fases concluídas × 3000)) × 10
```

O resultado é arredondado para múltiplos de 0,5 e limitado entre 0 e 10.

### Salvamento do progresso

O progresso é salvo automaticamente no arquivo `save.json` sempre que o jogador conclui uma fase ou desafio, acerta uma resposta, altera uma configuração ou reseta o jogo. Ao abrir o jogo, o arquivo é carregado; se ele não existir, um novo é criado com os valores iniciais.

O arquivo fica na pasta de dados que o GameMaker reserva para o jogo (no Windows, dentro de `%LOCALAPPDATA%`), e não na pasta do projeto. Ele guarda:

| Campo | Conteúdo |
|---|---|
| `som_ativo` | Se o som está ligado |
| `volume` | Volume selecionado |
| `fullscreen` | Se o jogo está em tela cheia |
| `niveis_completos` | Total de fases e desafios concluídos |
| `fases_desbloqueadas` | Lista com o estado de desbloqueio das 32 fases |
| `fases_concluidas` | Lista com o estado de conclusão das 32 fases |
| `desafios_concluidos` | Lista com o estado de conclusão dos 8 desafios |
| `pontos_fases` | Pontuação obtida em cada fase/desafio |

O botão **Resetar** da tela de configurações apaga todo o progresso (mantendo apenas a fase 1 liberada) e salva o arquivo novamente.

## Estrutura do projeto

```text
Programming Game/
├── Programming Game.yyp   # Arquivo principal do projeto GameMaker
├── objects/               # Objetos e seus eventos em GML
│   ├── OGlobal/           # Variáveis globais e carregamento do save
│   ├── OTransicao/        # Transição em fade entre salas
│   ├── OHeader/           # Cabeçalho da seleção de fases (voltar, ajuda e nota)
│   ├── OBarraProgresso/   # Barra de progresso da seleção de fases
│   ├── OCamera/           # Rolagem da tela de ajuda
│   ├── OBotao*/           # Botões de menu, configurações e reset
│   ├── OIconeNivel*/      # Ícones das 32 fases na seleção de níveis
│   ├── SAreaResposta*/    # Áreas de resposta das fases e desafios
│   ├── SBotaoConfirmar*/  # Botões de confirmação das fases e desafios
│   ├── Lampada*/          # Sistema de dicas
│   ├── Imagens*/          # Feedback visual (neutro, correto, errado)
│   ├── ODesafio*/         # Botões dos desafios
│   ├── OExp*/             # Explicações da tela de ajuda
│   └── BotaoBloco*/       # Botões das telas de bloco concluído
├── rooms/                 # Salas (telas) do jogo
│   ├── TelaInicial/       # Menu principal
│   ├── TelaNiveis/        # Seleção de fases
│   ├── TelaSettings/      # Configurações
│   ├── TelaHelp/          # Ajuda
│   ├── TelaDesafio/       # Seleção de desafios
│   ├── TelaDesafioBloqueado/
│   ├── Nivel1/ … Nivel32/
│   ├── Desafio1/ … Desafio8/
│   ├── Bloco1Concluido/ … Bloco7Concluido/
│   ├── Parabens/
│   └── DesafiosConcluidos/
├── scripts/               # Funções reutilizáveis em GML
├── sprites/               # Imagens do jogo (fundos, botões, ícones, dicas)
├── options/               # Configurações de plataforma do GameMaker
└── README.md
```

## Scripts

| Script | Função |
|---|---|
| `scr_pontos_iniciar` | Define a pontuação inicial da fase |
| `scr_pontos_errar` | Desconta pontos sem deixar a pontuação negativa |
| `scr_pontos_confirmar_acerto` | Registra a pontuação da fase e salva o jogo |
| `scr_calcular_pontuacao_total` | Soma a pontuação de todas as fases registradas |
| `scr_calcular_nota` | Calcula a nota de 0 a 10 |
| `scr_normalizar_codigo` | Remove comentários e espaços e converte o código para minúsculas |
| `scr_validar_desafio` | Valida a estrutura do código dos desafios 2, 3, 4, 7 e 8 |
| `scr_salvar_jogo` | Grava progresso e configurações em `save.json` |
| `scr_carregar_jogo` | Lê `save.json` e aplica os dados ao jogo |

## Pré-requisitos

- **GameMaker** instalado (o projeto foi criado na versão `2024.14.4.222`; recomenda-se usar essa versão ou uma mais recente);
- **Windows**, que é a plataforma configurada no projeto;
- **Git**, caso queira clonar o repositório (opcional).

## Como executar

1. Clone o repositório:

   ```bash
   git clone https://github.com/joao-farias16/Programming-Game.git
   ```

   Ou baixe o ZIP pelo GitHub e extraia em uma pasta.

2. Abra o GameMaker e selecione **Open** (Abrir).
3. Escolha o arquivo `Programming Game.yyp`, na raiz do projeto.
4. Com o projeto aberto, clique em **Run** (ou pressione **F5**) para executar o jogo.

Não é necessário instalar dependências nem configurar variáveis de ambiente.

## Gerando o executável

1. No GameMaker, selecione o alvo **Windows**.
2. Use a opção **Build → Create Executable**.
3. Escolha o formato desejado (instalador ou `.zip`) e o local de destino.

O executável é gerado com o nome `PyQuest.exe`, conforme definido nas configurações de Windows do projeto.

## Controles

| Ação | Controle |
|---|---|
| Navegar pelos menus e botões | Clique do mouse |
| Selecionar a área de resposta | Clique na lacuna |
| Digitar a resposta | Teclado |
| Mover o cursor | Setas ← → |
| Apagar | Backspace |
| Confirmar resposta nas fases | Enter ou botão **Confirmar** |
| Nova linha nos desafios | Enter |
| Rolar a tela de ajuda | Roda do mouse ou setas ↑ ↓ |

## Status do projeto

🚧 **Em desenvolvimento.**

Já estão implementadas as 32 fases, o Modo Desafio com 8 desafios, o sistema de dicas, a pontuação com nota, a tela de ajuda, as configurações e o salvamento do progresso. Ajustes e correções continuam sendo feitos ao longo do desenvolvimento do TCC.

## Integrantes

| Nome | GitHub |
|---|---|
| João Vitor Farias da Silva | [@joao-farias16](https://github.com/joao-farias16) |
| Ariel Vasconcellos Bernardes | — |
