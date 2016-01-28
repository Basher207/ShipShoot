ArrayList <Charchter> charchters;
GameManager manager;

void setup () {
  size (600,600, P3D);
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
      charchters.get(i).Move ();
    }
  }
  void Render () {
    background (255);
    for (int i = charchters.size() - 1; i >= 0; i--) {
      charchters.get(i).Render();
    }
  }
}  