class BasharsShip extends Charchter {
  PImage myShip;
  
  PVector velocity;
  
  float idealSpeed;
  float maxAcl;
  
  BasharsShip (float xPos, float yPos) {
    super (100, xPos, yPos);
    
    idealSpeed = 5;
    maxAcl = 0.02;
    velocity = new PVector();
    myShip = loadImage ("BasharsShip.png");
  }
  void Render () {
    imageMode (CENTER);
    image (myShip, xPos, yPos, 100, 100);
  }
  void Move () {
    PVector idealVelocity = PVector.sub (new PVector(mouseX,mouseY), new PVector (xPos,yPos));
    idealVelocity.setMag (idealSpeed);
    
    PVector acl = PVector.sub (idealVelocity, velocity);
    acl.setMag (maxAcl);
    
    velocity.add (acl);
    xPos += velocity.x;
    yPos += velocity.y;
  }
  void EnemyNearBy (float x, float y) {
    
  }
}