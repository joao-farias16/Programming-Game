if (instance_exists(OAreaRespostaNivel2)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (OAreaRespostaNivel2.estado_atual == ESTADO_FASE.ACERTO) {
		global.fase2_concluida = true
		global.fase3_desbloqueada = true
		global.niveis_completos++
		
		scr_salvar_jogo();
		
		with OTransicao {
			indo = true
			proxima_sala = Nivel3
		}
		
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = string_trim(OAreaRespostaNivel2.texto_digitado)
        
        // Resposta correta
        if (string_lower(comando) == "print(\"ola mundo\")") {
            
            OAreaRespostaNivel2.estado_atual = ESTADO_FASE.ACERTO
			
			scr_pontos_confirmar_acerto(OAreaRespostaNivel2, "");

            
        } 
        else {
            
            // Resposta incorreta
            OAreaRespostaNivel2.estado_atual = ESTADO_FASE.ERRO
			
			scr_pontos_errar(OAreaRespostaNivel2, 100);
			
			with (LampadaNivel2)
			{
				contador_erros++;

				if (contador_erros >= 2 && nivel_dica < 1)
				{
					nivel_dica = 1;

					alpha_dica1 = 0;
					offset_dica1 = 10;
					
					scr_pontos_errar(OAreaRespostaNivel2, 200);
				}

				else if (contador_erros >= 4 && nivel_dica < 2)
				{
					nivel_dica = 2;

					alpha_dica2 = 0;
					offset_dica2 = 10;
					
					scr_pontos_errar(OAreaRespostaNivel2, 300);
				}

				else if (contador_erros >= 6 && nivel_dica < 3)
				{
					nivel_dica = 3;

					alpha_dica3 = 0;
					offset_dica3 = 10;
					
					scr_pontos_errar(OAreaRespostaNivel2, 400);
				}
			}
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps)
            }
            
            // Limpa a área de resposta após um tempo
            OAreaRespostaNivel2.alarm[0] = 1 * game_get_speed(gamespeed_fps)
        } 
    } 
}