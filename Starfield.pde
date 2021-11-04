Flower[] flowers = new Flower[11];
Particle[] particles = new Particle[150];

int fps = 30;
boolean todrawflowers = true;

int reset = (int)(Math.random()*25+20);
int resetcheck = 0;

int continualrotate = 0;
int xLoc = (int)(Math.random()*1001);
int yLoc = (int)(Math.random()*1001);

int trail = 10;
color newcolor;
color backgroundcolor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
boolean uniformcolors = true;

void setup() {  
  size(1000, 1000);  
  background(backgroundcolor);  
  xLoc = (int)(Math.random()*1001);  
  yLoc = (int)(Math.random()*1001);  
  double angle = (Math.random()*361);  
  int sizing = (int)(Math.random()*20)+20;  
  flowers[0] = new Middle(0, 0, 7, angle);
  newcolor = color(255, 182, 193);
  for (int i = 1; i < flowers.length; i++) {
    flowers[i] = new Flower(10, 10, 3, sizing, angle, newcolor);
  }  
  xLoc = (int)(Math.random()*1001);
  yLoc = (int)(Math.random()*1001);
  frameRate(fps);  
  //strokeWeight(3);
}

void draw() {  
  fill(backgroundcolor, trail);  
  rect(0, 0, 1000, 1000);  
  //background(150);  
  if (todrawflowers){
    translate(xLoc, yLoc);  
    rotate(radians(continualrotate));  
    for (int i = 0; i < flowers.length; i++) {    
      flowers[i].show();    
      flowers[i].move();    
      rotate(radians(36));
    }  
    continualrotate += 10;  
    xLoc += Math.cos(flowers[0].myAngle)*flowers[0].mySpeed;  
    yLoc += Math.sin(flowers[0].myAngle)*flowers[0].mySpeed;  
  } else {
    for (int i = 0; i < particles.length; i++) {
      particles[i].move();
      particles[i].show();
    }
  }
  resetcheck++;  
  if (resetcheck == reset || (flowers[1].myX >= 1000-xLoc || flowers[1].myX <= xLoc-1000 || flowers[1].myY >= 1000-yLoc || flowers[1].myY <= yLoc-1000)) {    
    reset = (int)(Math.random()*25+20);    
    resetcheck = 0;
    
    if (todrawflowers){
      double angle = (Math.random()*361);  
      int sizing = (int)(Math.random()*20)+20;  
      flowers[0] = new Middle(0, 0, 7, angle);
      if (uniformcolors)
        newcolor = color(255, 182, 193);
      else
        newcolor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
      for (int i = 1; i < flowers.length; i++) {    
        flowers[i] = new Flower(10, 10, 3, sizing, angle, newcolor);
      }  
      xLoc = (int)(Math.random()*1001);  
      yLoc = (int)(Math.random()*1001);
    } else {
      xLoc = (int)(Math.random()*1001);    
      yLoc = (int)(Math.random()*1001);
      color thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
      if (uniformcolors) {
        for (int i = 1; i < particles.length; i++) {
          particles[i] = new Particle(xLoc, yLoc, thisColor);
        }
      } else {
        for (int i = 1; i < particles.length; i++) {
          particles[i] = new Particle(xLoc, yLoc, thisColor);
          thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
        }
      }
      thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 10);
      particles[0] = new OddballParticle(xLoc, yLoc, thisColor);
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (todrawflowers){
      double angle = (Math.random()*361);  
      int sizing = (int)(Math.random()*20)+20;  
      flowers[0] = new Middle(0, 0, 7, angle);
      if (uniformcolors)
        newcolor = color(255, 182, 193);
      else
        newcolor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
      for (int i = 1; i < flowers.length; i++) {    
        flowers[i] = new Flower(10, 10, 3, sizing, angle, newcolor);
      }  
      xLoc = (int)(Math.random()*1001);  
      yLoc = (int)(Math.random()*1001);
    } else {
      xLoc = (int)(Math.random()*1001);    
      yLoc = (int)(Math.random()*1001);
      color thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
      if (uniformcolors) {
        for (int i = 1; i < particles.length; i++) {
          particles[i] = new Particle(xLoc, yLoc, thisColor);
        }
      } else {
        for (int i = 1; i < particles.length; i++) {
          particles[i] = new Particle(xLoc, yLoc, thisColor);
          thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
        }
      }
      thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 10);
      particles[0] = new OddballParticle(xLoc, yLoc, thisColor);
    }
  } else if (mouseButton == CENTER) {
    uniformcolors = !uniformcolors;
  } else if (mouseButton == RIGHT) {
    backgroundcolor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), trail);
  }
}

