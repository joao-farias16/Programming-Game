if (instance_exists(SAreaResposta_Desafio6)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_Desafio6.estado_atual == ESTADO_FASE.ACERTO) {
        global.desafio6_concluido = true;
		global.niveis_completos++
		
		scr_salvar_jogo();
        
        with (OTransicao) {
            indo = true;
            proxima_sala = Desafio7;
        }
        
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = scr_normalizar_codigo(SAreaResposta_Desafio6.texto_digitado);
        
        // Respostas aceitas (variações válidas do código corrigido)
        var resposta_1 = scr_normalizar_codigo("nota = 7.5\nif nota >= 9:\nclassificacao = \"a\"\nelif nota >= 7:\nclassificacao = \"b\"\nelif nota >= 5:\nclassificacao = \"c\"\nelse:\nclassificacao = \"d\"\nprint(classificacao)");
        
        // Resposta correta
        if (comando == resposta_1) {
            
            SAreaResposta_Desafio6.estado_atual = ESTADO_FASE.ACERTO;
			
			scr_pontos_confirmar_acerto(SAreaResposta_Desafio5, "");
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_Desafio6.estado_atual = ESTADO_FASE.ERRO;
			
			scr_pontos_errar(SAreaResposta_Desafio6, 100);
			
			with (LampadaDesafio6)
			{
				contador_erros++;

				if (contador_erros >= 2 && nivel_dica < 1)
				{
					nivel_dica = 1;

					alpha_dica1 = 0;
					offset_dica1 = 10;
					
					scr_pontos_errar(SAreaResposta_Desafio6, 200);
				}

				else if (contador_erros >= 4 && nivel_dica < 2)
				{
					nivel_dica = 2;

					alpha_dica2 = 0;
					offset_dica2 = 10;
					
					scr_pontos_errar(SAreaResposta_Desafio6, 300);
				}

				else if (contador_erros >= 6 && nivel_dica < 3)
				{
					nivel_dica = 3;

					alpha_dica3 = 0;
					offset_dica3 = 10;
					
					scr_pontos_errar(SAreaResposta_Desafio6, 400);
				}
			}
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_Desafio6.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}