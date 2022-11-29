class Car extends Vehicle {
    Car( float x, float y, color c, float s, float a, float d, float min, float max, float w, float h, float pos) {
   xPos = x;
   yPos = y;
  Color = c;
  speed = s;
  acceleration = a;
  deceleration = d;
  minSpeed = min;
  maxSpeed = max;
  vWidth = w;
  vHeight = h;
  roadPos = pos;
  collision = false;
  }
}
