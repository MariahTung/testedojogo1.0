var velocidade = 2.5;

if (!place_meeting(x, y, obj_jogador)) {
    
    if (obj_jogador.x > x) {
        sprite_index = spr_robo_andandoD;
        direcao = 1;
        x += velocidade;	
    } 
    else if (obj_jogador.x < x) {
        sprite_index = spr_robo_andandoE;
        direcao = -1;
        x -= velocidade;	
    }

} 

else {
    if (direcao == 1) {
        sprite_index = spr_robo_paradoD;	
    } 
    else if (direcao == -1) {
        sprite_index = spr_robo_paradoE;	
    }
    
    obj_jogador.vida -= dano; 
}

if (obj_jogador.vida == 0) {
    room_restart();
}