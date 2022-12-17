class BusStop {
  //fields 
  float xCenter;
  float yCenter;
  color stopColor;
  int waitPeople;
  boolean busArrived;
  String side;

  
  BusStop(float xC, float yC, color sC, String s){
    this.xCenter = xC;
    this.yCenter = yC;
    this.stopColor = sC; 
    this.side = s;
    this.waitPeople = 0;
    this.busArrived = false;
  }
  
  
  void spawn(){
    stroke(255);
    fill(stopColor);
    ellipse(this.xCenter,this.yCenter,50,50);
  }
  
  
}
