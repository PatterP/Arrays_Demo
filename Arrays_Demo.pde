// Import of the minim class for sound effects
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;

Title title;
MiniGame minigame;
HighScores highScores;

// Variable used for debugging and math
float x;


// States for mouse input
boolean leftPressed = false;
boolean rightPressed = false;
boolean prevLeftPressed = false;
boolean prevRightPressed = false;

PFont font;

//int enemyCounter;

String dialogue = "";
float timer = 0;
int i = 0;

void setup() {
  size(1920, 1080); // Sets window dimensions

  minim = new Minim(this);

  // Creates and loads a font
  font = createFont("Ink Free", 16);
  textFont(font);

  //println(PFont.list());

  title = new Title();
}

// Draws and updates everything on the screen for every game tick
void draw() {

  background(255);

  // Draws each screen of the game when they are loaded
  if ( title != null) {
    minigame = null;
    highScores = null;

    title.update();

    title.draw();
  }

  if ( minigame != null) {
    title = null;
    //gameOver = null;

    minigame.update();

    minigame.draw();
  }

  if ( highScores != null) {
    title = null;
    minigame = null;

    highScores.update();

    highScores.draw();
  }

  //if ( gameOver != null) {
  //  theme.pause();
  //  theme.rewind();
  //  gameOver.update();

  //  gameOver.draw();
  //}

  // Ends the game
  //if (level != null) {
  //  if (player.health < 1 || enemyCounter < 1) {
  //    gameOver = new GameOver();

  //    level = null;
  //  }
  //}

  // Updates inputs for keyboard and mouse
  Keyboard.update();

  prevLeftPressed = leftPressed;
  prevRightPressed = rightPressed;
}

void dynamicText(String input, color hue, float xPos, float yPos, float speed) {

  // This splits the sentence into words
  String[] list = split(input, " ");

  timer += 0.5;
  println(i);

  if (timer > speed && i < list.length) {
    dialogue += " " + list[i]; // I stumbled upon this by complete accident lmao!!!

    i++;
    timer = 0;
  }

  fill(hue);

  text(dialogue, xPos, yPos);
}

void keyPressed() {
  Keyboard.handleKeyDown(keyCode);
}

void keyReleased() {
  Keyboard.handleKeyUp(keyCode);
}

void mousePressed() {
  if (mouseButton == LEFT) leftPressed = true;
  if (mouseButton == RIGHT) rightPressed = true;
}

void mouseReleased() {
  if (mouseButton == LEFT) leftPressed = false;
  if (mouseButton == RIGHT) rightPressed = false;
}
