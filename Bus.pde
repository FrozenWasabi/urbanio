class Bus extends Vehicle {

int Ax = 170;
int Ay = 110;
int Bx = 550;
int By = 110;
int Cx = 970;
int Cy = 110;
int Dx = 970;
int Dy = 610;
int Ex = 550;
int Ey = 610;
int Fx = 170;
int Fy = 610;

int busx;
int busy;
int bush;

//boolean isTurning = false;
//boolean turningLeft = false;
//boolean turningRight = false;

  
 ///Methods///
 Bus(int x, int y, int w, int h, int m, color c, int s, int a, int d, int mns, int mxs){
  this.xPos = x;
  this.yPos = y;
  this.vWidth = w;
  this.vHeight = h;
  this.objM = m;
  this.Color = c;
  this.speed = s;
  this.acceleration = a;
  this.deceleration = d;
  this.minSpeed = mns;
  this.maxSpeed = mxs;
}


public void createBus(){
  rect(this.busx, this.busy, this.bush, this.bush);
}

  void drawBus() {
    println("Calling draw bus");
    noStroke();
    fill(Color);
    pushMatrix();
    translate(this.xPos, this.yPos);
    rotate(roadPos+angle);
    rectMode(CENTER);
    rect(0, 0, vWidth, vHeight, 20);
    popMatrix();
    println("bus's y val is", this.yPos);
    println("bus's x val is", this.xPos);
  }
   
   void moveBus() { // Forward track
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
      float rand = random(0,100);
      if(rand <=50){
        if (busTrackShort() == true) {
          busStop();
          isTurning = true;
          turningLeft = true;
        }else if(busTrackLong() == true) {
          busStop();
          isTurning = true;
          turningLeft = true;
        } else{
          isTurning = false;
          turningLeft = false;
        }
      }else{
         if (busTrackLong() == true) {
          busStop();
          isTurning = true;
          turningLeft = true;
        } else{
          isTurning = false;
          turningLeft = false;
        }
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
    }
  }
  
 void moveBusBack() { // Backward track 
    if (speed > 0) {
      if ( turningCooldown > 0) {
        turningCooldown -=1;
      }
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
    //if it intersection and not already turning and it wants to turn, turn

    if (isTurning == false && turningCooldown == 0) {
      float desiredAngle;
      float rand = random(0,100);
      if(rand <=50){
        if (busTrackShortBack() == true) {
          busStop();
          isTurning = true;
          turningRight = true;
        }else if(busTrackLongBack() == true) {
          busStop();
          isTurning = true;
          turningRight = true;
        } else{
          isTurning = false;
          turningRight = false;
        }
      }else{
         if (busTrackLongBack() == true) {
          busStop();
          isTurning = true;
          turningRight = true;
        } else{
          isTurning = false;
          turningRight = false;
        }
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
    }
  }
  
  
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

  
  boolean busTrackShort(){ //random name, need to change to bus track 1
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
  boolean busTrackLong(){ //random name, need to change to bus track 2
    if(this.xPos == 180 && this.yPos == 120){//x value
      return true;
    }else if(this.xPos == 136 && this.yPos == 540){//x value
      return true;
    }else if(this.xPos == 860 && this.yPos == 584){
      return true;
    }else if(this.xPos == 902 && this.yPos == 120){//testing
      return false;
    }else{
      return false;
    }
  }
  
 boolean busTrackShortBack(){ //random name, need to change to bus track 2
    if(this.xPos == 898 && this.yPos == 80){//x value
      return true;
    }else if(this.xPos == 942 && this.yPos == 578){//x value
      return true;
    }else if(this.xPos == 522 && this.yPos == 622){
      return true;
    }else if(this.xPos == 478 && this.yPos == 124){//testing
      return true;
    }else{
      return false;
    }
  } 
 
  boolean busTrackLongBack(){ //random name, need to change to bus track 2
    if(this.xPos == 898 && this.yPos == 80){//x value
      return true;
    }else if(this.xPos == 942 && this.yPos == 578){//x value
      return true;
    }else if(this.xPos == 142 && this.yPos == 622){
      return true;
    }else if(this.xPos == 98 && this.yPos == 124){//testing
      return true;
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
    }else if(this.xPos == 898 && this.yPos == 80){
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
   
void updateBus(){
  }
}
