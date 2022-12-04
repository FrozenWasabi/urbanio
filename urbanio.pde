import g4p_controls.*;
//Global Variables//

ArrayList<Car> allCars = new ArrayList<Car>(); //arraylist for all cars on the road
ArrayList<Bus> allBus = new ArrayList<Bus>(); //arraylist for all buses
ArrayList<Road> allRoads = new ArrayList<Road>(); //arraylist for all roads

//color//
color red = color(255, 0, 0);

//GUI Variables//


void setup() {
  frameRate(30);
  size(1000, 700);
  createGUI();
  allCars.add(new Car(300, 100, 100, 20, red, 5, 10, 10, 10, 10, 0));
  allCars.add(new Car(300, 300, 100, 20, red, 5, 10, 10, 10, 10, 0));
  allCars.add(new Car(300, 500, 100, 20, red, 5, 10, 10, 10, 10, 0));

  setupRoads();
}

void draw() {
  background(40, 200, 80);
  drawMap();
  updateCars();
  drawCars();

  //clearCars();

  //  updateBuses();
  //drawBuses();

  //  updatePeople();
  //  drawPeople();
}

void setupRoads() {
  allRoads.add(new Road(80, 580, 60, 120, 350));
  allRoads.add(new Road(964, 80, 60, 478, 600));
  allRoads.add(new Road(1000, 80, 60, 500, 100));
  allRoads.add(new Road(80, 550, 60, 920, 350));
  allRoads.add(new Road(80, 650, 60, 500, 450));
  allRoads.add(new Road(80, 80, 60, 500, 600));
  allRoads.add(new Road(80, 80, 60, 500, 100));
  allRoads.add(new Road(80, 80, 60, 120, 600));
  allRoads.add(new Road(80, 80, 60, 120, 100));
  allRoads.add(new Road(80, 80, 60, 920, 100));
  allRoads.add(new Road(80, 80, 60, 920, 600));
  allRoads.add(new Road(80, 80, 60, 881, 559));
}

void drawRoads() {
  for (int i = 0; i < allCars.size(); i++) {
    allCars.get(i).drawVehicle();
  }
}

void updateCars() {
  for (int i = 0; i < allCars.size(); i++) {
    allCars.get(i).moveVehicle();
    allCars.get(i).turn();
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

void drawMap() {
  allRoads.get(0).DrawRoad();
  allRoads.get(1).DrawRoad();
  allRoads.get(2).DrawRoad();
  allRoads.get(3).DrawRoad();
  allRoads.get(4).DrawRoad();
  allRoads.get(5).DrawIntersection();
  allRoads.get(6).DrawIntersection();
  allRoads.get(7).DrawIntersection();
  allRoads.get(8).DrawIntersection();
  allRoads.get(9).DrawIntersection();
  allRoads.get(10).DrawIntersection();
  allRoads.get(11).DrawCurveLine();
}
