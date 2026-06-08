// ==========================================
// 1. DESENHAR A CAIXA DE TEXTO E A DIGITAÇÃO
// ==========================================

// Desenha o próprio sprite da caixinha azul (SAreaResposta)
draw_self();

// Se estiver aguardando resposta, lê o teclado
if (clicado && estado_atual == ESTADO_FASE.AGUARDANDO) {
    texto_digitado = keyboard_string;
}

// 🛡️ TRAVA DE LIMITE: Não deixa o texto ter mais que 8 caracteres para não passar da caixinha
if (string_length(texto_digitado) > 8) {
    texto_digitado = string_copy(texto_digitado, 1, 8);
    keyboard_string = texto_digitado; // Atualiza o teclado para parar de digitar
}

// Configura o texto que o usuário digita
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// 📐 AJUSTE DA ALTURA DA DIGITAÇÃO:
// Mude o "- 5" para valores menores (como -10, -15) se o texto ainda precisar SUBIR mais.
// Mude para números maiores (como +0, +5) se ele precisar DESCER.
var digitacao_x = x + 27;
var digitacao_y = y + 1;

draw_text(digitacao_x, digitacao_y, texto_digitado);

// Cursor piscante ("|") ajustado para a nova posição
if (clicado && (current_time mod 1000 < 500) && estado_atual == ESTADO_FASE.AGUARDANDO) {
    var tam_texto = string_width(texto_digitado);
    draw_text(digitacao_x + tam_texto, digitacao_y, "|");
}


// ==========================================
// 2. CONFIGURAR A COR DO TEXTO DE FEEDBACK
// ==========================================

if (estado_atual == ESTADO_FASE.ACERTO) {
    draw_set_color(c_lime);  // Texto verde para acerto
} else if (estado_atual == ESTADO_FASE.ERRO) {
    draw_set_color(c_red);   // Texto vermelho para erro
} else {
    draw_set_color(c_gray);  // Texto cinza para aguardando
}


// ==========================================
// 3. DESENHAR AS MENSAGENS NO CENTRO DE -230
// ==========================================

draw_set_halign(fa_center);

// Define o centro horizontal baseado no deslocamento do seu fundo (-230)
var centro_custom_x = -230;

// Altura vertical onde o texto deve aparecer dentro do painel preto
var texto_y = 420; 

// Desenha o texto principal
draw_text(centro_custom_x, texto_y, texto_resultado);

// Se o jogador acertou, desenha o conceito um pouco mais abaixo
if (estado_atual == ESTADO_FASE.ACERTO) {
    draw_set_color(c_lime);
    draw_text(centro_custom_x, texto_y + 80, texto_conceito);
}

// Reseta o alinhamento padrão do GameMaker para evitar bugs em outros objetos
draw_set_halign(fa_left);
draw_set_valign(fa_top);