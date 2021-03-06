
; PICBASIC PRO(TM) Compiler 3.0.6.1, (c) 1998, 2012 microEngineering Labs, Inc. All Rights Reserved. 
MPASMWIN_USED			EQU	1

#define	PBP_PATH	C:\PBP3\




        NOLIST
    ifdef PM_USED
        LIST
        include 'M16F8x.INC'    ; PM header
        XALL
        NOLIST
    else
        LIST
        LIST p = 16F84A, r = dec, w = -302
        INCLUDE "P16F84A.INC"    ; MPASM  Header
        NOLIST
    endif
        LIST


PBP_HARDWAREDEF  macro
  endm


    ifdef PM_USED
        device  pic16F84A, xt_osc, wdt_on, protect_off
    else
        __config _XT_OSC & _WDT_ON & _CP_OFF
    endif



; Define statements.
; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00014	define LCD_DREG     PORTB  'definimos que puerto vamos a usar para el LCD
#define		LCD_DREG		     PORTB  
; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00015	DEFINE LCD_DBIT     0      'A partir de que pin
#define		LCD_DBIT		     0      
; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00016	DEFINE LCD_RSREG    PORTA  'Definimos en que puerto esta el RS
#define		LCD_RSREG		    PORTA  
; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00017	DEFINE LCD_RSBIT    2      'RA2
#define		LCD_RSBIT		    2      
; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00018	DEFINE LCD_EREG     PORTA  'Definimos en que puerto esta el E
#define		LCD_EREG		     PORTA  
; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00019	DEFINE LCD_EBIT     3      'RA3                                                                      
#define		LCD_EBIT		     3      

RAM_START       		EQU	0000Ch
RAM_END         		EQU	0004Fh
RAM_BANKS       		EQU	00001h
BANK0_START     		EQU	0000Ch
BANK0_END       		EQU	0004Fh
EEPROM_START    		EQU	02100h
EEPROM_END      		EQU	0213Fh

