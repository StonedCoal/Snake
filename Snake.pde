int gridSize = 80;
int tileWidth = 10;
int speed = 4;
Grid gameGrid;
Player player;
Player player2;
int timer;
boolean jumpDown=false;
boolean jumpDown2=false;

void setup(){
  gameGrid = new Grid(gridSize);
  size(800, 800);
  surface.setTitle("Schnake");
  gameGrid.addFruit();
  player = new Player(5, 15, 1, gameGrid);
  player2 = new Player(75, 65, 3, gameGrid);
}

void update(){
  if(timer >= speed){
    player.move(1, player2);
    player2.move(1, player);
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
          stroke(255);
          fill(40, 40, 40);
          noStroke();
          rect(x*tileWidth, y*tileWidth, tileWidth, tileWidth);
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
      for (int field : player2.fields){
        if(field == gameGrid.calculateFieldByCoordinates(x, y)){
          fill (0, 0, 255);
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
   if(key=='w'&&player2.direction!=2) 
     player2.direction = 0;  
   if(key=='d'&&player2.direction!=3) 
     player2.direction = 1;
   if(key=='s'&&player2.direction!=0) 
     player2.direction = 2;
   if(key=='a'&&player2.direction!=1) 
     player2.direction = 3;
   if(key=='l')
    jumpDown = true;
   if(key=='c')
    jumpDown2 = true;
}

void keyReleased(){
  if(key=='l' && jumpDown){
    jumpDown = false;
    player.move(4, player2);
  }
    if(key=='c' && jumpDown2){
    jumpDown2 = false;
    player2.move(4, player);
  }
}
