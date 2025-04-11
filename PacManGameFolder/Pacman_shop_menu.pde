int nCoins = 120;

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
