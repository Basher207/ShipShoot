ArrayList <Charchter> charchters;
GameManager manager;

void setup () {
  size (600,600, P2D);
  charchters = new ArrayList<Charchter> ();
  manager = new GameManager ();
}
void draw () {
  manager.Update();
}

class GameManager {
  GameManager () {
    charchters = new ArrayList<Charchter> ();
    charchters.add (new BasharsShip (width / 3        , height / 3));
    charchters.add (new AkhilsShip  (width - width / 3, height / 3));
    charchters.add (new BeckysShip  (width / 3        , height - height / 3));
    charchters.add (new BilalsShip  (width - width / 3, height - height / 3));
  }
  void Update () {
    Render ();
    Move   ();
  }
  void Move () {
    for (int i = charchters.size() - 1; i >= 0; i--) {
      Charchter charchter = charchters.get (i);
      charchter.Move ();
      CheckIfInside (charchter);
    }
  }
  void Render () {
    background (255);
    for (int i = charchters.size() - 1; i >= 0; i--) {
      charchters.get(i).Render();
    }
  }
  void CheckIfInside (Charchter charchter) {
    if (charchter.xPos > width)
      charchter.xPos -= width;
    if (charchter.xPos < 0)
      charchter.xPos += width;
      
    if (charchter.yPos > height)
      charchter.yPos -= height;
    if (charchter.yPos < 0)
      charchter.yPos += height;
  }
}  