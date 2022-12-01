import g4p_controls.*;
//Global Variables//

ArrayList<Car> allCars = new ArrayList<Car>(); //arraylist for all cars on the road
ArrayList<Bus> allBus = new ArrayList<Bus>(); //arraylist for all buses


//color//
color red = color(255,0,0);

//GUI Variables//


void setup() {
  frameRate(30);
  size(1000,700);
  createGUI();
  allCars.add(new Car(300, 100, 100, 20, red, 5, 10, 10, 10, 10, 0));
  allCars.add(new Car(300, 300, 100, 20, red, 5, 10, 10, 10, 10, 0));
  allCars.add(new Car(300, 500, 100, 20, red, 5, 10, 10, 10, 10, 0));
}

void draw() {
  background(40,200,80);
  updateCars();
  drawCars();
  //clearCars();
  
//  updateBuses();
  //drawBuses();
  
//  updatePeople();
//  drawPeople();
}

void updateCars() {
  for (int i = 0; i < allCars.size(); i++) {
    allCars.get(i).moveVehicle();
    allCars.get(i).carLeave();
  }
}  
void drawCars() {
  for (int i = 0; i < allCars.size(); i++) {
    allCars.get(i).drawVehicle();
  }
}

void clearCars() {
  int i = 0;
  while (i < allCars.size()) {
  allCars.remove(i);  
  i = 0;
  }
}
