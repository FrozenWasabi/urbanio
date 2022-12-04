class Road {
  //fields
  int rw;
  int rh;
  int x;
  int y;
  int speed; 

  Road(int w, int h, int s, int xC, int yC) {
    this.rw = w;
    this.rh = h;
    this.speed = s; 
    this.x = xC;
    this.y = yC;
  }

  void DrawRoad() {
    rectMode(CENTER);
    noStroke();
    fill(55);
    rect(this.x, this.y, this.rw, this.rh);
    fill(255, 255, 0);
    if (this.rw > 200)
      rect(this.x, this.y, this.rw, this.rh/15);
    else 
    rect(this.x, this.y, this.rw/15, this.rh);
  }

  void DrawIntersection() {
    rectMode(CENTER);
    noStroke();
    fill(55);
    rect(this.x, this.y, this.rw, this.rh);
  }

  void DrawCurveLine() {
    noFill();
    stroke(255, 255, 0);
    strokeWeight(5);
    arc(this.x, this.y, 77, 81, 0, HALF_PI);
  }
}
