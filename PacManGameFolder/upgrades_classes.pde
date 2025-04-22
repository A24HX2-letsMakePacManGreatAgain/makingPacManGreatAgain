class speedUpgrade 
{
  int nBuys = 0; // Variabel for at holde styr på hvor mange gange spilleren har opgraderet farten.
  int price = 40;
  int speedDeDelayer = -15*nBuys;
  
  float xPos = 305;
  
  void buy() 
  {
    if(nBuys < 3 && nCoins >= price) 
    {
      nBuys++;
      pacman.delayTime2 += speedDeDelayer;
      nCoins -= price;
    }
  }

}

class wtwUpgrade // "walk through walls upgrade"
{
  int nUpgrades = 0; // Variabel for at holde styr på hvor mange af denne opgradering spilleren har ad gangen.
  int price = 100;
  
  void buy() 
  {
    if(nUpgrades < 5 && nCoins >= price) 
    {
      nUpgrades++;
      nCoins -= price;
    }
  }
}

class healthUpgrade 
{
  int nBuys = 0;
  int price = 75;
  
  void buy() 
  {
    if(nBuys < 1 && nCoins >= price) 
    {
      nBuys++;
      nCoins -= price;
    }
  }
}

class berryDurationIncrease 
{
  int nBuys = 1;
  int price = 75;
  
  void buy() 
  {
    if(nBuys < 3 && nCoins >= price) 
    {
      nBuys++;
      nCoins -= price;
    }
  }
}
