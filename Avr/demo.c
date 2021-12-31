/*******************************************************
This program was created by the
CodeWizardAVR V3.14 Advanced
Automatic Program Generator
� Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : 
Version : 
Date    : 12/14/2021
Author  : 
Company : 
Comments: 


Chip type               : ATmega8
Program type            : Application
AVR Core Clock frequency: 11.059200 MHz
Memory model            : Small
External RAM size       : 0
Data Stack size         : 256
*******************************************************/

#include <mega8.h>
#include <math.h>
#include <delay.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#define min 10
#define max 255
// Declare your global variables here
unsigned ext_cnt2x, ext_cnt4x;
unsigned int mode = 1;
float error, pre_error, Pout, Iout, Dout, out, integral, derivative;
int Kp = 15, Ki = 10, Kd = 1;
long ADC_val_0 = 0,ADC_val_1 = 0;
float Volt_0 = 0, Weight_0 = 0, Volt_1 = 0, Weight_1 = 0;
char str2[20];
char function[8][50] ={
            "sp",
            "1x",
            "2x",
            "4x",
            "Kp",
            "Ki",
            "Kd",
            "mode"
            };
int number;
int i,j,k,l,m;
float spd1, spd2, spd3, spd4;
long Ts = 100;
int cmd ;
float output;
int func_prevnumber, func_number =1;
long timer_cnt, capture_pulse;
// External Interrupt 0 service routine
interrupt [EXT_INT0] void ext_int0_isr(void)
{
// Place your code here
ext_cnt2x++;
ext_cnt4x++;
}

// External Interrupt 1 service routine
interrupt [EXT_INT1] void ext_int1_isr(void)
{
// Place your code here
ext_cnt4x++;
}

#define DATA_REGISTER_EMPTY (1<<UDRE)
#define RX_COMPLETE (1<<RXC)
#define FRAMING_ERROR (1<<FE)
#define PARITY_ERROR (1<<UPE)
#define DATA_OVERRUN (1<<DOR)

// USART Receiver buffer
#define RX_BUFFER_SIZE 8
char rx_buffer[RX_BUFFER_SIZE];

#if RX_BUFFER_SIZE <= 256
unsigned char rx_wr_index=0,rx_rd_index=0;
#else
unsigned int rx_wr_index=0,rx_rd_index=0;
#endif

#if RX_BUFFER_SIZE < 256
unsigned char rx_counter=0;
#else
unsigned int rx_counter=0;
#endif

// This flag is set on USART Receiver buffer overflow
bit rx_buffer_overflow;

// USART Receiver interrupt service routine
interrupt [USART_RXC] void usart_rx_isr(void)
{
char status,data;
status=UCSRA;
data=UDR;
if ((status & (FRAMING_ERROR | PARITY_ERROR | DATA_OVERRUN))==0)
   {
   rx_buffer[rx_wr_index++]=data;
#if RX_BUFFER_SIZE == 256
   // special case for receiver buffer size=256
   if (++rx_counter == 0) rx_buffer_overflow=1;
#else
   if (rx_wr_index == RX_BUFFER_SIZE) rx_wr_index=0;
   if (++rx_counter == RX_BUFFER_SIZE)
      {
      rx_counter=0;
      rx_buffer_overflow=1;
      }
#endif
   }
}

#ifndef _DEBUG_TERMINAL_IO_
// Get a character from the USART Receiver buffer
#define _ALTERNATE_GETCHAR_
#pragma used+
char getchar(void)
{
char data;
while (rx_counter==0);
data=rx_buffer[rx_rd_index++];
#if RX_BUFFER_SIZE != 256
if (rx_rd_index == RX_BUFFER_SIZE) rx_rd_index=0;
#endif
#asm("cli")
--rx_counter;
#asm("sei")
return data;
}
#pragma used-
#endif

// Standard Input/Output functions
#include <stdio.h>
float PID_controller(float setpoint, float input);
int compare ();
void substring(const char *str1, int pos1, int pos2);
int startwith(const char *pre, const char *str);
void Function1x();
void Function2x();
void Function4x();
void Kp_function(int Kp_new);
void Ki_function(int Ki_new);
void Kd_function(int Kd_new);
void SetPoint(int Ref);
void mode_function(int mode_number);
// Timer1 input capture interrupt service routine.
interrupt [TIM1_CAPT] void timer1_capt_isr(void)
{
// Place your code here
   timer_cnt = TCNT1;
   TCNT1 = 0;
   capture_pulse++;
}

