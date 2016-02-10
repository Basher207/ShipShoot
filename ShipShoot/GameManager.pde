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
}
