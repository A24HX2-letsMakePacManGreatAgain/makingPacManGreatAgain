
class PacMan
{
  int delayTime1 = 0;  
  int delayTime2 = 75; // makes Pacman move slower
  
  int PBposX;
  int PBposY; // De her er til "playingboard position".
  
  boolean moved = false; // til at vide om det er starten af spillet eller ej. Bruges til hans bevægelse.

  PacMan() 
  {
    findStartPos();
  }

  void move(char button)
  {
    switch(button)
    {
    case 'w':
      if (PBposY > 0 && playingBoard2[PBposY-1][PBposX] != 'w') // Skal tjekke om det ønsket felt er ledig. ('w' står for "wall").
      {
        playingBoard2[PBposY][PBposX] = 'e'; // Så gør vi Pac-man's tidligere position til 'e' ("empty").
        PBposY--;
        checkForBuffs();
        playingBoard2[PBposY][PBposX] = 'P'; // Og så flytter hans ikon til den nye position.
        moved = true;
      }
      break;

    case 'a':
      if (PBposX > 0 && playingBoard2[PBposY][PBposX-1] != 'w')
      {
        playingBoard2[PBposY][PBposX] = 'e';
        PBposX--;
        checkForBuffs();
        playingBoard2[PBposY][PBposX] = 'P';
        moved = true;
      }
      break;

    case 's':
      if (PBposY < levelSize[1] - 1 && playingBoard2[PBposY+1][PBposX] != 'w')
      {
        playingBoard2[PBposY][PBposX] = 'e';
        PBposY++;
        checkForBuffs();
        playingBoard2[PBposY][PBposX] = 'P';
        moved = true;
      }
      break;

    case 'd':
      if (PBposX < levelSize[0] - 1 && playingBoard2[PBposY][PBposX+1] != 'w')
      {
        playingBoard2[PBposY][PBposX] = 'e';
        PBposX++;
        checkForBuffs();
        playingBoard2[PBposY][PBposX] = 'P';
        moved = true;
      }
      break;

    default:
      break; // Hvis knappen ikke er w, a, s, eller d, skal der ikke ske noget.
    }
  }
  
  void checkForBuffs() 
  {
    if(playingBoard2[PBposY][PBposX] == 'c') 
    {
      nCoins += 1*coinMultiplier;
    }
    else if(playingBoard2[PBposY][PBposX] == 'b') // Den her er ny, b står for berry.
    {
      // Tilføjes senere
    }
    else if(playingBoard2[PBposY][PBposX] == 'm') // Den her er også ny, m står for multiplier. Vi gør at hvis man samler et 'm' op, så forstørrer ens multiplier til coins.
    {
      coinMultiplier++;
    }
  }
  
  void keyReleased()
  {
    if (millis() - delayTime1 > delayTime2) {
      move(key);
      delayTime1 = millis(); // register tidspunkt for sidste bevægelse
    }
  }
  
  void findStartPos() 
  {
    for (int y = 0; y < levelSize[1]; y++)
    {
      for (int x = 0; x < levelSize[0]; x++)
      {
        if (playingBoard2[y][x] == 'p')
        {
          PBposX = x;
          PBposY = y;
        }
      }
    }
  }
  
  void drawPac()
  {
    if(!moved) 
    {
      image(pac, PBposX * gridSize - 5, PBposY * gridSize - 4 + 96);
      pacMovingLeft.pause();
    }
    else 
    {
      image(pacMovingLeft, PBposX * gridSize - 5, PBposY * gridSize - 4 + 96);
      pacMovingLeft.play(); // Credit til ChatGPT for at hjælpe med dette.
    }
  }
}
