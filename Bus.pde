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


void moveBus() {
    //if not near intersection, move forwards
    if (this.speed > 0) {
      if ( this.turningCooldown > 0) {
        this.turningCooldown -=1;
      }
      if (roadPos == 0) {
        this.xPos += this.speed;
      } else if (roadPos == PI/2) {
        this.yPos -= this.speed;
      } else if (roadPos == PI) {
        this.xPos -= this.speed;
      } else if (roadPos == 3*PI/2) {
        this.yPos += this.speed;
      }
    }
    //if it intersection and not already turning, turn
    if (this.isTurning == false && this.turningCooldown == 0) {
      for ( int i = 2; i < 5; i++) {
        if (dist(this.getCenterLocationX(),this.getCenterLocationY(),allRoads.get(i+5).getCenterLocationX(),allRoads.get(i+5).getCenterLocationY()) <= 80) {
          this.isTurning = true;
          this.turningRight = true;
        }
      }
    }
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
  
  
  float getCenterLocationX() {
    float middleX = this.xPos + this.vWidth/2;
    return middleX;
  }
  
  float getCenterLocationY() {
    float middleY = this.yPos + this.vHeight/2;
    return middleY;
  }
  
 
    
void updateBus(){
  
}
}
