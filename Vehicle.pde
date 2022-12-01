class Vehicle {
  ///Fields///
////////////////////////////////
  float xPos;
  float yPos;
  color Color;
  
  float speed;
  float acceleration;
  float deceleration;
  float minSpeed;
  float maxSpeed;

  float roadPos;
  boolean collision;
  boolean isTurning;
 
  ///Methods///
/////////////////
  void moveVehicle(){
    
  }
  
  void accelerate() {
    if (speed < maxSpeed) {
      speed += acceleration;
      if (speed > maxSpeed) {
        speed = maxSpeed;
      }
    }
  }
  
  void decelerate() {
    if (speed > maxSpeed) {
      speed -= deceleration;
      if (speed < minSpeed) {
        speed = minSpeed;
      }
    }
  }
  
  void turn() {
    
  }
  
  void drawVehicle(){
    fill(Color);
    circle(xPos,yPos,10);
  }
  
}
