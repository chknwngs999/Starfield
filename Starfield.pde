//toggle between random, bands, grids, spokes (rotating spokes?) PROBABLY NOT
//blooming flowers or fireworks?
//toggle same color in individual explosions or all random
//toggle speed
//really buggy after combining - fireworks are too big, random flowers cancelled

//your code here
Particle[] particle;
Flower[] flowers;
int reset = (int)(Math.random()*25)+25;
int resetcheck = 0;
int continualrotate = 0;
int xLoc = (int)(Math.random()*1001);
int yLoc = (int)(Math.random()*1001);
boolean uniformColors = true;
boolean flowerdraw = false;
color background = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 10);
void setup()
{
  size(1000, 1000);
  noStroke();
  particle = new Particle[100];
  flowers = new Flower[11];
  int xLoc = (int)(Math.random()*1001);
  int yLoc = (int)(Math.random()*1001);
  color thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  for (int i = 1; i < particle.length; i++) {
    particle[i] = new Particle(xLoc, yLoc, thisColor);
  }
  thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 10);
  particle[0] = new OddballParticle(xLoc, yLoc, thisColor);
  double angle = (Math.random()*361);    
  int sizing = (int)(Math.random()*20)+20;    
  flowers[0] = new Middle(0, 0, 7, angle);    
  for (int i = 1; i < flowers.length; i++) {      
    flowers[i] = new Flower(10, 10, 3, sizing, angle);
  }    
  xLoc = (int)(Math.random()*1001);    
  yLoc = (int)(Math.random()*1001);
}
void draw()
{
  fill(background);
  rect(0, 0, 1000, 1000);
  //your code here
  if (flowerdraw) {
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
    resetcheck++;  
    if (resetcheck == reset || (flowers[1].myX >= 700-xLoc || flowers[1].myX <= xLoc-700 || flowers[1].myY >= 700-yLoc || flowers[1].myY <= yLoc-700)) {    
      reset = (int)(Math.random()*25+20);    
      resetcheck = 0;        
      double angle = (Math.random()*361);    
      int sizing = (int)(Math.random()*20)+20;    
      flowers[0] = new Middle(0, 0, 7, angle);    
      for (int i = 1; i < flowers.length; i++) {      
        flowers[i] = new Flower(10, 10, 3, sizing, angle);
      }    
      xLoc = (int)(Math.random()*1001);    
      yLoc = (int)(Math.random()*1001);
    }
  } else {
    for (int i = 0; i < particle.length; i++) {
      particle[i].move();
      particle[i].show();
    }
  }
  resetcheck++;
  if (resetcheck > reset || (flowerdraw && (flowers[1].myX >= 1000-xLoc || flowers[1].myX <= xLoc-1000 || flowers[1].myY >= 1000-yLoc || flowers[1].myY <= yLoc-1000))) {
    resetcheck = 0;
    reset = (int)(Math.random()*25)+25;
    int xLoc = (int)(Math.random()*1001);
    int yLoc = (int)(Math.random()*1001);
    if (flowerdraw) {
      double angle = (Math.random()*361);    
      int sizing = (int)(Math.random()*20)+20;    
      flowers[0] = new Middle(0, 0, 7, angle);    
      for (int i = 1; i < flowers.length; i++) {      
        flowers[i] = new Flower(10, 10, 3, sizing, angle);
      }    
      xLoc = (int)(Math.random()*1001);    
      yLoc = (int)(Math.random()*1001);
    } else {
      color thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
      if (uniformColors) {
        for (int i = 1; i < particle.length; i++) {
          particle[i] = new Particle(xLoc, yLoc, thisColor);
        }
      } else {
        for (int i = 1; i < particle.length; i++) {
          particle[i] = new Particle(xLoc, yLoc, thisColor);
          thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
        }
      }
      thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 10);
      particle[0] = new OddballParticle(xLoc, yLoc, thisColor);
    }
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
  color myFill, myStroke;  
  Flower() {    
    myX = (int)(Math.random()*1001);    
    myY = (int)(Math.random()*1001);    
    mySpeed = (int)(Math.random()*10)+5;    
    myAngle = (Math.random()*361);    
    mySize = 40;    
    myFill = color(255, 192, 203);    
    myStroke = color(255, 182, 193);
  }  
  Flower(int X, int Y, int SPEED, int SIZE, double ANGLE) {    
    myX = X;    
    myY = Y;    
    mySpeed = SPEED;    
    myAngle = ANGLE;    
    mySize = SIZE;    
    myFill = color(255, 192, 203);    
    myStroke = color(255, 182, 193);
  }  
  void move() {    
    myX += mySpeed;    
    myY += mySpeed;    
    mySize += mySpeed;
  }  
  void show() {    
    fill(myFill);    
    stroke(myStroke);    
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
    myFill = color(255, 255, 51);    
    myStroke = color(240, 230, 140);
  }  
  void move() {     
    mySize += mySpeed;
  }  
  void show() {    
    fill(myFill);    
    stroke(myStroke);    
    ellipse(0, 0, mySize, mySize);
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (flowerdraw) {
      double angle = (Math.random()*361);    
      int sizing = (int)(Math.random()*20)+20;    
      flowers[0] = new Middle(0, 0, 7, angle);    
      for (int i = 1; i < flowers.length; i++) {      
        flowers[i] = new Flower(10, 10, 3, sizing, angle);
      }    
      xLoc = (int)(Math.random()*1001);    
      yLoc = (int)(Math.random()*1001);
    } else {
      int xLoc = (int)(Math.random()*1001);
      int yLoc = (int)(Math.random()*1001);
      color thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
      for (int i = 1; i < particle.length; i++) {
        particle[i] = new Particle(xLoc, yLoc, thisColor);
      }
      thisColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 10);
      particle[0] = new OddballParticle(xLoc, yLoc, thisColor);
    }
  } else if (mouseButton == RIGHT) {
    background = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 10);
  } else if (mouseButton == CENTER) {
    uniformColors = !uniformColors;
  }
}

void keyPressed() {
  if (keyCode == 32) {
    flowerdraw = !flowerdraw;
  }
}

/*void mouseWheel(MouseEvent event) { 
 float e = event.getCount();
 println(e);
 }*/
