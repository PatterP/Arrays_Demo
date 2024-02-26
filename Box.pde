// Box uses button class as template for on click events
class Box extends Button {

  Item contents[];
  int contentCounter = 0;

  Box(PImage image, float x, float y, int arrSize) {
    super(x, y);
    this.size.x = image.width;
    this.size.y = image.height;
    this.image = image;

    contents = new Item[arrSize];

    for (int i = 0; i < contents.length; i++) {
      contents[i] = null;
    }
  }

  void update() {
    super.update();
  }
}
