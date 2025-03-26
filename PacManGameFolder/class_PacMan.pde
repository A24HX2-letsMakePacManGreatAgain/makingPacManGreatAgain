
class PacMan 
{
 // int speed = 2;
 int delayTime = 200; // makes Pacman move slower
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
          delay(delayTime);
        }
        break;
        
      case 'a':
        if(PBposX > 0 && playingBoard2[PBposY][PBposX-1] != 'w') 
        {
          playingBoard2[PBposY][PBposX] = 'e';
          PBposX--;
          playingBoard2[PBposY][PBposX] = 'P';
          delay(delayTime);
        }
        break;
        
      case 's':
        if(PBposY < levelSize[1] - 1 && playingBoard2[PBposY+1][PBposX] != 'w') 
        {
          playingBoard2[PBposY][PBposX] = 'e';
          PBposY++; 
          playingBoard2[PBposY][PBposX] = 'P';
          delay(delayTime);
        }
        break;
        
      case 'd':
        if(PBposX < levelSize[0] - 1 && playingBoard2[PBposY][PBposX+1] != 'w') 
        {                    
          playingBoard2[PBposY][PBposX] = 'e';
          PBposX++;
          playingBoard2[PBposY][PBposX] = 'P';
          delay(delayTime);
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
