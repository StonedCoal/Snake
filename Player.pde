public class Player{
  
  public ArrayList<Integer> fields = new ArrayList<Integer>();
  Grid currentGrid;
  public int direction = 1;
  int fCounter=0;
  
  public Player(int x, int y, int dir ,Grid grid){
    currentGrid=grid;
    direction = dir;
    fields.add(currentGrid.calculateFieldByCoordinates(x, y));
  }
  
  public void move(int steps, Player enemy){
    int currentField = fields.get(fields.size()-1);
    int nextField = -1;
    for(int i = 0; i<steps; i++){
     switch(direction){
      case 0:
        nextField = currentField - gridSize;
      break;
      case 1:
        nextField = currentField+1;
      break;
      case 2:
        nextField = currentField + gridSize; 
      break;
      case 3:
        nextField = currentField -1;
      break;
      } 
      currentField = nextField;
    }
    if(nextField < 0 || nextField>=currentGrid.gridData.length){
      die();
      return;
    }
    if(nextField%currentGrid.gridSize==0&&direction==1){
      die();
      return;
    }
    if(nextField%currentGrid.gridSize==currentGrid.gridSize-1&&direction==3){
      die();
      return;
    }
    if(fields.contains(nextField)){
      die();
      return;
    }
    if(enemy.fields.contains(nextField)){
      die();
      return;
    }
    if(currentGrid.gridData[nextField]==1){
      fields.add(nextField);
      currentGrid.gridData[nextField]=0;
      currentGrid.addFruit();
    }else{
      fields.add(nextField);
      fields.remove(0);
    }
    
  }
  
  public void die(){
    fCounter++;
    println("F:" + fCounter);
  }
}
