if (instance_exists(SAreaResposta_Desafio3)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_Desafio3.estado_atual == ESTADO_FASE.ACERTO) {
        global.desafio3_concluido = true;
		global.niveis_completos++
        
        with (OTransicao) {
            indo = true;
            proxima_sala = Desafio4;
        }
        
    } 
    // Se ainda está testando o código:
    else {
        
        // Resposta correta
        if (scr_validar_desafio(3, SAreaResposta_Desafio3.texto_digitado)) {
            
            SAreaResposta_Desafio3.estado_atual = ESTADO_FASE.ACERTO;
			
			scr_pontos_confirmar_acerto(SAreaResposta_Desafio3, "");
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_Desafio3.estado_atual = ESTADO_FASE.ERRO;
			
			scr_pontos_errar(SAreaResposta_Desafio3, 100);
			
			with (LampadaDesafio3)
			{
				contador_erros++;

				if (contador_erros >= 2 && nivel_dica < 1)
				{
					nivel_dica = 1;

					alpha_dica1 = 0;
					offset_dica1 = 10;
					
					scr_pontos_errar(SAreaResposta_Desafio3, 200);
				}

				else if (contador_erros >= 4 && nivel_dica < 2)
				{
					nivel_dica = 2;

					alpha_dica2 = 0;
					offset_dica2 = 10;
					
					scr_pontos_errar(SAreaResposta_Desafio3, 300);
				}

				else if (contador_erros >= 6 && nivel_dica < 3)
				{
					nivel_dica = 3;

					alpha_dica3 = 0;
					offset_dica3 = 10;
					
					scr_pontos_errar(SAreaResposta_Desafio3, 400);
				}
			}
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_Desafio3.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}