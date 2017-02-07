# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 27 "myLib.h"
extern unsigned short *videoBuffer;
# 51 "myLib.h"
void setPixel(int, int, unsigned short);
void drawRect(int row, int col, int height, int width, volatile unsigned short color);
void drawRectInBounds(int row, int col, int height, int width, volatile unsigned short color);
void waitForVblank();
void fillScreen(unsigned short);
void delay();
# 2 "myLib.c" 2


void drawRect(int row, int col, int height, int width, unsigned short color)
{
 for(int r = 0; r < height; r++)
 {
  for(int c = 0; c < width; c++)
  {
   setPixel(row+r, col+c, color);
  }
 }
}


void drawRectInBounds(int row, int col, int height, int width, unsigned short color)
{
 for(int r = 0; r < height; r++)
 {
  for(int c = 0; c < width; c++)
  {
   if(col + c > 0 && col + c < 240 && row + r > 0 && row + r < 160)
    setPixel(row+r, col+c, color);
  }
 }
}


void setPixel(int row, int col, unsigned short color)
{
 ((unsigned short *)0x6000000)[((row)*(240)+(col))] = color;
}


void waitForVBlank()
{
 while((*(volatile unsigned short *)0x4000006)>160);
 while((*(volatile unsigned short *)0x4000006)<160);
}


void fillScreen(unsigned short color)
{
 for (int p = 0; p < 38400; p++)
 {
  ((unsigned short *)0x6000000)[p] = color;
 }
}


void delay() {
    int i;
    volatile int b;
    for(i=0;i<30000;i++) {
        b++;
    }
}
