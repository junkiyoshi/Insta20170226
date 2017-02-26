Particle particle;
float angle;

void setup()
{
  size(512, 512, P3D);
  frameRate(30);
  colorMode(HSB);
  rectMode(CENTER);
  
  particle = new Particle(new PVector(width / 2, height / 2, 0));
}

void draw()
{
  background(0);
   
  particle.update();
  particle.display();
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 900)
  {
     exit();
  }
  */
}