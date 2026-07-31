draw_sprite(SHeader, 0, 0, 0)
draw_sprite(SBotaoVoltarNiveis, 0, 622, 14)
draw_sprite(SBotaoHelp, 0, 1274, 16)

draw_sprite(Nota, 0, 1775, 40);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_text(1825, 35, string(scr_calcular_nota()));