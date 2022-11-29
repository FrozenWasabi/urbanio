class Vehicle {
  float vX;
  float vY;
  color vColor;
  
  float vSpeed;
  float vAcceleration;
  float vDeceleration;
  float minSpeed;
  float maxSpeed;
  
  float vWidth;
  float vHeight;
  
  float vRoadPos;
  boolean vCollision;
  
  Vehicle( float x, float y, color c, float speed, float a, float d, float min, float max, float w, float h, float pos) {
    this.vX = x;
    this.vY = y;
    this.vColor = c;
    this.vSpeed = speed;
    this.vAcceleration = a;
    this.vDeceleration = d;
    this.minSpeed = min;
    this.maxSpeed = max;
    this.vWidth = w;
    this.vHeight = h;
    this.vRoadPos = pos;
    this.vCollision = false;
  }
  
}
