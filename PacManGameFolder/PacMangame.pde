String gameState;
PacMan pacman = new PacMan();
speedUpgrade speedy = new speedUpgrade();
wtwUpgrade wally = new wtwUpgrade();
healthUpgrade health = new healthUpgrade();
berryDurationIncrease BDI = new berryDurationIncrease();

public PImage pac; // Pacman's billede
public PImage radRobert; // Billede af shopkeeper'en
public PImage shopBackground; // Billede til baggrunden af shoppen.
public PImage coin; // billede til coins'ne.

public int[] levelSize = {28, 36}; // En int array for at holde på størrelsen af spillebrættet. Tallene er i X,Y format.
public char[][] playingBoard2 = {{'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'p', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
                                 {'w', 'c', 'w', 'w', ' ', 'w', 'w', 'w', 'w', 'w', ' ', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
                                 {'w', ' ', 'w', 'w', ' ', 'w', 'w', 'w', 'w', 'w', ' ', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
                                 {'w', ' ', ' ', ' ', ' ', ' ', ' ', 'w', 'w', ' ', ' ', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
                                 {'w', 'c', 'w', 'w', 'w', 'w', ' ', 'w', 'w', 'w', ' ', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
                                 {'w', ' ', 'w', 'w', 'c', ' ', ' ', 'c', ' ', ' ', 'c', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
                                 {'w', ' ', 'w', 'w', ' ', 'w', 'w', 'w', 'w', ' ', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
                                 {'w', 'c', 'w', 'w', ' ', 'c', ' ', 'c', ' ', 'c', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
                                 {'w', ' ', 'w', 'w', 'w', ' ', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', ' ', 'w', 'w', 'w', ' ', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'c', 'w', 'w', 'w', 'c', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', ' ', 'w', 'w', 'w', ' ', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', ' ', 'w', 'w', 'w', ' ', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'c', 'w', 'w', 'w', 'c', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', ' ', 'w', 'w', 'w', ' ', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', ' ', 'w', 'w', 'w', ' ', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'c', 'w', 'w', 'w', 'c', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', ' ', 'w', 'w', 'w', ' ', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', ' ', 'c', ' ', 'c', ' ', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}};                                

public float gridSize = 24; // Variablen skal være public for at den kan bruges igennem de forskellige filer.
public int nCoins = 120; // Tester-værdi til coins.

void setup() 
{
  size(224*3, 288*3);
  frameRate(30);
  textSize(30);
  pac = loadImage("JohnPackageMan.png");
  radRobert = loadImage("ratRobert.png");
  shopBackground = loadImage("shopBackground.png");
  coin = loadImage("coin.png");

  gameState = "Main menu";
}

void draw()
{
  if (gameState == "Main menu")
  {
     drawMenu();
  } 
  else if (gameState == "Playing")
  {
    stroke(#000000);
    strokeWeight(1);
    textSize(30);
    background(207);
    pacman.keyReleased();
    drawGrid();
    drawElements();
    pacman.drawPac();
  }
  else if(gameState == "Shop") 
  {
    drawShop();
  }
}


void drawGrid() 
{
  for(int i = 1; i <= 28; i++) 
  {
    line(gridSize*i, 0, gridSize*i, height);
  }
  for(int i = 1; i <= 36; i++) 
  {
    line(0, gridSize*i, width, gridSize*i);
  }
}

void drawElements() 
{
  for(int y = 0; y < levelSize[1]; y++) 
  {
    for(int x = 0; x < levelSize[0]; x++) 
    {
      char element = playingBoard2[y][x];
      switch(element) 
      {
        case 'p':
          fill(0, 255, 255);
          text(element, 2+gridSize*x, 22+gridSize*y);
          break;
        case 'c':
          fill(0, 255, 0);
          text(element, 2+gridSize*x, 22+gridSize*y);
          break;
        case 'w':
          fill(0);
          text(element, 2+gridSize*x, 22+gridSize*y);
          break;
      } 
    }
  }
}

void mousePressed() 
{
  if(gameState == "Main menu" && mouseButton == LEFT) // Kan kun have én "mousePressed()", så vi er tvunget til at have "if"-statements.
  {
   if ((mouseX >= 240 && mouseX <= 440) && (mouseY >= 290 && mouseY <= 390))
    {
      gameState = "Playing";
    }
  
    //quitting when pressed quit
    else if ((mouseX >= 360 && mouseX <= 560) && (mouseY >= 420 && mouseY <= 520))
    {
      exit();
    }
  
    // går til shop når den er trykkede:
    else if ((mouseX >= 120 && mouseX <= 320) && (mouseY >= 420 && mouseY <= 520))
    {
      gameState = "Shop";
    }
  }
  
  //============ kode til knapper på shop side ===============
  else if(gameState == "Shop" && mouseButton == LEFT) // Til return knappen
  {
    if((mouseX >= 40 && mouseX <= 200) && (mouseY >= height-100 && mouseY <= height-100+60)) // Knappen til at gå tilbage til main menu.
    {
      gameState = "Main menu";
    }
    else if((mouseX >= width-200 && mouseX <= width-40) && (mouseY >= height-100 && mouseY <= height-40)) 
    { // Knappen til at gå videre til kosmetikker
      gameState = "Cosmetics";
    }
  }
  
  // Knapperne til at bladre igennem upgrades
  if((mouseX >= 470 && mouseX <= 510) && (mouseY >= 495 && mouseY <= 555)) // Højre pil
  {
    if(itemDisplayed != 4) 
    {
      itemDisplayed++;
    }
    else {itemDisplayed = 1;}
  }
  else if((mouseX >= 150 && mouseX <= 190) && (mouseY >= 495 && mouseY <= 555)) // Venstre pil
  {
    if(itemDisplayed != 1) 
    {
      itemDisplayed--;
    }
    else{itemDisplayed = 4;}
  }
  
  // Knappen til at købe opgraderingerne.
  else if((mouseX >= width/2 - 62.5 && mouseX <= width/2 + 62.5) && (mouseY >= 650 && mouseY <= 725)) 
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
