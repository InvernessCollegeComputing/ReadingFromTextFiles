String[] lines;

int index = 0;

void setup() {
  
  size(1000, 600);
  background(255);
  stroke(0);

  lines = loadStrings("positions.txt");

}

void draw() {
  
  try{  
    
    if (index < lines.length) {

      int[] pieces = int(split(lines[index], ','));

      rect(pieces[0], pieces[1], pieces[2], pieces[3]);
 
      index = index + 1;  // Go to the next line for the next run through draw()
    }
  } 
  
  catch (NullPointerException errorLoadingRectanglePositionsInSetup) {
  
    println("no file was found here");
    
  } 
}
