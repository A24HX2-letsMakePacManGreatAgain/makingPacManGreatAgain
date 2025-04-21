class Node {
  int i, j; // position i grid
  float f = 0, g = 0, h = 0; // A* værdier
  ArrayList<Node> neighbors = new ArrayList<Node>(); // nabo-noder
  Node previous = null; // den node vi kom fra

  Node(int i, int j) {
    this.i = i;
    this.j = j;
  }

  void show(color c) {
    fill(c);
    stroke(0);
    rect(j * gridSize, i * gridSize + 96, gridSize, gridSize); // tegner firkanten
  }

  void addNeighbors(Node[][] grid) {
    // Tilføj op, ned, venstre, højre naboer (hvis de findes)
    if (i < levelSize[0] - 1) neighbors.add(grid[i+1][j]); // højre
    if (i > 0) neighbors.add(grid[i-1][j]);        // venstre
    if (j < levelSize[1] - 1) neighbors.add(grid[i][j+1]); // ned
    if (j > 0) neighbors.add(grid[i][j-1]);        // op
  }
}

Node[][] grid = new Node[28][32];
ArrayList<Node> openSet = new ArrayList<Node>();
ArrayList<Node> closedSet = new ArrayList<Node>();
ArrayList<Node> path = new ArrayList<Node>();

Node start;
Node end;

void pathfindingPreparation() 
{
  size(224*3, 288*3);
  
  for (int i = 0; i < levelSize[0]; i++) {
    for (int j = 0; j < levelSize[1]; j++) {
      grid[i][j] = new Node(i, j);
    }
  }
  
  for (int i = 0; i < levelSize[0]; i++) {
    for (int j = 0; j < levelSize[1]; j++) {
      grid[i][j].addNeighbors(grid);
    }
  }
}

void pathfindingLogistics() 
{
  ghost.movementState = null; // For at spøgelset står stillet så den kan finde den bedste path til at kunne chase.
  start = grid[ghost.PBposY][ghost.PBposX];                  
  end = grid[pacman.PBposY][pacman.PBposX]; 
  openSet.add(start);
  
  if (openSet.size() > 0) 
  {
    // Find den node med lavest f-værdi (bedste bud pt.)
    int winner = 0;
    for (int i = 1; i < openSet.size(); i++) 
    {
      if (openSet.get(i).f < openSet.get(winner).f) 
      {
        winner = i;
      }
    }

    Node current = openSet.get(winner); // node vi arbejder med nu

    // Er vi nået frem?
    if (current == end) 
    {
      // Rekonstruér sti
      path.clear();
      Node temp = current;
      path.add(temp);
      while (temp.previous != null) 
      {
        path.add(temp.previous);
        temp = temp.previous;
      }
    }

    // Flyt current fra openSet til closedSet
    openSet.remove(current);
    closedSet.add(current);

    // Tjek naboer
    for (Node neighbor : current.neighbors) 
    {
      // Hvis naboen IKKE er i closedSet, så er den mulig at gå til
      if (!closedSet.contains(neighbor)) 
      {
        float tempG = current.g + 1; // vi antager alle bevægelser koster 1

        boolean newPath = false;
        // Hvis naboen allerede er i openSet
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
          // Ellers er det en ny node vi ikke har set før
          neighbor.g = tempG;
          newPath = true;
          openSet.add(neighbor);
        }

        // Hvis vi har fundet en bedre vej
        if (newPath) 
        {
          // h = heuristik – vi bruger afstand til målet (her: Euklidisk afstand)
          neighbor.h = dist(neighbor.i, neighbor.j, end.i, end.j);
          neighbor.f = neighbor.g + neighbor.h; // total cost
          neighbor.previous = current; // vi husker hvor vi kom fra
        }
      }
    }
  }
  ghost.movementState = "chase"; // Når openSet.Size() == 0 (altså at den har fundet stien) skal spøgelserne begynd at løbe efter John Package Man.
}
