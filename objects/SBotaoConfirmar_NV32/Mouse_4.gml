if (instance_exists(SAreaResposta_NV32)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV32.estado_atual == ESTADO_FASE.ACERTO) {
        global.fase32_concluida = true;
		global.niveis_completos++
        
        with (OTransicao) {
            indo = true;
            proxima_sala = Parabens;
        }
        
    } 
    // Se ainda está testando o código:
    else {
        
        var comando = scr_normalizar_codigo(SAreaResposta_NV32.texto_digitado);
        
        // Respostas aceitas (variações válidas do código corrigido)
        var resposta_1 = scr_normalizar_codigo("numeros = [1, 2, 3, 4, 5]\nsoma = 0\nfor n in numeros:\nif n % 2 == 0:\nsoma += n\nprint(\"soma dos pares: \" + str(soma))");
        
        // Resposta correta
        if (comando == resposta_1) {
            
            SAreaResposta_NV32.estado_atual = ESTADO_FASE.ACERTO;
			
			scr_pontos_confirmar_acerto(SAreaResposta_NV32, "");

            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV32.estado_atual = ESTADO_FASE.ERRO;
			
			scr_pontos_errar(SAreaResposta_NV32, 125);
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV32.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}