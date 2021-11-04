//toggle colors onclick
//toggle location?
//toggle trail?
//toggle framerate
class Flower {  
  int myX, myY, mySpeed, mySize;  
  double myAngle;  
  color myFill, myStroke;  
  Flower() {    
    myX = (int)(Math.random()*701);    
    myY = (int)(Math.random()*701);    
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
Flower[] flowers = new Flower[11];
int continualrotate = 0;
int reset = (int)(Math.random()*25+20);
int resetcheck = 0;
int xLoc = (int)(Math.random()*701);
int yLoc = (int)(Math.random()*701);
void setup() {  
  size(700, 700);  
  background(0, 255, 0);  
  xLoc = (int)(Math.random()*701);  
  yLoc = (int)(Math.random()*701);  
  double angle = (Math.random()*361);  
  int sizing = (int)(Math.random()*20)+20;  
  flowers[0] = new Middle(0, 0, 7, angle);  
  for (int i = 1; i < flowers.length; i++) {    
    flowers[i] = new Flower(10, 10, 3, sizing, angle);
  }  
  xLoc = width/2;  
  yLoc = height/2;  
  frameRate(30);  
  strokeWeight(3);
}
void draw() {  
  fill(0, 255, 0, 30);  
  rect(0, 0, 700, 700);  
  //background(150);  
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
    xLoc = (int)(Math.random()*701);    
    yLoc = (int)(Math.random()*701);
  }
}
void mousePressed() {  
  double angle = (Math.random()*361);  
  int sizing = (int)(Math.random()*20)+20;  
  flowers[0] = new Middle(0, 0, 7, angle);  
  for (int i = 1; i < flowers.length; i++) {    
    flowers[i] = new Flower(10, 10, 3, sizing, angle);
  }  
  xLoc = (int)(Math.random()*701);  
  yLoc = (int)(Math.random()*701);
}
