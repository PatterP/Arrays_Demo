// Screen states
Title title;
MiniGame minigame;
HighScores highScores;
Learn learn;

// States for mouse input
boolean leftPressed = false;
boolean rightPressed = false;
boolean prevLeftPressed = false;
boolean prevRightPressed = false;

// Font used for the game
PFont font;

// Variables used for the typewriter to function
String dialogue1 = "";
String dialogue2 = "";
String dialogue3 = "";
float timer = 0;
int i = 0;
int j = 0;
int k = 0;
boolean done1 = false;
boolean done2 = false;
boolean done3 = false;

// Player score
int score = 0;

// Arrays to store high scores
String users[];
int scores[];

PImage background;

void setup() {
  size(1920, 1080); // Sets window dimensions

  // Creates and loads a font
  font = createFont("Calibri", 16);
  textFont(font);

  title = new Title();

  // Loads high scores
  users = loadStrings("Users.txt");
  scores = int(loadStrings("Scores.txt"));
}

// Draws and updates everything on the screen for every game tick
void draw() {

  background(125);

  // Draws each screen of the game when they are loaded
  if (title != null) {
    minigame = null;
    highScores = null;
    learn = null;
    score = 0;

    title.update();

    title.draw();
  }

  if (minigame != null) {
    title = null;
    highScores = null;
    learn = null;

    minigame.update();

    minigame.draw();
  }

  if (highScores != null) {
    title = null;
    minigame = null;
    learn = null;

    highScores.update();

    highScores.draw();
  }

  if (learn != null) {
    minigame = null;
    highScores = null;
    title = null;
    score = 0;

    learn.update();

    learn.draw();
  }

  // Updates inputs for keyboard and mouse
  Keyboard.update();

  prevLeftPressed = leftPressed;
  prevRightPressed = rightPressed;
}

// Typewriter effect split into 3 functions, 1 for each line user
// Code created with assistance from Phil Nyugen
void dynamicText1(String input, color hue, float xPos, float yPos, float speed) {

  // This splits the sentence into words
  String[] list = split(input, " ");

  timer += 0.5;
  //println(i);

  if (timer > speed && i < list.length) {
    dialogue1 += " " + list[i]; // I stumbled upon this by complete accident lmao!!!

    i++;
    timer = 0;
  } else if (i >= list.length) {
    done1 = true;
  }

  fill(hue);

  text(dialogue1, xPos, yPos);
}

void dynamicText2(String input, color hue, float xPos, float yPos, float speed) {

  // This splits the sentence into words
  String[] list = split(input, " ");

  timer += 0.5;
  //println(i);

  if (timer > speed && j < list.length) {
    dialogue2 += " " + list[j]; // I stumbled upon this by complete accident lmao!!!

    j++;
    timer = 0;
  } else if (j >= list.length) {
    done2 = true;
  }

  fill(hue);

  text(dialogue2, xPos, yPos);
}

void dynamicText3(String input, color hue, float xPos, float yPos, float speed) {

  // This splits the sentence into words
  String[] list = split(input, " ");

  timer += 0.5;
  //println(i);

  if (timer > speed && k < list.length) {
    dialogue3 += " " + list[k]; // I stumbled upon this by complete accident lmao!!!

    k++;
    timer = 0;
  } else if (k >= list.length) {
    done3 = true;
  }

  fill(hue);

  text(dialogue3, xPos, yPos);
}

// Clears typewriter for a new page
void clearDynamicText() {
  dialogue1 = "";
  done1 = false;
  i = 0;

  dialogue2 = "";
  done2 = false;
  j = 0;

  dialogue3 = "";
  done3 = false;
  k = 0;
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

  if (minigame != null) {
    minigame.mousePressed();
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) leftPressed = false;
  if (mouseButton == RIGHT) rightPressed = false;
}
