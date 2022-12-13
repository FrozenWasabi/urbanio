/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void gui_draw(PApplet appc, GWinData data) { //_CODE_:gui_elements:668838:
  appc.background(230);
} //_CODE_:gui_elements:668838:

public void pausedButton_clicked(GButton source, GEvent event) { //_CODE_:pauseButton:486533:
  paused = !paused;
  if (pauseButton.getText().equals("Pause")) {
    pauseButton.setText("Resume");
    pauseButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  } else {
    pauseButton.setText("Pause"); 
    pauseButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  }
} //_CODE_:pauseButton:486533:

public void clear_click1(GButton source, GEvent event) { //_CODE_:clear:869121:
  setupVehicleArrays();
} //_CODE_:clear:869121:

public void timeOfDay_change1(GSlider source, GEvent event) { //_CODE_:timeOfDay:834892:
  println("timeOfDay - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:timeOfDay:834892:

public void spawnBus_click1(GButton source, GEvent event) { //_CODE_:spawnBus:744922:
  println("spawnBus - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:spawnBus:744922:

public void spawnCar_click1(GButton source, GEvent event) { //_CODE_:spawnCar:798203:
  allCars.add(new Car(0, 120, color(random(100, 255), random(100, 255), random(0, 255)), 5, 10, 10, 10, 10, 0));
} //_CODE_:spawnCar:798203:

public void demand_slider1_change1(GCustomSlider source, GEvent event) { //_CODE_:demand_slider1:569200:
  println("demand_slider1 - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:demand_slider1:569200:

public void bustolerance_slider1_change1(GCustomSlider source, GEvent event) { //_CODE_:tolerance_slider1:686281:
  println("tolerance_slider1 - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:tolerance_slider1:686281:

public void capacity_slider1_change1(GCustomSlider source, GEvent event) { //_CODE_:capacity_slider1:756224:
  println("capacity_slider1 - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:capacity_slider1:756224:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  gui_elements = GWindow.getWindow(this, "gui_elements", 0, 0, 400, 400, JAVA2D);
  gui_elements.noLoop();
  gui_elements.setActionOnClose(G4P.KEEP_OPEN);
  gui_elements.addDrawHandler(this, "gui_draw");
  pauseButton = new GButton(gui_elements, 210, 70, 60, 20);
  pauseButton.setText("Pause");
  pauseButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  pauseButton.addEventHandler(this, "pausedButton_clicked");
  clear = new GButton(gui_elements, 310, 70, 60, 20);
  clear.setText("Clear");
  clear.addEventHandler(this, "clear_click1");
  time = new GLabel(gui_elements, 50, 60, 80, 20);
  time.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  time.setText("Time:");
  time.setOpaque(false);
  timeOfDay = new GSlider(gui_elements, 10, 80, 160, 50, 10.0);
  timeOfDay.setShowValue(true);
  timeOfDay.setLimits(12, 0, 24);
  timeOfDay.setNbrTicks(24);
  timeOfDay.setStickToTicks(true);
  timeOfDay.setNumberFormat(G4P.INTEGER, 0);
  timeOfDay.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  timeOfDay.setOpaque(false);
  timeOfDay.addEventHandler(this, "timeOfDay_change1");
  spawnBus = new GButton(gui_elements, 320, 160, 30, 30);
  spawnBus.setIcon("bus_icon.png", 1, GAlign.EAST, GAlign.CENTER, GAlign.MIDDLE);
  spawnBus.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  spawnBus.addEventHandler(this, "spawnBus_click1");
  label1 = new GLabel(gui_elements, 300, 130, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Spawn Bus");
  label1.setOpaque(false);
  spawnCar = new GButton(gui_elements, 230, 160, 30, 30);
  spawnCar.setIcon("car_icon.png", 1, GAlign.EAST, GAlign.CENTER, GAlign.MIDDLE);
  spawnCar.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  spawnCar.addEventHandler(this, "spawnCar_click1");
  label2 = new GLabel(gui_elements, 200, 130, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Spawn Car");
  label2.setOpaque(false);
  demand_slider1 = new GCustomSlider(gui_elements, 40, 180, 100, 50, "red_yellow18px");
  demand_slider1.setShowValue(true);
  demand_slider1.setLimits(1, 0, 100);
  demand_slider1.setNbrTicks(100);
  demand_slider1.setNumberFormat(G4P.INTEGER, 0);
  demand_slider1.setOpaque(false);
  demand_slider1.addEventHandler(this, "demand_slider1_change1");
  demandlbl = new GLabel(gui_elements, 50, 150, 80, 20);
  demandlbl.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  demandlbl.setText("Bus Demand");
  demandlbl.setLocalColorScheme(GCScheme.RED_SCHEME);
  demandlbl.setOpaque(false);
  tolerance_slider1 = new GCustomSlider(gui_elements, 40, 270, 100, 50, "red_yellow18px");
  tolerance_slider1.setShowValue(true);
  tolerance_slider1.setLimits(5, 0, 10);
  tolerance_slider1.setNbrTicks(10);
  tolerance_slider1.setNumberFormat(G4P.INTEGER, 0);
  tolerance_slider1.setOpaque(false);
  tolerance_slider1.addEventHandler(this, "bustolerance_slider1_change1");
  label3 = new GLabel(gui_elements, 20, 250, 130, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Delay Tolerance");
  label3.setOpaque(false);
  capacity_slider1 = new GCustomSlider(gui_elements, 200, 240, 170, 90, "grey_blue");
  capacity_slider1.setShowValue(true);
  capacity_slider1.setLimits(5, 1, 10);
  capacity_slider1.setNumberFormat(G4P.INTEGER, 0);
  capacity_slider1.setLocalColorScheme(GCScheme.RED_SCHEME);
  capacity_slider1.setOpaque(false);
  capacity_slider1.addEventHandler(this, "capacity_slider1_change1");
  label4 = new GLabel(gui_elements, 240, 240, 80, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Bus Capacity");
  label4.setOpaque(false);
  gui_elements.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow gui_elements;
GButton pauseButton; 
GButton clear; 
GLabel time; 
GSlider timeOfDay; 
GButton spawnBus; 
GLabel label1; 
GButton spawnCar; 
GLabel label2; 
GCustomSlider demand_slider1; 
GLabel demandlbl; 
GCustomSlider tolerance_slider1; 
GLabel label3; 
GCustomSlider capacity_slider1; 
GLabel label4; 
