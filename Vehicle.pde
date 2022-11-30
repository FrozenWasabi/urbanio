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
 
  ///Methods///
/////////////////
  void move(){
    
  }
  
  void drawVehicle(){
    fill(Color);
    circle(xPos,yPos,10);
  }
  
}
