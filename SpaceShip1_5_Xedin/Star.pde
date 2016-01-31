class Star
{
  PShape globe;
  PImage texmap;

  int sDetail = 35;  // Sphere detail setting
  float rotationX = 0;
  float rotationY = 0;
  float velocityX = 0;
  float velocityY = 0;
  float globeRadius = 450;

  int x;
  int y;
  int z;

  Star(String path, int X, int Y, int Z, float radius)
  {
    x = X;
    y = Y;
    z = Z;
    
    globeRadius = radius;

    sphereDetail(sDetail);

    texmap = loadImage(path);

    globe = createShape(SPHERE, globeRadius);

    globe.setStroke(false);
    globe.setTexture(texmap);
  }

  void draw()
  {
    renderGlobe();
  }

  void renderGlobe() 
  {
    pushMatrix();    
    translate(x, y, z);

    lights();   
    noStroke();
    //rotateX(radians(-rotationX));  
    //rotateY(radians(-rotationY));
    shape(globe);

    rotationX += velocityX;
    rotationY += velocityY;
    velocityX *= 0.95;
    velocityY *= 0.95;

    popMatrix();
  }
}