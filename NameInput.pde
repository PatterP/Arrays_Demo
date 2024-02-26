// Specific button used to input intials for high scores
class NameInput extends Button {

  String alphabet[] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
  int index = 0;

  NameInput(float x, float y) {
    super(x, y);
    this.size = new PVector(50, 50);
    this.text = alphabet[0];
  }

  void update() {
    super.update();

    if (mouseHasBeenPressed()) {
      index++;

      if (index > 25) {
        index = 0;
      }
    }
    text = alphabet[index];
  }
}
