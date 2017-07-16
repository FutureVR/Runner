PFont myFont;
float elementWidth = 10;
String deadString = "PRESS 'R' TO RESTART";
String startString = "Click Mouse to Jump";
boolean started = false;
 
TerrainController tc;
Player player;

void setup()
{
  size(1600, 400);
  background(255);
  
  myFont = createFont("Georgia", 64);
  textFont(myFont);
  textSize(64);
  
  tc = new TerrainController(height - 50, player);
  player = new Player( new PVector(100, height - 150), tc);
}

void draw()
{
  if (!started)
  {
    background(0);
    fill(255);
    textAlign(CENTER);
    text(startString, width / 2, height / 2);
  }
  else
  {
    background(255);
    
    printMessage();
    tc.mainUpdate();
    player.mainUpdate();
  }
  
}

void mousePressed()
{
  started = true;
  
  if(player.grounded)
  {
    player.jump();
    player.grounded = false;
  }
}

void keyPressed()
{
  if( key == 'r' || key == 'R')
  {
    tc = new TerrainController(height - 50, player);
    player = new Player( new PVector(100, height - 150), tc);
  }
}

void printMessage()
{
  if(player.dead) 
  {
    textSize(64);
    textAlign(CENTER, CENTER);
    text(deadString, width / 2, height / 2);
  }
  
  String s = "Score: " + int(player.score);
  
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text(s, (6f/8f) * width, (1f/8f) * height);
}
