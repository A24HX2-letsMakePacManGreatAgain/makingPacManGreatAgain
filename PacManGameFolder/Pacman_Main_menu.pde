
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
  //rect(a, b, c, d, r)
  //a x-coordinate of the rectangle by default
  //b  y-coordinate of the rectangle by default
  //c  width of the rectangle by default
  //d  height of the rectangle by default
  //r  radii for all four corners
  rect(240, 290, 200, 100, 10);
  rect(120, 420, 200, 100, 10);
  rect(360, 420, 200, 100, 10);

  //tekst til knapperne
  fill(#ff0000);
  textSize(50);
  text("START", 275, 360);
  text("SHOP", 160, 490);
  text("QUIT", 410, 490);


  quitButtonAnimation();
  playButtonAnimation();
  shopButtonAnimation();
}


void quitButtonAnimation()
{
  if ((mouseX >= 360 && mouseX <= 560) && (mouseY >= 420 && mouseY <= 520))
  {
    //Quitbutton Animation
    fill(#33397d);
    stroke(#ebda26);
    rect(340, 400, 240, 140, 10);
    fill(#ff0000);
    textSize(60);
    text("QUIT", 395, 490);
  }
}


void playButtonAnimation()
{
  if ((mouseX >= 240 && mouseX <= 440) && (mouseY >= 290 && mouseY <= 390))
  {
    //playbutton Animation
    fill(#33397d);
    stroke(#ebda26);
    rect(220, 270, 240, 140, 10);
    fill(#ff0000);
    textSize(60);
    text("START", 260, 360);
  }
}


void shopButtonAnimation()
{
  if ((mouseX >= 120 && mouseX <= 320) && (mouseY >= 420 && mouseY <= 520))
  {
    //shopbutton Animation
    fill(#33397d);
    stroke(#ebda26);
    rect(100, 400, 240, 140, 10);
    fill(#ff0000);
    textSize(60);
    text("SHOP", 145, 490);
  }
}
