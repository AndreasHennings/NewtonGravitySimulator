class Particle
{
  float r; //radius
  float m; //mass
  
  PVector pos; //position
  PVector vel; //velocity
  PVector acc; //acceleration
  
  public Particle(float x, float y, float vx, float vy, float rad)
  {
    r=rad;
    m=r*r*PI; //mass depends on surface size
    pos=new PVector(x,y);
    vel=new PVector(vx,vy);
    acc=new PVector(0.0,0.0);    
  }
  
  void play(PVector force)
  {
    acc.add(force);
    vel.add(acc);
    colorMode(HSB);
    fill(vel.mag()*800,255,255);
    ellipse (pos.x, pos.y, r, r);
    pos.add(vel);  
    
    acc.mult(0);
  } 
  
  void displStars()
  {
    for (float disc = 2; disc < r*r; disc+=(disc*disc/100))
    {
      float col = map (disc,2,r,255,0);
      colorMode(RGB);
      fill (255, 255, 255, col-50);//0.0000002 *
      noStroke();
      ellipse (pos.x, pos.y, disc, disc);
    }
  }
}