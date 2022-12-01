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
  boolean isTurning = false;
  boolean turningLeft = true;
  boolean turningRight = false;
 
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
      if (turningRight == true) {
        turningFactor -= 0.01;
      }
      else if (turningLeft == true) {
        turningFactor += 0.01;
      }
      if (turningFactor + roadPos == (round(radians(90)*100)/100) ||
      turningFactor + roadPos == (round(radians(90)*100)/100) ||
      turningFactor + roadPos == (round(radians(90)*100)/100) ||
      turningFactor + roadPos == (round(radians(90)*100)/100) ||
      turningFactor + roadPos == (round(radians(90)*100)/100)) {
        
          if (roadPos == 360) {
            roadPos = 0;
          }
          
        roadPos += turningFactor;
        turningFactor = 0;
        isTurning = false;
      }
  }
  
  void drawVehicle(){
    fill(Color);
    pushMatrix();
    translate(xPos,yPos);
    rotate((round((roadPos+turningFactor)*100))/100);
    println((round((roadPos+turningFactor)*100))/100);
    rect(-(vWidth/2),-(vHeight/2),vWidth,vHeight);
    popMatrix();
  }
  
}
