class Particle
{
  PVector location;
  
  float color_value;
  color body_color;

  color[] color_history;
  int len;
  
  float[] x_history;
  float[] y_history;
  
  Particle(PVector l)
  {
    location = l.copy();
    color_value = random(255);
    body_color = color(color_value, 255, 255);
    len = 20;
    color_history = new color[len];
    x_history = new float[len];
    y_history = new float[len];
    for(int i = 0; i < len; i++)
    {
      color_history[i] = body_color;
      x_history[i] = 0;
      y_history[i] = 0;
    }
  }
  
  void update()
  {      
    for(int i = len - 1; i > 0; i--)
    {
      color_history[i] = color_history[i - 1];
      x_history[i] = x_history[i - 1];
      y_history[i] = y_history[i - 1];
    }
    
    color_value = (color_value + 3) % 255;
    body_color = color(color_value, 255, 255);
      
    color_history[0] = body_color;
    x_history[0] = x_history[0] + 4;
    y_history[0] = y_history[0] + 4;
  }
  
  void display()
  {
    fill(body_color);
    noStroke();
    
    int size = 40;
      
    for(int i = 0; i < len; i++)
    {
      pushMatrix();
      translate(location.x, location.y, location.z);
      rotateX(radians(x_history[i]));
      rotateY(radians(y_history[i]));
      
      if(i == 0)
      {
        noStroke();
        fill(color_history[i]);
        box(size);
      }else
      {
        stroke(color_history[i]);
        strokeWeight(1.5);
        noFill();
        box(size);
      }
      
      popMatrix();
      size += 25;
    }
  }
}