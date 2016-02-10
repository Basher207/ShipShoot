class BensShip extends Character {
    PImage ship;
    PVector velocity;

    BensShip(float xPos, float yPos) {
        super(100, xPos, yPos);
        velocity = new PVector(0, 0);
        ship = loadImage("BensShip.png");
    }

    void Render() {
        imageMode (CENTER);

        pushMatrix ();

        translate (xPos, yPos);

        if (velocity.x < 0)
            scale (-1, 1);

        image (ship, 0, 0);

        popMatrix ();
    }

    void Move() {
        xPos += 1;
    }

    void EnemyNearBy(float x, float y) {

    }
}
