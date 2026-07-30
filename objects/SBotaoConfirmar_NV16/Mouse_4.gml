if (instance_exists(SAreaResposta_NV16)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV16.estado_atual == ESTADO_FASE.ACERTO) {
        global.fase16_concluida = true;
        global.fase17_desbloqueada = true;
		global.niveis_completos++
        
        with (OTransicao) {
            indo = true;
            proxima_sala = Bloco4Concluido;
        }
        
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = scr_normalizar_codigo(SAreaResposta_NV16.texto_digitado);
        
        // Respostas aceitas (variações válidas do código corrigido)
        var resposta_1 = scr_normalizar_codigo("x = 10\nif x == 10:\nprint(\"e dez!\")");
        var resposta_2 = scr_normalizar_codigo("x = 10\nif x == 10:\nprint(\"e dez!\")");
        
        // Resposta correta
        if (comando == resposta_1 || comando == resposta_2) {
            
            SAreaResposta_NV16.estado_atual = ESTADO_FASE.ACERTO;
			
			scr_pontos_confirmar_acerto(SAreaResposta_NV16, "");

            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV16.estado_atual = ESTADO_FASE.ERRO;
			
			scr_pontos_errar(SAreaResposta_NV16, 100);
			
			with (LampadaNivel16)
			{
				contador_erros++;

				if (contador_erros >= 2 && nivel_dica < 1)
				{
					nivel_dica = 1;

					alpha_dica1 = 0;
					offset_dica1 = 10;
					
					scr_pontos_errar(SAreaResposta_NV16, 200);
				}

				else if (contador_erros >= 4 && nivel_dica < 2)
				{
					nivel_dica = 2;

					alpha_dica2 = 0;
					offset_dica2 = 10;
					
					scr_pontos_errar(SAreaResposta_NV16, 300);
				}

				else if (contador_erros >= 6 && nivel_dica < 3)
				{
					nivel_dica = 3;

					alpha_dica3 = 0;
					offset_dica3 = 10;
					
					scr_pontos_errar(SAreaResposta_NV16, 400);
				}
			}
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV16.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}