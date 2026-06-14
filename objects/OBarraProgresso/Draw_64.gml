draw_self()

// Desenha o progresso
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_set_color(make_color_rgb(108, 124, 147))

draw_text(1276, 55, string(fases_concluidas) + "/32")