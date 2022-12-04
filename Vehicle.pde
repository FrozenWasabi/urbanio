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
      if (roadPos == 0) {
        xPos += speed;
      } else if (roadPos == PI/2) {
        yPos -= speed;
      } else if (roadPos == PI) {
        xPos -= speed;
      } else if (roadPos == 3*PI/2) {
        yPos += speed;
      }
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
    if (turningLeft == true) {
      angle -= (PI/90);
      if (roadPos == 0) {
        yPos -= 2;
      } else if (roadPos == PI/2) {
        xPos -= 2;
      } else if (roadPos == PI) {
        yPos += 2;
      } else if (roadPos == 3*PI/2) {
        xPos += 2;
      }
    } else if (turningRight == true) {
      angle += (PI/90);
      if (roadPos == 0) {
        yPos += 2;
      } else if (roadPos == PI/2) {
        xPos += 2;
      } else if (roadPos == PI) {
        yPos -= 2;
      } else if (roadPos == 3*PI/2) {
        xPos -= 2;
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
      turningLeft = false;
      turningRight = false;
    }
  }

  void drawVehicle() {
    noStroke();
    fill(Color);
    pushMatrix();
    translate(xPos, yPos);
    rotate(roadPos+angle);
    println(roadPos);
    rectMode(CENTER);
    rect(0, 0, vWidth, vHeight, 20);
    popMatrix();
  }
}
