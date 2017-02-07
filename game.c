#include "main.h"
#include "myLib.h"
#include "game.h"

// move player with left and right key
void updatePlayer(PLAYER* p)
{
	p->oldRow = p->row;
	p->oldCol = p->col;

	if(BUTTON_HELD(BUTTON_RIGHT)) {
		if (p -> col < 240 - p -> width) {
			p->col++;
		}
	}
	if(BUTTON_HELD(BUTTON_LEFT)) {
		if (p -> col > 0 + p -> width) {
			p->col--;
		}
	}
}

// move enemy if its active
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

// move bullet if its active
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

// draw a rect of the player and make old position black
void drawPlayer(PLAYER* p)
{
	drawRect(p->oldRow, p->oldCol, p->height, p->width, BLACK);
	drawRect(p->row, p->col, p->height, p->width, p->color);
}

// draw a rect for a bullet and make old position black
void drawBullet(BULLET* b)
{
	drawRect(b->oldRow, b->oldCol, b->height, b->width, BLACK);
	drawRect(b->row, b->col, b->height, b->width, b->color);
}

// draw a rect for an enemy and make old position black
void drawEnemy(ENEMY* e)
{
	if(e->active) {
		drawRectInBounds(e->oldRow, e->oldCol, e->height, e->width, BLACK);
		drawRectInBounds(e->row, e->col, e->height, e->width, e->color);
	}
}