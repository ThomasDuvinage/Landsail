//Include Libraries
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>
#include <Servo.h>

#define retrait_voile 5

Servo myservo;

//create an RF24 object
RF24 radio(9, 8);  // CE, CSN

//address through which two modules communicate.
const byte address[6] = "00001";

int msg[3][1];

void setup_remote()
{
  while (!Serial);
    Serial.begin(9600);
  
  radio.begin();
  
  //set the address
  radio.openReadingPipe(0, address);
  
  //Set module as receiver
  radio.startListening();

}

void remote()
{
  //Read the data if available in buffer
  if (radio.available())
  {
    radio.read(msg, sizeof(msg));
    Serial.print(msg[0][0]);
    Serial.print("  ");
    Serial.print(msg[1][0]);
    Serial.print("  ");
    Serial.println(msg[2][0]);

    servo_direction.write(msg[0][0]);

    if(msg[1][0] == 0 && angle_voile <= 2000 - retrait_voile ){
      angle_voile += retrait_voile;
    }

    if(msg[2][0] == 0 && angle_voile >= 0 - retrait_voile ){
      angle_voile -= retrait_voile;
    }

    Serial.print("angle = ");
    Serial.println(angle_voile);

    move_servo(angle_mapping(angle_voile));
  }
}
