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
      if (r==0) {
        dotx=dotx-(1*(dotx-v1x)/2);
        doty=doty-(1*(doty-v1y)/2);
        //dotx=(dotx+v1x)/2;
        //doty=(doty+v1y)/2;
        fill(255, 0, 0);
        if (count>120) {
          ellipse(dotx, doty, diameter, diameter);
        }
      } else if (r==1) {
        dotx=dotx-(1*(dotx-v2x)/2);
        doty=doty-(1*(doty-v2y)/2);
        //dotx=(dotx+v2x)/2;
        //doty=(doty+v2y)/2;
        fill(0, 255, 0);
        if (count>120) {
          ellipse(dotx, doty, diameter, diameter);
        }
      } else if (r==2) {
        dotx=dotx-(1*(dotx-v3x)/2);
        doty=doty-(1*(doty-v3y)/2);
        //dotx=(dotx+v3x)/2;
        //doty=(doty+v3y)/2;
        fill(0, 0, 255);
        if (count>120) {
          ellipse(dotx, doty, diameter, diameter);
        }
      }
    }
    fill(0);
     ellipse(v1x, v1y, 20, 20);
     ellipse(v2x, v2y, 20, 20);
     ellipse(v3x, v3y, 20, 20);
    noFill();

    count+=1;
  }
}

void keyPressed() {
  if (playing) {
    if (key=='p') {
      playing=false;
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
    if (key=='1'){
      diameter=1;
      background(255);
    }
    if (key=='2'){
      diameter=2;
      background(255);
    }
    if (key=='3'){
      diameter=3;
      background(255);
    }
    if (key=='4'){
      diameter=4;
      background(255);
    }
    if (key=='5'){
      diameter=5;
      background(255);
    }
    if (key=='6'){
      diameter=6;
      background(255);
    }
  } else {
    if (key=='p') {
      playing=true;
    }
    if (key=='r') {
      background(255);
    }
    if (key=='1'){
      diameter=1;
      background(255);
    }
    if (key=='2'){
      diameter=2;
      background(255);
    }
    if (key=='3'){
      diameter=3;
      background(255);
    }
    if (key=='4'){
      diameter=4;
      background(255);
    }
    if (key=='5'){
      diameter=5;
      background(255);
    }
    if (key=='6'){
      diameter=6;
      background(255);
    }
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