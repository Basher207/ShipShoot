class BasharsShip extends Character {
  //The Image of the ship
  PImage myShip; 
  //The velocity of the ship
  PVector velocity;
  
  //The ideal target speed that the ship will seek
  float idealSpeed;
  //The maximum acceleration of the ship
  float maxAcl;
  
  //The constructor, takes in the xPosition, yPosition of the ship
  BasharsShip (float xPos, float yPos) {
    super (100, xPos, yPos);

    idealSpeed = 7;
    maxAcl = 0.06;
    velocity = new PVector();
    myShip = loadImage ("BasharsShip.png");
  }
  //Renders the ship into the correct position, and uses Matrixes to scale the xAxis 
  //to make the ship turn to the right direction
  void Render () {
    imageMode (CENTER);

    pushMatrix ();
      translate (xPos, yPos);
      if (velocity.x < 0)
        scale (-1, 1);
      image (myShip, 0, 0, 100, 100);
    popMatrix ();
  }
  //Sets an ideal velocity vector, and accelerates towards it from current velocity vector
  //Than adds velocity to position
  void Move () {
    Character runAwayFromPosition = PositionOfClosestEnemy ();

    PVector idealVelocity = PVector.sub (new PVector (xPos,yPos), new PVector (runAwayFromPosition.xPos, runAwayFromPosition.yPos));
    idealVelocity.setMag (idealSpeed);

    PVector acl = PVector.sub (idealVelocity, velocity);
    acl.setMag (maxAcl);

    velocity.add (acl);
    xPos += velocity.x;
    yPos += velocity.y;
  }
}
void mousePressed () {
  characters.add (new BasharsShip (mouseX + random (-5,5), mouseY + random (-5,5)));
}