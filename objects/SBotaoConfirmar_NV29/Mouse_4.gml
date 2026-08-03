if (instance_exists(SAreaResposta_NV29)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV29.estado_atual == ESTADO_FASE.ACERTO) {
        global.fase29_concluida = true;
        global.fase30_desbloqueada = true;
		global.niveis_completos++
		
		scr_salvar_jogo();
        
        with (OTransicao) {
            indo = true;
            proxima_sala = Bloco7Concluido;
        }
        
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = scr_normalizar_codigo(SAreaResposta_NV29.texto_digitado);
        
        // Respostas aceitas (variações válidas do código corrigido)
        var resposta_1 = scr_normalizar_codigo("soma = 0\nfor i in range(11):\nif i % 2 == 0:\nsoma += i\nprint(soma)");
        
        // Resposta correta
        if (comando == resposta_1) {
            
            SAreaResposta_NV29.estado_atual = ESTADO_FASE.ACERTO;
            
			scr_pontos_confirmar_acerto(SAreaResposta_NV29, "");

        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV29.estado_atual = ESTADO_FASE.ERRO;
			
			scr_pontos_errar(SAreaResposta_NV29, 100);
			
			with (LampadaNivel29)
			{
				contador_erros++;

				if (contador_erros >= 2 && nivel_dica < 1)
				{
					nivel_dica = 1;

					alpha_dica1 = 0;
					offset_dica1 = 10;
					
					scr_pontos_errar(SAreaResposta_NV29, 200);
				}

				else if (contador_erros >= 4 && nivel_dica < 2)
				{
					nivel_dica = 2;

					alpha_dica2 = 0;
					offset_dica2 = 10;
					
					scr_pontos_errar(SAreaResposta_NV29, 300);
				}

				else if (contador_erros >= 6 && nivel_dica < 3)
				{
					nivel_dica = 3;

					alpha_dica3 = 0;
					offset_dica3 = 10;
					
					scr_pontos_errar(SAreaResposta_NV29, 400);
				}
			}
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV29.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}