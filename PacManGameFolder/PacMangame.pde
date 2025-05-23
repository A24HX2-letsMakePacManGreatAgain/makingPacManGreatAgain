import gifAnimation.*;
import processing.sound.*;

String gameState; // String for at vide hvilken 'page' man er på.

PacMan pacman;
Ghost ghost;
speedUpgrade speedy = new speedUpgrade();
wtwUpgrade wally = new wtwUpgrade();
healthUpgrade health = new healthUpgrade();
berryDurationIncrease BDI = new berryDurationIncrease(); // Alle vores classes.

//BILLEDER
PImage pac; // Pacman's billede
Gif pacMovingLeft; // Pacman's billede når han bevæger sig til venstre.
Gif pacMovingRight; // Pacman's billede når han bevæger sig til højre.
Gif pacMovingDown; // Pacman's billede når han bevæger sig ned.
Gif pacMovingUp; // Pacman's billede når han bevæger sig op.
PImage radRobert; // Billede af shopkeeper'en
PImage shopBackground; // Billede til baggrunden af shoppen.
PImage coin; // billede til coins'ne.
PImage berryUpgrade;
PImage wtwUpg;
PImage healthUpg;
PImage speedUpg;
PImage brick; //billede af væg
PImage dirt; //billede af baggrund
PImage redGhost;
PImage blueGhost;
PImage pinkGhost;
PImage purpleGhost;
PImage coinMultiplierimg;

public int[] levelSize = {28, 32}; // En int array for at holde på størrelsen af spillebrættet. Tallene er i X,Y format.

float gridSize = 24;
int nCoins = 120; // Tester-værdi til coins.
int coinMultiplier = 1;
boolean chaseStarted;

boolean introPlayed = false;
boolean hoverPlay = false;
boolean hoverShop = false;
boolean hoverQuit = false;

SoundFile coinSound;
SoundFile introSound;
SoundFile buttonSound;

void setup()
{
  size(224*3, 288*3);
  frameRate(30);
  textSize(30);
  
  //til lyden brugte vi lige chatbot til at finde ud af hvordan opstillingen fungerede ellers ikke
  // ——— Lyd ———
  coinSound = new SoundFile(this, "pacman_chomp.wav");
  coinSound.amp(0.5);
   
  buttonSound = new SoundFile(this, "pixel-sound-effect-5-103221.wav");
  introSound = new SoundFile(this, "pacman_beginning.wav");
  
  initializePictures();

  gameState = "Main menu";
  pacman = new PacMan();
  ghost = new Ghost(redGhost);
  
  chaseStarted = false;
  pathfindingPreparation();
}

void draw()
{
  if (gameState == "Main menu")
  {
    if (!introPlayed && !introSound.isPlaying())
    {
      introSound.play();
      introPlayed = true;
    }
    drawMenu();
  } 
  else if (gameState == "Playing")
  {
    playingLogistics(); 
  } 
  else if (gameState == "Shop")
  {
    drawShop();
  }
}

void initializePictures() 
{
  // Her har vi alle initialiseringer for gifs
  pacMovingLeft = new Gif(this, "JohnPackageManMovingLeft.gif");
  pacMovingRight = new Gif(this, "JohnPackageManMovingRight.gif");
  pacMovingDown = new Gif(this, "JohnPackageManMovingDown.gif");
  pacMovingUp = new Gif(this, "JohnPackageManMovingUp.gif");
  pacMovingRight.loop();
  pacMovingLeft.loop();
  pacMovingDown.loop();
  pacMovingUp.loop();
  
  // Her har vi alle initialiseringerne for billederne.
  pac = loadImage("JohnPackageMan.png");
  redGhost = loadImage("redGhost.png");
  pinkGhost = loadImage("pinkGhost.png");
  blueGhost = loadImage("blueGhost.one");
  purpleGhost = loadImage("purpleGhost.png");
  radRobert = loadImage("ratRobert.png");
  shopBackground = loadImage("shopBackground.png");
  coin = loadImage("coin.png");
  berryUpgrade = loadImage("berryUpgrade.png");
  wtwUpg = loadImage("wtwUpgrade.png");
  healthUpg = loadImage("healthUpgrade.png");
  speedUpg = loadImage("speedUpgrade.png");
  brick = loadImage ("brick.png");
  dirt = loadImage ("dirt.png");
  coinMultiplierimg = loadImage("coinMultiplier.png");
}

