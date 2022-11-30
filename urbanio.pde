import g4p_controls.*;

//Global Variables//

ArrayList<Car> allCars = new ArrayList<Car>(); //arraylist for all cars on the road
ArrayList<Bus> allBus = new ArrayList<Bus>(); //arraylist for all buses

//GUI Variables//


void setup() {
  background(40,200,80);
  size(1000,700);
  createGUI();
}

void draw() {
  updateCars();
  drawCars();
  
  updateBuses();
  drawBuses();
  
  updatePeople();
  drawPeople();
}
