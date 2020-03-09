#include "config.h"
#include "capteurs.h"
#include "moteurs.h"


void AttenteDebut(void);
void PseudoIA(void);

void TestMoteurs(void);
void TestUltrason(void);
void TestTCRT(void);

void setup()
{
#if DEBUG
  // Initialisation du lien série
  Serial.begin(9600); // init liaison UART
  Serial.print("mySumoBot OS V");
  Serial.println(VERSION);
#endif
  
  /* Configuration INPUT*/
  pinMode(BP,             INPUT_PULLUP);
  
  pinMode(TCRT_AVG,       INPUT);
  pinMode(TCRT_AVD,       INPUT);
  pinMode(TCRT_ARC,       INPUT);

  pinMode(HCSR04_ECHO,    INPUT);

  /* Configuration OUTPUT */
  pinMode(LED_D1,         OUTPUT);
  pinMode(LED_D2,         OUTPUT);
  
  pinMode(HCSR04_TRIGGER, OUTPUT);

  pinMode(MOTG_DIR1,      OUTPUT);
  pinMode(MOTG_DIR2,      OUTPUT);
  pinMode(MOTG_PWM,       OUTPUT);
  pinMode(MOTD_DIR1,      OUTPUT);
  pinMode(MOTD_DIR2,      OUTPUT);
  pinMode(MOTD_PWM,       OUTPUT);
  PiloteMoteurs(0, 0, 0);  
}

/***********************
 * PROGRAMME PRINCIPAL *
 ***********************/

void loop()
{
  AttenteDebut();

  while(digitalRead(BP) == HIGH)
    PseudoIA();
#if DEBUG
  Serial.println("END !!");
#endif
  
  delay(2000);    
}


/*************
 * FONCTIONS *
 *************/

void AttenteDebut(void)
{
  int wait = 0;
#if DEBUG
  Serial.print("Waiting...");
#endif
  while(digitalRead(BP) == HIGH)
  {
    digitalWrite(LED_D1, HIGH);
    digitalWrite(LED_D2, LOW);
    delay(125);
    digitalWrite(LED_D1, LOW);
    digitalWrite(LED_D2, HIGH);
    delay(125);
  }

  digitalWrite(LED_D1, LOW);
  digitalWrite(LED_D2, LOW);
#if DEBUG
  Serial.print("Ready");
#endif
  
  for(wait = 0; wait < 5; wait++)
  {
    digitalWrite(LED_D2, HIGH);
    delay(500);
    digitalWrite(LED_D2, LOW);
    delay(500);
#if DEBUG
  Serial.print('.');
#endif    
  }
#if DEBUG
  Serial.println("FIGHT !!");
#endif
}

void PseudoIA(void)
{
  TestUltrason();
  TestTCRT();  
  TestMoteurs();        
}


/*****************
 * TESTS SUMOBOT *
 *****************/

void TestMoteurs(void)
{
  // TEST PILOTAGE MOTEURS
  // Avance
  PiloteMoteurs(1, PWM_100, PWM_100);
#if DEBUG  
  Serial.println("Avance");
#endif
  delay(5000);

  // Recule
  PiloteMoteurs(2, PWM_50, PWM_50);
#if DEBUG  
  Serial.println("Recule");
#endif
  delay(5000);
  
  // Stop
  PiloteMoteurs(0, PWM_0, PWM_0);
#if DEBUG  
  Serial.println("Stop");
#endif
  delay(5000);
}

void TestUltrason(void)
{
  // TEST MESURE MODULE HC-SR04
  long distance = 0;
  distance = MesureDistance();
#if DEBUG  
  Serial.print("Distance Objet: ");
  Serial.println(distance);
#endif
  delay(500);
}

void TestTCRT(void)
{
  // TEST CAPTEURS TCRT5000
  byte ValTCRT[3] = {0, 0, 0};
  StatusTCRT(ValTCRT);
#if DEBUG  
  Serial.print("TCRT Avant Gauche: ");
  Serial.println(ValTCRT[0]);
  Serial.print("TCRT Avant Droit: ");
  Serial.println(ValTCRT[1]);
  Serial.print("TCRT Arriere Centre: ");
  Serial.println(ValTCRT[2]);
#endif  
  delay(500);
}
