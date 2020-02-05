public class Grid{
  /**  
  *** The data in this game is saved in this Grid
  *** 0 means empty field
  *** 1 is fruit
  **/
  
  
  public  int[] gridData;
  public int gridSize;

  public Grid(int gridSize){
    this.gridSize = gridSize;
    gridData=new int[gridSize*gridSize];
    for(int i = 0; i<gridData.length; i++){
      gridData[i]=0;
    }
  }
  
  public int getFieldValue(int x, int y){
    return gridData[calculateFieldByCoordinates(x, y)];
  } 
  
  public void setFieldValue(int x, int y, int value){
    gridData[calculateFieldByCoordinates(x, y)] = value;
  }
  
  public int calculateFieldByCoordinates(int x, int y){
    return y * gridSize + x;
  }
  void addFruit(){
  boolean fruitAdded = false;
  while(!fruitAdded){
    int fieldX = (int)random(0, gridSize - 1);
    int fieldY = (int)random(0, gridSize - 1);
    if(getFieldValue(fieldX, fieldY) == 0){
      setFieldValue(fieldX, fieldY, 1);
      fruitAdded=true;
    }
  }
}
  
}
