/*
*/
void settings(){
  size(SCREENX, SCREENY);
}

  PImage alienImage;
  PImage bottomLeft;
  PImage bottomRight;
  PImage topLeft; 
  PImage topRight;
  PImage explodingImage;
  PImage star; 
  PImage cherry;
  PImage bolt; 
void setup(){
  alienImage= loadImage("Invader.GIF");
  
  cherry = loadImage("cherry.png");
  bolt = loadImage("bolt.png");
  star = loadImage("star.png");
  bottomLeft = loadImage ("bottomLeft.gif");
  bottomRight = loadImage ("bottomRight.gif");
  topLeft = loadImage ("topLeft.gif");
  topRight = loadImage ("topRight.gif");

  alienGang = new Alien[30];

  bullets = new LinkedList<Bullet>();
  user = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  noStroke();
  init_array(alienGang);
  

}
  int s = second();
  int gang =1;
  int changed = (int)random(100, 300);
  
void draw(){
    background (100);
    if( (frameCount %   100 == 0) && (gang <30)){ gang++;}
    
    user.move(mouseX);
    move_array(alienGang, gang, user);
    move_array(bullets);

    
    collision(bullets, alienGang);
    user.draw();
    draw_array(alienGang, gang);
    draw_array(bullets);
}
