class Car extends Vehicle {
  Car( float x, float y, float w, float h, color c, float s, float a, float d, float min, float max, float pos) {
    xPos = x;
    yPos = y;
    vWidth = w;
    vHeight = h;
    Color = c;
    speed = s;
    acceleration = a;
    deceleration = d;
    minSpeed = min;
    maxSpeed = max;
    roadPos = pos;
    collision = false;
    rotationStrength = PI/20;
  }

  //chance of car leaving if it is at a infrastructure
  void carLeave() {
    //is it near a infrastructure
    //if it is check chance of leaving due to time
  }
}
