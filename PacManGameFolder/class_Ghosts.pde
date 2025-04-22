class Ghost
{
  int PBposX, PBposY; // Grid-position som PacMan
  color ghostColor; //farven
  String movementState = "scatter"; /* pacman har 3 modes. 1. mode hedder Scatter og gør bare at spøgelset går rundt i random. 2. mode hedder chase, og er når spøgelset direkte går efter spøgelset.
                                       3. mode hedder eaten mode, det er når spøgelset er blevet spist og skal tilbage til start for at blive gennoplivet.*/
  
  boolean dieWhenTouched = false; // Boolean til når pacman samler et bær op, og kan spise spøgelserne.
  
  int delayTime1 = 0;
  int delayTime2 = 120; // Spøgelserne skal være en smule langsommere end pacman.
  int currentDirection = (int)random(0, 3);
  
  int pathIndex = -1;
  boolean pathFound = false;
  ArrayList<Node> currentPath = new ArrayList<Node>();
  ArrayList<Node> nextPath = new ArrayList<Node>();
  boolean nextPathReady = false;
  
  Ghost()
  {
    ghostColor = color(255, 0, 0); // farven rød
    findStartPos(); // find 'g' i gridden
  }
  
  //dette fortæller, hvis programmet finder på spillebrættet et g, skal det gå videre til at tegne en cirkel.
  // dette er teknisk set bare for at koden skal holde øje med et "g"
  void findStartPos()
  {
    for (int y = 0; y < levelSize[1]; y++)
    {
      for (int x = 0; x < levelSize[0]; x++)
      {
        if (playingBoard2[y][x] == 'g')
        {
          PBposX = x;
          PBposY = y;
        }
      }
    }
  }
  
  void move() // !!!!! ChatGPT er blevet brugt som en hjælp til denne del, men kun som en vejleder. Koden er ikke direkte kopieret fra ChatGPT.
  {
      if (millis() - delayTime1 > delayTime2) // Et delay lige som ved pacman, så spøgelset ikke bevæger sig for hurtigt.
    {
      checkGrid();
        if (movementState == "scatter") // If-statement til de 3 forskellige movementState'er.
        {
            int[][] directions = 
            {
                {0, 1},   // Ned
                {1, 0},   // Højre
                {0, -1},  // Op
                {-1, 0}   // Left
            };

            int newX = PBposX + directions[currentDirection][0];
            int newY = PBposY + directions[currentDirection][1]; // Her beregner vi de nye positioner med retningerne.
            
            // Vi checker for mulige retninger:
            ArrayList<Integer> possibleDirections = new ArrayList<Integer>();
            for (int i = 0; i < 4; i++) 
            {
                int nx = PBposX + directions[i][0];
                int ny = PBposY + directions[i][1];
                if (i != (currentDirection + 2) % 4 && playingBoard2[ny][nx] != 'w') // Tjekker at den nye i-retning ikke er bagudvendt, og at den nye position ikke er en væg.
                {
                    possibleDirections.add(i);
                }
            }

            // Hvis der ikke er nogle retniner (Hvis spøgelset er i et hjørne)
            if (possibleDirections.size() == 0) 
            {
                // Så resetter vi retninger, eller tvinger den ud af hjørnet.
                currentDirection = (int)random(0, 4); 
            }
            else 
            {
                int randomDirection = (int)random(possibleDirections.size());
                currentDirection = possibleDirections.get(randomDirection);
            }

            // Og så flytter vi spøgelset hen til den nye position.
            newX = PBposX + directions[currentDirection][0];
            newY = PBposY + directions[currentDirection][1];
            if (playingBoard2[newY][newX] != 'w') 
            {
                PBposX = newX;
                PBposY = newY;
            }
        }
        
        else if(movementState == "chase") 
        {
            if(millis() - delayTime1 > delayTime2) 
            {
                followCurrentPath();
            }
        }
        
        delayTime1 = millis();
    }
  }
  
  int countAvailableDirections() 
  {
    int count = 0;
    if (playingBoard2[PBposY+1][PBposX] != 'w') count++; // Ned
    if (playingBoard2[PBposY][PBposX+1] != 'w') count++; // Højre
    if (playingBoard2[PBposY-1][PBposX] != 'w') count++; // Op
    if (playingBoard2[PBposY][PBposX-1] != 'w') count++; // Venstre
    return count;
  }
  
  void followCurrentPath() 
  {
    if(currentPath != null && pathIndex >= 0 && pathIndex < currentPath.size()) // Her bruger vi en if-statement som en form for for-loop.
    {
      Node target = currentPath.get(pathIndex); // Først giver vi variablen værdien af den næste node som vi skal flytte til.
      PBposX = target.x; // Så flytter vi vores x.
      PBposY = target.y; // Så flytter vi vores y.
      pathIndex++; // Og så går vi videre til den næste node.
    }  // Det er kort sagt en for-loop med én ekstra betingelse.
    else if (nextPathReady) 
    {
      currentPath = nextPath;
      pathIndex = 0;
      nextPathReady = false;
      pathFound = true;
    }
    else if(pathIndex >= currentPath.size()) 
    {
      pathFound = false;
      nextPathReady = false;
    }
  }
  
  void checkGrid() 
  {
    if(PBposX == pacman.PBposX && PBposY == pacman.PBposY) 
    {
      nCoins = nCoins/2; // Når man dør fra spøgelserne, mister man halvdelen af sine penge.
      playingBoard2 = level1; // Og man tager tilbage til level 1.
      chaseStarted = false; // Og så genstarter vi variablen.
    }
  }
  
  // dette er selve tegningen af spøgelset (cirkel)
  void drawGhost()
  {
    fill(ghostColor);
    ellipse(PBposX * gridSize + gridSize/2, PBposY * gridSize + gridSize/2 + 96, gridSize*0.8, gridSize*0.8);
  }
}
//nu vil vi gå videre med at spøgelset skal kunne finde Pacman...
//her har vi valgt at bruge A* algoritmen. det vil hjælpe spøgelset at finde Pacman hurtigst mugligt når den går i "Chase mode"
