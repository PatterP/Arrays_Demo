class MiniGame {

  Box box1;
  //Box box2;
  //Box box3;

  Item item;

  MiniGame() {

    // Sets location and contents of buttons
    box1 = new Box(new PVector(50, 50), width/2 - 50, height - 200);
    //box2 = new Box(new PVector(50, 50), width/2 - 150, height - 200);
    //box3 = new Box(new PVector(50, 50), width/2 + 50, height - 200);

    item = new Item(new PVector(50, 50), width/2, height/2);


    //titleCard = (loadImage("TitleCard.png"));
  }

  void update() {

    box1.update();
    //box2.update();
    //box3.update();

    if (item.inBox == false)
      item.update();

    checkBox();
    
    buttonPressed();
  }

  void draw() {

    box1.draw();
    //box2.draw();
    //box3.draw();

    if (item.inBox == false)
      item.draw();
  }

  // Switches screen based on button input
  void buttonPressed() {
  }

  void checkBox() {
    if (item.isMoving) {
      if (box1.mouseHasBeenPressed())
        item.inBox = true;
    }
  }
}
