class Item extends Button {

  boolean isClicked = false;
  boolean isMoving = false;
  boolean inBox = false;

  Item(PVector size, float x, float y) {
    super(x, y);
    this.size = size;
  }

  void update() {

    isClicked = mouseHasBeenPressed();

    if (isClicked)
      isMoving = endMove();

    if (isMoving) {
      this.position.x = mouseX - size.x/2;
      this.position.y = mouseY - size.y/2;
    }
  }

  boolean endMove() {

    if (isMoving)
      return false;

    return true;
  }
}
