class TerrainController
{
  ArrayList<Element> elements = new ArrayList<Element>();
  float elementWidth = 10;
  int index = 0;
  int range = int(width / elementWidth);
  
  float obstacleWidth = 25;
  float obstacleHeight = 30;
  float walkwayWidth = 10;
  float walkwayHeight = 10;
  
  float terrainSpeed = 5;
  float posY = height - 50;
  float startingPosX = 0;
  float finalPosX = 0;
  
  Player myPlayer;
  int ballIndex;
  
  TerrainController(float y, Player p)
  {
    posY = y;
    myPlayer = p;
    
    for(int i = 0; i < 60; i++) elements.add( new Walkway(walkwayWidth, walkwayHeight));
  }
  
  void mainUpdate()
  {
    moveTerrain();
    checkBounds();
    displayTerrain();
  }
  
  void moveTerrain()
  {
    if(!player.dead) startingPosX -= terrainSpeed;  
  }
  
  void checkBounds()
  {
    if(elements.size() > 0) 
    {
      if(abs(startingPosX) > elements.get(0).myWidth)
      {
        elements.remove(0);
        startingPosX = 0;
      }
    }
  }
  
  void generateElement() 
  {
    //elements.add( new Walkway(10, 5) );
    if( (int)random(0, 25) == 0 ) elements.add( new Obstacle(obstacleWidth + random(-5, 10), obstacleHeight + random(-5, 10)) );
    else elements.add( new Walkway(walkwayWidth, walkwayHeight) );
  }
  
  void displayTerrain()
  {
    finalPosX = startingPosX;
    int i = index;
    
    while(finalPosX < width)
    {
      if( i >= elements.size() ) generateElement();
      Element e = elements.get(i);
      e.display(finalPosX , posY);
      
      if( finalPosX < player.position.x  &&  player.position.x < finalPosX + e.myWidth) ballIndex = i;
      
      finalPosX += e.myWidth;
      i++;
    }
  }
}