var velocidade = 5;
depth = 1;

if (keyboard_check(ord("A"))) {
    sprite_index = spr_andando_jogadorE;
    direcao = 1;
	
    if (!place_meeting(x - velocidade, y, colisao)) {
        x -= velocidade;
    }
}


else if (keyboard_check(ord("D"))) {
    sprite_index = spr_andando_jogadorD;
    direcao=-1;

    if (!place_meeting(x + velocidade, y, colisao)) {
        x += velocidade;
    }
}

else if(!keyboard_check(ord("A")) && !keyboard_check(ord("D"))){
	if(direcao==1) {
		sprite_index = spr_parado_jogadorE;	
	}
	if(direcao==-1) {
		sprite_index = spr_parado_jogadorD;	
	}
	
}
	var key_jump = keyboard_check_pressed(vk_space);
var grounded = place_meeting(x, y + 1, obj_chao);


if (key_jump) {
	if(direcao==1) {
	sprite_index = jumpingA;
	}
	if(direcao==-1) {
	sprite_index = jumpingD;	
	}
    show_debug_message("Teclou ESPAÇO!");
    if (grounded) {
        show_debug_message("Esta no chao! Pulou!");
        vspd = jumpspeed;
    } else {
        show_debug_message("NAO esta no chao!");
    }
}

	if (!grounded) {
    vspd += grv;
}

	if (place_meeting(x, y + vspd, obj_chao)) {
		while (!place_meeting(x, y + sign(vspd), obj_chao)) {
        y += sign(vspd);
    }
		vspd = 0;
}

	y += vspd;


 if(place_meeting(x,y,portal)) {
	 room_goto_next();
 }

if (!grounded) {
 
    if (direcao == 1) {
        sprite_index = jumpingD; // Pulando para a esquerda
    } else {
        sprite_index = jumpingA; // Pulando para a direita
    }
    
    
    image_speed = 0.2;
    
    
    if (image_index >= image_number - 1) {
        image_speed = 0;
    }
} 
else {
    
    image_speed = 1; 
    
    if (keyboard_check(ord("A"))) {
        sprite_index = spr_andando_jogadorE;
    } 
    else if (keyboard_check(ord("D"))) {
        sprite_index = spr_andando_jogadorD;
    } 
    else {
        if (direcao == 1) {
            sprite_index = spr_parado_jogadorD;
        } else {
            sprite_index = spr_parado_jogadorE;
        }
    }
}