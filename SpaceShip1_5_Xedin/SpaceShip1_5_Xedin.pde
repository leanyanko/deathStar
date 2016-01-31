SpaceShip spaceShip;

int state = 1;
/*
0 - hyperloop
 1 - spacedanger
 2 - loose
 3 - win 1/2
 4 - win full
 */

String c = " Hi ";
String s, m;

boolean cab =true;
PImage cabine;

int firstTime;
int secondTime;
int timeLeft;

Star star;
Star planet;
Star space;

void displayTime()
{
  secondTime %= 3600;

  m = str(secondTime / 60);
  s = str(secondTime % 60);

  if (secondTime < 10 * 60 )
    fill(150, 150, 0);
  if (secondTime < 6 * 60 )
    fill(200, 0, 0);

  if ( int(s) < 10)
    s = "0"+s;
  if (int(m) < 10)
    m = "0"+m;

  fill(255);
  
 // camera();
  text(m + ":" + s, width - width/6, height/10);
  
  if( int(m)==0&&int (s)==0)
  {
    if (dist(spaceShip.xShip2, spaceShip.yShip2, spaceShip.zShip2, star.x, star.y, star.z)>500&&dist(spaceShip.xShip2, spaceShip.yShip2, spaceShip.zShip2, planet.x, planet.y, planet.z)>2000)
    state = 3;
    else state =4;
  }
    
}

void starDanger()
{
  spaceShip.zTranslate();
  spaceShip.yRotate();
  spaceShip.update();
  spaceShip.draw();

  planet.draw();
  star.draw();
  space.draw();
  
  secondTime = 60 * 1 - (second() + 60 * minute() + 3600 * hour() - firstTime);  
    
  if (dist(spaceShip.xShip2, spaceShip.yShip2, spaceShip.zShip2, star.x, star.y, star.z)<100) 
    {
      state = 2;
   //   c = "Ship has burned. Very sad.";
   //   println(c);
    }
    println("DISTANCE: " + dist(spaceShip.xShip1, spaceShip.yShip1, spaceShip.zShip1, star.x, star.y, star.z));
    println("DISTANCE2: " + dist(spaceShip.xShip2, spaceShip.yShip2, spaceShip.zShip2, star.x, star.y, star.z));
    println("planet: " +dist(spaceShip.xShip2, spaceShip.yShip2, spaceShip.zShip2, planet.x, planet.y, planet.z));
}

void textMe()
{
 
  switch(state)
  {
   case 2:
   c = "Ship has burned. Very sad.";
   break;
  case 3:
    c = "You saved your ship";
    break;
   case 4:
    c = "You did it!";
    break;
  }
  //camera(0,0,0,0,0,2000,0,0.1,0);
  camera();
  
  textSize(32);
  text(c, (width-textWidth(c))/2, height/2);
  println(state);
  println(c);
  
}




void setup()
{
  size(800, 600, P3D);
  frameRate(30);  

  spaceShip = new SpaceShip();
  star = new Star("resources/sun_b.png", 0, 0, 2000, 450);
  planet = new Star("resources/planet.png", 0, 0, 4000, 450);
  space = new Star("resources/space7.jpg", 0, 0, 0, 2000);
  
  //cabine =loadImage("resources/cabine.png");
    
  //cabine.resize(0,height);
  
   firstTime = second() + 60 * minute() + 3600 * hour();
}

void draw()
{
  background(0);   
  //if (cab==false)
 // image(cabine,-width/3,0);

  if (state == 1)
    starDanger();
  else
    {
      textMe();
    }
    camera();
      displayTime();
}