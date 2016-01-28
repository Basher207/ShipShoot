class BeckysShip extends Charchter {
  BeckysShip (float xPos, float yPos) {
    super (100, xPos, yPos);
  }
  void Render () {
    ellipse (xPos, yPos, 10, 10);
  }
  void Move () {
    
  }
  void EnemyNearBy (float x, float y) {
    
  }
}