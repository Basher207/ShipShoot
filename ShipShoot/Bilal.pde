class BilalsShip extends Character {
    PImage pirateShip;
    PImage pirateShipPower;//this is the variable name of my ship image

    BilalsShip (float xPos, float yPos) {
        super (100, xPos, yPos);
        pirateShip = loadImage ("boat.png");
        pirateShipPower = loadImage ("boat copy.png");
        //this loads the file that I added to the data folder
    }

    void Render () {
        pushMatrix();

        translate(xPos, yPos); //this translate allows the image to move according to the set value f xPos and yPos

        image (pirateShip, 0,0);

        xPos -= 2; //this determines the spead and direction at which the ship is moving
        Character nearest =PositionOfClosestEnemy(); //calling this function detects the closest object near the image.
        float enemy = nearest.xPos - xPos; //this one creates the distance between my ship and the other detected object.

        if (enemy <10) { //this if statement states that if the ship is less than 10 pixels away it will display another image which is the state extreting it's hidden power "purple flames"
            image(pirateShip,0,0);
        } else {
            image(pirateShipPower,0,0);
        }

        popMatrix();
    }

    void Move () {

    }

    void EnemyNearBy (float x, float y) {

    }
}
