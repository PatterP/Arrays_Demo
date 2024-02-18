// Button class for interactable buttons
class Button {

  // The position of the button's top left corner
  PVector position = new PVector();
  PVector size = new PVector(100 * 3, 35 * 3);

  String text; // Default text for the button class

  // Button constructor
  Button(float x, float y, String content) {
    position.x = x;
    position.y = y;
    text = content;
  }

  Button(float x, float y) {
    position.x = x;
    position.y = y;
  }

  void update() {
    // Updates the button based on the mouse's actions
    mouseIsOver();
    mouseHasBeenPressed();
  }

  void draw() {

    if (mouseIsOver() == true)
      fill(102, 0, 0); // Makes the button green when the mouse is hovered over
    else
      fill(0); // Makes the button gray
    rect(position.x, position.y, size.x, size.y);

    // Creates the text of the button
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(48);
    if (text != null)
      text(text, position.x + size.x/2, position.y + size.y/2);
  }

  boolean mouseIsOver() {

    if (mouseX < position.x)
      return false; // The Mouse is to the left of the button
    if (mouseX > position.x + size.x)
      return false; // The Mouse is to the right of the button
    if (mouseY < position.y)
      return false; // The Mouse is to the left of the button
    if (mouseY > position.y + size.y)
      return false; // The Mouse is to the right of the button

    return true;
  }

  // Checks to see if the mouse was pressed on the button
  boolean mouseHasBeenPressed() {
    if (mouseIsOver() == true && leftPressed)
      return true;

    return false;
  }
}
