#include <Wire.h>
#include <MPU6050.h>
#include <Servo.h>


Servo treuil;  // create servo object to control a servo
Servo servo_direction;

MPU6050 mpu;

const int encodeur = 7;//correspond au pin de l'encodeur sur l'arduino
const float nombre_fente = 14.;//correspond au nombre de fente qu'il y a dans la roue 
const float rayon_roue = 0.04;//en m
int etat_encodeur = 0, angle_direction = 0 , angle_voile = 0 , check_passage = 1, increment = 0;
float positionX = 0.000, positionY = 0.000;


void setup() 
{
  Serial.begin(115200);
  setup_remote();

  treuil.writeMicroseconds(1500); //set initial servo position if desired
  treuil.attach(6);  //the pin for the servo control
  servo_direction.attach(5);

  Serial.println("Initialize MPU6050");

  while(!mpu.begin(MPU6050_SCALE_2000DPS, MPU6050_RANGE_2G))
  {
    Serial.println("Could not find a valid MPU6050 sensor, check wiring!");
    delay(500);
  }

  move_servo(angle_mapping(0));

  pinMode(encodeur,INPUT);

  servo_direction.write(angle_direction);
}

void loop() {
  //count_encodeur();
  remote();
  
}