// Voltage Reference: AREF pin
#define ADC_VREF_TYPE ((0<<REFS1) | (0<<REFS0) | (0<<ADLAR))

// Read the AD conversion result
unsigned int read_adc(unsigned char adc_input)
{
ADMUX=adc_input | ADC_VREF_TYPE;
// Delay needed for the stabilization of the ADC input voltage
delay_us(10);
// Start the AD conversion
ADCSRA|=(1<<ADSC);
// Wait for the AD conversion to complete
while ((ADCSRA & (1<<ADIF))==0);
ADCSRA|=(1<<ADIF);
return ADCW;
}

void main(void)
{
// Declare your local variables here


// Input/Output Ports initialization
// Port B initialization
// Function: Bit7=In Bit6=In Bit5=In Bit4=In Bit3=Out Bit2=In Bit1=In Bit0=In 
DDRB=(0<<DDB7) | (0<<DDB6) | (0<<DDB5) | (0<<DDB4) | (1<<DDB3) | (0<<DDB2) | (0<<DDB1) | (0<<DDB0);
// State: Bit7=T Bit6=T Bit5=T Bit4=T Bit3=0 Bit2=T Bit1=T Bit0=T 
PORTB=(0<<PORTB7) | (0<<PORTB6) | (0<<PORTB5) | (0<<PORTB4) | (0<<PORTB3) | (0<<PORTB2) | (0<<PORTB1) | (0<<PORTB0);

// Port C initialization
// Function: Bit6=In Bit5=In Bit4=In Bit3=In Bit2=In Bit1=In Bit0=In 
DDRC=(0<<DDC6) | (0<<DDC5) | (0<<DDC4) | (0<<DDC3) | (0<<DDC2) | (0<<DDC1) | (0<<DDC0);
// State: Bit6=T Bit5=T Bit4=T Bit3=T Bit2=T Bit1=T Bit0=T 
PORTC=(0<<PORTC6) | (0<<PORTC5) | (0<<PORTC4) | (0<<PORTC3) | (0<<PORTC2) | (0<<PORTC1) | (0<<PORTC0);

// Port D initialization
// Function: Bit7=In Bit6=In Bit5=In Bit4=In Bit3=In Bit2=In Bit1=In Bit0=In 
DDRD=(0<<DDD7) | (0<<DDD6) | (0<<DDD5) | (0<<DDD4) | (0<<DDD3) | (0<<DDD2) | (0<<DDD1) | (0<<DDD0);
// State: Bit7=T Bit6=T Bit5=T Bit4=T Bit3=T Bit2=T Bit1=T Bit0=T 
PORTD=(0<<PORTD7) | (0<<PORTD6) | (0<<PORTD5) | (0<<PORTD4) | (0<<PORTD3) | (0<<PORTD2) | (0<<PORTD1) | (0<<PORTD0);

// Timer/Counter 0 initialization
// Clock source: System Clock
// Clock value: Timer 0 Stopped
TCCR0=(0<<CS02) | (0<<CS01) | (0<<CS00);
TCNT0=0x00;

// Timer/Counter 1 initialization
// Clock source: System Clock
// Clock value: 1382.400 kHz
// Mode: Normal top=0xFFFF
// OC1A output: Disconnected
// OC1B output: Disconnected
// Noise Canceler: On
// Input Capture on Rising Edge
// Timer Period: 47.407 ms
// Timer1 Overflow Interrupt: Off
// Input Capture Interrupt: On
// Compare A Match Interrupt: Off
// Compare B Match Interrupt: Off
TCCR1A=(0<<COM1A1) | (0<<COM1A0) | (0<<COM1B1) | (0<<COM1B0) | (0<<WGM11) | (0<<WGM10);
TCCR1B=(1<<ICNC1) | (1<<ICES1) | (0<<WGM13) | (0<<WGM12) | (0<<CS12) | (1<<CS11) | (0<<CS10);
TCNT1H=0x00;
TCNT1L=0x00;
ICR1H=0x00;
ICR1L=0x00;
OCR1AH=0x00;
OCR1AL=0x00;
OCR1BH=0x00;
OCR1BL=0x00;

// Timer/Counter 2 initialization
// Clock source: System Clock
// Clock value: 345.600 kHz
// Mode: Fast PWM top=0xFF
// OC2 output: Non-Inverted PWM
// Timer Period: 0.74074 ms
// Output Pulse(s):
// OC2 Period: 0.74074 ms Width: 0.14815 ms
ASSR=0<<AS2;
TCCR2=(1<<PWM2) | (1<<COM21) | (0<<COM20) | (1<<CTC2) | (0<<CS22) | (1<<CS21) | (1<<CS20);
TCNT2=0x00;
OCR2=0x33;

// Timer(s)/Counter(s) Interrupt(s) initialization
TIMSK=(0<<OCIE2) | (0<<TOIE2) | (1<<TICIE1) | (0<<OCIE1A) | (0<<OCIE1B) | (0<<TOIE1) | (0<<TOIE0);

// External Interrupt(s) initialization
// INT0: On
// INT0 Mode: Any change
// INT1: On
// INT1 Mode: Any change
GICR|=(1<<INT1) | (1<<INT0);
MCUCR=(0<<ISC11) | (1<<ISC10) | (0<<ISC01) | (1<<ISC00);
GIFR=(1<<INTF1) | (1<<INTF0);

// USART initialization
// Communication Parameters: 8 Data, 1 Stop, No Parity
// USART Receiver: On
// USART Transmitter: On
// USART Mode: Asynchronous
// USART Baud Rate: 9600
UCSRA=(0<<RXC) | (0<<TXC) | (0<<UDRE) | (0<<FE) | (0<<DOR) | (0<<UPE) | (0<<U2X) | (0<<MPCM);
UCSRB=(1<<RXCIE) | (0<<TXCIE) | (0<<UDRIE) | (1<<RXEN) | (1<<TXEN) | (0<<UCSZ2) | (0<<RXB8) | (0<<TXB8);
UCSRC=(1<<URSEL) | (0<<UMSEL) | (0<<UPM1) | (0<<UPM0) | (0<<USBS) | (1<<UCSZ1) | (1<<UCSZ0) | (0<<UCPOL);
UBRRH=0x00;
UBRRL=0x47;

// Analog Comparator initialization
// Analog Comparator: Off
// The Analog Comparator's positive input is
// connected to the AIN0 pin
// The Analog Comparator's negative input is
// connected to the AIN1 pin
ACSR=(1<<ACD) | (0<<ACBG) | (0<<ACO) | (0<<ACI) | (0<<ACIE) | (0<<ACIC) | (0<<ACIS1) | (0<<ACIS0);

// ADC initialization
// ADC Clock frequency: 691.200 kHz
// ADC Voltage Reference: AREF pin
ADMUX=ADC_VREF_TYPE;
ADCSRA=(1<<ADEN) | (0<<ADSC) | (0<<ADFR) | (0<<ADIF) | (0<<ADIE) | (1<<ADPS2) | (0<<ADPS1) | (0<<ADPS0);
SFIOR=(0<<ACME);

// SPI initialization
// SPI disabled
SPCR=(0<<SPIE) | (0<<SPE) | (0<<DORD) | (0<<MSTR) | (0<<CPOL) | (0<<CPHA) | (0<<SPR1) | (0<<SPR0);

// TWI initialization
// TWI disabled
TWCR=(0<<TWEA) | (0<<TWSTA) | (0<<TWSTO) | (0<<TWEN) | (0<<TWIE);

// Global enable interrupts
#asm("sei")

while (1)
      {
      // Place your code here
         delay_ms(100);
         // ADC_val_0 = read_adc(0);
         // Volt_0 = ADC_val_0*5/1023.0;
         // Weight = (Volt_0/0.05);
         // printf("%d,%5.2f,%7.4f  \n\r", ADC_val_0, Volt_0, Weight);
         if(rx_buffer_overflow)
         {
             rx_buffer_overflow = 0;
            func_prevnumber = compare();
            if( func_prevnumber > 0 && func_number < 4 )
            {
             func_number = func_prevnumber;
            }
         }
         switch(func_number)
         {
            case  1: Function1x();
               break;
            case  2: Function2x();
               break;
            case  3: Function4x();                   
         }
      }
}

