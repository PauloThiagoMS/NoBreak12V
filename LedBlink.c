//Default Level
#define ON 1
#define OFF 0

//PIN CONFIGURATION
#define RECARGA         PORTC.RC5       //Invertido
#define OUT_POWER       PORTC.RC4
#define CARGA_BAT       PORTC.RC3
#define PG_BT           PORTA.RA5       //Invertido
#define FONTE_OUT       PORTA.RA4
#define ADC_REDE        6
#define ADC_BAT         5

// Time to CHARGE
#define T_CARGA_ON      35000           //~6s
#define T_CARGA_OFF     10000           //~1s

// ADC Levels References
unsigned int MID_REDE        = 744;      //100V ac
unsigned int MIN_REDE        = 532;       //90V ac

unsigned int MAX_VBAT        = 820;      //13V dc
unsigned int MIN_VBAT        = 344;      //12V dc
unsigned int CRT_VBAT        = 387;      //11V dc

unsigned int ACTIVE = 0;
unsigned int RECHARG = 0;
unsigned int CONT = 0;
unsigned int VBAT;
unsigned int REDE;
port_a_ullup();

void blink_rele(){
    OUT_POWER = ON;
    Delay_ms(250);
    OUT_POWER = OFF;
    Delay_ms(250);
    OUT_POWER = ON;
    Delay_ms(250);
    OUT_POWER = OFF;
    Delay_ms(250);
}

void update_levels(){
     if (EEPROM_Read(0) != 0xFF){
        MIN_REDE = EEPROM_Read(1)*4;
        MID_REDE = EEPROM_Read(2)*4;
        CRT_VBAT = EEPROM_Read(3)*4;
        MIN_VBAT = EEPROM_Read(4)*4;
        MAX_VBAT = EEPROM_Read(5)*4;
     }
}

void setup_prog(){
    // Gravando MIN_REDE
    blink_rele();
    FONTE_OUT = OFF;
    CARGA_BAT = OFF;
    OUT_POWER = OFF;
    RECARGA = ON;  //invertido
    while(PG_BT == ON){            //Aguardar contato 2 no BT
         Delay_ms(70);
    }
    REDE = ADC_Read(ADC_REDE);
    EEPROM_Write(1, REDE/4);
    
    // Gravando MID_REDE
    blink_rele();
    while(PG_BT == ON){            //Aguardar contato 3 no BT
         Delay_ms(70);
    }
    REDE = ADC_Read(ADC_REDE);
    EEPROM_Write(2, REDE/4);
    
    // Gravando CRT_VBAT
    blink_rele();
    while(PG_BT == ON){            //Aguardar contato 4 no BT
         Delay_ms(70);
    }
    VBAT = ADC_Read(ADC_BAT);
    EEPROM_Write(3, VBAT/4);

    // Gravando MIN_VBAT
    blink_rele();
    while(PG_BT == ON){            //Aguardar contato 5 no BT
         Delay_ms(70);
    }
    VBAT = ADC_Read(ADC_BAT);
    EEPROM_Write(4, VBAT/4);

    // Gravando MAX_VBAT
    blink_rele();
    while(PG_BT == ON){            //Aguardar contato 6 no BT
         Delay_ms(70);
    }
    VBAT = ADC_Read(ADC_BAT);
    EEPROM_Write(5, VBAT/4);

    // END SETUP
    EEPROM_Write(0, 1);
    blink_rele();
    blink_rele();
}

void main(){
     TRISA.RA4 = 0;
     TRISA.RA5 = 1;
     TRISC.RC5 = 0;
     TRISC.RC4 = 0;
     TRISC.RC3 = 0;
     TRISC.RC2 = 1;
     TRISC.RC1 = 1;
     OPTION_REG = 0x7F;
     ANSEL = 1;
     ADCON0 = 1;
     CMCON = 7;
     CONT = 0;

     FONTE_OUT = OFF;
     CARGA_BAT = OFF;
     RECARGA = ON; //invertido
     Delay_ms(2000);
     update_levels();

     while(1){
         if (PG_BT == OFF){                  //Modo setup_prog (contato 1)
             Delay_ms(70);
             setup_prog();
             update_levels();
         }
         REDE = ADC_Read(ADC_REDE);
         if (REDE < MIN_REDE){
             if (ACTIVE == OFF){
                 ACTIVE = ON;
                 RECHARG = OFF;
                 RECARGA = ON; //invertido
                 CONT = 0;
                 CARGA_BAT = ON;
                 Delay_ms(1500);
                 FONTE_OUT = ON;

             }
         }else if (REDE > MID_REDE){
             if (ACTIVE == ON){
                 ACTIVE = OFF;
                 FONTE_OUT = OFF;
                 Delay_ms(1500);
                 CARGA_BAT = OFF;
             }
         }
         if (ACTIVE == ON){
             VBAT = ADC_Read(ADC_BAT);
             if (VBAT < CRT_VBAT){
                 OUT_POWER = OFF;
             }else{
                 OUT_POWER = ON;
             }
         }else{
             OUT_POWER = ON;
             if (RECHARG == ON){
                 CONT ++;
                 if(CONT < T_CARGA_OFF){
                     RECARGA = ON; //invertido
                 }else{
                     RECARGA = OFF;  //invertido
                 }
                 if (CONT > T_CARGA_OFF + T_CARGA_ON){
                     CONT = 0;
                     VBAT = ADC_Read(ADC_BAT);
                     if (VBAT > MAX_VBAT){
                         RECHARG = OFF;
                     }
                 }
             }else{
                 VBAT = ADC_Read(ADC_BAT);
                 if (VBAT < MIN_VBAT){
                     RECHARG = ON;
                 }
             }
         }

     }
}