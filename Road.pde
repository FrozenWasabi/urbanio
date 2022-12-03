class Road{
  //fields
  int width;
  int height;
  int x;
  int y;
  int speed; 

 Road(int w, int h, int s,int xC,int yC){
  this.width = w;
  this.height = h;
  this.speed = s; 
  this.x = xC;
  this.y = yC;
  
}

void DrawRoad(){
  rectMode(CENTER);
  noStroke();
  fill(55);
  rect(this.x, this.y, this.width, this.height);
  fill(255,255,0);
  if (this.width > 200)
    rect(this.x, this.y, this.width, this.height/15);
  else 
    rect(this.x, this.y, this.width/15, this.height);
}

void DrawIntersection(){
  rectMode(CENTER);
  noStroke();
  fill(55);
  rect(this.x, this.y, this.width, this.height);
}

void DrawCurveLine(){
  noFill();
  stroke(255,255,0);
  strokeWeight(5);
  arc(this.x, this.y, 77, 81, 0, HALF_PI);
}

void DrawMap(){
  Road road2 = new Road(80,580,60,120,350);
  Road road3 = new Road(964,80,60,478,600);
  Road road5 = new Road(1000,80,60,500,100);
  Road road4 = new Road(80,550,60,920,350);
  Road road6 = new Road(80,650,60,500,450);
  Road road7 = new Road(80,80,60,500,600);
  Road road8 = new Road(80,80,60,500,100);
  Road road9 = new Road(80,80,60,120,600);
  Road road10 = new Road(80,80,60,120,100);
  Road road11 = new Road(80,80,60,920,100);
  Road road12 = new Road(80,80,60,920,600);
  Road road13 = new Road(80,80,60,881,559);

  road2.DrawRoad();
  road3.DrawRoad();
  road4.DrawRoad();
  road5.DrawRoad();
  road6.DrawRoad();
  road7.DrawIntersection();
  road8.DrawIntersection();
  road9.DrawIntersection();
  road10.DrawIntersection();
  road11.DrawIntersection();
  road12.DrawIntersection();
  road13.DrawCurveLine();
  }
}
