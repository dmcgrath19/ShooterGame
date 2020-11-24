/*

*/
final int SCREENX = 1000;
final int SCREENY = 500;
final int ALIENWIDTH = 30; 
final int ALIENHEIGHT = 25; 


class Alien{
  float x; float y;
  float dx; float dy;
  boolean status;
  float yCount;
  float deadtime = 100;
  float separatespeed = 1;
  int powerNum; 
  PowerUp power;
  int hit = 0;
  
  float xbl; float ybl;
  float xbr; float ybr;
  float xtr; float ytr;
  float xtl; float ytl;
  
  Alien(){
    x = 0 - ALIENWIDTH; y = 0;
    dx = 1; dy = 0;
    yCount = 0;
    status = true;
    powerNum = (int)random(10);
    if(powerNum == 0 || powerNum == 1 || powerNum == 2){
      power = new PowerUp();
    }
  }
  
  void move(){
    if(status){
      if(x + ALIENWIDTH <  SCREENX && dx ==1)  x++;
    
      else if(x + ALIENWIDTH == SCREENX && dx ==1) {
        dx = 2; dy = 1; yCount = 0;
      }
    
      else if(dy == 1 && yCount < ALIENHEIGHT){
         y++;
         yCount++;
      }
      
      else if(dy == 1 && yCount == ALIENHEIGHT){
        dy = 0; 
        yCount =0;
        if(dx ==2) dx = -1;
        if(dx == -2) dx =1;
      }
    
      else if(dx == -1 && 0 < x) x--;
    
      else if (dx == -1 && 0 == x){
        dx = -2; dy = 1;
      }
    
    
    if(powerNum >= 0 && powerNum < 3){
      power.x = x + ALIENWIDTH/4; power.y = y+ ALIENHEIGHT;
      power.carry();
    }}
    
    if(!status && powerNum >= 0 && powerNum < 3){
      power.move();
      power.draw();
    
  }
  }
  
    
    
  void explode(){
    status = false;
    
    
    xtl = x; ytl = y;
    ytr = y; xtr = x + 15;
    xbl = x; ybl = y +15; 
    xbr = x +15; ybr = y +15;
    
 
  }
  
  void draw(){
    if(status)
    image(alienImage, x, y);
    else {
      separatespeed += .1;
      
     
      pushMatrix();
      translate(xbl--, ybl++); 
      rotate(-PI/6 * separatespeed);
      image(bottomLeft, 0, 0);
      popMatrix();
      
      pushMatrix();
      translate(xtl--, ytl--); 
      rotate(PI/6.0 * separatespeed);
      image(topLeft, 0, 0);
      popMatrix();
      
      
      
      pushMatrix();
      translate(xtr++, ytr--); 
     rotate(PI/6.0 * separatespeed);
      image(topRight, 0, 0);
      popMatrix();
      
      
     
      pushMatrix();
      translate(xbr++, ybr++); 
      rotate(-PI/6.0*separatespeed);
      image(bottomRight, 0, 0);
      popMatrix();
      
    }
    
  }
}
