class MiniGame {

  Box box1;
  Box box2;
  Box box3;

  Item item1;
  Item item2;
  Item item3;
  Item item4;

  Item items[] = new Item[4];
  Box boxes[] = new Box[3];

  MiniGame() {

    // Sets location and contents of buttons
    box1 = new Box(new PVector(50, 50), width/2 - 50, height - 200, 16);
    box2 = new Box(new PVector(50, 50), width/2 - 150, height - 200, 6);
    box3 = new Box(new PVector(50, 50), width/2 + 50, height - 200, 10);

    boxes[0] = box1;
    boxes[1] = box2;
    boxes[2] = box3;

    item1 = new Item(new PVector(50, 50), width/2, height/2);
    item2 = new Item(new PVector(50, 50), width/2 - 100, height/2);
    item3 = new Item(new PVector(50, 50), width/2 - 200, height/2);
    item4 = new Item(new PVector(50, 50), width/2 - 300, height/2);

    items[0] = item1;
    items[1] = item2;
    items[2] = item3;
    items[3] = item4;

    //titleCard = (loadImage("TitleCard.png"));
  }

  void update() {

    for (Box box : boxes) {
      box.update();
    }



    for (Item item : items) {
      if (item.inBox == false)
        item.update();
    }

    checkBox();

    buttonPressed();
  }

  void draw() {

    for (Box box : boxes) {
      box.draw();
    }

    for (Item item : items) {
      if (item.inBox == false)
        item.draw();
    }
  }

  // Switches screen based on button input
  void buttonPressed() {
  }

  void checkBox() {

    for (Box box : boxes) {
      for (Item item : items) {
        // Stores item in the selected box
        if (box.mouseIsOver() && item.mouseHasBeenPressed()) {
          item.position.x = item.defaultX;
          item.position.y = item.defaultY;

          for (int i = 0; i < box.contents.length; i++) {
            if (box.contents[i] == null) {
              box.contents[i] = item;
              item.inBox = true;
              //println(box1.contents[i]);
              box.contentCounter++;
              break;
            }
          }
        }

        // Removes all items from the selected box

d

        // Places Item back into default location

        else if ((item.mouseIsOver() && !item.mouseHasBeenPressed()) || (!item.mouseIsOver() && !item.mouseHasBeenPressed())) { // When the mouse no longer touching the item or mouse press is off
          item.position.x = item.defaultX;
          item.position.y = item.defaultY;
        }
        // Shows the number of items stored in a box
        if (box.mouseIsOver()) {
          fill(0);
          textAlign(CENTER, CENTER);
          textSize(24);
          text(box.contentCounter + "/" + box.contents.length, box.position.x + box.size.x/2, box.position.y + box.size.y/2 + 50);
        }
      }
    }
  }
}
