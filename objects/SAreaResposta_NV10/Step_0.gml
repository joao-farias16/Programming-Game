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
}

// Enter confirma
if (clicado && keyboard_check_pressed(vk_return)) {
    keyboard_clear(vk_return);

    if (instance_exists(SAreaResposta_NV10) && instance_exists(SAreaResposta2NV10)) {
        
        // Se as duas respostas já estão corretas,
        // avança para a próxima fase
        if (SAreaResposta_NV10.estado_atual == ESTADO_FASE.ACERTO &&
            SAreaResposta2NV10.estado_atual == ESTADO_FASE.ACERTO) {
            
            global.fase10_concluida = true;
            global.fase11_desbloqueada = true;
            global.niveis_completos++;
            
            scr_salvar_jogo();
            
            with (OTransicao) {
                indo = true;
                proxima_sala = Nivel11;
            }
        }
        else {
            
            var comando1 = string_trim(SAreaResposta_NV10.texto_digitado);
            var comando2 = string_trim(SAreaResposta2NV10.texto_digitado);
            
            // Resposta correta
            if (string_lower(comando1) == "+" &&
                string_lower(comando2) == "+") {
                
                SAreaResposta_NV10.estado_atual = ESTADO_FASE.ACERTO;
                SAreaResposta2NV10.estado_atual = ESTADO_FASE.ACERTO;
                
                scr_pontos_confirmar_acerto(SAreaResposta_NV10, "_a");
                scr_pontos_confirmar_acerto(SAreaResposta2NV10, "_b");
            }
            else {
                
                // Resposta incorreta
                SAreaResposta_NV10.estado_atual = ESTADO_FASE.ERRO;
                SAreaResposta2NV10.estado_atual = ESTADO_FASE.ERRO;
                
                scr_pontos_errar(SAreaResposta_NV10, 50);
                scr_pontos_errar(SAreaResposta2NV10, 50);
                
                with (LampadaNivel10) {
                    contador_erros++;

                    if (contador_erros >= 2 && nivel_dica < 1) {
                        nivel_dica = 1;
                        alpha_dica1 = 0;
                        offset_dica1 = 10;
                        
                        scr_pontos_errar(SAreaResposta_NV10, 100);
                        scr_pontos_errar(SAreaResposta2NV10, 100);
                    }
                    else if (contador_erros >= 4 && nivel_dica < 2) {
                        nivel_dica = 2;
                        alpha_dica2 = 0;
                        offset_dica2 = 10;
                        
                        scr_pontos_errar(SAreaResposta_NV10, 150);
                        scr_pontos_errar(SAreaResposta2NV10, 150);
                    }
                    else if (contador_erros >= 6 && nivel_dica < 3) {
                        nivel_dica = 3;
                        alpha_dica3 = 0;
                        offset_dica3 = 10;
                        
                        scr_pontos_errar(SAreaResposta_NV10, 200);
                        scr_pontos_errar(SAreaResposta2NV10, 200);
                    }
                }
                
                if (instance_exists(Neutro)) {
                    Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
                }
                
                SAreaResposta_NV10.alarm[0] = 1 * game_get_speed(gamespeed_fps);
                SAreaResposta2NV10.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
        }
    }
}