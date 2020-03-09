#include "config.h"
#include "capteurs.h"


long MesureDistance(void)
{
  long mesure = 0;

  // Declenchement mesure distance
  digitalWrite(HCSR04_TRIGGER, LOW);
  delayMicroseconds(2);
  digitalWrite(HCSR04_TRIGGER, HIGH);
  delayMicroseconds(10);
  digitalWrite(HCSR04_TRIGGER, LOW);

  mesure = pulseIn(HCSR04_ECHO, HIGH, 25000); 
  
  delayMicroseconds(200);
  
  // Conversion cm
  mesure = mesure * 17/1000;
  return mesure;
}

void StatusTCRT(byte *tmpTCRT)
{
  tmpTCRT[0] = digitalRead(TCRT_AVG);
  tmpTCRT[1] = digitalRead(TCRT_AVD);
  tmpTCRT[2] = digitalRead(TCRT_ARC);
}
