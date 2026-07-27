if (instance_exists(SAreaResposta)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta.estado_atual == ESTADO_FASE.ACERTO) {
		global.fase1_concluida = true
		global.fase2_desbloqueada = true
		global.niveis_completos++
		
		ds_map_set(global.pontos_fases, "fase1", SAreaResposta.pontuacao_fase_atual);

		
		with OTransicao {
			indo = true
			proxima_sala = Nivel2
		}
		
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = string_trim(SAreaResposta.texto_digitado)
        
        // Resposta correta
        if (string_lower(comando) == "print") {
            
            SAreaResposta.estado_atual = ESTADO_FASE.ACERTO
			
			show_debug_message("Pontuação da fase 1: " + string(SAreaResposta.pontuacao_fase_atual));
			show_debug_message("Pontuação total: " + string(scr_calcular_pontuacao_total()));
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta.estado_atual = ESTADO_FASE.ERRO
			
			SAreaResposta.pontuacao_fase_atual = max(0, SAreaResposta.pontuacao_fase_atual - 500);

            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps)
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta.alarm[0] = 1 * game_get_speed(gamespeed_fps)
        } 
    } 
}