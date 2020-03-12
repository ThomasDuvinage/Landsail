Landsail buddy;
WindOb Wind;

ArrayList<Cone> ConeList = new ArrayList<Cone>();
public String mode = new String();

void setup(){
  size(1000, 1000);

  buddy = new Landsail(44, 58, 0.3064, 58, 1); 
  Wind = new WindOb();

  mode = "setup";

  //buddy.setPos(new PVector(width/2,height/2,0));
}

void draw(){
  translate(width/2, height/2);

  background(50,120,200);
      drawVector(0, 0, 50, 0, color(200, 0, 0));
      drawVector(0, 0, 50, PI/2, color(0, 200, 0));


  //buddy.debug();
  buddy.autoPilot();
  buddy.computeSpeed();
  buddy.display();

  for(int i = 0; i < ConeList.size(); i++){
    ConeList.get(i).displayCone();
  }

  if(mode.equals("showCommand")) showCommand();
  
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


void mousePressed(){
  switch (mode) {
    case "setup" :
      ConeList.add(new Cone(new PVector(mouseX - width/2, mouseY - height/2)));
    break;

    case "draw"	:
      buddy.goTo(mouseX - width/2, mouseY - height/2);
    break;
  }
}


void keyPressed(){
  switch (keyCode) {
    case UP :
      Wind.setDirection(DIRECTION.NORTH);
    break;	
    case DOWN :
      Wind.setDirection(DIRECTION.SOUTH);
    break;	
      case LEFT :
     Wind.setDirection(DIRECTION.WEST);
    break;	
    case RIGHT :
      Wind.setDirection(DIRECTION.EAST);
    break;	
  }

  switch (key) {
      case 'q' :
        if(mode.equals("setup")){
          mode = "draw";
          break;
        } 
        else if (mode.equals("draw")) buddy.steerLeft();
        else if (mode.equals("showCommand")) {
          mode = "setup";
          break;
        }
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
      case 'c' :
        mode = "showCommand";
      break;		
      case ' ' :
        buddy.setPos(new PVector(0,0,0));
      break;	
  }
}

void showCommand(){
  pushMatrix();
    translate(-width/2, -height/2);
    fill(200);
    rect(0,25,300,300);
    fill(0);
    strokeWeight(0.5);
    textSize(15);
            
    text("_heading :", 10, 50);         
    text("_speed :", 10,100);          
    text("_sailOpenning :", 10,150);    
    text("_sailAngularSpeed :", 10,200);
    text("_sailMomentum :", 10,250);    
  popMatrix();
}
