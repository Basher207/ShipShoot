ArrayList <Character> characters; //Contains a reference to all the Characters
GameManager manager; //A GameManager instance

void setup () {
  size (600,600, P2D);
  characters = new ArrayList<Character> ();
  manager = new GameManager ();
}
void draw () {
  manager.Update();
}

class GameManager {
  //Adds all the ships in the correct spots.
  GameManager () {
    characters = new ArrayList<Character> ();
    characters.add (new BasharsShip (width / 3        , height / 3));
    characters.add (new AkhilsShip  (width - width / 3, height / 3));
    characters.add (new BeckysShip  (width / 3        , height - height / 3));
    characters.add (new BilalsShip  (width - width / 3, height - height / 3));
    characters.add (new BensShip    (width / 2, height / 2));
  }
  //Does all the callbacks to all the ships
  void Update () {
    Render ();
    Move   ();
  }
  //Calls Move() on all the Characters
  void Move () {
    for (int i = characters.size() - 1; i >= 0; i--) {
      Character character = characters.get (i);
      character.Move ();
      CheckIfInside (character);
    }
  }
  //Calls Render() on all the Characters
  void Render () {
    background (255);
    for (int i = characters.size() - 1; i >= 0; i--) {
      characters.get(i).Render();
    }
  }
  //Forces the Character to be inside of the ship.
  void CheckIfInside (Character character) {
    float border = 100;
    if (character.xPos > width + border)
      character.xPos -= width + border;
    if (character.xPos < 0)
      character.xPos += width + border;

    if (character.yPos > height + border)
      character.yPos -= height + border;
    if (character.yPos < 0)
      character.yPos += height + border;
  }
}

void mousePressed () {
    // pick a ship to place pseudo-randomly
    switch (millis() % 5) {
        case 0: {
            characters.add (new BasharsShip (mouseX + random (-5,5), mouseY + random (-5,5)));
        } break;

        case 1: {
            characters.add (new AkhilsShip (mouseX + random (-5,5), mouseY + random (-5,5)));
        } break;

        case 2: {
            characters.add (new BeckysShip (mouseX + random (-5,5), mouseY + random (-5,5)));
        } break;

        case 3: {
            characters.add (new BilalsShip (mouseX + random (-5,5), mouseY + random (-5,5)));
        } break;

        case 4: {
            characters.add (new BensShip (mouseX + random (-5,5), mouseY + random (-5,5)));
        } break;
    }
}
