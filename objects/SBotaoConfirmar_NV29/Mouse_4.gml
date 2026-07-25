if (instance_exists(SAreaResposta_NV29)) {
    
    // Se o jogador já acertou e clicar novamente,
    // avança para a tela de níveis
    if (SAreaResposta_NV29.estado_atual == ESTADO_FASE.ACERTO) {
        global.fase29_concluida = true;
        global.fase30_desbloqueada = true;
		global.niveis_completos++
        
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
            
        } 
        else {
            
            // Resposta incorreta
            SAreaResposta_NV29.estado_atual = ESTADO_FASE.ERRO;
            
            // Faz a imagem voltar para o estado neutro
            if (instance_exists(Neutro)) {
                Neutro.alarm[0] = 1 * game_get_speed(gamespeed_fps);
            }
            
            // Limpa a área de resposta após um tempo
            SAreaResposta_NV29.alarm[0] = 1 * game_get_speed(gamespeed_fps);
        } 
    } 
}