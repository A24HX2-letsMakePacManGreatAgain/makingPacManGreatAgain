PFont mono; // PacMan Font
boolean game = false; // til Main menu



PacMan pacman = new PacMan();
public int[] levelSize = {12, 10}; // En int array for at holde på størrelsen af spillebrættet. Tallene er i X,Y format.
public char[][] playingBoard = {{'P', 'c', 'c', 'w', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c'},
  {'w', 'w', 'c', 'w', 'c', 'w', 'w', 'w', 'w', 'w', 'w', 'c'},
  {'c', 'w', 'c', 'w', 'c', 'w', 'w', 'c', 'c', 'c', 'w', 'c'},
  {'c', 'w', 'c', 'w', 'c', 'w', 'w', 'c', 'w', 'c', 'w', 'c'},
  {'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'w', 'c', 'w', 'c'},
  {'w', 'w', 'c', 'w', 'w', 'c', 'w', 'c', 'w', 'c', 'c', 'c'},
  {'w', 'w', 'c', 'c', 'c', 'c', 'w', 'c', 'w', 'w', 'w', 'c'},
  {'w', 'w', 'c', 'w', 'w', 'c', 'w', 'c', 'c', 'c', 'c', 'c'},
  {'w', 'w', 'c', 'w', 'w', 'c', 'w', 'c', 'w', 'w', 'w', 'c'},
  {'w', 'w', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c'}, }; // Bruger et array til at holde på positionerne af coins, væggene, og Pac-Man.

float gridHeight = (height/(levelSize[1]/10));
float gridWidth = (width/(levelSize[0]/10));

void setup()
{
  size(1200, 1000);
  frameRate(20);
  textSize(30);

  // load PacMan font og sæt font
  mono = createFont("PAC-FONT.TTF", 128);
  textFont(mono);
}

void draw()
{
  
  // hvis game er true starter spillet ellers vises main menu
  if (game) {
    background(207);
    pacman.keyReleased();
    drawGrid();
    drawElements();
  } else {
    background (#14084d);
    drawMainMenu();
  }
}

void drawGrid()
{
  for (int i = 1; i <= levelSize[0]; i++)
  {
    line(gridWidth*i, 0, gridWidth*i, height);
  }
  for (int i = 1; i <= levelSize[1]; i++)
  {
    line(0, gridHeight*i, width, gridHeight*i);
  }
}

void drawElements()
{
  for (int y = 0; y < levelSize[1]; y++)
  {
    for (int x = 0; x < levelSize[0]; x++)
    {
      char element = playingBoard[y][x];
      switch(element)
      {
      case 'P':
        fill(#f5e342);
        text(element, 40+gridWidth*x, 40+gridHeight*y);
        break;
      case 'c':
        fill(0, 255, 0);
        text(element, 40+gridWidth*x, 40+gridHeight*y);
        break;
      case 'w':
        fill(0);
        text(element, 40+gridWidth*x, 40+gridHeight*y);
        break;
      }
    }
  }
}

void drawMainMenu() {
  //for cirklerne ude i hjørnerne. for loop for at slippe for at skrive circle() om og om igen
  //plus farve og ingen outline
  fill(#ebda26);
  noStroke();
  for (int i = 1; i <= 20; i++)
  {
    circle(20, 45*i, 20);
    
    // istedet for to løkker kan det hele laves i den samme.
    circle(width-20, 45*i, 20);
  }

  
  //den røde farve og tekst
  fill(#ff0000);
  textSize(100);
  // jeg trækker 300 fra fordi font er 100 og der er 3 bogstaver.  Jeg bruger width for at det automatisk tilpasser
  text("PAC-MAN", width/2-300, 100);
}
