#include "myLib.h"
#include "main.h"
#include "game.h"
#include <stdlib.h>

/* Game Specific Macros */
#define BORDER_HEIGHT 20
#define SCREEN_HEIGHT 160
#define SCREEN_WIDTH 240

/* Prototypes */
void update();
void initialize();
void draw();
void collisionCheckEnemyPlayer(ENEMY* e, PLAYER* p);
void collisionCheckEnemyBullet(ENEMY* e, BULLET* b);
void updateStars(int);
void drawStars(int,int);

unsigned int buttons, oldButtons;

enum {SPLASH, GAME, PAUSE, LOSE};
int state;

/* Player */
PLAYER player;

/* Enemies */
ENEMY enemies[15];
int enemyCount;
int timeToNextEnemy;

/* Bullets */
BULLET bullets[10];
int numberOfBullets;
int maxBullets = 10;

/* Game */
int time;
int j = 0;


int main()
{
	REG_DISPCTL = MODE3 | BG2_ENABLE;
	initialize();
	int j = 0;

	goToSplash();

	while(1)
	{
		// make sure buttonPressed works

		oldButtons = buttons;
		buttons = BUTTONS;

		switch(state)
		{
			case SPLASH:
				updateSplash();
				break;
			case GAME:
				updateGame();
				break;
			case PAUSE:
				updatePause();
				break;
			case LOSE:
				updateLose();
				break;
		}
		
	}
}

void goToSplash()
{
	// update splash runs every single frame, don't want to draw splash screen every frame, just draw once and leave it there
	// waste of time, dont put text in update state
	fillScreen(BLUE);

	state = SPLASH;
}

void updateSplash()
{
	if (BUTTON_PRESSED(BUTTON_A))
	{
		initialize();
		goToGame();
	}
}

void goToGame()
{
	fillScreen(BLACK);
	state = GAME;
}

void updateGame()
{
	// checking if player is dead and if not running game
	if(!(player.dead))
	{
		update();
		waitForVBlank();
		draw();

		// want after draw , because draw happens nonetheless, dont want to go to splash screen and have game drawn on top of it, want splash drawn on top of game
		if (BUTTON_PRESSED(BUTTON_SELECT))
		{
			goToSplash();
		}
		if (BUTTON_PRESSED(BUTTON_START))
		{
			goToPause();
		}
	}

	//if player died restart game over
	if(player.dead)
    {
    	goToLose();
    }
}

void goToPause()
{
	fillScreen(LIGHTGRAY);
	state = PAUSE;
}

void updatePause()
{
	if (BUTTON_PRESSED(BUTTON_START))
	{
		goToGame();
	}

}

void goToLose()
{
	state = LOSE;
}

void updateLose()
{
	initialize();
	goToGame();
}

//initialize start of game
void initialize()
{
	//initial screen clear
	fillScreen(BLACK);

	//draw some stationary stars in background
	drawStars(5,10    );
	drawStars(20,5    );
	drawStars(15,35   );
	drawStars(32,33   );
    drawStars(30,50   );
    drawStars(30,70   );
    drawStars(50,90   );
    drawStars(80,76   );
    drawStars(120,74  );
    drawStars(104,76  );
    drawStars(96,100  );

	numberOfBullets = 0;

	//initialize player, enemies, and bullets
	player.oldRow = 0;
	player.oldCol = 0;
	player.width = 5;
	player.height = 5;
	player.row = SCREEN_HEIGHT - player.height;
	player.col = SCREEN_WIDTH/2 - player.width/2;
	player.color = CYAN;
	player.dead = 0;

	ENEMY enemy;
	enemy.row = 0;
	enemy.col = 0;
	enemy.oldRow = 0;
	enemy.oldCol = 0;
	enemy.height = 6;
	enemy.width = 6;
	enemy.rd = 20;
	enemy.cd = 0;
	enemy.active = 0;
	enemy.color = RED;
	enemyCount = (sizeof(enemies)/sizeof(enemies[0]));

	BULLET bullet;
	bullet.width = 3;
	bullet.height = 3;
	bullet.rd = 10;
	bullet.cd = 0;
	bullet.color = player.color;

	//Setting up all enemies and max bullets
	for(int i = 0; i < enemyCount; i++)
	{
		enemies[i] = enemy;
	}

	for(int i = 0; i < maxBullets; i++)
	{
		bullets[i] = bullet;
	}

	time = 0;
}

