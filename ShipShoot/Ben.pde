class BensShip extends Character {
    PImage ship;
    PVector velocity;
    color c;

    BensShip(float xPos, float yPos) {
        super(100, xPos, yPos);
        velocity = new PVector(-1, 1);
        c = color(255, 255, 255);
        ship = loadImage("BensShip.png");
    }

    void Render() {
        imageMode (CENTER);

        pushMatrix ();

        translate (xPos, yPos);

        if (velocity.x > 0)
            scale (-1, 1);

        tint(c);
        image (ship, 0, 0, 294/2, 144/2);
        noTint();

        popMatrix ();
    }

    void Move() {
        velocity.x = cos(millis()/10000.0) * 2;
        velocity.y = sin(millis()/10000.0) * 2;

        xPos += velocity.x;
        yPos += velocity.y;
    }

    void EnemyNearBy(float x, float y) {

    }
}
