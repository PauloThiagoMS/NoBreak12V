
_blink_rele:

;LedBlink.c,33 :: 		void blink_rele(){
;LedBlink.c,34 :: 		OUT_POWER = ON;
	BSF        PORTC+0, 4
;LedBlink.c,35 :: 		Delay_ms(250);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_blink_rele0:
	DECFSZ     R13+0, 1
	GOTO       L_blink_rele0
	DECFSZ     R12+0, 1
	GOTO       L_blink_rele0
	DECFSZ     R11+0, 1
	GOTO       L_blink_rele0
	NOP
	NOP
;LedBlink.c,36 :: 		OUT_POWER = OFF;
	BCF        PORTC+0, 4
;LedBlink.c,37 :: 		Delay_ms(250);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_blink_rele1:
	DECFSZ     R13+0, 1
	GOTO       L_blink_rele1
	DECFSZ     R12+0, 1
	GOTO       L_blink_rele1
	DECFSZ     R11+0, 1
	GOTO       L_blink_rele1
	NOP
	NOP
;LedBlink.c,38 :: 		OUT_POWER = ON;
	BSF        PORTC+0, 4
;LedBlink.c,39 :: 		Delay_ms(250);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_blink_rele2:
	DECFSZ     R13+0, 1
	GOTO       L_blink_rele2
	DECFSZ     R12+0, 1
	GOTO       L_blink_rele2
	DECFSZ     R11+0, 1
	GOTO       L_blink_rele2
	NOP
	NOP
;LedBlink.c,40 :: 		OUT_POWER = OFF;
	BCF        PORTC+0, 4
;LedBlink.c,41 :: 		Delay_ms(250);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_blink_rele3:
	DECFSZ     R13+0, 1
	GOTO       L_blink_rele3
	DECFSZ     R12+0, 1
	GOTO       L_blink_rele3
	DECFSZ     R11+0, 1
	GOTO       L_blink_rele3
	NOP
	NOP
;LedBlink.c,42 :: 		}
L_end_blink_rele:
	RETURN
; end of _blink_rele

_update_levels:

;LedBlink.c,44 :: 		void update_levels(){
;LedBlink.c,45 :: 		if (EEPROM_Read(0) != 0xFF){
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L_update_levels4
;LedBlink.c,46 :: 		MIN_REDE = EEPROM_Read(1)*4;
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _MIN_REDE+0
	CLRF       _MIN_REDE+1
	RLF        _MIN_REDE+0, 1
	RLF        _MIN_REDE+1, 1
	BCF        _MIN_REDE+0, 0
	RLF        _MIN_REDE+0, 1
	RLF        _MIN_REDE+1, 1
	BCF        _MIN_REDE+0, 0
;LedBlink.c,47 :: 		MID_REDE = EEPROM_Read(2)*4;
	MOVLW      2
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _MID_REDE+0
	CLRF       _MID_REDE+1
	RLF        _MID_REDE+0, 1
	RLF        _MID_REDE+1, 1
	BCF        _MID_REDE+0, 0
	RLF        _MID_REDE+0, 1
	RLF        _MID_REDE+1, 1
	BCF        _MID_REDE+0, 0
;LedBlink.c,48 :: 		CRT_VBAT = EEPROM_Read(3)*4;
	MOVLW      3
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _CRT_VBAT+0
	CLRF       _CRT_VBAT+1
	RLF        _CRT_VBAT+0, 1
	RLF        _CRT_VBAT+1, 1
	BCF        _CRT_VBAT+0, 0
	RLF        _CRT_VBAT+0, 1
	RLF        _CRT_VBAT+1, 1
	BCF        _CRT_VBAT+0, 0
;LedBlink.c,49 :: 		MIN_VBAT = EEPROM_Read(4)*4;
	MOVLW      4
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _MIN_VBAT+0
	CLRF       _MIN_VBAT+1
	RLF        _MIN_VBAT+0, 1
	RLF        _MIN_VBAT+1, 1
	BCF        _MIN_VBAT+0, 0
	RLF        _MIN_VBAT+0, 1
	RLF        _MIN_VBAT+1, 1
	BCF        _MIN_VBAT+0, 0
;LedBlink.c,50 :: 		MAX_VBAT = EEPROM_Read(5)*4;
	MOVLW      5
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _MAX_VBAT+0
	CLRF       _MAX_VBAT+1
	RLF        _MAX_VBAT+0, 1
	RLF        _MAX_VBAT+1, 1
	BCF        _MAX_VBAT+0, 0
	RLF        _MAX_VBAT+0, 1
	RLF        _MAX_VBAT+1, 1
	BCF        _MAX_VBAT+0, 0
;LedBlink.c,51 :: 		}
L_update_levels4:
;LedBlink.c,52 :: 		}
L_end_update_levels:
	RETURN
