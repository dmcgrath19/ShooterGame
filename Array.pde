import java.util.LinkedList;
import java.util.Queue;
import java.util.Iterator;

Queue <Bullet> bullets;
Alien alienGang[];
PowerUp currentPower; 
float timeUntilNextPower = 0;
boolean speedBall = false;


void mousePressed(){
  speedBall = false;
   for(int i=0; i<alienGang.length; i++){
    if(!alienGang[i].status && alienGang[i].powerNum >= 0 && alienGang[i].powerNum < 3 && alienGang[i].power.powerOn){
      speedBall = true;
      currentPower = alienGang[i].power;
    }
    
   }
  if(speedBall)
    init_newBall(bullets, user, currentPower);
  else
    init_newBall(bullets, user);
  
}

 void init_newBall(Queue bullets, Player player){
   
   bullets.add(new Bullet(player)); 
 }
 
 void init_newBall(Queue bullets, Player player, PowerUp power){
   bullets.add(new Bullet(player, power));
 }
 
 void draw_array(Queue bullets){
   Iterator iterator = bullets.iterator();
   
    while(iterator.hasNext()){
      Bullet bullet = (Bullet)iterator.next();
      bullet.draw();
   }
 }
 
 void move_array(Queue bullets){
   Iterator iterator = bullets.iterator();
   
    while(iterator.hasNext()){
      Bullet bullet = (Bullet)iterator.next();
      bullet.move();
   }
   
   if(bullets.size() > 0){
     Bullet oldestBullet = (Bullet)bullets.peek();
   if(!oldestBullet.onScreen) bullets.remove();
 }
 }

 

 
 void collision(Queue bullets, Alien alienArray[]){
    Iterator iterator = bullets.iterator();
   
    while(iterator.hasNext()){
      Bullet bullet = (Bullet)iterator.next();
      for(int index = 0; index < alienArray.length; index++){
        bullet.collide(alienArray[index]);
      }
   }
 }
 

void init_array(Alien theArray[]){
  for(int i=0; i<theArray.length; i++)
    theArray[i] = new Alien();
}
void draw_array(Alien theArray[], int gang){
  for(int i=0; i<gang; i++)
    theArray[i].draw();
}
void move_array(Alien theArray[], int gang, Player player){
  for(int i=0; i < gang; i++){
    theArray[i].move();
    if(theArray[i].powerNum >= 0 && theArray[i].powerNum < 3)theArray[i].power.gathered(player);
  }
}
