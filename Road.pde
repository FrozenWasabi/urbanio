class Road {
  //fields
  int rw;
  int rh;
  int x;
  int y;
  int speed;
  String roadType;
  String side;
  float orientation;

  Road(int w, int h, int s, int xC, int yC, float o, String rT, String side) {
    this.rw = w;
    this.rh = h;
    this.speed = s; 
    this.x = xC;
    this.y = yC;
    this.roadType = rT;
    this.orientation = o;
    this.side = side;
  }

  Road(int w, int h, int s, int xC, int yC, String rT) {
    this.rw = w;
    this.rh = h;
    this.speed = s; 
    this.x = xC;
    this.y = yC;
    this.roadType = rT;
  }

  void drawRoad() {
    rectMode(CENTER);
    noStroke();
    fill(55);
    rect(this.x, this.y, this.rw, this.rh);
    fill(255, 255, 0);
  }

  //void drawLineCrossing(Road a, Road b) {
  //}

  void drawIntersection() {
    rectMode(CENTER);
    noStroke();
    fill(55);
    rect(this.x, this.y, this.rw, this.rh);
  }

  void drawCurveLine() {
    noFill();
    stroke(255, 255, 0);
    strokeWeight(5);
    arc(this.x, this.y, 77, 81, 0, HALF_PI);
  }

  float getCenterLocationX() {
    float middleX = this.x;
    return middleX;
  }

  float getCenterLocationY() {
    float middleY = this.y;
    return middleY;
  }
  
  float getAngle() {
    return orientation;
  }

  String checkType() {
    return this.roadType;
  }
}
