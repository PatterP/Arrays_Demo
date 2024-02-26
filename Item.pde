// Item uses button class as template for on click events
class Item extends Button {

  boolean isClicked = false;
  boolean isMoving = false;
  boolean inBox = false;

  float defaultX, defaultY;

  Item(PImage image, float x, float y) {
    super(x, y);
    this.size.x = image.width;
    this.size.y = image.height;
    this.image = image;

    defaultX = x;
    defaultY = y;
  }

  void update() {

    if (inBox == false)
      isClicked = mouseHasBeenPressed();

    // Allows the item to move
    if (isMoving) {
      this.position.x = mouseX - size.x/2;
      this.position.y = mouseY - size.y/2;
    }
  }
}
