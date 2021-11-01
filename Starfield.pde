//toggle between random, bands, grids, spokes (rotating spokes?)
//use/practice encapsulation (data hiding + getters/setters)
//blooming flowers or fireworks?
//toggle same color in individual explosions or all random
//toggle speed
//overload constructor - color

//your code here
Particle[] particle;
int reset = (int)(Math.random()*25)+25;
int resetcheck = 0;
boolean uniformColors = true;
color background = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 10);
void setup()
{
  size(1000, 1000);
  noStroke();
  particle = new Particle[100];
  int xLoc = (int)(Math.random()*1001);
  int yLoc = (int)(Math.random()*1001);
  color thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  for (int i = 1; i < particle.length; i++){
    particle[i] = new Particle(xLoc, yLoc, thisColor);
  }
    thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 10);
  particle[0] = new OddballParticle(xLoc, yLoc, thisColor);
}
void draw()
{
  fill(background);
  rect(0, 0, 1000, 1000);
  //your code here
  for (int i = 0; i < particle.length; i++){
    particle[i].move();
    particle[i].show();
  }
  resetcheck++;
  if (resetcheck > reset){
    resetcheck = 0;
    reset = (int)(Math.random()*25)+25;
    int xLoc = (int)(Math.random()*1001);
    int yLoc = (int)(Math.random()*1001);
    color thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    if (uniformColors){
      for (int i = 1; i < particle.length; i++){
        particle[i] = new Particle(xLoc, yLoc, thisColor);
      }
    } else {
      for (int i = 1; i < particle.length; i++){
        particle[i] = new Particle(xLoc, yLoc, thisColor);
        thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
      }
    }
    thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 10);
    particle[0] = new OddballParticle(xLoc, yLoc, thisColor);
  }
}
class Particle
{
  //your code here
  double myX, myY, myAngle, mySpeed;
  int mySize;
  color myColor;
  Particle(){
    
  }
  Particle (double X, double Y, color COLOR) {
    myX = X;
    myY = Y;
    myColor = COLOR;
    myAngle = (Math.random()*361);
    mySpeed = (int)(Math.random()*10+5);
    mySize = (int)(Math.random()*15+10);
  }
  
  void move() {
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
  }
  void show() {
    fill(myColor);
    ellipse((float)myX, (float)myY, mySize, mySize);
  }
}

class OddballParticle extends Particle //inherits from Particle
{
  OddballParticle (double X, double Y, color COLOR)
  {
    myX = X;
    myY = Y;
    myColor = COLOR;
    myAngle = (Math.random()*361);
    mySpeed = (int)(Math.random()*15)+10;
    mySize = (int)(Math.random()*15+10);
  }
  void move() {
    mySize += mySpeed;
    mySize += mySpeed;
  }
  void show() {
    fill(myColor);
    ellipse((float)myX, (float)myY, mySize, mySize);
  }
}

void mousePressed() {
  if (mouseButton == LEFT){
    int xLoc = (int)(Math.random()*1001);
    int yLoc = (int)(Math.random()*1001);
    color thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    for (int i = 1; i < particle.length; i++){
      particle[i] = new Particle(xLoc, yLoc, thisColor);
    }
    thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 10);
    particle[0] = new OddballParticle(xLoc, yLoc, thisColor);
  } else if (mouseButton == RIGHT){
    background = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 10);
  } else if (mouseButton == CENTER){
    uniformColors = !uniformColors;
  }
}

void mouseWheel(MouseEvent event) { 
  float e = event.getCount();
  println(e);
}
