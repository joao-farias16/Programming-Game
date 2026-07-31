draw_self();

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var digitacao_x = x + 15;
var digitacao_y = y + 5;
draw_text(digitacao_x, digitacao_y, texto_digitado);

// Cursor piscante na posição correta (considerando quebras de linha)
if (clicado && (current_time mod 1000 < 500) && estado_atual == ESTADO_FASE.AGUARDANDO) {
    var altura_linha = string_height("A");
    var linhas = string_split(texto_digitado, "\n");
    var num_linhas = array_length(linhas);
    
    // Descobre em qual linha e coluna está posicao_cursor
    var restante = posicao_cursor;
    var linha_idx = 0;
    var col = 0;
    for (var i = 0; i < num_linhas; i++) {
        var tam_linha = string_length(linhas[i]);
        if (restante <= tam_linha) {
            linha_idx = i;
            col = restante;
            break;
        } else {
            restante -= (tam_linha + 1); // +1 pela quebra de linha
            linha_idx = i;
            col = tam_linha;
        }
    }
    
    var texto_ate_cursor = string_copy(linhas[linha_idx], 1, col);
    var cursor_x = digitacao_x + string_width(texto_ate_cursor) + 2;
    var cursor_y = digitacao_y + (linha_idx * altura_linha);
    var altura = string_height("A");
    draw_line(cursor_x, cursor_y, cursor_x, cursor_y + altura);
}

draw_sprite(Pontuacao, 0, 1660, 29);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_text(1750, 25, string(pontuacao_fase_atual) + " / 3000");