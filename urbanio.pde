import g4p_controls.*;
//Global Variables//

ArrayList<Car> allCars = new ArrayList<Car>(); //arraylist for all cars on the road
ArrayList<Bus> allBuses = new ArrayList<Bus>(); //arraylist for all buses
ArrayList<Road> allRoads = new ArrayList<Road>(); //arraylist for all roads

//color//
color red = color(255, 0, 0);
color blue = color(0, 0, 255);
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
  /////////////////all roads
  allRoads.add(new Road(40, 580, 60, 100, 350, 3*PI/2, "road", "left"));
  allRoads.add(new Road(40, 580, 60, 140, 350, PI/2, "road", "right"));
  allRoads.add(new Road(964, 40, 60, 478, 580, PI, "road", "right"));
  allRoads.add(new Road(964, 40, 60, 478, 620, 0, "road", "left"));
  allRoads.add(new Road(1000, 40, 60, 500, 80, PI, "road", "left"));
  allRoads.add(new Road(1000, 40, 60, 500, 120, 0, "road", "right"));
  allRoads.add(new Road(40, 550, 60, 900, 350, 3*PI/2, "road", "right"));
  allRoads.add(new Road(40, 550, 60, 940, 350, PI/2, "road", "left"));
  allRoads.add(new Road(40, 650, 60, 480, 450, 3*PI/2, "road", "right"));
  allRoads.add(new Road(40, 650, 60, 520, 450, PI/2, "road", "left"));
  /////////////////Intersections coordinations
  allRoads.add(new Road(80, 80, 60, 500, 600, "intersection"));
  allRoads.add(new Road(80, 80, 60, 500, 100, "intersection"));
  allRoads.add(new Road(80, 80, 60, 120, 600, "intersection"));
  allRoads.add(new Road(80, 80, 60, 120, 100,"intersection"));
  allRoads.add(new Road(80, 80, 60, 920, 100, "intersection"));
  allRoads.add(new Road(80, 80, 60, 920, 600, "intersection"));

  /////////////////Curve
  allRoads.add(new Road(80, 80, 60, 881, 559, "curve"));
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
  for (int i = 0; i < allRoads.size(); i++) {
    if (allRoads.get(i).checkType() == "road") {
      allRoads.get(i).drawRoad();
    }
    else if (allRoads.get(i).checkType() == "intersection") {
      allRoads.get(i).drawIntersection();
    }
    else if (allRoads.get(i).checkType() == "curve") {
       allRoads.get(i).drawCurveLine();
    }
  }
}

boolean trueOrFalse() {
  if (int(random(1, 100)) >= 50) {
    return true;
  } else {
    return false;
  }
}
