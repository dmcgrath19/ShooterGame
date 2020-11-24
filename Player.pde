Player user;


final int PADDLEHEIGHT = 15;
final int PADDLEWIDTH = 50;
final int MARGIN = 10;


class Player {
  int xpos; int ypos;
  color paddlecolor = color(50);
  int lives = 3;
  Player(int screen_y)
  {
    xpos=SCREENX/2;
    ypos=screen_y;
  }
  
  void move(int x){
    if(x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
    else xpos=x;
  }
  
  void draw()
  {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
  
  void moveComputer(int xOfBall){
    if (xOfBall > xpos){
      xpos++;
    }
    else{
      xpos--;
    }
    
  }
  void lostLife(){
    lives--;
  }
  

  }
  
  
  