; end of _update_levels

_setup_prog:

;LedBlink.c,54 :: 		void setup_prog(){
;LedBlink.c,56 :: 		blink_rele();
	CALL       _blink_rele+0
;LedBlink.c,57 :: 		FONTE_OUT = OFF;
	BCF        PORTA+0, 4
;LedBlink.c,58 :: 		CARGA_BAT = OFF;
	BCF        PORTC+0, 3
;LedBlink.c,59 :: 		OUT_POWER = OFF;
	BCF        PORTC+0, 4
;LedBlink.c,60 :: 		RECARGA = ON;  //invertido
	BSF        PORTC+0, 5
;LedBlink.c,61 :: 		while(PG_BT == ON){            //Aguardar contato 2 no BT
L_setup_prog5:
	BTFSS      PORTA+0, 5
	GOTO       L_setup_prog6
;LedBlink.c,62 :: 		Delay_ms(70);
	MOVLW      91
	MOVWF      R12+0
	MOVLW      231
	MOVWF      R13+0
L_setup_prog7:
	DECFSZ     R13+0, 1
	GOTO       L_setup_prog7
	DECFSZ     R12+0, 1
	GOTO       L_setup_prog7
	NOP
	NOP
;LedBlink.c,63 :: 		}
	GOTO       L_setup_prog5
L_setup_prog6:
;LedBlink.c,64 :: 		REDE = ADC_Read(ADC_REDE);
	MOVLW      6
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _REDE+0
	MOVF       R0+1, 0
	MOVWF      _REDE+1
;LedBlink.c,65 :: 		EEPROM_Write(1, REDE/4);
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;LedBlink.c,68 :: 		blink_rele();
	CALL       _blink_rele+0
;LedBlink.c,69 :: 		while(PG_BT == ON){            //Aguardar contato 3 no BT
L_setup_prog8:
	BTFSS      PORTA+0, 5
	GOTO       L_setup_prog9
;LedBlink.c,70 :: 		Delay_ms(70);
	MOVLW      91
	MOVWF      R12+0
	MOVLW      231
	MOVWF      R13+0
L_setup_prog10:
	DECFSZ     R13+0, 1
	GOTO       L_setup_prog10
	DECFSZ     R12+0, 1
	GOTO       L_setup_prog10
	NOP
	NOP
;LedBlink.c,71 :: 		}
	GOTO       L_setup_prog8
L_setup_prog9:
;LedBlink.c,72 :: 		REDE = ADC_Read(ADC_REDE);
	MOVLW      6
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _REDE+0
	MOVF       R0+1, 0
	MOVWF      _REDE+1
;LedBlink.c,73 :: 		EEPROM_Write(2, REDE/4);
	MOVLW      2
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;LedBlink.c,76 :: 		blink_rele();
	CALL       _blink_rele+0
;LedBlink.c,77 :: 		while(PG_BT == ON){            //Aguardar contato 4 no BT
L_setup_prog11:
	BTFSS      PORTA+0, 5
	GOTO       L_setup_prog12
;LedBlink.c,78 :: 		Delay_ms(70);
	MOVLW      91
	MOVWF      R12+0
	MOVLW      231
	MOVWF      R13+0
L_setup_prog13:
	DECFSZ     R13+0, 1
	GOTO       L_setup_prog13
	DECFSZ     R12+0, 1
	GOTO       L_setup_prog13
	NOP
	NOP
;LedBlink.c,79 :: 		}
	GOTO       L_setup_prog11
L_setup_prog12:
;LedBlink.c,80 :: 		VBAT = ADC_Read(ADC_BAT);
	MOVLW      5
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _VBAT+0
	MOVF       R0+1, 0
	MOVWF      _VBAT+1
;LedBlink.c,81 :: 		EEPROM_Write(3, VBAT/4);
	MOVLW      3
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;LedBlink.c,84 :: 		blink_rele();
	CALL       _blink_rele+0
;LedBlink.c,85 :: 		while(PG_BT == ON){            //Aguardar contato 5 no BT
L_setup_prog14:
	BTFSS      PORTA+0, 5
	GOTO       L_setup_prog15
;LedBlink.c,86 :: 		Delay_ms(70);
	MOVLW      91
	MOVWF      R12+0
	MOVLW      231
	MOVWF      R13+0
L_setup_prog16:
	DECFSZ     R13+0, 1
	GOTO       L_setup_prog16
	DECFSZ     R12+0, 1
	GOTO       L_setup_prog16
	NOP
	NOP
;LedBlink.c,87 :: 		}
	GOTO       L_setup_prog14
L_setup_prog15:
;LedBlink.c,88 :: 		VBAT = ADC_Read(ADC_BAT);
	MOVLW      5
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _VBAT+0
	MOVF       R0+1, 0
	MOVWF      _VBAT+1
;LedBlink.c,89 :: 		EEPROM_Write(4, VBAT/4);
	MOVLW      4
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;LedBlink.c,92 :: 		blink_rele();
	CALL       _blink_rele+0
;LedBlink.c,93 :: 		while(PG_BT == ON){            //Aguardar contato 6 no BT
L_setup_prog17:
	BTFSS      PORTA+0, 5
	GOTO       L_setup_prog18
;LedBlink.c,94 :: 		Delay_ms(70);
	MOVLW      91
	MOVWF      R12+0
	MOVLW      231
	MOVWF      R13+0
L_setup_prog19:
	DECFSZ     R13+0, 1
	GOTO       L_setup_prog19
	DECFSZ     R12+0, 1
	GOTO       L_setup_prog19
	NOP
	NOP
;LedBlink.c,95 :: 		}
	GOTO       L_setup_prog17
L_setup_prog18:
;LedBlink.c,96 :: 		VBAT = ADC_Read(ADC_BAT);
	MOVLW      5
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _VBAT+0
	MOVF       R0+1, 0
	MOVWF      _VBAT+1
;LedBlink.c,97 :: 		EEPROM_Write(5, VBAT/4);
	MOVLW      5
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;LedBlink.c,100 :: 		EEPROM_Write(0, 1);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;LedBlink.c,101 :: 		blink_rele();
	CALL       _blink_rele+0
;LedBlink.c,102 :: 		blink_rele();
	CALL       _blink_rele+0
;LedBlink.c,103 :: 		}
L_end_setup_prog:
	RETURN
