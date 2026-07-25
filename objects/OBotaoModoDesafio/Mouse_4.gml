if global.niveis_completos == 32 {
	with OTransicao {
		indo = true
		proxima_sala = TelaNiveis
	}
}
else {
	with OTransicao {
		indo = true
		proxima_sala = TelaDesafioBloqueado
	}
}