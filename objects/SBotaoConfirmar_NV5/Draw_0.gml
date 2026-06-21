draw_self()
/*// Calcula o centro exato do botão usando suas dimensões atuais
var centro_botao_x = x + (sprite_width / 2);
var centro_botao_y = y + (sprite_height / 2);

if (instance_exists(AreaResposta) && AreaResposta.estado_atual == ESTADO_FASE.ACERTO) {
    // Se acertou, pinta o botão de verde
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_lime, 1);
    
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(centro_botao_x, centro_botao_y, "Continuar ->");
} else {
    // Se não acertou, desenha o botão azul normal
    draw_self();
    
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
}

// Reseta o alinhamento padrão do GameMaker
draw_set_halign(fa_left);
draw_set_valign(fa_top);
*/