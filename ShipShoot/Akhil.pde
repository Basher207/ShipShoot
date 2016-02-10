class AkhilsShip extends Character {

  PVector velocity = new PVector(0,0);

  PVector follow = new PVector(1000,1000);

  AkhilsShip (float xPos, float yPos) {

    super (100, xPos, yPos);

}

  void Render () {

    ellipseMode(CENTER);
    arc (xPos,yPos,50,50,0,PI,ARC);



}

  void Move () {
    if (dist(follow.x,follow.y,xPos,yPos)>100){
      for(int i=0;i<characters.size();i++){

        if ((characters.get(i).xPos<follow.x)&&(characters.get(i).yPos<follow.y)){

          follow.x = characters.get(i).xPos;
          follow.y = characters.get(i).yPos;

        }
      }
      velocity = new PVector((follow.x-xPos)/dist(follow.x,follow.y,xPos,yPos),(follow.y-yPos)/dist(follow.x,follow.y,xPos,yPos));

      xPos+=velocity.x;
      yPos+=velocity.y;

    }else if (dist(follow.x,follow.y,xPos,yPos)==100){

      xPos+=0;
      yPos+=0;

    }else if (dist(follow.x,follow.y,xPos,yPos)<100){

      xPos-=(abs(follow.x-xPos)/(follow.x-xPos));
      yPos+=(abs(follow.y-yPos)/(follow.y-yPos));

    }

  }

  void EnemyNearBy (float x, float y) {

  }
}
