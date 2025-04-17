int itemDisplayed = 1;

public void drawShop() 
{
  background(shopBackground);
  radRobert.resize(450, 550); // Robert skal skaleres, da han er for stor i hans normale tilstand.
  image(radRobert, (width/2) - 240, 500 - (550/2)); // skulle lige lege lidt rundt med tallene for at få ham i midten.
  
  // Knapperne for at gå tilbage til "Main menu" og til at køre videre til kosmetikkerne:
  stroke(#000000);
  strokeWeight(5);
  fill(#33397d);
  rect(40, height-100, 160, 60, 10); // Tilbage til "Main menu".
  rect(width-200, height-100, 160, 60, 10); // Videre til kosmetikkerne.
  
  // Teksten til knapperne:
  fill(#ff0000);
  textSize(40);
  text("Return", 63, height-60); // Tilbage knappen
  textSize(34);
  text("Cosmetics", width-193, height-61); // Kosmetikker knappen
  
  returnButtonAnimation();
  cosmeticsButtonAnimation();
  
  // Spilleren skal kunne købe upgrades'ne, og det skal de bruge en knap til:
  stroke(#000000);
  fill(#33397d);
  rect(width/2 - 62.5, 650, 125, 75, 10);
  
  fill(#ff0000);
  textSize(40);
  text("Buy", width/2 - 33, 698);
  
  buyButtonColorChange();
  
  // Spillerne skal kunne se den mængde penge de har:
  fill(#000000);
  rect(37, 30, 135, 66);
  image(coin, 15, 13);
  fill(#ffffff);  
  text(nCoins, 100, 75);
  
  drawShuffleArrows();
  drawUpgrades();
  
  whichUpgradesDoIHave();
}

void returnButtonAnimation() 
{
  if((mouseX >= 40 && mouseX <= 200) && (mouseY >= height-100 && mouseY <= height-100+60)) 
  {  // Det præcis samme sker med disse knapper, som ved main menu; knapperne bliver forstørret.
    fill(#33397d);
    stroke(#ebda26);
    rect(20, height-125, 200, 100, 10); // Laver den forstørret kasse.
    fill(#ff0000);
    textSize(50); // Og så forstørrer teksten sig.
    text("Return", 53, height-63); 
  } 
}

void cosmeticsButtonAnimation() 
{
  if((mouseX >= width-200 && mouseX <= width-40) && (mouseY >= height-100 && mouseY <= height-40)) 
  {
    fill(#33397d);
    stroke(#ebda26);
    rect(width-220, height-125, 200, 100, 10);
    fill(#ff0000);
    textSize(44);
    text("Cosmetics", width-214, height-65);
  }
}

void buyButtonColorChange() 
{
  if((mouseX >= width/2 - 62.5 && mouseX <= width/2 + 62.5) && (mouseY >= 650 && mouseY <= 725)) 
  {
    stroke(#000000);
    fill(#232754);
    rect(width/2 - 62.5, 650, 125, 75, 10);
    fill(#ff0000);
    textSize(40);
    text("Buy", width/2 - 33, 698);
  }
}

void drawShuffleArrows() 
{
  strokeWeight(2);
  stroke(#ff0000);
  fill(#33397d);
  triangle(470, 495, 470, 555, 510, 525);
  triangle(190, 495, 190, 555, 150, 525);
  
  // Da knapperne er pile, er det lidt besværligt med at registrere om musen er på knappen, så vi putter bare en firkant om trekanterne.
  if((mouseX >= 470 && mouseX <= 510) && (mouseY >= 495 && mouseY <= 555)) 
  {
    fill(#232754);
    triangle(470, 495, 470, 555, 510, 525);
  }
  else if((mouseX >= 150 && mouseX <= 190) && (mouseY >= 495 && mouseY <= 555)) 
  {
    fill(#232754);
    triangle(190, 495, 190, 555, 150, 525);
  } 
  
}

void drawUpgrades() 
{
  switch(itemDisplayed) 
  {
    case 1:
      fill(#ffffff);
      rect(305, height/2 + 60, 60, 60);
      fill(#000000);
      text("one", 305 - 3, height/2 + 100);
      textSize(15);
      text(speedy.price + " coins", 305 + 5, height/2 + 140);
      break;
    case 2:
      fill(#ffffff);
      rect(305, height/2 + 60, 60, 60);
      fill(#000000);
      text("two", 305 - 3, height/2 + 100);
      textSize(15);
      text(wally.price + " coins", 305 + 1, height/2 + 140);
      break;
    case 3:
      fill(#ffffff);
      rect(305, height/2 + 60, 60, 60);
      fill(#000000);
      text("three", 305 - 3, height/2 + 100);
      textSize(15);
      text(health.price + " coins", 305 + 5, height/2 + 140);
      break;
    case 4:
      fill(#ffffff);
      rect(305, height/2 + 60, 60, 60);
      fill(#000000);
      text("four", 305 - 3, height/2 + 100);
      textSize(15);
      text(BDI.price + " coins", 305 + 5, height/2 + 140);
      break;
  }
}

void whichUpgradesDoIHave() 
{
  stroke(#000000);
  fill(#33397d);
  rect(width-190, 0, 200, 280, 10);
  
  noStroke();
  textSize(25);
  fill(#ff0000);
  text("Owned upgrades", width-184, 25);
  
  fill(#ffffff);
  rect(width - 155, 40, 40, 40);
  rect(width - 155, 100, 40, 40);
  rect(width - 155, 160, 40, 40);
  rect(width - 155, 220, 40, 40);
  
  fill(#ff0000);
  text("one", width - 155, 65);
  text(speedy.nBuys, width - 90, 68);
  text("two", width - 155, 125);
  text(wally.nUpgrades, width - 90, 128);
  text("three", width - 155, 185);
  text(health.nBuys, width - 90, 188);
  text("four", width - 155, 245);
  text(BDI.nBuys, width - 90, 248);
  
  
  
}
