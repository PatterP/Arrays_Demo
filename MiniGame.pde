class MiniGame {

  Box box1;
  Box box2;
  Box box3;

  MiniGame() {

    // Sets location and contents of buttons
    box1 = new Box(new PVector(50, 50), width/2 - 50, height - 200);
    box2 = new Box(new PVector(50, 50), width/2 - 150, height - 200);
    box3 = new Box(new PVector(50, 50), width/2 + 50, height - 200);


    //titleCard = (loadImage("TitleCard.png"));
  }

  void update() {
    
    box1.update();
    box2.update();
    box3.update();
    
    buttonPressed();
  }

  void draw() {
    
    box1.draw();
    box2.draw();
    box3.draw();
    
  }

  // Switches screen based on button input
  void buttonPressed() {
  }
}
