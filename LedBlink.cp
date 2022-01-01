#line 1 "C:/Users/User/Documents/LEDBLINK/LedBlink.c"
#line 19 "C:/Users/User/Documents/LEDBLINK/LedBlink.c"
unsigned int MID_REDE = 744;
unsigned int MIN_REDE = 532;

unsigned int MAX_VBAT = 820;
unsigned int MIN_VBAT = 344;
unsigned int CRT_VBAT = 387;

unsigned int ACTIVE = 0;
unsigned int RECHARG = 0;
unsigned int CONT = 0;
unsigned int VBAT;
unsigned int REDE;
port_a_ullup();

void blink_rele(){
  PORTC.RC4  =  1 ;
 Delay_ms(250);
  PORTC.RC4  =  0 ;
 Delay_ms(250);
  PORTC.RC4  =  1 ;
 Delay_ms(250);
  PORTC.RC4  =  0 ;
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

 blink_rele();
  PORTA.RA4  =  0 ;
  PORTC.RC3  =  0 ;
  PORTC.RC4  =  0 ;
  PORTC.RC5  =  1 ;
 while( PORTA.RA5  ==  1 ){
 Delay_ms(70);
 }
 REDE = ADC_Read( 6 );
 EEPROM_Write(1, REDE/4);


 blink_rele();
 while( PORTA.RA5  ==  1 ){
 Delay_ms(70);
 }
 REDE = ADC_Read( 6 );
 EEPROM_Write(2, REDE/4);


 blink_rele();
 while( PORTA.RA5  ==  1 ){
 Delay_ms(70);
 }
 VBAT = ADC_Read( 5 );
 EEPROM_Write(3, VBAT/4);


 blink_rele();
 while( PORTA.RA5  ==  1 ){
 Delay_ms(70);
 }
 VBAT = ADC_Read( 5 );
 EEPROM_Write(4, VBAT/4);


 blink_rele();
 while( PORTA.RA5  ==  1 ){
 Delay_ms(70);
 }
 VBAT = ADC_Read( 5 );
 EEPROM_Write(5, VBAT/4);


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

  PORTA.RA4  =  0 ;
  PORTC.RC3  =  0 ;
  PORTC.RC5  =  1 ;
 Delay_ms(2000);
 update_levels();

 while(1){
 if ( PORTA.RA5  ==  0 ){
 Delay_ms(70);
 setup_prog();
 update_levels();
 }
 REDE = ADC_Read( 6 );
 if (REDE < MIN_REDE){
 if (ACTIVE ==  0 ){
 ACTIVE =  1 ;
 RECHARG =  0 ;
  PORTC.RC5  =  1 ;
 CONT = 0;
  PORTC.RC3  =  1 ;
 Delay_ms(1500);
  PORTA.RA4  =  1 ;

 }
 }else if (REDE > MID_REDE){
 if (ACTIVE ==  1 ){
 ACTIVE =  0 ;
  PORTA.RA4  =  0 ;
 Delay_ms(1500);
  PORTC.RC3  =  0 ;
 }
 }
 if (ACTIVE ==  1 ){
 VBAT = ADC_Read( 5 );
 if (VBAT < CRT_VBAT){
  PORTC.RC4  =  0 ;
 }else{
  PORTC.RC4  =  1 ;
 }
 }else{
  PORTC.RC4  =  1 ;
 if (RECHARG ==  1 ){
 CONT ++;
 if(CONT <  10000 ){
  PORTC.RC5  =  1 ;
 }else{
  PORTC.RC5  =  0 ;
 }
 if (CONT >  10000  +  35000 ){
 CONT = 0;
 VBAT = ADC_Read( 5 );
 if (VBAT > MAX_VBAT){
 RECHARG =  0 ;
 }
 }
 }else{
 VBAT = ADC_Read( 5 );
 if (VBAT < MIN_VBAT){
 RECHARG =  1 ;
 }
 }
 }

 }
}
