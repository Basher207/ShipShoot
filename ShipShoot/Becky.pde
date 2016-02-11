class BeckysShip extends Character {

    //image of whale to be used for "ship"
    PImage whale = loadImage("whale.png");

    //image of whale used when enemy is nearby
    PImage whaleWater = loadImage("whaleWater.png");


    //faceLeft boolean is used to change the direction of the
    //whale image
    boolean faceLeft = false;

    //constructor
    BeckysShip (float xPos, float yPos) {
        super (100, xPos, yPos);
        //resizing both images to be the same size when displayed
        whaleWater.resize(150, 100);
        whale.resize(150, 50);
    }

    void Render () {
        pushMatrix();

        //creates movement by moving the sketch by the value of xPos and yPos
        //in the move function
        translate(xPos, yPos);

        //controls value of boolean faceLeft
        //faceLeft() function is called directly below
        //so that for either faceLeft being false or true,
        //its functionality is called straight after

        if (xPos > (width-200)) {
            faceLeft = true;
        } else if (xPos < 200) {
            faceLeft = false;
        }

        faceLeft();

        //calls function PositionOfClosestEnemy and
        //returns the xPos of the nearest character
        Character nearest = PositionOfClosestEnemy();

        //Calculates the distance between the current value
        //of xPos and the value of the nearest characters xPos
        float distanceX = nearest.xPos - xPos;

        //if value of distanceX is smaller than 20, meaning
        //if an object is less than 20 pixels away from it
        //display the image of the whale spouting water, if
        //any further than 20 pixels away, display the normal
        //image of the whale
        if (distanceX < 20) {
            image(whaleWater, 0, 0);
        } else {
            image(whale, 0, 0);
        }

        popMatrix();
    }


    void Move () {
        //creates the wave movement that the whale has,
        //changes in movement because millis() is used
        xPos = (width/2) + cos(millis()/1000.0) * 200;
        yPos = (height - 100) + sin(millis()/100.0) * 50;
    }

    void EnemyNearBy (float x, float y) {
    }

    //function for boolean faceLeft
    void faceLeft() {
        if (faceLeft) {
            //if true, reverse the image horizontally so it is facing left
            scale(-1, 1);
        } else {
            //if false, reverse the image again horizontally so it is facing right
            scale(1, 1);
        }
    }
}
