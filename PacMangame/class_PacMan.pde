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
