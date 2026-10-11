function aplicar_volume() {
    if (audio_is_playing(global.musica)) {
        if (global.som_ativo) {
            audio_sound_gain(global.musica, global.volume, 0);
        } else {
            audio_sound_gain(global.musica, 0, 0);
        }
    }
}