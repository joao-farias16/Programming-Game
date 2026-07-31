if (instance_exists(SAreaResposta_Desafio2)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_Desafio2.estado_atual == ESTADO_FASE.ACERTO) {
        global.desafio2_concluido = true;
		global.niveis_completos++
        
        with (OTransicao) {
            indo = true;
            proxima_sala = Desafio3;
        }
        
    } 
    // Se ainda está testando o código:
    else {
        
        // Resposta correta
        if (scr_validar_desafio(2, SAreaResposta_Desafio2.texto_digitado)) {
            
            SAreaResposta_Desafio2.estado_atual = ESTADO_FASE.ACERTO;
			
			scr_pontos_confirmar_acerto(SAreaResposta_Desafio2, "");
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_Desafio2.estado_atual = ESTADO_FASE.ERRO;
			
			scr_pontos_errar(SAreaResposta_Desafio2, 100);
			
			with (LampadaDesafio2)
			{
				contador_erros++;

				if (contador_erros >= 2 && nivel_dica < 1)
				{
					nivel_dica = 1;

					alpha_dica1 = 0;
					offset_dica1 = 10;
					
					scr_pontos_errar(SAreaResposta_Desafio2, 200);
				}

				else if (contador_erros >= 4 && nivel_dica < 2)
				{
					nivel_dica = 2;

					alpha_dica2 = 0;
					offset_dica2 = 10;
					
					scr_pontos_errar(SAreaResposta_Desafio2, 300);
				}

				else if (contador_erros >= 6 && nivel_dica < 3)
				{
					nivel_dica = 3;

					alpha_dica3 = 0;
					offset_dica3 = 10;
					
					scr_pontos_errar(SAreaResposta_Desafio2, 400);
				}
			}
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_Desafio2.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}