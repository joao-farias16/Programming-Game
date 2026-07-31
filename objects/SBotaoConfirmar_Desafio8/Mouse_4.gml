if (instance_exists(SAreaResposta_Desafio8)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_Desafio8.estado_atual == ESTADO_FASE.ACERTO) {
        global.desafio8_concluido = true;
		global.niveis_completos++
        
        with (OTransicao) {
            indo = true;
            proxima_sala = DesafiosConcluidos;
        }
        
    } 
    // Se ainda está testando o código:
    else {
        
        // Resposta correta
        if (scr_validar_desafio(8, SAreaResposta_Desafio8.texto_digitado)) {
            
            SAreaResposta_Desafio8.estado_atual = ESTADO_FASE.ACERTO;
			
			scr_pontos_confirmar_acerto(SAreaResposta_Desafio8, "");
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_Desafio8.estado_atual = ESTADO_FASE.ERRO;
			
			scr_pontos_errar(SAreaResposta_Desafio8, 100);
			
			with (LampadaDesafio8)
			{
				contador_erros++;

				if (contador_erros >= 2 && nivel_dica < 1)
				{
					nivel_dica = 1;

					alpha_dica1 = 0;
					offset_dica1 = 10;
					
					scr_pontos_errar(SAreaResposta_Desafio8, 200);
				}

				else if (contador_erros >= 4 && nivel_dica < 2)
				{
					nivel_dica = 2;

					alpha_dica2 = 0;
					offset_dica2 = 10;
					
					scr_pontos_errar(SAreaResposta_Desafio8, 300);
				}

				else if (contador_erros >= 6 && nivel_dica < 3)
				{
					nivel_dica = 3;

					alpha_dica3 = 0;
					offset_dica3 = 10;
					
					scr_pontos_errar(SAreaResposta_Desafio8, 400);
				}
			}
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_Desafio8.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}