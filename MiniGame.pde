class MiniGame {

  Box box1;
  Box box2;
  Box box3;

  Item item1;
  Item item2;
  Item item3;
  Item item4;

  Item items[] = new Item[3];
  Box boxes[] = new Box[3];

  Box box;
  Item item;

  MiniGame() {

    // Sets location and contents of buttons
    box1 = new Box(new PVector(50, 50), width/2 - 50, height - 200, 16);
    box2 = new Box(new PVector(50, 50), width/2 - 150, height - 200, 6);
    box3 = new Box(new PVector(50, 50), width/2 + 50, height - 200, 10);

    boxes[0] = box1;
    boxes[1] = box2;
    boxes[2] = box3;

    item1 = new Item(new PVector(50, 50), width/2 - 150, height/2);
    item2 = new Item(new PVector(50, 50), width/2 - 50, height/2);
    item3 = new Item(new PVector(50, 50), width/2 + 50, height/2);

    items[0] = item1;
    items[1] = item2;
    items[2] = item3;

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
      if (box.mouseIsOver()) {
        fill(0);
        textAlign(CENTER, CENTER);
        textSize(24);
        text(box.contentCounter + "/" + box.contents.length, box.position.x + box.size.x/2, box.position.y + box.size.y/2 + 50);
      }
    }
  }

  void mousePressed() {
    for (Item item : items) {
      if (item.mouseIsOver() && item.isMoving == false) {
        item.isMoving = true;
        //println(item.isMoving);
        return;
      } else if (item.mouseIsOver() && item.isMoving == true) {
        for (Box box : boxes) {
          if (box.mouseIsOver()) {
            for (int i = 0; i < box.contents.length; i++) {
              if (box.contents[i] == null) {
                box.contents[i] = item;
                break;
              }
            }
            item.inBox = true;
            box.contentCounter++;
          }
        }
        item.isMoving = false;
        item.position.x = item.defaultX;
        item.position.y = item.defaultY;
        //println(item.isMoving);
        return;
      }
    }
    for (Box box : boxes) {
      if (box.mouseIsOver() && box.contentCounter > 0) {
        for (int i = 0; i < box.contents.length; i++) {
          if (box.contents[i] != null) {
            box.contents[i].inBox = false;
            box.contents[i] = null;
          }
        }
        box.contentCounter = 0;
      }
    }
  }
}
