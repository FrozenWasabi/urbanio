import g4p_controls.*;
//Global Variables//

ArrayList<Car> allCars = new ArrayList<Car>(); //arraylist for all cars on the road
ArrayList<Bus> allBuses = new ArrayList<Bus>(); //arraylist for all buses
ArrayList<Road> allRoads = new ArrayList<Road>(); //arraylist for all roads

//color//
color red = color(255, 0, 0);
color blue = color(0,0,255);
color background = color(40, 200, 80);

//GUI Variables//


void setup() {
  frameRate(15);
  size(1000, 700);
  createGUI();
  allCars.add(new Car(300, 120, 60, 20, red, 5, 10, 10, 10, 10, 0));
  allBuses.add(new Bus(300, 620, 90, 30, blue, 5, 10, 10, 10, 10, 0));

  setupRoads();
}

void draw() {
  background(background);
  drawMap();
  updateCars();
  drawCars();

  //clearCars();

  updateBuses();
  drawBuses();

  //  updatePeople();
  //  drawPeople();
}

void setupRoads() {
  allRoads.add(new Road(80, 580, 60, 120, 350));
  allRoads.add(new Road(964, 80, 60, 478, 600));
  allRoads.add(new Road(1000, 80, 60, 500, 100));
  allRoads.add(new Road(80, 550, 60, 920, 350));
  allRoads.add(new Road(80, 650, 60, 500, 450));
  ///////////////Intersections coordinations
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

void updateBuses() {
  for (int i = 0; i < allBuses.size(); i++) {
    allBuses.get(i).moveVehicle();
    allBuses.get(i).turn();
  }
}  

void drawBuses() {
  for (int i = 0; i < allBuses.size(); i++) {
    allBuses.get(i).drawVehicle();
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
  ////////////////////////// Roads
  allRoads.get(0).DrawRoad();
  allRoads.get(1).DrawRoad();
  allRoads.get(2).DrawRoad();
  allRoads.get(3).DrawRoad();
  allRoads.get(4).DrawRoad();
  ////////////////////////// Intersections
  allRoads.get(5).DrawIntersection();
  allRoads.get(6).DrawIntersection();
  allRoads.get(7).DrawIntersection();
  allRoads.get(8).DrawIntersection();
  allRoads.get(9).DrawIntersection();
  allRoads.get(10).DrawIntersection();
  allRoads.get(11).DrawCurveLine();
}

boolean trueOrFalse() {
  if (int(random(1,100)) >= 50) {
    return true;
  }
    else {
      return false;
    }
}
