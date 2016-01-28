abstract class Charchter {
  float maxHealth;

  float xPos, yPos;
  
  float health;
  Charchter (float maxHealth, float xPos, float yPos) {
    this.maxHealth = maxHealth;
    this.xPos = xPos;
    this.yPos = yPos;
  }
  abstract void Render ();
  abstract void Move ();
  abstract void EnemyNearBy (float x, float y);
}