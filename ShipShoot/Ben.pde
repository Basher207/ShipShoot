class BensShip extends Character {
    PImage ship;
    PVector velocity;

    BensShip(float xPos, float yPos) {
        super(100, xPos, yPos);
        velocity = new PVector(-1, 1);
        ship = loadImage("BensShip.png");
    }

    void Render() {
        imageMode (CENTER);

        pushMatrix ();

        translate (xPos, yPos);

        if (velocity.x > 0)
            scale (-1, 1);

        tint(GenerateColor(xPos, yPos));
        image (ship, 0, 0, 294/2, 144/2);
        noTint();

        popMatrix ();
    }

    color GenerateColor(float x, float y) {
        float r = sin((millis() + x * y)/10000.0) * 255;
        float g = cos((millis() + x * y)/10000.0) * 255;
        float b = tan((millis() + x * y)/10000.0) * 255;
        return color(r, g, b);
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
