int gridSize = 20;
int tileWidth = 20;
int speed = 8;
Grid gameGrid;
Player player;
int timer;

void setup(){
  gameGrid = new Grid(gridSize);
  size(400, 400);
  gameGrid.addFruit();
  player = new Player(5, 15, gameGrid);
}

void update(){
  if(timer == speed){
    player.move();
    timer =1;
  }else
  timer++;
}

void draw(){
  update();
  background(24, 24, 24);
  noStroke();
  fill(255, 255, 255, 0);
  for(int y = 0; y < gridSize; y++){
    for(int x = 0; x < gridSize; x++){
      switch(gameGrid.getFieldValue(x, y)){
        case 0:
          fill(0, 0, 0, 0);
          //rect(x*tileWidth, y*tileWidth, tileWidth, tileWidth);
        break;  
        case 1:
          fill(255, 0, 0);
          rect(x*tileWidth, y*tileWidth, tileWidth, tileWidth);
        break; 
      }
      for (int field : player.fields){
        if(field == gameGrid.calculateFieldByCoordinates(x, y)){
          fill (255, 255, 255);
          //fill(random(0, 255), random(0, 255), random(0, 255));
          rect(x*tileWidth, y*tileWidth, tileWidth, tileWidth);
        }
      }
    }
  }
}
void keyPressed(){
   if(keyCode==UP&&player.direction!=2) 
     player.direction = 0;  
   if(keyCode==RIGHT&&player.direction!=3) 
     player.direction = 1;
   if(keyCode==DOWN&&player.direction!=0) 
     player.direction = 2;
   if(keyCode==LEFT&&player.direction!=1) 
     player.direction = 3;
}
