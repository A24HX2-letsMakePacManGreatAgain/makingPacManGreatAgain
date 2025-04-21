class Node // !!! ChatGPT er blevet brugt som vejleder, da algoritmer er besværlige og svære at forstå. Botten er kun blevet brugt til at forstå logikken, hjælpe med opstillingen, og som en vejleder.
{
  int i, j; // position i grid
  float f = 0, g = 0, h = 0; /* De her værdier er grundlæggende for A* algoritmen. 'g' er hvor meget det 'koster' at gå fra starten til enden, for hver celle kan skal flytte til, øges g med 1. 'h' er den direkte distance mellem starten og slutningen.
                                Forestil dig en streg - der ignorerer felterne - der kører direkte fra startpunktet til endepunktet, 'h' er længden af denne streg. f er den vigtigste ud af dem alle, f defineres som g + h. 
                                f er den variabel der bruges til at finde den mest kosteffektive og hurtigst ved til endepunktet.*/
                                
  ArrayList<Node> neighbors = new ArrayList<Node>(); // nabo-noder
  Node previous = null; // den node vi kom fra

  Node(int i, int j) 
  {
    this.i = i;
    this.j = j;
  }

  void show(color c) 
  {
    fill(c);
    stroke(0);
    rect(j * gridSize, i * gridSize + 96, gridSize, gridSize); // tegner firkanten
  }

  void addNeighbors(Node[][] grid) 
  {
    // Tilføj op, ned, venstre, højre naboer (hvis de findes)
    if (i < levelSize[0] - 1) neighbors.add(grid[i+1][j]); // højre
    if (i > 0) neighbors.add(grid[i-1][j]);        // venstre
    if (j < levelSize[1] - 1) neighbors.add(grid[i][j+1]); // ned
    if (j > 0) neighbors.add(grid[i][j-1]);        // op
  }
}

Node[][] grid = new Node[32][32]; /* Jeg kom til at skrive ...new Node[28][32], hvilket er i den forkerte rækkefølge, det skulle have været ...new Node[32][28]. For at vi ikke skal gå igennem hele koden, har jeg bare ændret det til [32][32].
                                     Dette kommer ikke til at forstyrre koden på nogen måde, da stien kommer til at ignorere alle felter der er væge, hvori vi hele kanten af spillepladen er vægge. */

ArrayList<Node> openSet = new ArrayList<Node>();
ArrayList<Node> closedSet = new ArrayList<Node>();
ArrayList<Node> path = new ArrayList<Node>();

Node start;
Node end;

void pathfindingPreparation() 
{
  size(224*3, 288*3);
  
  for (int i = 0; i < levelSize[0]; i++) 
  {
    for (int j = 0; j < levelSize[1]; j++) 
    {
      grid[i][j] = new Node(i, j);
    }
  }
  
  for (int i = 0; i < levelSize[0]; i++) 
  {
    for (int j = 0; j < levelSize[1]; j++) 
    {
      grid[i][j].addNeighbors(grid);
    }
  }
}


void pathfindingLogistics() 
{
  if(ghost.pathFound) return; // Hvis spøgelset allerede har en sti, skal vi bare stoppe funktionen.

  openSet.clear();
  closedSet.clear();
  path.clear();

  start = grid[ghost.PBposY][ghost.PBposX];                  
  end = grid[pacman.PBposY][pacman.PBposX]; 
  openSet.add(start);
  
  while (openSet.size() > 0)  // Her finder vi den node der er tættest på endepunktet.
  {
    int winner = 0;
    for (int i = 1; i < openSet.size(); i++) 
    {
      if (openSet.get(i).f < openSet.get(winner).f) 
      {
        winner = i;
      }
    }

    Node current = openSet.get(winner);

    if (current == end) 
    {
      path.clear();
      Node temp = current;
      path.add(temp);
      while (temp.previous != null)
      {
        path.add(0, temp.previous); // Skal tilføjes i den modsatte rækkefølge.
        temp = temp.previous;
      }
      
      ghost.currentPath = path; // Så opdaterer vi spøgelsets sti med den nye sti.
      ghost.pathIndex = 0;      // Og så opdaterer vi dets pathIndex for at followCurrentPath() kører.
      ghost.pathFound = true; 
      ghost.movementState = "chase"; // Og så skal vi huske at opdatere de værdier der også bruges andre steder.
      return;
    }

    openSet.remove(current);
    closedSet.add(current);

    for (Node neighbor : current.neighbors) 
    {
      if (!closedSet.contains(neighbor)) 
      {
        float tempG = current.g + 1;
        boolean newPath = false;

        if (openSet.contains(neighbor)) 
        {
          if (tempG < neighbor.g) 
          {
            
            neighbor.g = tempG;
            newPath = true;
          }
        } 
        else 
        {
          neighbor.g = tempG;
          newPath = true;
          openSet.add(neighbor);
        }

        if (newPath) 
        {
          neighbor.h = dist(neighbor.i, neighbor.j, end.i, end.j);
          neighbor.f = neighbor.g + neighbor.h;
          neighbor.previous = current;
        }
      }
    }
  }
}
