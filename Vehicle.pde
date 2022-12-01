class Vehicle {
  ///Fields///
////////////////////////////////
  float xPos;
  float yPos;
  float vWidth;
  float vHeight;
  float objM;
  
  color Color;
  
  float speed;
  float acceleration;
  float deceleration;
  float minSpeed;
  float maxSpeed;

  float roadPos; //position of the car rotation 0 is East, 90 is North, 180 is West, 270 is South
  float turningFactor;
  String sideOfRoad;
  boolean collision;
  boolean isTurning;
  boolean turningLeft;
  boolean turningRight;
 
  ///Methods///
/////////////////
  void moveVehicle(){
    //if not near intersection, move forwards
    if (speed > 0) {
      xPos += speed;
    }
    //if it intersection, turn
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
      if (turningRight = true) {
        turningFactor -= 0.1;
      }
      else if (turningLeft = true) {
        turningFactor += 0.1;
      }
  }
  
  void drawVehicle(){
    fill(Color);
    pushMatrix();
    translate(xPos,yPos);
    rotate(roadPos);
    rect(-(vWidth/2),-(vHeight/2),vWidth,vHeight);
    popMatrix();
  }
  
}
