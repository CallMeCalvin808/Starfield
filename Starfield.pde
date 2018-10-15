//global particle array
Particle[] particles;
//int to track time
int timer = 0;

void setup() {
  size(500, 500);

	particles = new Particle [2000];
  
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new NormalParticle(250, 250);
  }
  
  particles[0] = new OddballParticle(250, 250);
  
  for (int j = 1; j <= particles.length / 2; j++){
    particles[j] = new JumboParticle(250, 250);
  }
}

void draw() {
  background (255);
  
  if(timer <= 200){
  	for (int i = 0; i < particles.length; i++) {
      particles[i].show();
      particles[i].move();
    }
  }
  
  if(timer > 200) {
     for (int i = 0; i < particles.length; i++) {
      particles[i].collapse();
      particles[i].show();
    }
  }
  
  timer++;
}

void mousePressed() {
  timer = 0;
  
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new NormalParticle(mouseX, mouseY);
  }
  particles[0] = new OddballParticle(mouseX, mouseY);
  
  for (int j = 1; j <= particles.length / 2; j++){
    particles[j] = new JumboParticle(mouseX, mouseY);
  }
}

class NormalParticle implements Particle {
	double myX, myY, myVelocity, myAngle;

  NormalParticle (double x, double y) {
    myVelocity = (Math.random() * 5) + 1;
    myAngle = Math.random() * (2 * Math.PI);
    myX = x;
    myY = y;
  }
  
  NormalParticle () {
    myVelocity = (Math.random() * 5) + 1;
    myAngle = Math.random() * (2 * Math.PI);
    myX = 250;
    myY = 250;
  }
  
  public void move() {
    myX = myX + (Math.cos(myAngle) * myVelocity);
    myY = myY + (Math.sin(myAngle) * myVelocity);
  }
  
  public void show() {
     fill(0);
     ellipse((float)myX, (float)myY, 10, 10);
  }
  
  public void collapse() {
    myX = myX - (Math.cos(myAngle) * myVelocity);
    myY = myY - (Math.sin(myAngle) * myVelocity);
  }
}
interface Particle {
	public void show();
  public void move();
  public void collapse();
}
class OddballParticle implements Particle {
	double myX, myY, myXVelocity, myYVelocity;
  double xMin, xMax, yMin, yMax;
  
  OddballParticle(double x, double y){
    myX = x - 50;
    myY = y;
    myXVelocity = myYVelocity =  -1;
    
    xMin = x - 50;
    xMax = x + 50;
    yMin = y - 50;
    yMax = y + 50;
  }
  
  public void move() {
    if (myX == xMin) 
      myXVelocity = 1;
      
    else if (myX == xMax) 
      myXVelocity = -1;
      
    if (myY == yMin) 
      myYVelocity = 1;
      
    else if (myY == yMax) 
      myYVelocity = -1;
      
    myX = myX + myXVelocity;
    myY = myY + myYVelocity;
  }
  
  public void show(){
    stroke(0);
    fill(255);
    ellipse((float)myX, (float)myY, 15, 15);
  }
  
  public void collapse(){
    if (myX == xMin) 
      myXVelocity = 1;
      
    else if (myX == xMax) 
      myXVelocity = -1;
      
    if (myY == yMin) 
      myYVelocity = 1;
      
    else if (myY == yMax) 
      myYVelocity = -1;
      
    myX = myX + myXVelocity;
    myY = myY + myYVelocity;
  }
}
class JumboParticle extends NormalParticle{
  JumboParticle(double x, double y){
    myX = x;
    myY = y;
  }
  
	public void show(){
    noStroke();
    fill(50);
    ellipse((float)myX, (float)myY, 20, 20);
  }
}
