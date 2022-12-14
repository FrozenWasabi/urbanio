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
  boolean despawn = false;

  ///Methods///
  /////////////////
  void moveVehicle() {
    //if(doDespawn() == true){
      
    //if (this.yPos == 450 && this.xPos == 600) {
    //  isTurning = true;
    //  turningRight = true;
    //}
    //else if (this.yPos == 
   //if not near intersection, move forwards
    if (speed > 0) {
      if ( turningCooldown > 0) {
        turningCooldown -=1;
      }
      if (roadPos == 0) {
        this.xPos -= speed;
      } else if (roadPos == PI/2) {
        this.yPos += speed;
      } else if (roadPos == PI) {
        this.xPos += speed;
      } else if (roadPos == 3*PI/2) {
        this.yPos -= speed;
      }
    }
  


    //if it intersection and not already turning and it wants to turn, turn

    if (isTurning == false && turningCooldown == 0) {
      float desiredAngle;
      if (trueOrFalse1() == true) {//------------------p-----------------------------------------------------------------------------------------------
        busStop();
        isTurning = true;
        turningLeft = true;
      } else{
        isTurning = false;
        turningLeft = false;
      }

      if (turningRight == true) {
        desiredAngle = roadPos - PI/2;
        if (desiredAngle == -PI/2) {
          desiredAngle = 3*PI/2;
        }
      } else {
        desiredAngle = roadPos + PI/2;
      }

      if (desiredAngle > PI/2 && desiredAngle <3*PI/2) { //corrects the rounding issues with processing
        desiredAngle = PI;
      }

      for ( int i = 0; i < allRoads.size(); i++) {
        if (allRoads.get(i).checkType() == "road") {
          if (this.roadPos == 0) {
            if (allRoads.get(i).getAngle() == desiredAngle && this.xPos-allRoads.get(i).getCenterLocationX() == 0) {
              isTurning = true;
            }
          } else if (this.roadPos == PI/2) {
            if (allRoads.get(i).getAngle() == desiredAngle && this.yPos-allRoads.get(i).getCenterLocationY() == 0) {
              isTurning = true;
            }
          } else if (this.roadPos == PI) {
            if (allRoads.get(i).getAngle() == desiredAngle && this.xPos-allRoads.get(i).getCenterLocationX() == 0) {
              isTurning = true;
            }
          } else if (this.roadPos == 3*PI/2) {
            if (allRoads.get(i).getAngle() == desiredAngle) {
              if (int(this.yPos) - int(allRoads.get(i).getCenterLocationY()) == 0) {
                isTurning = true;
              }
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

  //void turn() {
  //  if (isTurning == true) {
  //    if (turningLeft == true) {
  //      angle += (rotationStrength);
  //    } else if (turningRight == true) {
  //      angle -= (rotationStrength);
  //    }

  //    if (angle >= PI/2 || angle <= -PI/2) {     
  //      if (turningRight == true) {
  //        angle = -(PI/2);
  //      } else if (turningLeft == true) {
  //        angle = (PI/2);
  //      }

  //      roadPos += angle;

  //      if (roadPos == -(PI/2)) { //in case it becomes negative, we can set it back to positive
  //        roadPos = 3*PI/2;
  //      } else if (roadPos > PI/2 && roadPos <3*PI/2) { //corrects the rounding issues with processing
  //        roadPos = PI;
  //      } else if (roadPos == 2*PI) { //in case it does a full rotation and becomes 2PI, we can set it back to 0;
  //        roadPos = 0;
  //      }

  //      angle = 0;
  //      isTurning = false;
  //      turningCooldown = 5;
  //      turningLeft = false;
  //      turningRight = false;
  //    }
  //  }
  //}
  
    void turn() {
    if (turningLeft == true) {
      angle -= (PI/45);
      if (roadPos == 0) {
        this.yPos += 2;
      } else if (roadPos == PI/2) {
        this.xPos += 2;
      } else if (roadPos == PI) {
        this.yPos += 2;
      } else if (roadPos == 3*PI/2) {
        this.xPos += 2;
      }
    } else if (turningRight == true) {
      angle += (PI/45);
      if (roadPos == 0) {
        this.yPos += 2;
      } else if (roadPos == PI/2) {
        this.xPos += 2;
      } else if (roadPos == PI) {
        this.yPos += 2;
      } else if (roadPos == 3*PI/2) {
        this.xPos += 2;
      }
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

  void drawVehicle() {
    noStroke();
    fill(Color);
    pushMatrix();
    //imageMode(CENTER);
    translate(this.xPos, this.yPos);
    rotate(roadPos+angle);
    //car.resize(60,60);
    tint(Color);
    //image(car,0,0);
    rectMode(CENTER);
    rect(0, 0, vWidth, vHeight, 20);    
    popMatrix();
    //println("Car's y val is", this.yPos);
    //println("Car's x val is", this.xPos);
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
  //  int turnChance = int(random(1, 100));
  //  if (turnChance >= 5) {
  //    return true;
  //  } else
  //    this.turningCooldown = 30;
  //  return false;
  //}
  
  boolean trueOrFalse(){ //random name, need to change to bus track 1
    if(this.xPos == 562 && this.yPos == 120){ //--562
      return true;
    }else if(this.xPos == 518 && this.yPos == 540){
      return true;
    }else if(this.xPos == 860 && this.yPos == 584){
      return true;
    }else if(this.xPos == 902 && this.yPos == 120){//testing
      return false;
    }else{
      return false;
    }
  }
  boolean trueOrFalse1(){ //random name, need to change to bus track 2
    if(this.xPos == round(random(80,100)) && this.yPos == 120){//x value
      return true;
    }else if(this.xPos == 100 && this.yPos == 540){//x value
      return true;
    }else if(this.xPos == 860 && this.yPos == 584){
      return true;
    }else if(this.xPos == 902 && this.yPos == 120){//testing
      return false;
    }else{
      return false;
    }
  }
  void busStop(){
    float orgSpeed = this.speed;
    this.speed = 0;
    delay(1000);
    this.speed = orgSpeed;
  }
  boolean doDespawn(){
    if(this.xPos == 904 && this.yPos == 120){
      return true;
    }else{
      return false;
     }
    }    
  boolean checkOffScreen() {
    if ( yPos <= 0 || yPos >= 700 || xPos <= 0 || xPos >= 1000) {
      return true;
    } else {
      return false;
    }
  }
}