void update()
{
	//if right time spawn enemy
	if(!(++time % timeToNextEnemy))
   	{
   		for(int i = 0; i < enemyCount; i++)
   		{
   			ENEMY * e = &enemies[i];
   			if(!e->active)
   			{
   				e->active = 1;
   				e->row = -e->height;
   				e->col = rand()%240;
   				e -> col = rand()%(240);
   				e -> width = rand()%5 + 5;
   				e -> height = rand()%5 + 5;
   				e -> rd = (rand() & 1) + 1;

   				timeToNextEnemy = rand()%75;
    			break;
   			}
   		}
   	}

   	// update player
   	updatePlayer(&player);

   	makeStarBG(++j);

   	// call update enemies, check if collision with player, then check if collision with bullets
	for(int i = 0; i < enemyCount; i++)
	{
		updateEnemy(&enemies[i]);
		collisionCheckEnemyPlayer(&enemies[i], &player);
		for (int j = 0; j < maxBullets; j++)
		{
			if (&bullets[j].active)
			{
				collisionCheckEnemyBullet(&enemies[i], &bullets[j]);
			}
		}
	}

	// update bullets (if active)
	for(int i = 0; i < maxBullets; i++)
	{
		updateBullet(&bullets[i]);
	}

	// if enter pressed spawn bullet where player is and make active while increasing numberOfBullets
   	if (BUTTON_PRESSED(BUTTON_B)) 
   	{
		if (++numberOfBullets < maxBullets) {
			BULLET * b = &bullets[numberOfBullets];
			b->row = player.row + 1;
			b->col = player.col + 2;
			b->active = !(b->active);
		}
	}

	if (j == 100)
	{
		j = 0;
	}
}

// checks if enemy collides with player, if so makes player dead
void collisionCheckEnemyPlayer(ENEMY* e, PLAYER* p)
{
	if(e->col <= p->col + p->width && e->col + e->width >= p->col && e->row + e->height >= p->row)
	{
		p->dead = 1;
	}
}

// checks if enemy collides with bullet, if so replaces rectangle of enemy with black and makes that enemy inactive
void collisionCheckEnemyBullet(ENEMY* e, BULLET* b)
{
	if(e->col <= b->col + b->width && e->col + e->width >= b->col && e->row + e->height >= b->row)
	{
		drawRect(e->oldRow, e->oldCol, e->height, e->width, BLACK);
		e->active = 0;
	}
}

// draws player, all active enemies, and all active bullets
void draw()
{
	drawPlayer(&player);

	for(int i = 0; i < enemyCount; i++)
	{
		ENEMY * e = &enemies[i];
		if (e->active)
		{
			drawEnemy(e);
		}
		//drawEnemy(e);
	}

	for(int i = 0; i < maxBullets; i++)
	{
		BULLET * b = &bullets[i];
		if (b->active)
		{
			drawBullet(b);
		}
	}
}

// creates Star Background
void makeStarBG(int i)
{
    drawStars(i,i+20   );
    drawStars(i+10,i+15);
    drawStars(i+30,i+46);
    drawStars(i+45,i+93);
    drawStars(i+66,i+80);
    drawStars(i+2,i+3  );
    drawStars(i,i+20   );
    drawStars(i,i+40   );
    drawStars(i+20,i+60);
    drawStars(i+50,i+46);
    drawStars(i+90,i+44);
    drawStars(i+74,i+36);
    drawStars(i+66,i+70);
}

// draws stars
void drawStars(int x, int y)
{
    setPixel(x,y,LIGHTGRAY);
    setPixel(x-1,y-1,BLACK);

    setPixel((x-40)*3,(y-14)*3,LIGHTGRAY);
    setPixel((x-41)*3,(y-15)*3,BLACK);
}
