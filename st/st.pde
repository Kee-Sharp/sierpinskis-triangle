int v1x=10;
float v1y=50*sqrt(3)+10;
int v2x=60;
int v2y=10;
int v3x=110;
float v3y=50*sqrt(3)+10;
float dotx=250;
float doty=250;
int r;
int diameter=4;
int count=0;
int tps;
int speed;
boolean playing=true;
boolean slow=true;
boolean medium=false;
boolean fast=false;
void setup() {
  size(770, 670);
  background(255);
}
void draw() {
  noStroke();
  if (slow) {
    tps=1;
  } else if (medium) {
    tps=5;
  } else if (fast) {
    tps=60;
  }
  speed=60/tps;
  if (playing) {
    r=int(random(3));
    if (count%speed==0) {
      float vx;
      float vy;
      if (r==0) {
        vx=v1x;
        vy=v1y;
        fill(255, 0, 0);
      } else if (r==1) {
        vx=v2x;
        vy=v2y;
        fill(0, 255, 0);
      } else {
        vx=v3x;
        vy=v3y;
        fill(0, 0, 255);
      }
      dotx=dotx-(dotx-vx)/2;
      doty=doty-(doty-vy)/2;
      if (count>120) {
          ellipse(dotx, doty, diameter, diameter);
        }
    }
    fill(0);
     ellipse(v1x, v1y, 10, 10);
     ellipse(v2x, v2y, 10, 10);
     ellipse(v3x, v3y, 10, 10);
    noFill();
    count+=1;
  }
}

void keyPressed() {  
    if (key=='p') {
      playing=!playing;
    }
    if (key=='a') {
      slow=true;
      medium=false;
      fast=false;
    }
    if (key=='s') {
      slow=false;
      medium=true;
      fast=false;
    }
    if (key=='d') {
      slow=false;
      medium=false;
      fast=true;
    }
    if (key=='r') {
      background(255);
    }
    if (key>=49 && key<=57){
      diameter=key-48;
      background(255);
    }
}
void mouseDragged(){
  if(sqrt(sq(mouseX-v1x)+sq(mouseY-v1y))<=20){
    background(255);
    v1x=mouseX;
    v1y=mouseY;
  }
  if(sqrt(sq(mouseX-v2x)+sq(mouseY-v2y))<=20){
    background(255);
    v2x=mouseX;
    v2y=mouseY;
  }
  if(sqrt(sq(mouseX-v3x)+sq(mouseY-v3y))<=20){
    background(255);
    v3x=mouseX;
    v3y=mouseY;
  }
}