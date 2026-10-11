function tocar_resposta(_correta) {
    var _som = _correta ? confirmation_002 : back_002;
    var _inst = audio_play_sound(_som, 1, false);
    audio_sound_gain(_inst, global.volume_sfx, 0);
    return _correta;
}