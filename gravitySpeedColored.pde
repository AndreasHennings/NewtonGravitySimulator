ArrayList<Particle> psys=new ArrayList();
ArrayList<Particle> myPs=new ArrayList();
int x, y;

void setup()
{
  fullScreen();
  background(0);
  initStars();
  x=0;
  y=0;
}

void draw()
{
  for (Particle p : psys)
  {       
    for (Particle myP : myPs)
    {     
      PVector dist = PVector.sub(p.pos,myP.pos);
      float dis = dist.mag();
      if (dis != 0.0)
      {
        float force = 0.000000005 * (p.m * myP.m) / dis;
        dist.normalize();
        dist.mult(force);
        myP.play(dist); 
      }
    }
  }
}

void mousePressed()
{
  Particle nuP = new Particle (mouseX, mouseY, 0,0,3);
  myPs.add(nuP);  
}

void keyPressed()
{
  if (key == 'd') {x+=10;}
}

void initStars()
{
  for (int i=0; i<20; i++)
  {
    Particle p= new Particle(random(width),random(height),0.0,0.0,random(700));
    p.displStars();
    psys.add(p);
  }    
}