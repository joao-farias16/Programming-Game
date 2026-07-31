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
global.fase2_desbloqueada = true
global.fase3_desbloqueada = true
global.fase4_desbloqueada = true
global.fase5_desbloqueada = true
global.fase6_desbloqueada = true
global.fase7_desbloqueada = true
global.fase8_desbloqueada = true
global.fase9_desbloqueada = true
global.fase10_desbloqueada = true
global.fase11_desbloqueada = true
global.fase12_desbloqueada = true
global.fase13_desbloqueada = true
global.fase14_desbloqueada = true
global.fase15_desbloqueada = true
global.fase16_desbloqueada = true
global.fase17_desbloqueada = true
global.fase18_desbloqueada = true
global.fase19_desbloqueada = true
global.fase20_desbloqueada = true
global.fase21_desbloqueada = true
global.fase22_desbloqueada = true
global.fase23_desbloqueada = true
global.fase24_desbloqueada = true
global.fase25_desbloqueada = true
global.fase26_desbloqueada = true
global.fase27_desbloqueada = true
global.fase28_desbloqueada = true
global.fase29_desbloqueada = true
global.fase30_desbloqueada = true
global.fase31_desbloqueada = true
global.fase32_desbloqueada = true

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

global.niveis_completos = 32

global.desafio1_concluido = false
global.desafio2_concluido = false
global.desafio3_concluido = false
global.desafio4_concluido = false
global.desafio5_concluido = false
global.desafio6_concluido = false
global.desafio7_concluido = false
global.desafio8_concluido = false

global.pontos_fases = 0