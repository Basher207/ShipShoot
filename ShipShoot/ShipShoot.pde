ArrayList <Character> characters;
GameManager manager;

void setup () {
  size (600,600, P2D);
  characters = new ArrayList<Character> ();
  manager = new GameManager ();
}
void draw () {
  manager.Update();
}

class GameManager {
  GameManager () {
    characters = new ArrayList<Character> ();
    characters.add (new BasharsShip (width / 3        , height / 3));
    characters.add (new AkhilsShip  (width - width / 3, height / 3));
    characters.add (new BeckysShip  (width / 3        , height - height / 3));
    characters.add (new BilalsShip  (width - width / 3, height - height / 3));
    characters.add (new BensShip    (width / 2, height / 2));
  }
  void Update () {
    Render ();
    Move   ();
  }
  void Move () {
    for (int i = characters.size() - 1; i >= 0; i--) {
      Character Character = characters.get (i);
      Character.Move ();
      CheckIfInside (Character);
    }
  }
  void Render () {
    background (255);
    for (int i = characters.size() - 1; i >= 0; i--) {
      characters.get(i).Render();
    }
  }
  void CheckIfInside (Character Character) {
    if (Character.xPos > width)
      Character.xPos -= width;
    if (Character.xPos < 0)
      Character.xPos += width;

    if (Character.yPos > height)
      Character.yPos -= height;
    if (Character.yPos < 0)
      Character.yPos += height;
  }
}
