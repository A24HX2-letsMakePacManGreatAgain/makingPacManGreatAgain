  
public void drawMenu()
{
  background (#14084d);

  //for cirklerne ude i hjørnerne. for loop for at slippe for at skrive circle() om og om igen
  //plus farve og ingen outline
  fill(#ebda26);
  noStroke();
  for (int i = 1; i <= 20; i++)
  
  {
    circle(20, 45*i, 20);
  }

  for (int e = 1; e <= 20; e++)
  {
    circle(652, 45*e, 20);
  }


  //den røde farve og tekst
  fill(#ff0000);
  textSize(100);
  text("PAC-MAN", 150, 100);
  
  
  //de tre bokse 
  stroke(#000000);
  strokeWeight(5);
  fill(#33397d);
  rect(240,290,200,100,10);
  rect(120,420,200,100,10);
  rect(360,420,200,100,10);
  
  //tekst til knapperne 
   fill(#ff0000);
  textSize(50);
  text("START", 275, 360);
   text("SHOP", 160, 490);
    text("QUIT", 410, 490);
  
}
