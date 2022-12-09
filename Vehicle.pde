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
  float angle;
  float rotationStrength;
  float turningCooldown;
  String sideOfRoad;
  boolean collision;
  boolean isTurning = false;
  boolean turningLeft = false;
  boolean turningRight = false;

  ///Methods///
  /////////////////
  void moveVehicle() {
    //if not near intersection, move forwards
    if (speed > 0) {
      if ( turningCooldown > 0) {
        turningCooldown -=1;
      }
      if (isTurning == false) {
      if (roadPos == 0) {
        this.xPos += speed;
      } else if (roadPos == PI/2) {
        this.yPos -= speed;
      } else if (roadPos == PI) {
        this.xPos -= speed;
      } else if (roadPos == 3*PI/2) {
        this.yPos += speed;
        }
      }
    }
  

    //if it intersection and not already turning and it wants to turn, turn
    
    if (isTurning == false && turningCooldown == 0) {
      float desiredAngle;
      if (trueOrFalse() == true) {
          isTurning = false;
          turningRight = true;
        }
         else {
           isTurning = false;
           turningLeft = true;
         }
         
      if (turningRight == true) {
        desiredAngle = roadPos - PI/2;
        if (desiredAngle == -PI/2) {
          desiredAngle = 3*PI/2;
        }
      }
      
      else {
        desiredAngle = roadPos + PI/2; 
        }
        
      for ( int i = 0; i < allRoads.size(); i++) {
        if (allRoads.get(i).checkType() == "road") {
          if (this.roadPos == 0) {
            if (allRoads.get(i).getAngle() == desiredAngle && this.xPos-allRoads.get(i).getCenterLocationX() == 0) {
              println("yeah");
                isTurning = true;
                }
            }
          else if (this.roadPos == PI/2) {
              if (allRoads.get(i).getAngle() == desiredAngle && this.yPos-allRoads.get(i).getCenterLocationY() == 0) {
                isTurning = true;
                }
            }
          else if (this.roadPos == PI) {
             if (allRoads.get(i).getAngle() == desiredAngle && this.xPos-allRoads.get(i).getCenterLocationX() == 0) {
                isTurning = true;
                }
            }
          else if (this.roadPos == 3*PI/2) {
            println(allRoads.get(i).getCenterLocationY());
             if (allRoads.get(i).getAngle() == desiredAngle && this.yPos-allRoads.get(i).getCenterLocationY() == 0) {
               println("nestedwork");
                isTurning = true;
                }
              }
            }
      }
    
    }
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
    if (isTurning == true) {
      println("hi");
      if (turningLeft == true) {
        angle -= (rotationStrength);
      } else if (turningRight == true) {
        angle += (rotationStrength);
      }
      
      if (angle >= PI/2 || angle <= -PI/2) {     
        if (turningRight == true) {
          angle = -(PI/2);
        } else if (turningLeft == true) {
          angle = (PI/2);
        }
  
        roadPos += angle;
  
        if (roadPos == -(PI/2)) { //in case it becomes negative, we can set it back to positive
          roadPos = 3*PI/2;
        } else if (roadPos > PI/2 && roadPos <3*PI/2) { //corrects the rounding issues with processing
          roadPos = PI;
        } else if (roadPos == 2*PI) { //in case it does a full rotation and becomes 2PI, we can set it back to 0;
          roadPos = 0;
        }
  
        angle = 0;
        isTurning = false;
        turningCooldown = 20;
        turningLeft = false;
        turningRight = false;
      }
    }
  }
 
  void drawVehicle() {
    noStroke();
    fill(Color);
    pushMatrix();
    rectMode(CENTER);
    translate(this.xPos, this.yPos);
    rotate(roadPos+angle);
    
    rect(0, 0, vWidth, vHeight, 20);
    popMatrix();
    println("Car's y val is", this.yPos, roadPos);
    println("Car's x val is", this.xPos);
  }
  
  float getCenterLocationX() {
    float middleX = this.xPos;
    return middleX;
  }
  
  float getCenterLocationY() {
    float middleY = this.yPos;
    return middleY;
  }
  
  //boolean wantsToTurn() {
  //  int turnChance = int(random(1,100));
  //  if (turnChance >= 50) {
  //    return true;
  //  }
  //  else
  //    this.turningCooldown = 30;
  //    return false; 
  //}
  
 }