; end of _setup_prog

_main:

;LedBlink.c,105 :: 		void main(){
;LedBlink.c,106 :: 		TRISA.RA4 = 0;
	BCF        TRISA+0, 4
;LedBlink.c,107 :: 		TRISA.RA5 = 1;
	BSF        TRISA+0, 5
;LedBlink.c,108 :: 		TRISC.RC5 = 0;
	BCF        TRISC+0, 5
;LedBlink.c,109 :: 		TRISC.RC4 = 0;
	BCF        TRISC+0, 4
;LedBlink.c,110 :: 		TRISC.RC3 = 0;
	BCF        TRISC+0, 3
;LedBlink.c,111 :: 		TRISC.RC2 = 1;
	BSF        TRISC+0, 2
;LedBlink.c,112 :: 		TRISC.RC1 = 1;
	BSF        TRISC+0, 1
;LedBlink.c,113 :: 		OPTION_REG = 0x7F;
	MOVLW      127
	MOVWF      OPTION_REG+0
;LedBlink.c,114 :: 		ANSEL = 1;
	MOVLW      1
	MOVWF      ANSEL+0
;LedBlink.c,115 :: 		ADCON0 = 1;
	MOVLW      1
	MOVWF      ADCON0+0
;LedBlink.c,116 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;LedBlink.c,117 :: 		CONT = 0;
	CLRF       _CONT+0
	CLRF       _CONT+1
;LedBlink.c,119 :: 		FONTE_OUT = OFF;
	BCF        PORTA+0, 4
;LedBlink.c,120 :: 		CARGA_BAT = OFF;
	BCF        PORTC+0, 3
;LedBlink.c,121 :: 		RECARGA = ON; //invertido
	BSF        PORTC+0, 5
;LedBlink.c,122 :: 		Delay_ms(2000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	NOP
;LedBlink.c,123 :: 		update_levels();
	CALL       _update_levels+0
;LedBlink.c,125 :: 		while(1){
L_main21:
;LedBlink.c,126 :: 		if (PG_BT == OFF){                  //Modo setup_prog (contato 1)
	BTFSC      PORTA+0, 5
	GOTO       L_main23
;LedBlink.c,127 :: 		Delay_ms(70);
	MOVLW      91
	MOVWF      R12+0
	MOVLW      231
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	NOP
	NOP
;LedBlink.c,128 :: 		setup_prog();
	CALL       _setup_prog+0
;LedBlink.c,129 :: 		update_levels();
	CALL       _update_levels+0
;LedBlink.c,130 :: 		}
L_main23:
;LedBlink.c,131 :: 		REDE = ADC_Read(ADC_REDE);
	MOVLW      6
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _REDE+0
	MOVF       R0+1, 0
	MOVWF      _REDE+1
;LedBlink.c,132 :: 		if (REDE < MIN_REDE){
	MOVF       _MIN_REDE+1, 0
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVF       _MIN_REDE+0, 0
	SUBWF      R0+0, 0
L__main47:
	BTFSC      STATUS+0, 0
	GOTO       L_main25
;LedBlink.c,133 :: 		if (ACTIVE == OFF){
	MOVLW      0
	XORWF      _ACTIVE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVLW      0
	XORWF      _ACTIVE+0, 0
L__main48:
	BTFSS      STATUS+0, 2
	GOTO       L_main26
;LedBlink.c,134 :: 		ACTIVE = ON;
	MOVLW      1
	MOVWF      _ACTIVE+0
	MOVLW      0
	MOVWF      _ACTIVE+1
;LedBlink.c,135 :: 		RECHARG = OFF;
	CLRF       _RECHARG+0
	CLRF       _RECHARG+1
;LedBlink.c,136 :: 		RECARGA = ON; //invertido
	BSF        PORTC+0, 5
;LedBlink.c,137 :: 		CONT = 0;
	CLRF       _CONT+0
	CLRF       _CONT+1
;LedBlink.c,138 :: 		CARGA_BAT = ON;
	BSF        PORTC+0, 3
;LedBlink.c,139 :: 		Delay_ms(1500);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
	NOP
	NOP
;LedBlink.c,140 :: 		FONTE_OUT = ON;
	BSF        PORTA+0, 4
;LedBlink.c,142 :: 		}
L_main26:
;LedBlink.c,143 :: 		}else if (REDE > MID_REDE){
	GOTO       L_main28
L_main25:
	MOVF       _REDE+1, 0
	SUBWF      _MID_REDE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVF       _REDE+0, 0
	SUBWF      _MID_REDE+0, 0
L__main49:
	BTFSC      STATUS+0, 0
	GOTO       L_main29
;LedBlink.c,144 :: 		if (ACTIVE == ON){
	MOVLW      0
	XORWF      _ACTIVE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVLW      1
	XORWF      _ACTIVE+0, 0
L__main50:
	BTFSS      STATUS+0, 2
	GOTO       L_main30
;LedBlink.c,145 :: 		ACTIVE = OFF;
	CLRF       _ACTIVE+0
	CLRF       _ACTIVE+1
;LedBlink.c,146 :: 		FONTE_OUT = OFF;
	BCF        PORTA+0, 4
;LedBlink.c,147 :: 		Delay_ms(1500);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_main31:
	DECFSZ     R13+0, 1
	GOTO       L_main31
	DECFSZ     R12+0, 1
	GOTO       L_main31
	DECFSZ     R11+0, 1
	GOTO       L_main31
	NOP
	NOP
;LedBlink.c,148 :: 		CARGA_BAT = OFF;
	BCF        PORTC+0, 3
;LedBlink.c,149 :: 		}
L_main30:
;LedBlink.c,150 :: 		}
L_main29:
L_main28:
;LedBlink.c,151 :: 		if (ACTIVE == ON){
	MOVLW      0
	XORWF      _ACTIVE+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVLW      1
	XORWF      _ACTIVE+0, 0
L__main51:
	BTFSS      STATUS+0, 2
	GOTO       L_main32
;LedBlink.c,152 :: 		VBAT = ADC_Read(ADC_BAT);
	MOVLW      5
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _VBAT+0
	MOVF       R0+1, 0
	MOVWF      _VBAT+1
;LedBlink.c,153 :: 		if (VBAT < CRT_VBAT){
	MOVF       _CRT_VBAT+1, 0
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVF       _CRT_VBAT+0, 0
	SUBWF      R0+0, 0
L__main52:
	BTFSC      STATUS+0, 0
	GOTO       L_main33
;LedBlink.c,154 :: 		OUT_POWER = OFF;
	BCF        PORTC+0, 4
;LedBlink.c,155 :: 		}else{
	GOTO       L_main34
L_main33:
;LedBlink.c,156 :: 		OUT_POWER = ON;
	BSF        PORTC+0, 4
;LedBlink.c,157 :: 		}
L_main34:
;LedBlink.c,158 :: 		}else{
	GOTO       L_main35
L_main32:
;LedBlink.c,159 :: 		OUT_POWER = ON;
	BSF        PORTC+0, 4
;LedBlink.c,160 :: 		if (RECHARG == ON){
	MOVLW      0
	XORWF      _RECHARG+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVLW      1
	XORWF      _RECHARG+0, 0
L__main53:
	BTFSS      STATUS+0, 2
	GOTO       L_main36
;LedBlink.c,161 :: 		CONT ++;
	INCF       _CONT+0, 1
	BTFSC      STATUS+0, 2
	INCF       _CONT+1, 1
;LedBlink.c,162 :: 		if(CONT < T_CARGA_OFF){
	MOVLW      39
	SUBWF      _CONT+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVLW      16
	SUBWF      _CONT+0, 0
L__main54:
	BTFSC      STATUS+0, 0
	GOTO       L_main37
;LedBlink.c,163 :: 		RECARGA = ON; //invertido
	BSF        PORTC+0, 5
;LedBlink.c,164 :: 		}else{
	GOTO       L_main38
L_main37:
;LedBlink.c,165 :: 		RECARGA = OFF;  //invertido
	BCF        PORTC+0, 5
;LedBlink.c,166 :: 		}
L_main38:
;LedBlink.c,167 :: 		if (CONT > T_CARGA_OFF + T_CARGA_ON){
	MOVF       _CONT+1, 0
	SUBLW      175
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVF       _CONT+0, 0
	SUBLW      200
L__main55:
	BTFSC      STATUS+0, 0
	GOTO       L_main39
;LedBlink.c,168 :: 		CONT = 0;
	CLRF       _CONT+0
	CLRF       _CONT+1
;LedBlink.c,169 :: 		VBAT = ADC_Read(ADC_BAT);
	MOVLW      5
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _VBAT+0
	MOVF       R0+1, 0
	MOVWF      _VBAT+1
;LedBlink.c,170 :: 		if (VBAT > MAX_VBAT){
	MOVF       R0+1, 0
	SUBWF      _MAX_VBAT+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVF       R0+0, 0
	SUBWF      _MAX_VBAT+0, 0
L__main56:
	BTFSC      STATUS+0, 0
	GOTO       L_main40
;LedBlink.c,171 :: 		RECHARG = OFF;
	CLRF       _RECHARG+0
	CLRF       _RECHARG+1
;LedBlink.c,172 :: 		}
L_main40:
;LedBlink.c,173 :: 		}
L_main39:
;LedBlink.c,174 :: 		}else{
	GOTO       L_main41
L_main36:
;LedBlink.c,175 :: 		VBAT = ADC_Read(ADC_BAT);
	MOVLW      5
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _VBAT+0
	MOVF       R0+1, 0
	MOVWF      _VBAT+1
;LedBlink.c,176 :: 		if (VBAT < MIN_VBAT){
	MOVF       _MIN_VBAT+1, 0
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main57
	MOVF       _MIN_VBAT+0, 0
	SUBWF      R0+0, 0
L__main57:
	BTFSC      STATUS+0, 0
	GOTO       L_main42
;LedBlink.c,177 :: 		RECHARG = ON;
	MOVLW      1
	MOVWF      _RECHARG+0
	MOVLW      0
	MOVWF      _RECHARG+1
;LedBlink.c,178 :: 		}
L_main42:
;LedBlink.c,179 :: 		}
L_main41:
;LedBlink.c,180 :: 		}
L_main35:
;LedBlink.c,182 :: 		}
	GOTO       L_main21
;LedBlink.c,183 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
