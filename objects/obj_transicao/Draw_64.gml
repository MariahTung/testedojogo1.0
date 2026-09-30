if (alpha > 0) 
{
    var _gui_largura = display_get_gui_width();
    var _gui_altura = display_get_gui_height();

    draw_set_color(c_black);
    draw_set_alpha(alpha);


    draw_rectangle(0, 0, _gui_largura, _gui_altura, false);

    draw_set_alpha(1);
    draw_set_color(c_white);
}