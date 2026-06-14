if (instance_exists(SAreaResposta)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta.estado_atual == ESTADO_FASE.ACERTO) {
		global.fase1_concluida = true
		global.fase2_desbloqueada = true
		
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
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta.estado_atual = ESTADO_FASE.ERRO
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps)
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta.alarm[0] = 1 * game_get_speed(gamespeed_fps)
        } 
    } 
}