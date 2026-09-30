// Verificar o estado atual de cada tecla
image_speed = 0;
var _a     = keyboard_check(ord("A"));
var _d     = keyboard_check(ord("D"));
var _space = keyboard_check(vk_space);

// Atualizar o frame exato do sprite com base nas combinações
if (!_a && !_d && !_space)
{
    image_index = 0; // Nenhum pressionado
}
else if (_a && !_d && !_space)
{
    image_index = 1; // A
}
else if (!_a && _d && !_space)
{
    image_index = 2; // D
}
else if (!_a && !_d && _space)
{
    image_index = 3; // SPACE
}
else if (_a && _d && !_space)
{
    image_index = 4; // A + D
}
else if (_a && !_d && _space)
{
    image_index = 5; // A + SPACE
}
else if (!_a && _d && _space)
{
    image_index = 6; // D + SPACE
}
else if (_a && _d && _space)
{
    image_index = 7; // A + D + SPACE
}