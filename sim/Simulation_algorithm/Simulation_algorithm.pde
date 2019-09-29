Landsail buddy;
WindOb Wind;

void setup(){
  size(1000, 1000);
  buddy = new Landsail(44, 58, 0.3064, 58, 1); 
  Wind = new WindOb();
  buddy.setPos(new PVector(width/2,height/2,0));
}



void draw(){
    background(80);
        drawVector(width/2, height/2, 50, 0, color(200, 0, 0));
        drawVector(width/2, height/2, 50, PI/2, color(0, 200, 0));

    Wind.draw();
    buddy.autoPilot();
    buddy.computeSpeed();
    buddy.display();
}

void drawVector(float x1, float y1, float l, float alpha, color col){
  fill(col);
  stroke(col);
    // draw the line
  float x2 = x1 + l*cos(alpha);
  float y2 = y1 + l*sin(alpha);
  line(x1, y1, x2 , y2);

  // draw a triangle at (x2, y2)
  pushMatrix();
    translate(x2, y2);
    rotate(alpha);
    triangle(0, 0, -10, 5, -10, -5);
  popMatrix(); 
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
    case UP :
      
    break;	
    case DOWN :
      
    break;	
      case LEFT :
     
    break;	
    case RIGHT :
      
    break;	
  }
}