void playingLogistics() 
{
  stroke(#000000);
  strokeWeight(1);
  textSize(30);
  background(207); // Disse er her da disse ting ændres i nogle af funktionerne, så de skal lige tages tilbage til normal.
 
  drawGrid();
  drawElements();
  drawNavbarPlaying();
  changeLevel();

  pacman.keyReleased();
  pacman.drawPac();
  pacman.checkForBuffs();

  ghost.move();
  ghost.drawGhost();
  ghostChaseStarter();
}

void drawGrid()
{ 
  for (int i = 1; i <= 28; i++)
  {
    line(gridSize*i, 0, gridSize*i, height); // Tegner de lodrette linjer.
  }
  for (int i = 1; i <= 32; i++)
  {
    line(0, gridSize*i + 96, width, gridSize*i + 96); // Tegner de vandrette linjer.
  }
}

void drawElements()
{
  for (int y = 0; y < 32; y++)
  {
    for (int x = 0; x < 28; x++)
    {
      image(dirt, gridSize * x, gridSize * y + 96, gridSize, gridSize); // tegner baggrundet
      char element = playingBoard2[y][x];
      switch(element)
      {
      case 'c':
        image(coin, gridSize * x, gridSize * y + 96, gridSize, gridSize); //tegner coins
        break;
      case 'w':
        image(brick, gridSize * x, gridSize * y + 96, gridSize, gridSize); // tegner væg
        break;
      case 'b':
        image(berryUpgrade, gridSize * x, gridSize * y + 96, gridSize, gridSize); // tegner bær
        break;
      }
    }
  }
}

void drawNavbarPlaying()
{
  strokeWeight(2);
  stroke(#000000);
  fill(#33397d);
  rect(0, 0, width - 1, 96);

  image(coin, -20, -15);
  fill(#ffffff);
  textSize(20);
  text(nCoins + " coins", 70, 40);
  text("Multiplier: " + coinMultiplier, 40, 85);
  coinMultiplierimg.resize(60, 60);
  image(coinMultiplierimg, -8, 52);
  
  textSize(55);
  fill(#ff0000);
  text("PAC-MAN", 225, 60);
  textSize(23);
  fill(#000000);
  text("Level " + (currentLevel+1), 290, 86);

  textSize(30);
  fill(#232754);
  rect(width - 180, 17, 150, 60, 10);
  fill(#ff0000);
  text("Return", width - 148, 55);

  if ((mouseX >= width-180 && mouseX <= width-30) && (mouseY >= 17 && mouseY <= 77))
  {
    fill(#1f234d);
    rect(width - 180, 17, 150, 60, 10);
    fill(#ff0000);
    text("Return", width - 148, 55);
  }
}

void mousePressed()
{
  if (gameState == "Main menu" && mouseButton == LEFT) // Kan kun have én "mousePressed()", så vi er tvunget til at have "if"-statements til hver side.
  {
    if ((mouseX >= 240 && mouseX <= 440) && (mouseY >= 290 && mouseY <= 390)) gameState = "Playing"; // "Play" knappen.

    else if ((mouseX >= 360 && mouseX <= 560) && (mouseY >= 420 && mouseY <= 520)) exit(); // "Quit" knappen.
    
    else if ((mouseX >= 120 && mouseX <= 320) && (mouseY >= 420 && mouseY <= 520))  gameState = "Shop"; // "Shop" knappen.
  }

  //============ kode til knapper på shop side ===============
  else if (gameState == "Shop" && mouseButton == LEFT)
  {
    if ((mouseX >= 40 && mouseX <= 200) && (mouseY >= height-100 && mouseY <= height-100+60)) gameState = "Main menu"; // Knappen til at gå tilbage til main menu.
    
    else if ((mouseX >= width-200 && mouseX <= width-40) && (mouseY >= height-100 && mouseY <= height-40)) gameState = "Cosmetics"; // Knappen til at gå videre til kosmetikker

    // Knapperne til at bladre igennem upgrades
    if ((mouseX >= 470 && mouseX <= 510) && (mouseY >= 495 && mouseY <= 555)) // Højre pil
    {
      if (itemDisplayed != 4) itemDisplayed++;
      else itemDisplayed = 1;
    } 
    else if ((mouseX >= 150 && mouseX <= 190) && (mouseY >= 495 && mouseY <= 555)) // Venstre pil
    {
      if (itemDisplayed != 1) itemDisplayed--;
      else itemDisplayed = 4;
    }
    // Knappen til at købe opgraderingerne.
    else if ((mouseX >= width/2 - 62.5 && mouseX <= width/2 + 62.5) && (mouseY >= 650 && mouseY <= 725))
    {
      switch(itemDisplayed)
      {
      case 1:
        speedy.buy();
        break;
      case 2:
        wally.buy();
        break;
      case 3:
        health.buy();
        break;
      case 4:
        BDI.buy();
        break;
      }
    }
  } 
  else if (gameState == "Playing" && mouseButton == LEFT)
  {
    // Til return-knappen når man spiller.
    if ((mouseX >= width-180 && mouseX <= width-30) && (mouseY >= 17 && mouseY <= 77)) gameState = "Main menu";
  }
}

int chaseTimer;
float chaseChance = 0.03;
void ghostChaseStarter()
{
  int rnd = (int) random(0, 100);
  /* 0.3% chance for at spøgelserne skifter til chase, med et delay på 10 sekunder efter starten af spillet. ChaseStarted er en variabel der sørger for at den her funktion kører i en loop (i draw()), da stien kun udvikler sig for hvert frame.
   Da chaseStarted starter som false kan den første betingelse kun starte funktionen, men når den første betingelse så har startet funktionen bliver chaseStarted til true, og kan dermed sørge for at funktionen kører i en loop. */

  if ((rnd < chaseChance && millis() > 10000 && ghost.movementState != "chase") || chaseStarted)
  {
    chaseStarted = true;
    updateGhostPath();
  } 
  else if (chaseStarted  && (millis() - chaseTimer < 7000))
  {
    chaseStarted = false;
    ghost.movementState = "scatter";
    ghost.pathFound = false;
    ghost.nextPathReady = false;
  }
}

int lastPathUpdate = 0;
int pathUpdateInterval = 1500;
void updateGhostPath()
{
  if (millis() - lastPathUpdate > pathUpdateInterval && !ghost.nextPathReady)
  {
    pathfindingLogistics();
    lastPathUpdate = millis();
  }
}
