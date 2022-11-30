import g4p_controls.*;

//Global Variables//

ArrayList<Car> allCars = new ArrayList<Car>(); //arraylist for all cars on the road
ArrayList<Bus> allBus = new ArrayList<Bus>(); //arraylist for all buses


//color//
color red = color(255,0,0);

//GUI Variables//


void setup() {
  background(40,200,80);
  size(1000,700);
  createGUI();
  allCars.add(new Car(10, 10, red, 10, 10, 10, 10, 10, 10));
}

void draw() {
//  updateCars();
  drawCars();
  
//  updateBuses();
  //drawBuses();
  
//  updatePeople();
//  drawPeople();
}

void drawCars() {
  for (int i = 0; i < allCars.size(); i++) {
    allCars.get(i).drawVehicle();
  }
}
