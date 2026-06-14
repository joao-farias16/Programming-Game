gpu_set_texfilter(false)
global.som_ativo = true;
global.volume = 0.6
global.fullscreen = false

var base_w = 1920
var base_h = 1080

var display_w = display_get_width()
var display_h = display_get_height()

var scale = min(display_w / base_w, display_h / base_h)

var final_w = base_w * scale
var final_h = base_h * scale

window_set_size(final_w, final_h)
window_center()

// Controle de desbloqueio
global.fase1_desbloqueada = true
global.fase2_desbloqueada = false
global.fase3_desbloqueada = false
global.fase4_desbloqueada = false
global.fase5_desbloqueada = false
global.fase6_desbloqueada = false
global.fase7_desbloqueada = false
global.fase8_desbloqueada = false
global.fase9_desbloqueada = false
global.fase10_desbloqueada = false
global.fase11_desbloqueada = false
global.fase12_desbloqueada = false
global.fase13_desbloqueada = false
global.fase14_desbloqueada = false
global.fase15_desbloqueada = false
global.fase16_desbloqueada = false
global.fase17_desbloqueada = false
global.fase18_desbloqueada = false
global.fase19_desbloqueada = false
global.fase20_desbloqueada = false
global.fase21_desbloqueada = false
global.fase22_desbloqueada = false
global.fase23_desbloqueada = false
global.fase24_desbloqueada = false
global.fase25_desbloqueada = false
global.fase26_desbloqueada = false
global.fase27_desbloqueada = false
global.fase28_desbloqueada = false
global.fase29_desbloqueada = false
global.fase30_desbloqueada = false
global.fase31_desbloqueada = false
global.fase32_desbloqueada = false

// Controle de conclusão
global.fase1_concluida = false
global.fase2_concluida = false
global.fase3_concluida = false
global.fase4_concluida = false
global.fase5_concluida = false
global.fase6_concluida = false
global.fase7_concluida = false
global.fase8_concluida = false
global.fase9_concluida = false
global.fase10_concluida = false
global.fase11_concluida = false
global.fase12_concluida = false
global.fase13_concluida = false
global.fase14_concluida = false
global.fase15_concluida = false
global.fase16_concluida = false
global.fase17_concluida = false
global.fase18_concluida = false
global.fase19_concluida = false
global.fase20_concluida = false
global.fase21_concluida = false
global.fase22_concluida = false
global.fase23_concluida = false
global.fase24_concluida = false
global.fase25_concluida = false
global.fase26_concluida = false
global.fase27_concluida = false
global.fase28_concluida = false
global.fase29_concluida = false
global.fase30_concluida = false
global.fase31_concluida = false
global.fase32_concluida = false