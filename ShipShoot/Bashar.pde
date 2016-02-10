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
    PVector runAwayFromPosition = PositionOfClosestEnemy ();

    PVector idealVelocity = PVector.sub (new PVector (xPos,yPos), runAwayFromPosition);
    idealVelocity.setMag (idealSpeed);

    PVector acl = PVector.sub (idealVelocity, velocity);
    acl.setMag (maxAcl);

    velocity.add (acl);
    xPos += velocity.x;
    yPos += velocity.y;
  }
  PVector PositionOfClosestEnemy () {
    PVector closestTarget = null;
    float closestDistance = Float.POSITIVE_INFINITY;

    for (int i = 0; i < characters.size (); i++) {
      Character Character = characters.get (i);
      if (Character == this)
        continue;
      PVector CharacterPosition = Character.GetVectorPosition ();
      float distance =PVector.dist (CharacterPosition, new PVector (xPos, yPos));
      if (distance < closestDistance) {
        closestTarget = CharacterPosition;
        closestDistance = distance;
      }
    }
    return closestTarget;
  }
  void EnemyNearBy (float x, float y) {

  }
}
void mousePressed () {
  characters.add (new BasharsShip (mouseX + random (-5,5), mouseY + random (-5,5)));
}
