class Player
{
  PVector position;
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  
  float diameter = 10;
  float score = 0;
  char trailingSymbol = 'w';
  
  float gravityForce = .2;
  float jumpVelocity = 5;
  int rayStartPos = int((diameter / 2f) + 1);
  float rayLength = 1;
  
  boolean grounded = false;
  boolean collided = false;
  boolean dead = false;
  char elementUnder;
  
  TerrainController myTerrainController;
  
  
  Player(PVector p, TerrainController tc)
  {
    position = p.copy();
    myTerrainController = tc;
  }
  
  void mainUpdate()
  {
    if( grounded )
    {
      position.y = myTerrainController.posY - myTerrainController.walkwayHeight - diameter / 2f;
      velocity.mult(0);
    }
    else
    {
      applyGravity();
    }
    
    println(score);
    
    updateMovement();
    checkGrounded();
    checkCollided();
    checkScore();
    checkDead();
    if(!dead) display();
  }
  
  void updateMovement()
  {
    position.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
  }
  
  void checkGrounded()
  { 
    grounded = false;
    
    for(int i = rayStartPos; i < rayStartPos + rayLength; i++)
    {
      color c = get( int(position.x), int(position.y + i) );
      stroke(0, 255, 0);
      
      if( red(c) == 0 ) 
      {
        grounded = true;
      }
    }
    
    elementUnder = myTerrainController.elements.get(myTerrainController.ballIndex).symbol;
  }
  
  void checkCollided()
  {
    collided = false;
    
    for(int i = rayStartPos; i < rayStartPos + rayLength; i++)
    {
      color c = get( int(position.x + i), int(position.y) );
      stroke(0, 255, 0);
      
      if( red(c) == 0 ) 
      {
        collided = true;
      }
    }
  }
  
  void checkDead()
  {
    if( (grounded && elementUnder == 'o' ) || (collided) ) dead = true;
  }
  
  void checkScore()
  {
    if(trailingSymbol != elementUnder)
    {
      if(elementUnder == 'o') score++;
      trailingSymbol = elementUnder;
    }
  }
  
  void applyGravity()
  {
    acceleration = new PVector(0, gravityForce);
  }
  
  void jump()
  {
    velocity = new PVector(0, -jumpVelocity);
  }
  
  void display()
  {
    fill(200, 0, 0);
    noStroke();
    ellipse(position.x, position.y, diameter, diameter);
  }
  
}