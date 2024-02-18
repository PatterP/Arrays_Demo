class Item extends Button {

  boolean isClicked = false;
  boolean isMoving = false;
  boolean inBox = false;

  float defaultX, defaultY;

  Item(PVector size, float x, float y) {
    super(x, y);
    this.size = size;

    defaultX = x;
    defaultY = y;
  }

  void update() {

    isClicked = mouseHasBeenPressed();

    if (isClicked)
      isMoving = endMove();

    if (isMoving) {
      this.position.x = mouseX - size.x/2;
      this.position.y = mouseY - size.y/2;
    } else {
    }
  }

  boolean endMove() {

    if (isMoving)
      return false;


    return true;
  }
}
