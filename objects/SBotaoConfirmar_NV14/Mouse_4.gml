if (instance_exists(SAreaResposta_NV14)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV14.estado_atual == ESTADO_FASE.ACERTO) {
		global.fase14_concluida = true
		global.fase15_desbloqueada = true
		global.niveis_completos++
		
		scr_salvar_jogo();
		
		with OTransicao {
			indo = true
			proxima_sala = Nivel15
		}
		
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = string_trim(SAreaResposta_NV14.texto_digitado)
        
        // Resposta correta
        if (string_lower(comando) == "elif") {
            
            SAreaResposta_NV14.estado_atual = ESTADO_FASE.ACERTO
			
			scr_pontos_confirmar_acerto(SAreaResposta_NV14, "");

            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV14.estado_atual = ESTADO_FASE.ERRO
			
			scr_pontos_errar(SAreaResposta_NV14, 100);
			
			with (LampadaNivel14)
			{
				contador_erros++;

				if (contador_erros >= 2 && nivel_dica < 1)
				{
					nivel_dica = 1;

					alpha_dica1 = 0;
					offset_dica1 = 10;
					
					scr_pontos_errar(SAreaResposta_NV14, 200);
				}

				else if (contador_erros >= 4 && nivel_dica < 2)
				{
					nivel_dica = 2;

					alpha_dica2 = 0;
					offset_dica2 = 10;
					
					scr_pontos_errar(SAreaResposta_NV14, 300);
				}

				else if (contador_erros >= 6 && nivel_dica < 3)
				{
					nivel_dica = 3;

					alpha_dica3 = 0;
					offset_dica3 = 10;
					
					scr_pontos_errar(SAreaResposta_NV14, 400);
				}
			}
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps)
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV14.alarm[0] = 1 * game_get_speed(gamespeed_fps)
        } 
    } 
}