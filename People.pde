class Person {

// fields
   color personColour; 
   float paitenceLevel;
   boolean behindPerson;   
   
   Person(float pL){
     this.personColour = (55);
     this.paitenceLevel = pL;
     this.behindPerson = false;
   }
   
   void waitSpawn(BusStop a){
     a.waitPeople ++;
     fill( this.personColour);
     if (a.side == "Right"){
     ellipse(a.xCenter+55*a.waitPeople,a.yCenter,30,30);
     }
     else {
     ellipse(a.xCenter-55*a.waitPeople,a.yCenter,30,30);
     }
   }
   
   void debarkSpawn(BusStop a){
     fill(this.personColour);
     ellipse(a.xCenter,a.yCenter+75,30,30);
     debarkDespawn(a);
   }
   
   
   //void boardBus(Bus a){
   //  a.Passengers ++;
   //  waitDespawn(a);
   //}
   
   void debarkDespawn(BusStop a){
     fill(background);
     ellipse(a.xCenter,a.yCenter+75,30,30);
   }

   void waitDespawn(BusStop a){
     fill(background);
     if (a.side == "Right"){
     ellipse(a.xCenter+55*a.waitPeople,a.yCenter,30,30);
     }
     else {
     ellipse(a.xCenter-55*a.waitPeople,a.yCenter,30,30);
     }
   }
   
   //void debarkBus(Bus a, BusStop b){
   //  a.Passengers --;
   //  debarkSpawn(b);     
   //}
   
   void moveUpLine(BusStop a){
     fill(this.personColour);
     ellipse(a.xCenter,a.yCenter-55,30,30);
   }
   
   void becomeAgitated(BusStop a){
     fill(255,255,0);
     if (a.side == "Right"){
     ellipse(a.xCenter+55*a.waitPeople,a.yCenter,30,30);
     }
     else {
     ellipse(a.xCenter-55*a.waitPeople,a.yCenter,30,30);
     }
   }
   
    void madLeave(BusStop a){
     fill(255,0,0);
     if (a.side == "Right"){
     ellipse(a.xCenter+55*a.waitPeople,a.yCenter,30,30);
     }
     else {
     ellipse(a.xCenter-55*a.waitPeople,a.yCenter,30,30);
     }
     waitDespawn(a);
   }
   
}
