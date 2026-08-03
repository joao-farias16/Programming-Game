global.volume = 0.6

if global.som_ativo {
	audio_master_gain(global.volume)
}

scr_salvar_jogo();