if global.niveis_completos >= 32 {
	with OTransicao {
		indo = true
		proxima_sala = TelaDesafio
	}
}
else {
	with OTransicao {
		indo = true
		proxima_sala = TelaDesafioBloqueado
	}
}

audio_play_sound(drop_001,2,false);