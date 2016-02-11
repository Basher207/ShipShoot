abstract class Character {

  //Position of the Character
  float xPos, yPos;
  
  //Constructor, takes in the xPosition and the yPosition of the Character
  
  Character (float maxHealth, float xPos, float yPos) {
    this.xPos = xPos;
    this.yPos = yPos;
  }
  //Returns the position of the Character as a PVector
  PVector GetVectorPosition () {
   return new PVector (xPos, yPos);
  }
  //Move is first called to recalculate all the ships movements
  abstract void Move ();
  //Than Render is called, to render all the ships in there new positions
  abstract void Render ();
  //Returns the Character that is closest to this character, that isn't this Character
  
  Character PositionOfClosestEnemy () {
    Character closestTarget = null;
    float closestDistance = Float.POSITIVE_INFINITY;

    for (int i = 0; i < characters.size (); i++) {
      Character character = characters.get (i);
      if (character == this)
        continue;
      PVector CharacterPosition = character.GetVectorPosition ();
      float distance =PVector.dist (CharacterPosition, new PVector (xPos, yPos));
      if (distance < closestDistance) {
        closestTarget = character;
        closestDistance = distance;
      }
    }
    return closestTarget;
  }
  
}