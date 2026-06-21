if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    clicado = true;
    keyboard_string = texto_digitado;
    var digitacao_x = x + 27;
    var pos = 0;
    for (var i = 1; i <= string_length(texto_digitado); i++) {
        var largura = string_width(string_copy(texto_digitado, 1, i));
        if (mouse_x < digitacao_x + largura) {
            pos = i - 1;
            break;
        }
        pos = i;
    }
    posicao_cursor = pos;
}
if (mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, id)) {
    clicado = false;
}
if (clicado && estado_atual == ESTADO_FASE.AGUARDANDO) {
    if (keyboard_check_pressed(vk_left)) {
        posicao_cursor = max(0, posicao_cursor - 1);
    }
    if (keyboard_check_pressed(vk_right)) {
        posicao_cursor = min(string_length(texto_digitado), posicao_cursor + 1);
    }
    var texto_novo = keyboard_string;
    if (string_length(texto_novo) > string_length(texto_digitado)) {
        var letra = string_char_at(texto_novo, string_length(texto_novo));
        texto_digitado = string_insert(letra, texto_digitado, posicao_cursor + 1);
        posicao_cursor++;
        keyboard_string = texto_digitado;
    } else if (string_length(texto_novo) < string_length(texto_digitado)) {
        if (posicao_cursor > 0) {
            texto_digitado = string_delete(texto_digitado, posicao_cursor, 1);
            posicao_cursor--;
            keyboard_string = texto_digitado;
        } else {
            keyboard_string = texto_digitado;
        }
    }
    if (keyboard_check_pressed(vk_return)) {
        keyboard_clear(vk_return);
        var comando = string_trim(texto_digitado);
        if (estado_atual == ESTADO_FASE.ACERTO) {
            global.fase5_concluida = true;
            if (instance_exists(OTransicao)) {
                with (OTransicao) {
                    indo = true;
                    proxima_sala = TelaNiveis;
                }
            }
        } else if (comando == "%") {
            estado_atual = ESTADO_FASE.ACERTO;
        } else {
            estado_atual = ESTADO_FASE.ERRO;
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            alarm[0] = 1 * game_get_speed(gamespeed_fps);
        }
    }
}