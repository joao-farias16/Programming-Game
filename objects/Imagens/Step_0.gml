// Verifica se o objeto AreaResposta existe na tela para não dar erro de código
if (instance_exists(SAreaResposta)) {
    
    // Olha qual é o estado atual lá na AreaResposta e muda o próprio sprite
    if (SAreaResposta.estado_atual == ESTADO_FASE.ACERTO) {
        sprite_index = Correto;
    } 
    else if (SAreaResposta.estado_atual == ESTADO_FASE.ERRO) {
        sprite_index = Errado;
    } 
    else {
        sprite_index = Neutro;
    }
    
}