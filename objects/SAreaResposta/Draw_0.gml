draw_self();

if (string_length(texto_digitado) > 5) {
    texto_digitado = string_copy(texto_digitado, 1, 5);
    keyboard_string = texto_digitado;
}

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var digitacao_x = x + 29;
var digitacao_y = y + 1;

draw_text(digitacao_x, digitacao_y, texto_digitado);

if (clicado && (current_time mod 1000 < 500) && estado_atual == ESTADO_FASE.AGUARDANDO) {
    var texto_ate_cursor = string_copy(texto_digitado, 1, posicao_cursor);
    var cursor_x = digitacao_x + string_width(texto_ate_cursor) + 2;
    draw_line(cursor_x, digitacao_y, cursor_x, digitacao_y + string_height("A"));
}