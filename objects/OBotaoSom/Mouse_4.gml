global.som_ativo = !global.som_ativo

if global.som_ativo {
	audio_master_gain(global.volume)
}
else {
	audio_master_gain(0)
}