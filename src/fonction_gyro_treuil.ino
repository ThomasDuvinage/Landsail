int pitch(){
  // Read normalized values 
  Vector normAccel = mpu.readNormalizeAccel();

  // Calculate Pitch
  int pitch = -(atan2(normAccel.XAxis, sqrt(normAccel.YAxis*normAccel.YAxis + normAccel.ZAxis*normAccel.ZAxis))*180.0)/M_PI;

 return pitch;
}

int roll(){
  // Read normalized values 
  Vector normAccel = mpu.readNormalizeAccel();

  // Calculate Roll
  int roll = (atan2(normAccel.YAxis, normAccel.ZAxis)*180.0)/M_PI;

  return roll;
}

void move_servo(int microsecond){
  treuil.writeMicroseconds(microsecond);
}


int angle_mapping(int angle){
    int mapping_angle = map(abs(angle),0,90,2000,1499);//le mapping permet de transformer l'angle en impulsion pour le servo moteur 

    return mapping_angle;
}

void asservisement_voile(){
   if(roll() > 20 || roll() < -20){
    angle_voile = map(roll(),0,50,0,90);
  }

  else if(roll() > -5 && roll() < 5){
    angle_voile = 0 ;
  }
  
  move_servo(angle_mapping(angle_voile));
}
