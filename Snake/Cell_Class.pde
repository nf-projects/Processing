class Cell {
  
  // integers for red, green, and blue colors of the cell
  int r;
  int g;
  int b;
  
  // coordinates for the X & Y coordinates (not pixel positions, but coordinates e.g. top left cell)
  int coordx;
  int coordy;
  
  // TODO add value (is a snake on it, apple, etc)
  
  // constructor
  Cell (int r, int g, int b, int coordx, int coordy) {
    this.r = r;
    this.g = g;
    this.b = b;
    
    this.coordx = coordx;
    this.coordy = coordy;
  }
  
  void display(){
    fill(r,g,b);
    int pixelsPerCell = size / cellsPerRow;
    // draw the cell
    // subtract 1 so that you start counting at 1 instead of 0
    rect((coordx-1)*pixelsPerCell,(coordy-1)*pixelsPerCell,pixelsPerCell,pixelsPerCell);
    
  }
  
  void setX(int coordx) {
   this.coordx = coordx; 
  }
  
  void setY(int coordy) {
   this.coordy = coordy; 
  }  
  
}
