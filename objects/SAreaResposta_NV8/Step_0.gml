// Clique do mouse para posicionar o cursor
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    clicado = true;
    keyboard_string = texto_digitado;
    
    // Calcula em qual letra o mouse clicou
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

		if (string_length(texto_digitado) < max_caracteres_linha) {
			var letra = string_char_at(texto_novo, string_length(texto_novo));
			texto_digitado = string_insert(letra, texto_digitado, posicao_cursor + 1);
			posicao_cursor++;
		}

		keyboard_string = texto_digitado;
	}
        
    else if (string_length(texto_novo) < string_length(texto_digitado)) {
        // Backspace apaga na posição do cursor
        if (posicao_cursor > 0) {
            texto_digitado = string_delete(texto_digitado, posicao_cursor, 1);
            posicao_cursor--;
            keyboard_string = texto_digitado;
        } else {
            keyboard_string = texto_digitado;
        }
    }
    
    // Enter confirma
   if (keyboard_check_pressed(vk_return)) {
    keyboard_clear(vk_return);
    
    var comando = string_trim(texto_digitado);
    show_debug_message("Comando: " + comando);
    
    if (estado_atual == ESTADO_FASE.ACERTO) {
        global.fase8_concluida = true;
        if (instance_exists(OTransicao)) {
            with (OTransicao) {
                indo = true;
                proxima_sala = Nivel9;
            }
        }
    } else if (string_lower(comando) == "nome = \"python\"") {
        estado_atual = ESTADO_FASE.ACERTO;
		scr_pontos_confirmar_acerto(SAreaResposta_NV8, "");

    } else {
        estado_atual = ESTADO_FASE.ERRO;
		scr_pontos_errar(SAreaResposta_NV8, 100);
		
		with (LampadaNivel8)
			{
				contador_erros++;

				if (contador_erros >= 2 && nivel_dica < 1)
				{
					nivel_dica = 1;

					alpha_dica1 = 0;
					offset_dica1 = 10;
					
					scr_pontos_errar(SAreaResposta_NV8, 200);
				}

				else if (contador_erros >= 4 && nivel_dica < 2)
				{
					nivel_dica = 2;

					alpha_dica2 = 0;
					offset_dica2 = 10;
					
					scr_pontos_errar(SAreaResposta_NV8, 300);
				}

				else if (contador_erros >= 6 && nivel_dica < 3)
				{
					nivel_dica = 3;

					alpha_dica3 = 0;
					offset_dica3 = 10;
					
					scr_pontos_errar(SAreaResposta_NV8, 400);
				}
			}
		
        if (instance_exists(Neutro)) {
            Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        }
        alarm[0] = 1 * game_get_speed(gamespeed_fps);
    }
}
}