/***********************************************
 *                                             *
 *  CONFIGURATION KIT SUMOBOT ESIEESPACE V4.1  *
 *                                             *
 ***********************************************/


#include "Arduino.h"

#define VERSION           "0.1A"

#define DEBUG             1


/********************
 * DEFINITION INPUT *
 ********************/

// Bouton poussoir START/STOP match
#define BP                PUSH2

// Capteurs ligne blanche
#define TCRT_AVG          P1_4
#define TCRT_AVD          P2_6
#define TCRT_ARC          P2_5

// Mesure ultrason HC-SR04
#define HCSR04_ECHO       P2_7

/*********************
 * DEFINITION OUTPUT *
 * *******************/

// LEDs
#define LED_D1            P1_0
#define LED_D2            P1_6

// Module ultrason HC-SR04
#define HCSR04_TRIGGER    P1_7

// Pilote Moteur L298
#define MOTG_DIR1         P2_0
#define MOTG_DIR2         P1_5
#define MOTG_PWM          P2_2

#define MOTD_DIR1         P2_3
#define MOTD_DIR2         P2_4
#define MOTD_PWM          P2_1

#define PWM_0             0
#define PWM_25            63
#define PWM_50            127
#define PWM_75            191
#define PWM_100           255
