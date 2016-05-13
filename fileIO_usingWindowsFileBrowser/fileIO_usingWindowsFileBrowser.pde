//
// This program builds on the previous example (fileIO_usingJavaFileMethods.pde)
// Make sure you have read and understand that first!
//
// the difference here is that we are using a mouse click to trigger the windows file 
// browser to load, which lets us manually pick a file rather than hard-coding a file path into
// our software.
//

File textFileToRead;


int[] positions;


void setup() {
  
  size(1000, 600);
  background(255);
  stroke(0);
  
  positions = new int[0];
}

void draw() {
  
  background(255);

  if (positions.length > 0){
    rect(positions[0], positions[1], positions[2], positions[3]);
  }

}


void mouseClicked() {
  
  // This function does something we haven't come accross before. 
  // It uses a 'callback', which is when one function takes another function as an argument.
  
  // In this case, selectInput opens a dialog box (using the default windows file browser),
  // and uses the first String as a message to the user when the dialog box opens. The second
  // String is the name of a function included somewhere in our code. In this case, it will call the 
  // fileSelected function and pass it the file chosen in the dilog box.
  
  selectInput("Select a sokoban level to lead:", "fileSelected"); 
  
}

void fileSelected(File selection) {

  if (selection == null){
    println ("the user cancelled the dialog box"); 
  }
  else {
   
    
    String fileName = selection.getName();
        
    int indexOfDot = fileName.indexOf(".");
 
    String extension = fileName.substring(indexOfDot + 1, fileName.length());
    
    if(!extension.equals("sokoban")){
      
        throw new NullPointerException ("You did not select a valid file. Please choose a .sokoban file");
    }
    else {
        
      
      
      String[] lines = loadStrings(fileName);
      
      int index = 0;
      
      if (index < lines.length) {

        positions = int(split(lines[index], ','));
     
        index = index + 1;  // Go to the next line for the next run through draw()
      }
    }
  }


}




