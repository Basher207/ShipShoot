abstract class Character {
  float maxHealth;

  float xPos, yPos;

  float health;
  Character (float maxHealth, float xPos, float yPos) {
    this.maxHealth = maxHealth;
    this.xPos = xPos;
    this.yPos = yPos;
  }
  PVector GetVectorPosition () {
   return new PVector (xPos, yPos);
  }
  abstract void Render ();
  abstract void Move ();
  abstract void EnemyNearBy (float x, float y);
  
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