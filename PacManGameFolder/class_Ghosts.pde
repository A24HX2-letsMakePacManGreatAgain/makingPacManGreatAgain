class Ghost
{
  int PBposX, PBposY; // Grid-position som PacMan
  color ghostColor; //farven

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

  // dette er selve tegningen af spøgelset (cirkel)
  void drawGhost()
  {
    fill(ghostColor);
    ellipse(PBposX * gridSize + gridSize/2, PBposY * gridSize + gridSize/2, gridSize*0.8, gridSize*0.8);
  }
}
//nu vil vi gå videre med at spøgelset skal kunne finde Pacman...
//her har vi valgt at bruge A* algoritmen. det vil hjælpe spøgelset at finde Pacman hurtigst mugligt når den går i "Chase mode"
//pacman har 3 modes. 1 mode hedder Scatter og gør bare at spøgelset går rundt i random. 2 mode hedder chase, og er når spøgelset direkte går efter spøgelset.
// 3 mode hedder eaten mode. det er når spøgelset er blevet spist og skal tilbage til start for at blive gennoplivet.

//!!det meste af koden under her fik jeg hjælp fra chatbot og hjemmesider, siden vi ikke har prøvet at arbejde, med algoritmer!!

//vi starter med chase!
