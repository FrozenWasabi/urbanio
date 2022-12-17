void keyPressed() {
  if (key == 'a') {
    allCars.get(0).turningRight = true;
  }
  if (key == 's') {
    allCars.get(0).turningLeft = true;
  }
  if (key == 'd') {
    spawnCar();
  }
  if (key == 'f') {
    allBuses.add(new Bus(300, 620, 90, 30, blue, 5, 10, 10, 10, 10, 0));
  }
}
