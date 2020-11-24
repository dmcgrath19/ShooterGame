class Bullet {
  boolean onScreen = true;
  float x; float y;
  float x2;
  float dy;
  int radius;
  color ballColor;
  boolean shootsDouble = false;
  
  Bullet(Player player){
    x = player.xpos + PADDLEWIDTH/2;
    y = player.ypos;
    dy = 2;
    radius=5;
    ballColor = color(255);
  }
  
  Bullet(Player player, PowerUp power){
    if (power.power == cherry){
      x = player.xpos + PADDLEWIDTH/4; 
      x2 = player.xpos + PADDLEWIDTH * 3 /4;
      y = player.ypos;
      dy = 2;
      shootsDouble = true;
      ballColor = color(245, 91, 91);
      radius = 5;
    }
    else if(power.power == bolt){
      x = player.xpos + PADDLEWIDTH/2;
      y = player.ypos;
      dy = 4;
      radius=5;
      ballColor = color(255, 255, 151);
    }
    else if(power.power == star){
      x = player.xpos + PADDLEWIDTH/2;
      y = player.ypos;
      dy = 4;
      radius = 15;
      ballColor = color(255, 194, 242);
    }
     
  }

  void move(){
    y-= dy;
    if(y < 0) onScreen = false;
  }
  
  void draw(){
    fill(ballColor);
    if (shootsDouble){
      ellipse(int(x), int(y), radius, radius);
      ellipse(int(x2), int(y), radius, radius);
    }
    else
    ellipse(int(x), int(y), radius, radius);
  }

  void collide(Alien alien){
    if((alien.y + ALIENHEIGHT >= y && alien.y <=  y + radius) && (alien.x <= x +radius && alien.x + ALIENWIDTH >= x) && alien.status){
        alien.explode();
    }
    
    if (y-radius <=0)
    dy = -dy;
  }
  

    
  
  
}
