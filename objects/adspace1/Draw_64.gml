
var _gui_largura = display_get_gui_width();


draw_set_font(Font1); 
draw_set_color(c_white);


draw_set_halign(fa_center);
draw_set_valign(fa_top);


if (etapa_tutorial == 0) 
{

    
    draw_text(_gui_largura /2, 40, "Aperte A ou D para andar");
}
else if (etapa_tutorial == 1) 
{
   

    draw_text(_gui_largura / 2, 40, "Aperte ESPAÇO para pular");
}

// 5. Reseta o alinhamento para não desconfigurar outros textos do jogo
draw_set_halign(fa_left);
var _gui_largura = display_get_gui_width();

draw_set_font(Font1);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Desenha a mensagem a ser "digitada" aos poucos na tela
draw_text(_gui_largura / 2, 40, texto_atual);

draw_set_halign(fa_left);