; C:\PBP3\PBPPIC14.RAM     	00012	A0000C	R0      VAR     WORD BANK0 SYSTEM       ' System Register
R0              		EQU	RAM_START + 000h
; C:\PBP3\PBPPIC14.RAM     	00013	A0000E	R1      VAR     WORD BANK0 SYSTEM       ' System Register
R1              		EQU	RAM_START + 002h
; C:\PBP3\PBPPIC14.RAM     	00014	A00010	R2      VAR     WORD BANK0 SYSTEM       ' System Register
R2              		EQU	RAM_START + 004h
; C:\PBP3\PBPPIC14.RAM     	00015	A00012	R3      VAR     WORD BANK0 SYSTEM       ' System Register
R3              		EQU	RAM_START + 006h
; C:\PBP3\PBPPIC14.RAM     	00016	A00014	R4      VAR     WORD BANK0 SYSTEM       ' System Register
R4              		EQU	RAM_START + 008h
; C:\PBP3\PBPPIC14.RAM     	00017	A00016	R5      VAR     WORD BANK0 SYSTEM       ' System Register
R5              		EQU	RAM_START + 00Ah
; C:\PBP3\PBPPIC14.RAM     	00018	A00018	R6      VAR     WORD BANK0 SYSTEM       ' System Register
R6              		EQU	RAM_START + 00Ch
; C:\PBP3\PBPPIC14.RAM     	00019	A0001A	R7      VAR     WORD BANK0 SYSTEM       ' System Register
R7              		EQU	RAM_START + 00Eh
; C:\PBP3\PBPPIC14.RAM     	00020	A0001C	R8      VAR     WORD BANK0 SYSTEM       ' System Register
R8              		EQU	RAM_START + 010h
; C:\PBP3\PBPPIC14.RAM     	00026	A0001E	FLAGS   VAR     BYTE BANK0 SYSTEM       ' Static flags
FLAGS           		EQU	RAM_START + 012h
; C:\PBP3\PBPPIC14.RAM     	00025	A0001F	GOP     VAR     BYTE BANK0 SYSTEM       ' Gen Op Parameter
GOP             		EQU	RAM_START + 013h
; C:\PBP3\PBPPIC14.RAM     	00022	A00020	RM1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Mask
RM1             		EQU	RAM_START + 014h
; C:\PBP3\PBPPIC14.RAM     	00024	A00021	RM2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Mask
RM2             		EQU	RAM_START + 015h
; C:\PBP3\PBPPIC14.RAM     	00021	A00022	RR1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Register
RR1             		EQU	RAM_START + 016h
; C:\PBP3\PBPPIC14.RAM     	00023	A00023	RR2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Register
RR2             		EQU	RAM_START + 017h
; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00020	A00024	conteo var word     'Armamos la variable conteo. Esta variable la vamos a cortar en dos y la vamos a copiar a la EEPROM
_conteo          		EQU	RAM_START + 018h
; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00031	A00026	flash_lcd var byte  'Variable para flashear LCD
_flash_lcd       		EQU	RAM_START + 01Ah
; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00001	A00027	'****************************************************************
PB01            		EQU	RAM_START + 01Bh
; C:\PBP3\DEVICES\PIC16F84A.PBPINC	00110	PORTL   VAR     PORTB
_PORTL           		EQU	 PORTB
; C:\PBP3\DEVICES\PIC16F84A.PBPINC	00111	PORTH   VAR     PORTA
_PORTH           		EQU	 PORTA
; C:\PBP3\DEVICES\PIC16F84A.PBPINC	00112	TRISL   VAR     TRISB
_TRISL           		EQU	 TRISB
; C:\PBP3\DEVICES\PIC16F84A.PBPINC	00113	TRISH   VAR     TRISA
_TRISH           		EQU	 TRISA
_conteo??BYTE0   		EQU	_conteo
_conteo??BYTE1   		EQU	_conteo + 001h
#define _ongoing         	 PB01, 002h
#define _flagpulso       	 PB01, 000h
#define _halt            	 PB01, 001h
#define _stopped         	 PB01, 003h
#define _pulsos          	_PORTB??7
#define _relay           	_PORTB??6
#define _start           	_PORTB??5
#define _pausa           	_PORTB??4
#define _parar           	_PORTA??0
#define _PORTB??7        	 PORTB, 007h
#define _PORTB??6        	 PORTB, 006h
#define _PORTB??5        	 PORTB, 005h
#define _PORTB??4        	 PORTB, 004h
#define _PORTA??0        	 PORTA, 000h
	INCLUDE	"CODE.MAC"
	INCLUDE	"C:\PBP3\PBPPIC14.LIB"


; C:\PBP3\DEVICES\PIC16F84A.PBPINC	00036	#HEADER
; C:\PBP3\DEVICES\PIC16F84A.PBPINC	00061	#CONFIG
; C:\PBP3\DEVICES\PIC16F84A.PBPINC	00103	BANK0   $000C, $004F
; C:\PBP3\DEVICES\PIC16F84A.PBPINC	00105	EEPROM  $2100, $213F
; C:\PBP3\DEVICES\PIC16F84A.PBPINC	00107	    #ERROR "-n option (PBPL) is not supported for this device."
; C:\PBP3\DEVICES\PIC16F84A.PBPINC	00108	#ENDIF
; C:\PBP3\DEVICES\PIC16F84A.PBPINC	00109	LIBRARY "PBPPIC14"

; C:\PBP3\DEVICES\PIC16F84A.PBPINC	00114	include "PBPPIC14.RAM"
; C:\PBP3\DEVICES\PIC16F84A.PBPINC	00118	#HEADER

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00013	variables:

	LABEL?L	_variables	
; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00014	define LCD_DREG     PORTB  'definimos que puerto vamos a usar para el LCD
; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00015	DEFINE LCD_DBIT     0      'A partir de que pin
; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00016	DEFINE LCD_RSREG    PORTA  'Definimos en que puerto esta el RS
; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00017	DEFINE LCD_RSBIT    2      'RA2
; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00018	DEFINE LCD_EREG     PORTA  'Definimos en que puerto esta el E
; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00019	DEFINE LCD_EBIT     3      'RA3                                                                      

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00032	TRISA=%11110000     'Todos los pines son salidas. RA2,RA3,RA4 son por ahora las entradas.(PORTA)
	MOVE?CB	0F0h, TRISA

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00033	TRISB=%00000001     'Todos los pines son salidas (PORTB) 
	MOVE?CB	001h, TRISB

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00034	pause 200
	PAUSE?C	0C8h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00035	lcdout $fe,1,"Welcome" 'Primer mensaje al LCD 
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	057h
	LCDOUT?C	065h
	LCDOUT?C	06Ch
	LCDOUT?C	063h
	LCDOUT?C	06Fh
	LCDOUT?C	06Dh
	LCDOUT?C	065h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00037	ongoing = 1
	MOVE?CT	001h, _ongoing

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00038	conteo = 65530
	MOVE?CW	0FFFAh, _conteo

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00039	Write 1,ongoing       
	WRITEADDRESS?C	001h
	WRITE?T	_ongoing

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00040	write 2,conteo.byte0
	WRITEADDRESS?C	002h
	WRITE?B	_conteo??BYTE0

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00041	write 3,conteo.byte1
	WRITEADDRESS?C	003h
	WRITE?B	_conteo??BYTE1

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00042	Pause 500
	PAUSE?C	001F4h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00044	test_ongoing:

	LABEL?L	_test_ongoing	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00045	read 1,ongoing 'leemos la eeprom. El resultado va a la variable 'ongoing'
	READADDRESS?C	001h
	READ?T	_ongoing

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00046	Branch ongoing, [no_ongoing_job,ongoing_job]
	BRANCH?TCL	_ongoing, 002h, L00001
	BRGOTO?L	_no_ongoing_job
	BRGOTO?L	_ongoing_job

	LABEL?L	L00001	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00048	no_ongoing_job: 'Rutina que se ejecuta si no hay trabajo pendiente

	LABEL?L	_no_ongoing_job	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00050	FOr flash_lcd = 1 to 4
	MOVE?CB	001h, _flash_lcd
	LABEL?L	L00002	
	CMPGT?BCL	_flash_lcd, 004h, L00003

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00051	lcdout $fe,1,"Starting new Job"
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	053h
	LCDOUT?C	074h
	LCDOUT?C	061h
	LCDOUT?C	072h
	LCDOUT?C	074h
	LCDOUT?C	069h
	LCDOUT?C	06Eh
	LCDOUT?C	067h
	LCDOUT?C	020h
	LCDOUT?C	06Eh
	LCDOUT?C	065h
	LCDOUT?C	077h
	LCDOUT?C	020h
	LCDOUT?C	04Ah
	LCDOUT?C	06Fh
	LCDOUT?C	062h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00052	pause 100
	PAUSE?C	064h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00053	lcdout $fe,1
	LCDOUT?C	0FEh
	LCDOUT?C	001h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00054	Pause 100
	PAUSE?C	064h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00055	NExt
	NEXT?BCL	_flash_lcd, 001h, L00002
	LABEL?L	L00003	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00056	lcdout $fe,1,"Press start"
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	050h
	LCDOUT?C	072h
	LCDOUT?C	065h
	LCDOUT?C	073h
	LCDOUT?C	073h
	LCDOUT?C	020h
	LCDOUT?C	073h
	LCDOUT?C	074h
	LCDOUT?C	061h
	LCDOUT?C	072h
	LCDOUT?C	074h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00057	Conteo=0   'Reseteamos el conteo a cero por las dudas
	MOVE?CW	000h, _conteo

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00060	listen_start_pin:       'testeamos el pin de entrada para saber cuando hay que arrancar

	LABEL?L	_listen_start_pin	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00061	if start=1 then job
	CMPEQ?TCL	_start, 001h, _job

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00062	pause 50      
	PAUSE?C	032h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00063	goto listen_start_pin  'encierra esto en un loop hasta que haya una entrada. 
	GOTO?L	_listen_start_pin

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00065	job:

	LABEL?L	_job	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00066	high relay  'Mandamos un pulso para prender el relay
	HIGH?T	_relay

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00067	ongoing=1
	MOVE?CT	001h, _ongoing

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00068	write 1,ongoing 'Avisamos que hay un trabajo en progreso
	WRITEADDRESS?C	001h
	WRITE?T	_ongoing

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00069	lcdout $FE,1, "Job in Progress"
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	04Ah
	LCDOUT?C	06Fh
	LCDOUT?C	062h
	LCDOUT?C	020h
	LCDOUT?C	069h
	LCDOUT?C	06Eh
	LCDOUT?C	020h
	LCDOUT?C	050h
	LCDOUT?C	072h
	LCDOUT?C	06Fh
	LCDOUT?C	067h
	LCDOUT?C	072h
	LCDOUT?C	065h
	LCDOUT?C	073h
	LCDOUT?C	073h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00070	lcdout $FE,$C5,DEC conteo,  " turns"               
	LCDOUT?C	0FEh
	LCDOUT?C	0C5h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_conteo
	LCDOUTDEC?	
	LCDOUT?C	020h
	LCDOUT?C	074h
	LCDOUT?C	075h
	LCDOUT?C	072h
	LCDOUT?C	06Eh
	LCDOUT?C	073h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00072	watch_pulses:

	LABEL?L	_watch_pulses	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00073	if pulsos=1 then 
	CMPNE?TCL	_pulsos, 001h, L00004

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00074	gosub sumar
	GOSUB?L	_sumar

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00075	endif
	LABEL?L	L00004	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00076	if pausa=1 then 
	CMPNE?TCL	_pausa, 001h, L00006

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00077	gosub pausar
	GOSUB?L	_pausar

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00078	endif
	LABEL?L	L00006	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00079	if parar=1 then 
	CMPNE?TCL	_parar, 001h, L00008

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00080	gosub stoppear
	GOSUB?L	_stoppear

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00081	endif
	LABEL?L	L00008	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00082	goto watch_pulses 'encierra hasta que haya un input
	GOTO?L	_watch_pulses

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00084	sumar:

	LABEL?L	_sumar	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00085	pause 100
	PAUSE?C	064h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00086	conteo=conteo+1
	ADD?WCW	_conteo, 001h, _conteo

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00087	write 2,conteo.byte0
	WRITEADDRESS?C	002h
	WRITE?B	_conteo??BYTE0

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00088	Write 3,conteo.byte1
	WRITEADDRESS?C	003h
	WRITE?B	_conteo??BYTE1

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00089	lcdout $FE,$C5,DEC conteo,  " turns"
	LCDOUT?C	0FEh
	LCDOUT?C	0C5h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_conteo
	LCDOUTDEC?	
	LCDOUT?C	020h
	LCDOUT?C	074h
	LCDOUT?C	075h
	LCDOUT?C	072h
	LCDOUT?C	06Eh
	LCDOUT?C	073h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00090	return
	RETURN?	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00092	pausar:

	LABEL?L	_pausar	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00093	Low relay
	LOW?T	_relay

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00094	lcdout $FE,$1, "Work Paused"
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	057h
	LCDOUT?C	06Fh
	LCDOUT?C	072h
	LCDOUT?C	06Bh
	LCDOUT?C	020h
	LCDOUT?C	050h
	LCDOUT?C	061h
	LCDOUT?C	075h
	LCDOUT?C	073h
	LCDOUT?C	065h
	LCDOUT?C	064h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00095	lcdout $FE,$C0, "Press start"
	LCDOUT?C	0FEh
	LCDOUT?C	0C0h
	LCDOUT?C	050h
	LCDOUT?C	072h
	LCDOUT?C	065h
	LCDOUT?C	073h
	LCDOUT?C	073h
	LCDOUT?C	020h
	LCDOUT?C	073h
	LCDOUT?C	074h
	LCDOUT?C	061h
	LCDOUT?C	072h
	LCDOUT?C	074h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00098	write 2,conteo.byte0
	WRITEADDRESS?C	002h
	WRITE?B	_conteo??BYTE0

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00099	Write 3,conteo.byte1
	WRITEADDRESS?C	003h
	WRITE?B	_conteo??BYTE1

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00101	Pause_loop:

	LABEL?L	_Pause_loop	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00102	if start=1 then goto resume_job
	CMPNE?TCL	_start, 001h, L00010
	GOTO?L	_resume_job
	LABEL?L	L00010	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00103	goto pause_loop 
	GOTO?L	_Pause_loop

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00105	Resume_job:

	LABEL?L	_resume_job	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00106	pause 50
	PAUSE?C	032h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00107	flash_lcd = 0 
	MOVE?CB	000h, _flash_lcd

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00108	for flash_lcd = 1 to 2 
	MOVE?CB	001h, _flash_lcd
	LABEL?L	L00012	
	CMPGT?BCL	_flash_lcd, 002h, L00013

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00109	lcdout $fe,1,"Resuming job"
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	052h
	LCDOUT?C	065h
	LCDOUT?C	073h
	LCDOUT?C	075h
	LCDOUT?C	06Dh
	LCDOUT?C	069h
	LCDOUT?C	06Eh
	LCDOUT?C	067h
	LCDOUT?C	020h
	LCDOUT?C	06Ah
	LCDOUT?C	06Fh
	LCDOUT?C	062h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00110	pause 100
	PAUSE?C	064h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00111	lcdout $fe,1
	LCDOUT?C	0FEh
	LCDOUT?C	001h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00112	pause 100
	PAUSE?C	064h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00113	next
	NEXT?BCL	_flash_lcd, 001h, L00012
	LABEL?L	L00013	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00114	goto job
	GOTO?L	_job

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00116	stoppear: 

	LABEL?L	_stoppear	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00117	Pause 100
	PAUSE?C	064h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00118	low relay
	LOW?T	_relay

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00119	if stopped=1 then goto stop_loop
	CMPNE?TCL	_stopped, 001h, L00014
	GOTO?L	_stop_loop
	LABEL?L	L00014	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00120	stopped=1
	MOVE?CT	001h, _stopped

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00121	Lcdout $fe,1,"Cancel?"
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	043h
	LCDOUT?C	061h
	LCDOUT?C	06Eh
	LCDOUT?C	063h
	LCDOUT?C	065h
	LCDOUT?C	06Ch
	LCDOUT?C	03Fh

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00122	LCDout $fe,$C0, "Stop to confirm"
	LCDOUT?C	0FEh
	LCDOUT?C	0C0h
	LCDOUT?C	053h
	LCDOUT?C	074h
	LCDOUT?C	06Fh
	LCDOUT?C	070h
	LCDOUT?C	020h
	LCDOUT?C	074h
	LCDOUT?C	06Fh
	LCDOUT?C	020h
	LCDOUT?C	063h
	LCDOUT?C	06Fh
	LCDOUT?C	06Eh
	LCDOUT?C	066h
	LCDOUT?C	069h
	LCDOUT?C	072h
	LCDOUT?C	06Dh

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00124	Stop_loop: 

	LABEL?L	_stop_loop	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00125	if parar=1 then goto stop_sequence
	CMPNE?TCL	_parar, 001h, L00016
	GOTO?L	_stop_sequence
	LABEL?L	L00016	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00126	goto stop_loop
	GOTO?L	_stop_loop

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00128	Stop_sequence:     'TO DO: Revisar esta rutina

	LABEL?L	_stop_sequence	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00129	Pause 100
	PAUSE?C	064h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00130	lcdout $fe,1, "Job stopped"
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	04Ah
	LCDOUT?C	06Fh
	LCDOUT?C	062h
	LCDOUT?C	020h
	LCDOUT?C	073h
	LCDOUT?C	074h
	LCDOUT?C	06Fh
	LCDOUT?C	070h
	LCDOUT?C	070h
	LCDOUT?C	065h
	LCDOUT?C	064h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00131	LCDout $fe,$C0, "Press Start"
	LCDOUT?C	0FEh
	LCDOUT?C	0C0h
	LCDOUT?C	050h
	LCDOUT?C	072h
	LCDOUT?C	065h
	LCDOUT?C	073h
	LCDOUT?C	073h
	LCDOUT?C	020h
	LCDOUT?C	053h
	LCDOUT?C	074h
	LCDOUT?C	061h
	LCDOUT?C	072h
	LCDOUT?C	074h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00132	conteo = 0 
	MOVE?CW	000h, _conteo

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00133	ongoing = 0 
	MOVE?CT	000h, _ongoing

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00134	Write 1,ongoing
	WRITEADDRESS?C	001h
	WRITE?T	_ongoing

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00135	write 2,conteo.byte0
	WRITEADDRESS?C	002h
	WRITE?B	_conteo??BYTE0

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00136	Write 3,conteo.byte1
	WRITEADDRESS?C	003h
	WRITE?B	_conteo??BYTE1

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00138	restart_button:

	LABEL?L	_restart_button	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00139	if start=1 then goto test_ongoing
	CMPNE?TCL	_start, 001h, L00018
	GOTO?L	_test_ongoing
	LABEL?L	L00018	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00140	pause 50
	PAUSE?C	032h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00141	goto restart_button ' Encierra hasta que haya un loop
	GOTO?L	_restart_button

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00143	ongoing_job: 'si esta rutina se ejecuta si hay trabajo pendiente. 

	LABEL?L	_ongoing_job	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00145	print_warning:

	LABEL?L	_print_warning	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00146	lcdout $FE,1, "Pending job"
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	050h
	LCDOUT?C	065h
	LCDOUT?C	06Eh
	LCDOUT?C	064h
	LCDOUT?C	069h
	LCDOUT?C	06Eh
	LCDOUT?C	067h
	LCDOUT?C	020h
	LCDOUT?C	06Ah
	LCDOUT?C	06Fh
	LCDOUT?C	062h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00147	lcdout $FE,$C5, "Continue?"
	LCDOUT?C	0FEh
	LCDOUT?C	0C5h
	LCDOUT?C	043h
	LCDOUT?C	06Fh
	LCDOUT?C	06Eh
	LCDOUT?C	074h
	LCDOUT?C	069h
	LCDOUT?C	06Eh
	LCDOUT?C	075h
	LCDOUT?C	065h
	LCDOUT?C	03Fh

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00149	check_resume:

	LABEL?L	_check_resume	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00150	if start=1 then 
	CMPNE?TCL	_start, 001h, L00020

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00151	gosub resume_sequence
	GOSUB?L	_resume_sequence

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00152	endif
	LABEL?L	L00020	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00153	if parar=1 then 
	CMPNE?TCL	_parar, 001h, L00022

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00154	gosub stoppear
	GOSUB?L	_stoppear

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00155	endif
	LABEL?L	L00022	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00156	goto check_resume:
	GOTO?L	_check_resume

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00158	resume_sequence: 

	LABEL?L	_resume_sequence	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00159	flash_lcd = 0
	MOVE?CB	000h, _flash_lcd

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00160	FOr flash_lcd = 1 to 4
	MOVE?CB	001h, _flash_lcd
	LABEL?L	L00024	
	CMPGT?BCL	_flash_lcd, 004h, L00025

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00161	lcdout $fe,1,"Resuming Job"
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	052h
	LCDOUT?C	065h
	LCDOUT?C	073h
	LCDOUT?C	075h
	LCDOUT?C	06Dh
	LCDOUT?C	069h
	LCDOUT?C	06Eh
	LCDOUT?C	067h
	LCDOUT?C	020h
	LCDOUT?C	04Ah
	LCDOUT?C	06Fh
	LCDOUT?C	062h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00162	pause 100
	PAUSE?C	064h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00163	lcdout $fe,1
	LCDOUT?C	0FEh
	LCDOUT?C	001h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00164	Pause 100
	PAUSE?C	064h

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00165	NExt
	NEXT?BCL	_flash_lcd, 001h, L00024
	LABEL?L	L00025	

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00166	ongoing = 1
	MOVE?CT	001h, _ongoing

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00167	write 1,ongoing
	WRITEADDRESS?C	001h
	WRITE?T	_ongoing

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00168	read 2,conteo.byte0
	READADDRESS?C	002h
	READ?B	_conteo??BYTE0

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00169	read 3,conteo.byte1
	READADDRESS?C	003h
	READ?B	_conteo??BYTE1

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00170	goto job
	GOTO?L	_job

; C:\USERS\SSIMONE\DOCUMENTS\GITHUB\BOBINADORA\CODIGO\CODE.PBP	00172	END
	END?	

	END
