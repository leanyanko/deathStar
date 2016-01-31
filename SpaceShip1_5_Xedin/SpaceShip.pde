class SpaceShip
{
  float xShip1 = 0.0;
  float yShip1 = 0.0;
  float zShip1 = 0.0;

  float xShip2 = 0.0;
  float yShip2 = 0.0;
  float zShip2 = 100.0;

  PVector direction;

  float velocityZ = 0.0;
  float alphaY = 0.0;

  float rotateY[][];

  SpaceShip()
  {
    direction = new PVector(0, 0, 0);

    rotateY = new float[3][3];
  }

  void zTranslate()
  {
    direction = new PVector(xShip2 - xShip1, yShip2 - yShip1, zShip2 - zShip1);
    direction.normalize();   

    xShip1 += velocityZ * direction.x;
    yShip1 += velocityZ * direction.y;
    zShip1 += velocityZ * direction.z;

    xShip2 += velocityZ * direction.x;
    yShip2 += velocityZ * direction.y;
    zShip2 += velocityZ * direction.z;
  }

  void yRotate()
  {
    if (abs(alphaY) > 0.01)
    {
      rotateY[0][0] = cos(radians(alphaY));
      rotateY[0][1] = 0;
      rotateY[0][2] = sin(radians(alphaY));

      rotateY[1][0] = 0;
      rotateY[1][1] = 1;
      rotateY[1][2] = 0;

      rotateY[2][0] = -sin(radians(alphaY));
      rotateY[2][1] = 0;
      rotateY[2][2] = cos(radians(alphaY));

      /*
      xShip1 = rotateY[0][0] * xShip1 + rotateY[0][1] * yShip1 + rotateY[0][2] * zShip1;
       yShip1 = rotateY[1][0] * xShip1 + rotateY[1][1] * yShip1 + rotateY[1][2] * zShip1;
       zShip1 = rotateY[2][0] * xShip1 + rotateY[2][1] * yShip1 + rotateY[2][2] * zShip1;
       */

      xShip2 = xShip1 +  rotateY[0][0] * (xShip2 - xShip1) + rotateY[0][1] * (yShip2 - yShip1) + rotateY[0][2] * (zShip2 - zShip1);
      yShip2 = yShip1 + rotateY[1][0] * (xShip2 - xShip1) + rotateY[1][1] * (yShip2 - yShip1) + rotateY[1][2] * (zShip2 - zShip1);
      zShip2 = zShip1 + rotateY[2][0] * (xShip2 - xShip1) + rotateY[2][1] * (yShip2 - yShip1) + rotateY[2][2] * (zShip2 - zShip1);
    }
  }

  void draw()
  {
    camera(xShip1, yShip1, zShip1, xShip2, yShip2, zShip2, 0, 1, 0);

    //println("ALPHAY: " + alphaY);
  }

  void update()
  {
    if (key == CODED) 
    {
      if (keyCode == UP) 
      {
        velocityZ = 4.1;
      }

      if (keyCode == DOWN)
      {
        velocityZ = 0.0;
      }

      if (keyCode == LEFT)
      {
        alphaY = 0.1;
      }

      if (keyCode == RIGHT)
      {
        alphaY = -0.1;
      }
    }

    if (key == 'z')
    {
      alphaY = 0.0;
    }
  }
}