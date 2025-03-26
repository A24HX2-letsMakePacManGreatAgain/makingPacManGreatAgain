
class PacMan 
{
  int speed = 2;
  int PBposX = 1;
  int PBposY = 1; // De her er til "playingboard position".

  

  void move(char button) 
  {
    switch(button) 
    {
      case 'w':
        if(PBposY > 0 && playingBoard2[PBposY-1][PBposX] != 'w') // Skal tjekke om det ønsket felt er ledig. ('w' står for "wall").
        {     
          playingBoard2[PBposY][PBposX] = 'e'; // Så gør vi Pac-man's tidligere position til 'e' ("empty").
          PBposY--;
          playingBoard2[PBposY][PBposX] = 'P'; // Og så flytter hans ikon til den nye position.
        }
        break;
        
      case 'a':
        if(PBposX > 0 && playingBoard2[PBposY][PBposX-1] != 'w') 
        {
          playingBoard2[PBposY][PBposX] = 'e';
          PBposX--;
          playingBoard2[PBposY][PBposX] = 'P';
        }
        break;
        
      case 's':
        if(PBposY < levelSize[1] - 1 && playingBoard2[PBposY+1][PBposX] != 'w') 
        {
          playingBoard2[PBposY][PBposX] = 'e';
          PBposY++; 
          playingBoard2[PBposY][PBposX] = 'P';
        }
        break;
        
      case 'd':
        if(PBposX < levelSize[0] - 1 && playingBoard2[PBposY][PBposX+1] != 'w') 
        {                    
          playingBoard2[PBposY][PBposX] = 'e';
          PBposX++;
          playingBoard2[PBposY][PBposX] = 'P';
        }
        break;
        
      default:
        break; // Hvis knappen ikke er w, a, s, eller d, skal der ikke ske noget.
    }
  } 
  
  void keyReleased() 
  {
    move(key);
  }
  
  void drawPac() 
  {
    image(pac, PBposX*gridSize-5, PBposY*gridSize-4);
  }
}
=======
class PacMan 
{
  int speed = 2;
  int posX = 0;
  int posY = 0;

  void move(char button) 
  {
    switch(button) 
    {
      case 'w':
        if(posY > 0 && playingBoard[posY-1][posX] != 'w') // Skal tjekke om det ønsket felt er ledigt. ('w' står for "wall").
        {
          playingBoard[posY][posX] = 'e'; // Så gør vi Pac-man's tidligere position til 'e' ("empty").
          posY -= 1; // Ændrer på hans position.
          playingBoard[posY][posX] = 'P'; // Og så flytter hans ikon til den nye position.
        }
        break;
        
      case 'a':
        if(posX > 0 && playingBoard[posY][posX-1] != 'w') 
        {
          playingBoard[posY][posX] = 'e';
          posX -= 1;
          playingBoard[posY][posX] = 'P';
        }
        break;
        
      case 's':
        if(posY < levelSize[1] - 1 && playingBoard[posY+1][posX] != 'w') 
        {
          playingBoard[posY][posX] = 'e';
          posY += 1;
          playingBoard[posY][posX] = 'P';
        }
        break;
        
      case 'd':
        if(posX < levelSize[0] - 1 && playingBoard[posY][posX+1] != 'w') 
        {          
          playingBoard[posY][posX] = 'e';
          posX += 1;
          playingBoard[posY][posX] = 'P';
        }
        break;
        
      default:
        break; // Hvis knappen ikke er w, a, s, eller d, skal der ikke ske noget.
    }
  } 
  
  void keyReleased() 
  {
    move(key);
  }
  
  
  
  
}

