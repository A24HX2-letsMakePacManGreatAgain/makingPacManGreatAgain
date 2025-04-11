String gameState;
PacMan pacman = new PacMan();
public PImage pac;
public int[] levelSize = {28, 36}; // En int array for at holde på størrelsen af spillebrættet. Tallene er i X,Y format.
 
public char[][] playingBoard2 = {{'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
                                 {'w', ' ', 'w', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
                                 {'w', 'c', 'w', 'w', ' ', 'w', 'w', 'w', 'w', 'w', ' ', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
                                 {'w', ' ', 'w', 'w', ' ', 'w', 'w', 'w', 'w', 'w', ' ', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
                                 {'w', ' ', ' ', ' ', ' ', ' ', ' ', 'w', 'w', ' ', ' ', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
                                 {'w', 'c', 'w', 'w', 'w', 'w', ' ', 'w', 'w', 'w', ' ', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
                                 {'w', 'p', 'w', 'w', 'c', ' ', ' ', 'c', ' ', ' ', 'c', 'w', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
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

public float gridSize = 24; // Variablen skal være public for at den kan bruges igennem de forskellige filer

void setup() 
{
  size(224*3, 288*3);
  frameRate(30);
  textSize(30);
  pac = loadImage("JohnPackageMan.png");
  gameState = "Main Menu";
}

void draw()
{
  if (gameState == "Main menu")
  {
     drawMenu();
  } 
  else if (gameState == "Playing")
  {
    background(207);
    pacman.keyReleased();
    drawGrid();
    drawElements();
    pacman.drawPac();
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
  if(gameState == "Main menu") // Kan kun have én "mousePressed()", så vi er tvunget til at have "if"-statements.
  {
   if (mouseButton == LEFT && (mouseX >= 240 && mouseX <= 440) && (mouseY >= 290 && mouseY <= 390))
    {
      gameState = "Playing";
    }
  
    //quitting when pressed quit
    else if (mouseButton == LEFT && (mouseX >= 360 && mouseX <= 560) && (mouseY >= 420 && mouseY <= 520))
    {
      exit();
    }
  
    //goes to the shop when pressed shop
    else if (mouseButton == LEFT && (mouseX >= 120 && mouseX <= 320) && (mouseY >= 420 && mouseY <= 520))
    {
      gameState = "Shop";
    }
  }
  
  else if(gameState == "Shop")
  {
    if(mouseButton == LEFT && (mouseX >= 40 && mouseX <= 200) && (mouseY >= height-100 && mouseY <= height-100+60)) // Knappen til at gå tilbage til main menu.
    {
      gameState = "Main menu";
    }
    else if(mouseButton == LEFT && (mouseX >= width-200 && mouseX <= width-40) && (mouseY >= height-100 && mouseY <= height-40)) 
    { // Knappen til at gå videre til kosmetikker
      gameState = "Cosmetics";
    }
  }
}

