class Dot{
  float x;
  float y;
  float radius;
  PVector col;
  Dot(float ix, float iy, float rad, PVector col){
    x=ix;
    y=iy;
    radius=rad;
    this.col = col;
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