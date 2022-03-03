int cellsPerRow = 20;

// size of the canvas
int size = 500;

//Cell test = new Cell(100,100,100,15,10);

// list[][] for the checkerboard
ArrayList<Cell> grid = new ArrayList<Cell>();

void setup() {
  // need to update "int size" above as well
  size(500,500);
  strokeWeight(0);
  
  // initialize the background "checkerboard pattern"
  for (int x = 1; x <= cellsPerRow; x++) {
    for (int y = 1; y <= cellsPerRow; y++) {
      // if y is odd: if x is odd color1, if x is even color2
      // if y is even: if x is even color1, if x is odd color2
      if (y % 2 == 0) {
        // y is even
        if (x % 2 == 0) {
          // x is even -> color1
          grid.add(new Cell(162,209,73,x,y));
        } else {
          // x is odd -> color2
          grid.add(new Cell(170,215,81,x,y));
          
        }   
      } else {
        // y is odd
        if (x % 2 == 0) {
          // x is even -> color2
          grid.add(new Cell(170,215,81,x,y));
          
        } else {
          // x is odd -> color1
          grid.add(new Cell(162,209,73,x,y));
          
        }   
      }
    }
  }
}

void draw() {
  // draw all items in grid[]
  for (Cell cell : grid) {
    cell.display();
    
  }
  
}
