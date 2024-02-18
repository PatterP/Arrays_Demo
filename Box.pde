class Box extends Button {

  Item contents[];
  int contentCounter = 0;

  Box(PVector size, float x, float y, int arrSize) {
    super(x, y);
    this.size = size;

    contents = new Item[arrSize];

    for (int i = 0; i < contents.length; i++) {
      contents[i] = null;
    }
  }

  void update() {
    super.update();
  }
}
