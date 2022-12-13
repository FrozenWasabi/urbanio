import g4p_controls.*;
//Global Variables//

//Images//
PImage car;
PImage bus;
PImage imgSchool;
PImage imgOffice;
PImage imgSupermarket;
PImage imgCommunitycentre;
PImage imgBushub;

//color//
color red = color(255, 0, 0);
color blue = color(0, 0, 255);
color background = color(40, 200, 80);

//GUI Variables//
boolean paused = false;
boolean cleared = false;
float aggression;
float tolerance;
float capacity;

//Global Variables//
ArrayList<Car> allCars; //arraylist for all cars on the road
ArrayList<Bus> allBuses; //arraylist for all buses
ArrayList<Road> allRoads =  new ArrayList<Road>(); //arraylist for all roads

void setup() {
  frameRate(30);
  size(1000, 700);
  setupVehicleArrays();
  car = loadImage("car.png");
  createGUI();
  spawnCar();
  //allBuses.add(new Bus(300, 620, 90, 30, blue, 5, 10, 10, 10, 10, 0));

  setupRoads();
  imgSchool = loadImage("School.png");
  imgOffice = loadImage("Office.png");
  imgSupermarket = loadImage("Supermarket.png");
  imgCommunitycentre = loadImage("Communitycentre.png");
  imgBushub = loadImage("Bushub.png");
}

void setupVehicleArrays() {
  allCars = new ArrayList<Car>(); //arraylist for all cars on the road
  allBuses = new ArrayList<Bus>(); //arraylist for all buses
}
void draw() {
  if (paused == false) {
    background(background);
    drawMap();
    updateCars();
    drawCars();
    //clearCars();
    updateBuses();
    drawBuses();
    noTint();
    image(imgSchool, 230, 200, width/7, height/6);
    image(imgOffice, 710, 450, width/2.5, height/1.8);
    image(imgSupermarket, 260, 480, width/6, height/5);
    image(imgCommunitycentre, 615, 200, width/7, height/6);
    image(imgBushub, 810, 50, width/7, height/6); 
    //rectMode(CENTER);
    //rect(100,620,20,20);
    //  updatePeople();
    //  drawPeople();
  }
}

void setupRoads() {
  /////////////////all roads
  allRoads.add(new Road(40, 580, 60, 100, 350, PI/2, "road", "left"));
  allRoads.add(new Road(40, 580, 60, 140, 350, 3*PI/2, "road", "right"));
  allRoads.add(new Road(964, 40, 60, 478, 580, PI, "road", "right"));
  allRoads.add(new Road(964, 40, 60, 478, 620, 0, "road", "left"));
  allRoads.add(new Road(1000, 40, 60, 500, 80, PI, "road", "left"));
  allRoads.add(new Road(1000, 40, 60, 500, 120, 0, "road", "right"));
  allRoads.add(new Road(40, 550, 60, 900, 350, PI/2, "road", "right"));
  allRoads.add(new Road(40, 550, 60, 940, 350, 3*PI/2, "road", "left"));
  allRoads.add(new Road(40, 650, 60, 480, 450, PI/2, "road", "right"));
  allRoads.add(new Road(40, 650, 60, 520, 450, 3*PI/2, "road", "left"));
  /////////////////Intersections coordinations
  allRoads.add(new Road(80, 80, 60, 500, 600, "intersection"));
  allRoads.add(new Road(80, 80, 60, 500, 100, "intersection"));
  allRoads.add(new Road(80, 80, 60, 120, 600, "intersection"));
  allRoads.add(new Road(80, 80, 60, 120, 100, "intersection"));
  allRoads.add(new Road(80, 80, 60, 920, 100, "intersection"));
  allRoads.add(new Road(80, 80, 60, 920, 600, "intersection"));

  /////////////////Curve
  allRoads.add(new Road(80, 80, 60, 881, 559, "curve"));
}

void updateCars() {
  for (int i = 0; i < allCars.size(); i++) {
    allCars.get(i).moveVehicle();
    allCars.get(i).turn();
    if (allCars.get(i).despawn == true || allCars.get(i).checkOffScreen() == true) {
      allCars.remove(i);
    }
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

void drawMap() {
  ////////////////////////// Roads
  for (int i = 0; i < allRoads.size(); i++) {
    if (allRoads.get(i).checkType() == "road") {
      allRoads.get(i).drawRoad();
    } else if (allRoads.get(i).checkType() == "intersection") {
      allRoads.get(i).drawIntersection();
    } else if (allRoads.get(i).checkType() == "curve") {
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

void spawnCar() {
  allCars.add(new Car(0, 120, color(random(100, 255), random(100, 255), random(0, 255)), 5, 10, 10, 10, 10, 0));
}
