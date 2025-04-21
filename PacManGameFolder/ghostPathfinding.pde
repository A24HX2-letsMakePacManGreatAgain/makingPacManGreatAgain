class Node { // !!!!! ChatGPT er blevet brugt som vejleder til denne del. Vi har aldrig arbejdede med algoritmer, og har brug for hjælp. Botten er kun blevet brugt til opstillingen, og som vejleder!
  int x, y;
  float f = 0, g = 0, h = 0; /* De her værdier er grundlæggende for A* algoritmen. Læs om dem her: https://www.redblobgames.com/pathfinding/a-star/introduction.html*/

  ArrayList<Node> neighbors = new ArrayList<Node>();
  Node previous = null;

  boolean isWall;

  Node(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void addNeighbors(Node[][] grid) {
    if (x < levelSize[0] - 1 && !grid[y][x + 1].isWall) neighbors.add(grid[y][x + 1]); // Højre
    if (x > 0 && !grid[y][x - 1].isWall) neighbors.add(grid[y][x - 1]); // Venstre
    if (y < levelSize[1] - 1 && !grid[y + 1][x].isWall) neighbors.add(grid[y + 1][x]); // Ned
    if (y > 0 && !grid[y - 1][x].isWall) neighbors.add(grid[y - 1][x]); // Op
  }
}

Node[][] grid = new Node[levelSize[1]][levelSize[0]]; 

ArrayList<Node> openSet = new ArrayList<Node>();
ArrayList<Node> closedSet = new ArrayList<Node>();
ArrayList<Node> path = new ArrayList<Node>();

Node start;
Node end;

void pathfindingPreparation() {
  for (int y = 0; y < levelSize[1]; y++) {
    for (int x = 0; x < levelSize[0]; x++) {
      grid[y][x] = new Node(x, y);
      if (playingBoard2[y][x] == 'w') grid[y][x].isWall = true; // For at algoritmen ignorerer felterne der er vægge.
    }
  }

  for (int y = 0; y < levelSize[1]; y++) {
    for (int x = 0; x < levelSize[0]; x++) {
      grid[y][x].addNeighbors(grid);
    }
  }
}


void pathfindingLogistics() {
  for (int y = 0; y < levelSize[1]; y++) {
    for (int x = 0; x < levelSize[0]; x++) {
      Node n = grid[y][x];
      n.f = 0;
      n.g = 0;
      n.h = 0;
      n.previous = null;
    }
  }

  if (ghost.pathFound) return;

  openSet.clear();
  closedSet.clear();
  path.clear();

  start = grid[ghost.PBposY][ghost.PBposX];
  end = grid[pacman.PBposY][pacman.PBposX];
  openSet.add(start);

  while (openSet.size() > 0) {
    int winner = 0;
    for (int i = 1; i < openSet.size(); i++) {
      if (openSet.get(i).f < openSet.get(winner).f) {
        winner = i;
      }
    }

    Node current = openSet.get(winner);

    if (current == end) {
      path.clear();
      Node temp = current;
      path.add(temp);
      while (temp.previous != null) {
        path.add(0, temp.previous);
        temp = temp.previous;
      }

      ghost.currentPath = path;
      ghost.pathIndex = 0;
      ghost.pathFound = true;
      ghost.movementState = "chase";
      return;
    }

    openSet.remove(current);
    closedSet.add(current);

    for (Node neighbor : current.neighbors) {
      if (!closedSet.contains(neighbor)) {
        float tempG = current.g + 1;
        boolean newPath = false;

        if (openSet.contains(neighbor)) {
          if (tempG < neighbor.g) {
            neighbor.g = tempG;
            newPath = true;
          }
        } else {
          neighbor.g = tempG;
          newPath = true;
          openSet.add(neighbor);
        }

        if (newPath) {
          neighbor.h = dist(neighbor.x, neighbor.y, end.x, end.y);
          neighbor.f = neighbor.g + neighbor.h;
          neighbor.previous = current;
        }
      }
    }
  }
}
