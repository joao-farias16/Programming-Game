// Clique do mouse para posicionar o cursor
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    clicado = true;
    keyboard_string = texto_digitado;
    
    var digitacao_x = x + 27;
    var digitacao_y = y + 1;
    var altura_linha = string_height("A");
    
    var linhas = string_split(texto_digitado, "\n");
    var num_linhas = array_length(linhas);
    
    // Descobre em qual linha o mouse clicou
    var linha_idx = floor((mouse_y - digitacao_y) / altura_linha);
    linha_idx = clamp(linha_idx, 0, num_linhas - 1);
    
    // Descobre em qual coluna (letra) da linha o mouse clicou
    var linha_texto = linhas[linha_idx];
    var col = 0;
    for (var i = 1; i <= string_length(linha_texto); i++) {
        var largura = string_width(string_copy(linha_texto, 1, i));
        if (mouse_x < digitacao_x + largura) {
            col = i - 1;
            break;
        }
        col = i;
    }
    
    // Converte (linha, coluna) para posição absoluta dentro de texto_digitado
    var pos_absoluta = 0;
    for (var j = 0; j < linha_idx; j++) {
        pos_absoluta += string_length(linhas[j]) + 1; // +1 pela quebra de linha
    }
    pos_absoluta += col;
    
    posicao_cursor = pos_absoluta;
}

// Clicar fora tira o foco
if (mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, id)) {
    clicado = false;
}

if (clicado && estado_atual == ESTADO_FASE.AGUARDANDO) {
    
    // Mover cursor com setas
    if (keyboard_check_pressed(vk_left)) {
        posicao_cursor = max(0, posicao_cursor - 1);
    }
    if (keyboard_check_pressed(vk_right)) {
        posicao_cursor = min(string_length(texto_digitado), posicao_cursor + 1);
    }
    
    var texto_novo = keyboard_string;
    
    if (string_length(texto_novo) > string_length(texto_digitado)) {
        // Inserir letra na posição do cursor
        var letra = string_char_at(texto_novo, string_length(texto_novo));
        texto_digitado = string_insert(letra, texto_digitado, posicao_cursor + 1);
        posicao_cursor++;
        keyboard_string = texto_digitado;
        
    } else if (string_length(texto_novo) < string_length(texto_digitado)) {
        // Backspace apaga na posição do cursor
        if (posicao_cursor > 0) {
            texto_digitado = string_delete(texto_digitado, posicao_cursor, 1);
            posicao_cursor--;
            keyboard_string = texto_digitado;
        } else {
            keyboard_string = texto_digitado;
        }
    }
    
    // Enter insere quebra de linha
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_return)) {
        keyboard_clear(vk_enter);
        keyboard_clear(vk_return);
        texto_digitado = string_insert("\n", texto_digitado, posicao_cursor + 1);
        posicao_cursor++;
        keyboard_string = texto_digitado;
    }
}