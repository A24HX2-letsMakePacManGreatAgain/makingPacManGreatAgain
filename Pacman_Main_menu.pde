  PFont mono;

void setup()
{
  size(224*3, 288*3);
  mono = createFont("PAC-FONT.TTF", 128);
  textFont(mono);
}





void draw()
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
  text("PAC-MAN", 100, 100);
  
}