float PID_controller(float setpoint, float input)
{
   error = setpoint - input;
   Pout = Kp * error;
   integral = Kp * 0.1;
   Iout = Ki * integral;
   derivative = (error - pre_error) / 0.1;
   Dout = Kd * derivative;
    // Calculate total output
   out = Pout + Iout + Dout;
    // Restrict to max/min
    if(out >= max)
       out = max;
    else if(out <= min)
       out = min;
    // Save error to previous error
    pre_error = error;
   return out;
}

int compare ()
{
   i = 0;
  for (i = 0;i<8;i++ )
  {
    if(startwith(function[i],rx_buffer))
    {
    substring(rx_buffer,strlen(function[i]),strlen(rx_buffer));
    number = atoi(str2);    
   if(number != 0)
   {
      // printf("data is received\n");
      switch(i)
     {
     case  0: SetPoint(number);
         break;
     case  4: Kp_function(number);
         break;
     case  5: Ki_function(number);
         break;
     case  6: Kd_function(number);
         break;
     case  7: mode_function(number);                       
     }
     i = 0;
   }
   else if( number == 0)
   {
      // printf("no data is received\n");
      break;
   }
      number = 0;
      
      break;
   }
  }
  return i;
}
void substring(const char *str1, int pos1, int pos2)
{
  j = 0;
  l = pos1;
   for(l = pos1 ; l <= pos2 ; l++)
  {
    str2[j++] = str1[l];
  }
}
int startwith(const char *pre, const char *str)
{
  return strncmp(pre, str, strlen(pre))==0 ;
}
void Function1x()
{
   spd1 = 230400.0/timer_cnt;
   output = PID_controller(cmd,spd1);
   OCR2 = output;
   ext_cnt2x = 0;
   ext_cnt4x = 0;
   capture_pulse = 0;
   printf("%d,",cmd);
   printf("%5.2f,", spd1);
   if(mode == 1)
   {
      ADC_val_0 = read_adc(0);
      Volt_0 = ADC_val_0*5/1023.0;
      Weight_0 = (Volt_0/0.05);
      printf("%d,%5.2f,%5.2f \n\r", ADC_val_0, Volt_0, Weight_0);
   }
   else{
      ADC_val_1 = read_adc(1);
      Volt_1 = ADC_val_1*5/1023.0;
      Weight_1 = (Volt_1/0.05);
      printf("%d,%5.2f,%5.2f  \n\r", ADC_val_1, Volt_1, Weight_1);
   }
   
}
void Function2x()
{
   //  printf("2x function is executed!\n");
   spd3 = 83.3333*ext_cnt2x/Ts;
   output = PID_controller(cmd,spd3);
   OCR2 = output;
   ext_cnt2x = 0;
   ext_cnt4x = 0;
   capture_pulse = 0;
   printf("%d,",cmd);
   printf("%5.2f,", spd3);
   if(mode == 1)
   {
      ADC_val_0 = read_adc(0);
      Volt_0 = ADC_val_0*5/1023.0;
      Weight_0 = (Volt_0/0.05);
      printf("%d,%5.2f,%5.2f  \n\r", ADC_val_0, Volt_0, Weight_0);
   }
   else{
      ADC_val_1 = read_adc(1);
      Volt_1 = ADC_val_1*5/1023.0;
      Weight_1 = (Volt_1/0.05);
      printf("%d,%5.2f,%5.2f  \n\r", ADC_val_1, Volt_1, Weight_1);
   }
}
void Function4x()
{
   //  printf("4x function is executed!\n");
   spd4 = 41.6667*ext_cnt4x/Ts;
   output = PID_controller(cmd,spd4);
   OCR2 = output;
   ext_cnt2x = 0;
   ext_cnt4x = 0;
   capture_pulse = 0;
   printf("%d,",cmd);
   printf("%5.2f,", spd4);
   if(mode == 1)
   {
      ADC_val_0 = read_adc(0);
      Volt_0 = ADC_val_0*5/1023.0;
      Weight_0 = (Volt_0/0.05);
      printf("%d,%5.2f,%5.2f  \n\r", ADC_val_0, Volt_0, Weight_0);
   }
   else{
      ADC_val_1 = read_adc(1);
      Volt_1 = ADC_val_1*5/1023.0;
      Weight_1 = (Volt_1/0.05);
      printf("%d,%5.2f,%5.2f  \n\r", ADC_val_1, Volt_1, Weight_1);
   }
}
void Kp_function(int Kp_new)
{
    Kp = Kp_new;
   //  printf("Kp = %d\n", Kp);
}
void Ki_function(int Ki_new)
{
    Ki = Ki_new;
   //  printf("Ki = %d\n", Ki);
}
void Kd_function(int Kd_new)
{
    Kd = Kd_new;
   //  printf("Kd = %d\n", Kd);
}
void SetPoint(int Ref)
{
    cmd = Ref;
   //  printf("Ref is = %d\n", cmd);
}
void mode_function(int mode_number)
{
   mode = mode_number;
}