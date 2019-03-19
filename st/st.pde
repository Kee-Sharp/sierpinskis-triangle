/**
* Demonstration of the Sierpinski Triangle
*
* Each dot can be moved around
* Press 'p' to pause/play the demonstration
* Press 'a'/'s'/'d' for a slow/medium/fast speed
* Press a number between 1-9 to change the diameter of the dots,
*   a smaller diameter yields a clearer visualization of the effect
* Press 'r' to wipe the screen
*/

float dotx=250;
float doty=250;
ArrayList<Dot> dots;
int r;
int diameter=4;
int count=0;
int tps;
int speed;
boolean playing=true;
boolean slow=true;
boolean medium=false;
boolean fast=false;
boolean dragging=false;
int dnumber;
boolean gold = false;
void setup() {
  size(770, 670);
  background(255);
  dots=new ArrayList<Dot>();
  PVector[] gold_colors = {new PVector(247, 243, 34), new PVector(247, 243, 34), new PVector(247, 243, 34)};
  PVector[] rgb_colors = {new PVector(0, 255, 0), new PVector(255, 0, 0), new PVector(0, 0, 255)};
  PVector[] colors = gold ? gold_colors : rgb_colors;
  dots.add(new Dot(30, 150*sqrt(3)+30, 10, colors[0]));
  dots.add(new Dot(180, 30, 10, colors[1]));
  dots.add(new Dot(330, 150*sqrt(3)+30, 10, colors[2]));
  //dots.add(new Dot(110, 110, 10, 255, 0, 255));
}
void draw() {
  if(dragging){
    background(255);
  }
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
      Dot d=dots.get(r);
      fill(d.col.x, d.col.y, d.col.z);
      dotx=dotx-(dotx-d.x)/2;
      doty=doty-(doty-d.y)/2;
      if (count>120) {
        ellipse(dotx, doty, diameter, diameter);
      }
    }
    fill(0);
    count+=1;
  }
  for (Dot d : dots) {
    d.render();
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
  if (key>=49 && key<=57) {
    diameter=key-48;
    background(255);
  }
}
void mousePressed(){
  for (int i=0; i<dots.size(); i++) {
    Dot d=dots.get(i);
    if (d.contains(mouseX, mouseY)) {
      dragging=true;
      dnumber=i;
      playing=false;
    }
  }
}
void mouseDragged() {
  if(dragging){
      Dot d=dots.get(dnumber);
      d.x=mouseX;
      d.y=mouseY;     
  }  
}
void mouseReleased(){
  dragging=false;
  playing=true;
}