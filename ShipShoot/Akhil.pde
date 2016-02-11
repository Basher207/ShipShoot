class AkhilsShip extends Character {

  PVector position = new PVector(xPos,yPos); //the class character has variables xPos and yPos when defined, so here they are put in a vector position
  
  PVector velocity = new PVector(0,0); //velocity is used to contain the speed and direction of the ship

  PVector follow = new PVector(1000,1000); //follow is set to the object the ship is currently following
  
  int followIndex = 1; //follow index is the index of the object in the character arraylist that the ship is following

  PImage image = loadImage("data/AkhilShip.png");

AkhilsShip (float xPos, float yPos) {

    super (100, xPos, yPos);

  }

  void Render () {

    //draws the ship
    
    ellipseMode(CENTER);
    arc (xPos,yPos,50,50,0,PI,ARC);
    
    image(image,xPos,yPos);
    image.resize(100,100);
  }

  void followUpdate(){
    
    follow = new PVector(characters.get(followIndex).xPos,characters.get(followIndex).yPos); //updates the follow vector to be the position of the object stored in the followIndex
    
  }

  void closestShip(){
    
    PVector temp = new PVector(1000,1000); //a temporary vector is created to store the positions of the objects in each step of the for loop
    
    for (int i=0; i<characters.size();i++){ //this for loop runs for each object in the characters array
      
      if ((characters.get(i).xPos<temp.x) && (characters.get(i).yPos<temp.y)){ //this runs if the current object in the for loop has a position closer to the ship than the current temp vector
        
        temp = new PVector(characters.get(i).xPos,characters.get(i).yPos); //the temp vector is replaced with the position of the closest object
        
        followIndex = i; //the follow index is set to the closest object
        
      }
      
    }
    
  }

  void Move () {
    
    followUpdate(); 
    
    closestShip();
    
    velocity= new PVector(follow.x-velocity.x,follow.y-velocity.y); //the velocity is set to the vector between the ship's position adn the object being followed
    
    velocity.normalize(); //this vector is normalized so the ship only moves at one pixel per frame
    
    position.add(velocity); //the velocity is added to the position
    
    xPos = position.x; //the xPos and yPos variables are set to the x and y values of the position vector
    yPos = position.y;
    
  }
  
  void EnemyNearBy(float xPos, float yPos){
    
  }

}