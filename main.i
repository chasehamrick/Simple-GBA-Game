# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
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
# 3 "main.c" 2
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
# 4 "main.c" 2
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 1 3
# 10 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/ieeefp.h" 1 3
# 11 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 1 3
# 15 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/newlib.h" 1 3
# 16 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/config.h" 1 3



# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/ieeefp.h" 1 3
# 5 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/config.h" 2 3
# 17 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 2 3
# 12 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3



# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 211 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 323 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 16 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3

# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 1 3
# 13 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/_ansi.h" 1 3
# 14 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 1 3
# 12 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_types.h" 1 3






# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 1 3
# 26 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t ;
typedef unsigned char __uint8_t ;
# 36 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed short __int16_t;
typedef unsigned short __uint16_t;
# 46 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
# 58 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
# 76 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
# 99 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_default_types.h" 3
typedef signed long long __int64_t;
typedef unsigned long long __uint64_t;
# 8 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/_types.h" 2 3
# 13 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/lock.h" 1 3





typedef int _LOCK_T;
typedef int _LOCK_RECURSIVE_T;
# 14 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 2 3


typedef long _off_t;







typedef int __dev_t;




typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



__extension__ typedef long long _off64_t;







typedef long _fpos_t;
# 56 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 3
typedef int _ssize_t;






# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 1 3 4
# 352 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 64 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;
# 15 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 37 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _reent;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 89 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 105 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 169 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (* _read) (struct _reent *, void *, char *, int)
                     ;
  int (* _write) (struct _reent *, void *, const char *, int)
                            ;
  _fpos_t (* _seek) (struct _reent *, void *, _fpos_t, int);
  int (* _close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  int _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 273 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 305 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 579 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void (* __cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;


  struct _atexit *_atexit;
  struct _atexit _atexit0;


  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 817 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);
# 18 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3
# 1 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/machine/stdlib.h" 1 3
# 19 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 2 3
# 27 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;
# 58 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
extern int __mb_cur_max;



void abort (void) __attribute__ ((noreturn));
int abs (int);
int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, int (* _compar) (const void *, const void *))



                                                         ;
void * calloc (size_t __nmemb, size_t __size) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((noreturn));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);
long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void * malloc (size_t __size) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *, const char *, size_t);
int _mbtowc_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *, const char *, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
size_t wcstombs (char *, const wchar_t *, size_t);
size_t _wcstombs_r (struct _reent *, char *, const wchar_t *, size_t, _mbstate_t *);
# 111 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
void qsort (void * __base, size_t __nmemb, size_t __size, int(*_compar)(const void *, const void *));
int rand (void);
void * realloc (void * __r, size_t __size) ;



void srand (unsigned __seed);
double strtod (const char *__n, char **__end_PTR);
double _strtod_r (struct _reent *,const char *__n, char **__end_PTR);
float strtof (const char *__n, char **__end_PTR);






long strtol (const char *__n, char **__end_PTR, int __base);
long _strtol_r (struct _reent *,const char *__n, char **__end_PTR, int __base);
unsigned long strtoul (const char *__n, char **__end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *__n, char **__end_PTR, int __base);

int system (const char *__string);
# 198 "c:\\devkitarm\\bin\\../lib/gcc/arm-eabi/4.5.0/../../../../arm-eabi/include/stdlib.h" 3
char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);



extern long double strtold (const char *, char **);
extern long double wcstold (const wchar_t *, wchar_t **);



# 5 "main.c" 2







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


PLAYER player;


ENEMY enemies[15];
int enemyCount;
int timeToNextEnemy;


BULLET bullets[10];
int numberOfBullets;
int maxBullets = 10;


int time;
int j = 0;


int main()
{
 *(unsigned short *)0x4000000 = 3 | (1<<10);
 initialize();
 int j = 0;

 goToSplash();

 while(1)
 {


  oldButtons = buttons;
  buttons = (*(volatile unsigned int *)0x04000130);

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


 fillScreen(((0) | (0)<<5 | (31)<<10));

 state = SPLASH;
}

void updateSplash()
{
 if ((!(~oldButtons&(1))&&(~buttons&(1))))
 {
  initialize();
  goToGame();
 }
}

void goToGame()
{
 fillScreen(0);
 state = GAME;
}

void updateGame()
{

 if(!(player.dead))
 {
  update();
  waitForVBlank();
  draw();


  if ((!(~oldButtons&(4))&&(~buttons&(4))))
  {
   goToSplash();
  }
  if ((!(~oldButtons&(8))&&(~buttons&(8))))
  {
   goToPause();
  }
 }


 if(player.dead)
    {
     goToLose();
    }
}

void goToPause()
{
 fillScreen(((29) | (29)<<5 | (29)<<10));
 state = PAUSE;
}

void updatePause()
{
 if ((!(~oldButtons&(8))&&(~buttons&(8))))
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


void initialize()
{

 fillScreen(0);


 drawStars(5,10 );
 drawStars(20,5 );
 drawStars(15,35 );
 drawStars(32,33 );
    drawStars(30,50 );
    drawStars(30,70 );
    drawStars(50,90 );
    drawStars(80,76 );
    drawStars(120,74 );
    drawStars(104,76 );
    drawStars(96,100 );

 numberOfBullets = 0;


 player.oldRow = 0;
 player.oldCol = 0;
 player.width = 5;
 player.height = 5;
 player.row = 160 - player.height;
 player.col = 240/2 - player.width/2;
 player.color = ((0) | (31)<<5 | (31)<<10);
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
 enemy.color = ((31) | (0)<<5 | (0)<<10);
 enemyCount = (sizeof(enemies)/sizeof(enemies[0]));

 BULLET bullet;
 bullet.width = 3;
 bullet.height = 3;
 bullet.rd = 10;
 bullet.cd = 0;
 bullet.color = player.color;


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


    updatePlayer(&player);

    makeStarBG(++j);


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


 for(int i = 0; i < maxBullets; i++)
 {
  updateBullet(&bullets[i]);
 }


    if ((!(~oldButtons&(2))&&(~buttons&(2))))
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


void collisionCheckEnemyPlayer(ENEMY* e, PLAYER* p)
{
 if(e->col <= p->col + p->width && e->col + e->width >= p->col && e->row + e->height >= p->row)
 {
  p->dead = 1;
 }
}


void collisionCheckEnemyBullet(ENEMY* e, BULLET* b)
{
 if(e->col <= b->col + b->width && e->col + e->width >= b->col && e->row + e->height >= b->row)
 {
  drawRect(e->oldRow, e->oldCol, e->height, e->width, 0);
  e->active = 0;
 }
}


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


void makeStarBG(int i)
{
    drawStars(i,i+20 );
    drawStars(i+10,i+15);
    drawStars(i+30,i+46);
    drawStars(i+45,i+93);
    drawStars(i+66,i+80);
    drawStars(i+2,i+3 );
    drawStars(i,i+20 );
    drawStars(i,i+40 );
    drawStars(i+20,i+60);
    drawStars(i+50,i+46);
    drawStars(i+90,i+44);
    drawStars(i+74,i+36);
    drawStars(i+66,i+70);
}


void drawStars(int x, int y)
{
    setPixel(x,y,((29) | (29)<<5 | (29)<<10));
    setPixel(x-1,y-1,0);

    setPixel((x-40)*3,(y-14)*3,((29) | (29)<<5 | (29)<<10));
    setPixel((x-41)*3,(y-15)*3,0);
}
