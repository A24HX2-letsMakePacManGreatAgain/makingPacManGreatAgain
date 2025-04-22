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
        PBposY--;
        checkForBuffs();
        moved = true;
      }
      break;

    case 'a':
      if (PBposX > 0 && playingBoard2[PBposY][PBposX-1] != 'w')
      {
        PBposX--;
        checkForBuffs();
        moved = true;
      }
      break;

    case 's':
      if (PBposY < levelSize[1] - 1 && playingBoard2[PBposY+1][PBposX] != 'w')
      {
        PBposY++;
        checkForBuffs();
        moved = true;
      }
      break;

    case 'd':
      if (PBposX < levelSize[0] - 1 && playingBoard2[PBposY][PBposX+1] != 'w')
      {
        PBposX++;
        checkForBuffs();
        moved = true;
      }
      break;

    default:
      break; // Hvis knappen ikke er w, a, s, eller d, skal der ikke ske noget.
    }
  }

  void checkForBuffs()
  {
    char cell = playingBoard2[PBposY][PBposX];

    if (cell == 'c') // c står for coin.
    {
      coinSound.play();
      nCoins += 1 * coinMultiplier; // optæl mønterne.
      cell = ' '; // fjern mønten
    } 
    else if (cell == 'b') // b står for berry.
    {
      ghost.dieWhenTouched = true;
      cell = ' ';
    } 
    else if (cell == 'm') // m står for multiplier. Vi gør at hvis man samler et 'm' op, så forstørrer ens multiplier til coins.
    {
      coinMultiplier++;
      cell = ' ';
    }
    else if (PBposX == ghost.PBposX && PBposY == ghost.PBposY && !ghost.dieWhenTouched) // Når John Package Man dør fra kontakt med spøgelset.
    {
      // mister halvdelen af pengene
      nCoins = nCoins / 2;
      // genstart chase‐logik og respawn JPM.
      chaseStarted = false;
      findStartPos();
    }
    else if (PBposX == ghost.PBposX && PBposY == ghost.PBposY && ghost.dieWhenTouched) // Når spøgelset dør fra kontakt med JPM.
    {
      nCoins += 100; // En præmie på 100 coins.
      chaseStarted = false; // Sørge for at spøgelset går ud af chase (hvis den er i chase).
      ghost.findStartPos(); // Og så skal spøgelset respawn.
    }
  }

  void keyReleased()
  {
    if (millis() - delayTime1 > delayTime2) 
    {
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
    if (!moved) image(pac, PBposX * gridSize - 5, PBposY * gridSize - 4 + 96);
    
    else if (key == 'a')
    {
      image(pacMovingLeft, PBposX * gridSize - 5, PBposY * gridSize - 4 + 96);
      pacMovingRight.pause();
      pacMovingDown.pause();
      pacMovingUp.pause();
      pacMovingLeft.play(); // Credit til ChatGPT for at hjælpe med dette.
    }
    else if (key == 'd') 
    {
      image(pacMovingRight, PBposX * gridSize - 5, PBposY * gridSize - 4 + 96);
      pacMovingLeft.pause();
      pacMovingDown.pause();
      pacMovingUp.pause();
      pacMovingRight.play();
    }
    else if (key == 's') 
    {
      image(pacMovingDown, PBposX * gridSize - 5, PBposY * gridSize - 4 + 96);
      pacMovingLeft.pause();
      pacMovingRight.pause();
      pacMovingUp.pause();
      pacMovingDown.play();
    }
    else if (key == 'w') 
    {
      image(pacMovingUp, PBposX * gridSize - 5, PBposY * gridSize - 4 + 96);
      pacMovingLeft.pause();
      pacMovingRight.pause();
      pacMovingDown.pause();
      pacMovingUp.play();
    }
  }
}
