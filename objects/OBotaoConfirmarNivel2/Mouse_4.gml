if (instance_exists(OAreaRespostaNivel2)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (OAreaRespostaNivel2.estado_atual == ESTADO_FASE.ACERTO) {
		global.fase2_concluida = true
		global.fase3_desbloqueada = true
		
		with OTransicao {
			indo = true
			proxima_sala = TelaNiveis
		}
		
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = string_trim(OAreaRespostaNivel2.texto_digitado)
        
        // Resposta correta
        if (string_lower(comando) == "print(\"ola mundo\")") {
            
            OAreaRespostaNivel2.estado_atual = ESTADO_FASE.ACERTO
            
        } 
        else {
            
            // Resposta incorreta
            OAreaRespostaNivel2.estado_atual = ESTADO_FASE.ERRO
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps)
            }
            
            // Limpa a área de resposta após um tempo
            OAreaRespostaNivel2.alarm[0] = 1 * game_get_speed(gamespeed_fps)
        } 
    } 
}