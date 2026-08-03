if (instance_exists(SAreaResposta_NV30) && instance_exists(SAreaResposta2NV30)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV30.estado_atual == ESTADO_FASE.ACERTO && SAreaResposta2NV30.estado_atual == ESTADO_FASE.ACERTO) {
		global.fase30_concluida = true
		global.fase31_desbloqueada = true
		global.niveis_completos++
		
		scr_salvar_jogo();
		
		with OTransicao {
			indo = true
			proxima_sala = Nivel31
		}
		
    } 
    // Se ainda está testando o código:
    else {
        
        var comando1 = string_trim(SAreaResposta_NV30.texto_digitado)
        var comando2 = string_trim(SAreaResposta2NV30.texto_digitado)
        
        // Resposta correta
        if (string_lower(comando1) == "and" && string_lower(comando2) == "%") {
            
            SAreaResposta_NV30.estado_atual = ESTADO_FASE.ACERTO
            SAreaResposta2NV30.estado_atual = ESTADO_FASE.ACERTO
			
			scr_pontos_confirmar_acerto(SAreaResposta_NV30, "_a");
			scr_pontos_confirmar_acerto(SAreaResposta2NV30, "_b");

            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV30.estado_atual = ESTADO_FASE.ERRO
            SAreaResposta2NV30.estado_atual = ESTADO_FASE.ERRO
			
			scr_pontos_errar(SAreaResposta_NV30, 50);
			scr_pontos_errar(SAreaResposta2NV30, 50);
			
			with (LampadaNivel30)
			{
				contador_erros++;

				if (contador_erros >= 2 && nivel_dica < 1)
				{
					nivel_dica = 1;

					alpha_dica1 = 0;
					offset_dica1 = 10;
					
					scr_pontos_errar(SAreaResposta_NV30, 100);
					scr_pontos_errar(SAreaResposta2NV30, 100);
				}

				else if (contador_erros >= 4 && nivel_dica < 2)
				{
					nivel_dica = 2;

					alpha_dica2 = 0;
					offset_dica2 = 10;
					
					scr_pontos_errar(SAreaResposta_NV30, 150);
					scr_pontos_errar(SAreaResposta2NV30, 150);
				}

				else if (contador_erros >= 6 && nivel_dica < 3)
				{
					nivel_dica = 3;

					alpha_dica3 = 0;
					offset_dica3 = 10;
					
					scr_pontos_errar(SAreaResposta_NV30, 200);
					scr_pontos_errar(SAreaResposta2NV30, 200);
				}
			}
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps)
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV30.alarm[0] = 1 * game_get_speed(gamespeed_fps)
            SAreaResposta2NV30.alarm[0] = 1 * game_get_speed(gamespeed_fps)
        } 
    } 
}