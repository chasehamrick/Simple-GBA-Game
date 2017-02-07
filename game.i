# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "main.h" 1

typedef struct
{
 int row;
 int col;
 int oldRow;
 int oldCol;
 int width;
 int height;
 unsigned short color;
 char dead;
} PLAYER;

typedef struct
{
 int row;
 int col;
 int oldRow;
 int oldCol;
 int height;
 int width;
 int rd;
 int cd;
 int active;
 unsigned short color;
} ENEMY;

typedef struct {
 int row;
 int col;
 int oldRow;
 int oldCol;
 int height;
 int width;
 int rd;
 int cd;
 int active;
 unsigned short color;
} BULLET;
# 2 "game.c" 2
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
# 3 "game.c" 2
# 1 "game.h" 1

void updatePlayer(PLAYER*);
void updateEnemy(ENEMY*);
void updateBullet(BULLET*);
void drawPlayer(PLAYER*);
void drawEnemy(ENEMY*);
void drawBullet(BULLET*);
void goToSplash();
void goToGame();
void goToPause();
void goToLose();
void updateSplash();
void updateGame();
void updatePause();
void updateLose();
# 4 "game.c" 2


void updatePlayer(PLAYER* p)
{
 p->oldRow = p->row;
 p->oldCol = p->col;

 if((~((*(volatile unsigned int *)0x04000130)) & 16)) {
  if (p -> col < 240 - p -> width) {
   p->col++;
  }
 }
 if((~((*(volatile unsigned int *)0x04000130)) & 32)) {
  if (p -> col > 0 + p -> width) {
   p->col--;
  }
 }
}


void updateEnemy(ENEMY* e)
{
 e->oldRow = e->row;
 e->oldCol = e->col;


 if(e->active)
 {
  e -> row += e -> rd;

  if(e->row > 161)
  {
   e -> active = !(e -> active);
   e -> row = -(e -> height);

  }
 }
}


void updateBullet(BULLET* b)
{
 b->oldRow = b->row;
 b->oldCol = b->col;

 if(b->active)
 {
  b->row -= b->rd;

  if(b->row < - 10)
  {
   b->active = !(b->active);
  }
 }

}


void drawPlayer(PLAYER* p)
{
 drawRect(p->oldRow, p->oldCol, p->height, p->width, 0);
 drawRect(p->row, p->col, p->height, p->width, p->color);
}


void drawBullet(BULLET* b)
{
 drawRect(b->oldRow, b->oldCol, b->height, b->width, 0);
 drawRect(b->row, b->col, b->height, b->width, b->color);
}


void drawEnemy(ENEMY* e)
{
 if(e->active) {
  drawRectInBounds(e->oldRow, e->oldCol, e->height, e->width, 0);
  drawRectInBounds(e->row, e->col, e->height, e->width, e->color);
 }
}
