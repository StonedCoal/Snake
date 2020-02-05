public class Player{
  
  public ArrayList<Integer> fields = new ArrayList<Integer>();
  Grid currentGrid;
  public int direction = 1;
  
  public Player(int x, int y, Grid grid){
    currentGrid=grid;
    fields.add(currentGrid.calculateFieldByCoordinates(x, y));
  }
  
  public void move(){
    int currentField = fields.get(fields.size()-1);
    int nextField = -1;
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
    if(nextField < 0 || nextField>=currentGrid.gridData.length){
      println("Game Over");
      return;
    }
    if(nextField%currentGrid.gridSize==0&&direction==1){
      println("Game Over");
      return;
    }
    if(nextField%currentGrid.gridSize==currentGrid.gridSize-1&&direction==3){
      println("Game Over");
      return;
    }
    if(fields.contains(nextField)){
      println("Game Over");
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
}
