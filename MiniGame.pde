class MiniGame {

  // Arrays containing items and boxes
  Item items[] = new Item[7];
  Box boxes[] = new Box[3];


  Button nextButton;

  MiniGame() {

    // Creates boxes of random size
    int randSize = (int)random (2, 5);
    if (randSize % 2 != 0)
      randSize++;
    boxes[0] = new Box(loadImage("Box.png"), width/2 - 50, height - 200, randSize);

    randSize = (int)random (2, 5);
    if (randSize % 2 != 0)
      randSize++;
    boxes[1] = new Box(loadImage("Box.png"), width/2 - 350, height - 200, randSize);

    randSize = (int)random (2, 5);
    if (randSize % 2 != 0)
      randSize++;
    boxes[2] = new Box(loadImage("Box.png"), width/2 + 250, height - 200, randSize);

    // Creates items
    items[0] = new Item(loadImage("AlarmClock.png"), width - 550, 425);
    items[1] = new Item(loadImage("Bed.png"), 670, 510);
    items[2] = new Item(loadImage("Table.png"), 1130, 590);
    items[3] = new Item(loadImage("Lamp.png"), 1155, 450);
    items[4] = new Item(loadImage("TallLamp.png"), 375, 315);
    items[5] = new Item(loadImage("Dresser.png"), width - 580, 490);
    items[6] = new Item(loadImage("TrashBin.png"), width - 150, 725);

    //titleCard = (loadImage("TitleCard.png"));

    // Resets score
    score = 0;

    nextButton = new Button(width - 325, height - height/9, "Finished");

    background = (loadImage("Room.png"));
    //background = (loadImage("Background.png"));
  }

  void update() {

    for (Box box : boxes) {
      box.update();
    }

    for (Item item : items) {
      if (item.inBox == false)
        item.update();
    }

    nextButton.update();

    buttonPressed();
  }

  void draw() {

    image(background, 0, 0);

    // Box that contains UI
    fill(255);
    stroke(0);
    strokeWeight(8);
    rect(0, height - height/5, width, height/5);

    nextButton.draw();

    for (Box box : boxes) {
      box.draw();
    }

    for (Item item : items) {
      if (item.inBox == false)
        item.draw();
    }

    checkBox();
  }

  // Switches screen based on button input
  void buttonPressed() {
    if (nextButton.mouseHasBeenPressed() == true) {
      highScores = new HighScores();
    }
  }

  // Shows a counter of the box's contents
  void checkBox() {
    for (Box box : boxes) {
      if (box.mouseIsOver()) {
        fill(0);
        textAlign(CENTER, CENTER);
        textSize(24);
        text(box.contentCounter + "/" + box.contents.length, box.position.x + box.size.x/2, box.position.y + box.size.y/2 + 100);
      }
    }
  }

  void mousePressed() {
    // Moves the item
    for (Item item : items) {
      if (item.mouseIsOver() && item.isMoving == false) {
        item.isMoving = true;
        //println(item.isMoving);
        return;
      } // Deposits the item in the box
      else if (item.mouseIsOver() && item.isMoving == true) {
        for (Box box : boxes) {
          if (box.mouseIsOver() && box.contentCounter < box.contents.length) {
            for (int i = 0; i < box.contents.length; i++) {
              if (box.contents[i] == null) {
                box.contents[i] = item;
                break;
              }
            }
            item.inBox = true;
            score += (box.contents.length/2.0 * 100);
            box.contentCounter++;
            if (box.contentCounter >= box.contents.length)
              score += (2.0/box.contents.length * 1000);
            //println(score);
          }
        }
        // Resets position of item
        item.isMoving = false;
        item.position.x = item.defaultX;
        item.position.y = item.defaultY;
        //println(item.isMoving);
        return;
      }
    }
    // Empties the box
    for (Box box : boxes) {
      if (box.mouseIsOver() && box.contentCounter > 0) {
        for (int i = 0; i < box.contents.length; i++) {
          if (box.contents[i] != null) {
            box.contents[i].inBox = false;
            box.contents[i] = null;
          }
        }
        score -= (box.contents.length/2.0 * 100) * box.contentCounter;
        score -= (2.0/box.contents.length * 1000);
        box.contentCounter = 0;
      }
    }
  }
}
