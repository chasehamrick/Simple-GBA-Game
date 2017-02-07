#include "myLib.h"

// Draws a simple rectangle
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

// A less efficient draw rect function that takes the bounds of the screen into consideration
void drawRectInBounds(int row, int col, int height, int width, unsigned short color)
{
	for(int r = 0; r < height; r++)
	{
		for(int c = 0; c < width; c++)
		{
			if(col + c > 0 && col + c < 240 && row + r > 0 && row + r < 160) // If the pixel is on the screen essentially
				setPixel(row+r, col+c, color);
		}
	}
}

// sets pixel a certain color
void setPixel(int row, int col, unsigned short color)
{
	VIDEO_BUFFER[OFFSET(row, col, 240)] = color;
}

// waits for end of row
void waitForVBlank()
{
	while(SCANLINECOUNTER>160);
	while(SCANLINECOUNTER<160);
}

// fills screen with a color
void fillScreen(unsigned short color)
{
	for (int p = 0; p < 38400; p++)
	{
		VIDEO_BUFFER[p] = color;
	}
}

// delays
void delay() {
    int i;
    volatile int b;
    for(i=0;i<30000;i++) {
        b++;
    }
}