Landsail buddy;

void setup(){
  size(1000, 1000);
  buddy = new Landsail(44,58);
  buddy.setPos(new PVector(width/2,height/2,0));
  buddy.setSpeed(2);
}



void draw(){
    background(102);


    buddy.computeSpeed();
    buddy.display();

}



void keyPressed(){
  switch (key) {
    case 'q' :
      buddy.steerLeft();
    break;	
    case 'd' :
      buddy.steerRight();
    break;	
    case 'z' :
      buddy.accelerate();
    break;	
    case 's' :
      buddy.decelerate();
    break;	
    case ' ' :
      buddy.setPos(new PVector(width/2,height/2,0));
    break;	
  }
}