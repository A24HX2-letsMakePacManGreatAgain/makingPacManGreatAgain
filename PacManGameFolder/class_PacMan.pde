
class PacMan
{
  int delayTime1 = 0;  
  int delayTime2 = 75; // makes Pacman move slower
  
  int PBposX = 1;
  int PBposY = 1; // De her er til "playingboard position".
  
  boolean moved = false; // til at vide om det er starten af spillet eller ej. Bruges til hans ikon.


  void move(char button)
  {
    moved = true;
    switch(button)
    {
    case 'w':
      if (PBposY > 0 && playingBoard2[PBposY-1][PBposX] != 'w') // Skal tjekke om det ønsket felt er ledig. ('w' står for "wall").
      {
        playingBoard2[PBposY][PBposX] = 'e'; // Så gør vi Pac-man's tidligere position til 'e' ("empty").
        PBposY--;
        playingBoard2[PBposY][PBposX] = 'P'; // Og så flytter hans ikon til den nye position.
      }
      break;

    case 'a':
      if (PBposX > 0 && playingBoard2[PBposY][PBposX-1] != 'w')
      {
        playingBoard2[PBposY][PBposX] = 'e';
        PBposX--;
        playingBoard2[PBposY][PBposX] = 'P';
      }
      break;

    case 's':
      if (PBposY < levelSize[1] - 1 && playingBoard2[PBposY+1][PBposX] != 'w')
      {
        playingBoard2[PBposY][PBposX] = 'e';
        PBposY++;
        playingBoard2[PBposY][PBposX] = 'P';
      }
      break;

    case 'd':
      if (PBposX < levelSize[0] - 1 && playingBoard2[PBposY][PBposX+1] != 'w')
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
    if (millis() - delayTime1 > delayTime2) {
      move(key);
      delayTime1 = millis(); // register tidspunkt for sidste bevægelse
    }
  }

  void drawPac()
  {
    image(pac, PBposX*gridSize-5, PBposY*gridSize-4);
  }
}
