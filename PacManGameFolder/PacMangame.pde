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
                                {'w', 'w', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c'},}; // Bruger et array til at holde på positionerne af coins, væggene, og Pac-Man.
                                
float gridHeight = (height/(levelSize[1]/10));
float gridWidth = (width/(levelSize[0]/10));

void setup() 
{
  size(1200, 1000);
  frameRate(20);
  textSize(30);
}

void draw() 
{
  background(207);
  pacman.keyReleased();
  drawGrid();
  drawElements();
}

void drawGrid() 
{
  for(int i = 1; i <= levelSize[0]; i++) 
  {
    line(gridWidth*i, 0, gridWidth*i, height);
  }
  for(int i = 1; i <= levelSize[1]; i++) 
  {
    line(0, gridHeight*i, width, gridHeight*i);
  }
}

void drawElements() 
{
  for(int y = 0; y < levelSize[1]; y++) 
  {
    for(int x = 0; x < levelSize[0]; x++) 
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
