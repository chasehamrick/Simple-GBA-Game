//structures
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