#include "config.h"
#include "moteurs.h"


void PiloteMoteurs(char tmpMode, byte tmpMotG, byte tmpMotD)
{
  switch(tmpMode)
  {
    case 0:         // Stop
        SetDirection(LOW, LOW);
        break;
        
    case 1:         // Avance
        SetDirection(HIGH, LOW);
        break;
        
    case 2:         // Recule
        SetDirection(LOW, HIGH);
        break;
  }

  analogWrite(MOTG_PWM, tmpMotG);
  analogWrite(MOTD_PWM, tmpMotD);
}

void SetDirection(char tmpDIR1, char tmpDIR2)
{
  digitalWrite(MOTG_DIR1, tmpDIR1);
  digitalWrite(MOTG_DIR2, tmpDIR2);
  digitalWrite(MOTD_DIR1, tmpDIR1);
  digitalWrite(MOTD_DIR2, tmpDIR2);
  digitalWrite(LED_D1, tmpDIR1);
  digitalWrite(LED_D2, tmpDIR2);
}
