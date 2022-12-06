void keyPressed() {
  if (key == 'a') {
    allCars.get(0).turningRight = true;
  }
  if (key == 's') {
    allCars.get(0).turningLeft = true;
  }
  if (key == 'd') {
    allCars.add(new Car(300, 120, 60, 20, red, 5, 10, 10, 10, 10, 0));
  }
}
