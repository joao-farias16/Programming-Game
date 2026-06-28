// ========================================
// DEFINE QUAL SPRITE DEVE SER EXIBIDO
// ========================================

var novo_sprite

// Quando a resposta estiver correta,
// o botão vira "Próxima Fase"
if (instance_exists(SAreaResposta_NV8) && SAreaResposta_NV8.estado_atual == ESTADO_FASE.ACERTO) {

	novo_sprite = SBotaoProximaFase

}
else {

	// Mantém o botão de executar código
	novo_sprite = BotaoConfirmar

}


// ========================================
// INICIA A TRANSIÇÃO
// ========================================

// Se o sprite desejado for diferente do atual,
// inicia o fade
if (novo_sprite != sprite_index && !trocando) {

	sprite_alvo = novo_sprite
	trocando = true

}


// ========================================
// TRANSIÇÃO DE FADE
// ========================================

if (trocando) {

	// Faz o sprite desaparecer aos poucos
	image_alpha -= 0.08

	// Quando ficar invisível,
	// troca para o novo sprite
	if (image_alpha <= 0) {

		image_alpha = 0
		sprite_index = sprite_alvo

		// Finaliza a troca
		trocando = false
	}
}
else {

	// Faz o sprite aparecer aos poucos
	if (image_alpha < 1) {
		image_alpha += 0.08
	}

	// Garante que a transparência não passe de 1
	if (image_alpha > 1) {
		image_alpha = 1
	}
}