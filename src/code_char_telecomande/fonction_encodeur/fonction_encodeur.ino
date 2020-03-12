void count_encodeur(){
  etat_encodeur = digitalRead(encodeur);

  if(etat_encodeur == 0 && check_passage == false ){
    check_passage = 1;
    increment++;
    positionX += (((2. * 3.14) / nombre_fente) * rayon_roue) * cos(deg_to_rad(angle_direction));
    positionY += (((2. * 3.14) / nombre_fente) * rayon_roue) * sin(deg_to_rad(angle_direction));

    Serial.print("positionX = ");
    Serial.println(positionX,4);
    Serial.print("positionY = ");
    Serial.println(positionY,4);

    Serial.print("increment = ");
    Serial.println(increment);
  }
  if(etat_encodeur ==1 && check_passage == true){
    check_passage = false;
  }  
}

int deg_to_rad(int angle_deg){
  return (angle_deg * 3.14)/180;
}
