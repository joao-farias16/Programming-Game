if (instance_exists(SAreaResposta_NV9)) {

	// Define qual sprite deve ser mostrado
	var novo_sprite

	if (SAreaResposta_NV9.estado_atual == ESTADO_FASE.ACERTO) {
		novo_sprite = Correto
	}
	else if (SAreaResposta_NV9.estado_atual == ESTADO_FASE.ERRO) {
		novo_sprite = Errado
	}
	else {
		novo_sprite = Neutro
	}

	// Se o sprite desejado for diferente do atual,
	// inicia a transição
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

		// Faz o novo sprite aparecer aos poucos
		if (image_alpha < 1) {
			image_alpha += 0.08
		}

		// Garante que a transparência não passe de 1
		if (image_alpha > 1) {
			image_alpha = 1
		}
	}
}