class BasharsShip extends Character {
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

    pushMatrix ();

    translate (xPos, yPos);
    if (velocity.x < 0)
      scale (-1, 1);
    image (myShip, 0, 0, 100, 100);

    popMatrix ();
  }
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
  void EnemyNearBy (float x, float y) {

  }
}
void mousePressed () {
  characters.add (new BasharsShip (mouseX + random (-5,5), mouseY + random (-5,5)));
}