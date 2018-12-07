class Dot{
  float x;
  float y;
  float radius;
  int r;
  int g;
  int b;
  Dot(float ix, float iy, float rad, int ir, int ig, int ib){
    x=ix;
    y=iy;
    radius=rad;
    r=ir;
    g=ig;
    b=ib;
  }
  void render(){
    ellipse(x,y,radius*2,radius*2);
  }
  boolean contains(float mx, float my){
    if(sqrt(sq(mx-x)+sq(my-y))<=radius){
      return true;
    }
    return false;
  }
}