void keyPressed() {
  if (keyCode == 32) {
    backgroundcolor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), trail);
    todrawflowers = !todrawflowers;
    if (todrawflowers) {
      double angle = (Math.random()*361);  
      int sizing = (int)(Math.random()*20)+20;  
      flowers[0] = new Middle(0, 0, 7, angle);
      if (uniformcolors)
        newcolor = color(255, 182, 193);
      else
        newcolor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
      for (int i = 1; i < flowers.length; i++) {    
        flowers[i] = new Flower(10, 10, 3, sizing, angle, newcolor);
      }  
      xLoc = (int)(Math.random()*1001);  
      yLoc = (int)(Math.random()*1001);
    } else {
      xLoc = (int)(Math.random()*1001);    
      yLoc = (int)(Math.random()*1001);
      color thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
      if (uniformcolors) {
        for (int i = 1; i < particles.length; i++) {
          particles[i] = new Particle(xLoc, yLoc, thisColor);
        }
      } else {
        for (int i = 1; i < particles.length; i++) {
          particles[i] = new Particle(xLoc, yLoc, thisColor);
          thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
        }
      }
      thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 10);
      particles[0] = new OddballParticle(xLoc, yLoc, thisColor);
    }
  } else if (keyCode == 38) {
    trail++;
    if (trail > 100)
      trail = 100;
  } else if (keyCode == 40){
    trail--;
    if (trail < 0)
      trail = 0;
  } else if (keyCode == 37){
    fps--;
    if (fps < 1)
      fps = 1;
    frameRate(fps);
  } else if (keyCode == 39){
    fps++;
    if (fps > 100)
      fps = 100;
    frameRate(fps);
    System.out.println(fps);
  }
}

class Particle
{
  //your code here
  double myX, myY, myAngle, mySpeed;
  int mySize;
  color myColor;
  Particle() {
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
    noStroke();
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
    noStroke();
    ellipse((float)myX, (float)myY, mySize, mySize);
  }
}

class Flower {  
  int myX, myY, mySpeed, mySize;  
  double myAngle;  
  color myColor;  
  Flower() {    
    myX = (int)(Math.random()*1001);    
    myY = (int)(Math.random()*1001);    
    mySpeed = (int)(Math.random()*10)+5;    
    myAngle = (Math.random()*361);    
    mySize = 40;    
    myColor = color(255, 192, 203);
  }  
  Flower(int X, int Y, int SPEED, int SIZE, double ANGLE, color COLOR) {    
    myX = X;    
    myY = Y;    
    mySpeed = SPEED;    
    myAngle = ANGLE;    
    mySize = SIZE;
    myColor = COLOR;
  }
  void move() {    
    myX += mySpeed;    
    myY += mySpeed;    
    mySize += mySpeed;
  }  
  void show() {    
    fill(myColor);    
    stroke(myColor);    
    ellipse(myX, myY, mySize, mySize+10);
  }
}
class Middle extends Flower {  
  Middle(int X, int Y, int SPEED, double ANGLE) {    
    myX = X;    
    myY = Y;    
    mySize = 0;    
    mySpeed = SPEED;    
    myAngle = ANGLE;    
    myColor = color(255, 255, 51);
  }  
  void move() {     
    mySize += mySpeed;
  }  
  void show() {    
    fill(myColor);    
    stroke(myColor);    
    ellipse(0, 0, mySize, mySize);
  }
}
