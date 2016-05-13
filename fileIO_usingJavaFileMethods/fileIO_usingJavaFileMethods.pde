//
// The idea behind this version of the program is to use
// some of the JAVA File methods to inspect our file before we 
// try to load data from it. 
//
// This will allow us to be more specific with our error messages
// than we could be just by using the processing methods alone
//


File textFileToRead;    // The File object is a Java type: https://docs.oracle.com/javase/7/docs/api/java/io/File.html
                        // It can be used to store references to files or directories on your computer.

String[] lines;

int index = 0;

void setup() {
  
  size(1000, 600);
  background(255);
  stroke(0);

  // First we create a new File by passing it a URL:
  
  textFileToRead = new File("C:/Users/in13db/Desktop/ReadingFromTextFiles/fileIO_usingJavaFileMethods/data/positions.sokoban");

  if (textFileToRead.exists()){        // If the file exists at this location, then inspect it.
    
    String fileName = textFileToRead.getName();        // Get the full file name (including extension)
    
    int indexOfDot = fileName.indexOf(".");            // Find out where the . is so we know where the file extension starts
 
    String extension = fileName.substring(indexOfDot + 1, fileName.length());    // Extract the extension
    
    println(extension);
    
    if(extension.equals("sokoban")){          // Check if the extension matches our custom text file extension
                                              // (Which we made by renaming the file... pretty easy) 
      
      lines = loadStrings(fileName);          // If it does exist, and has the right extension, then load it up
      
    }
    else {
      throw new NullPointerException ("Error in setup() at line 38. The file you tried to load does not have the correct extension");
    }
    
  }
  else {
    throw new NullPointerException ("Error in setup() at line 46. The file you tried to load does not exist at this location");
  }

  

}

void draw() {
  
  // I've removed the try and catch block here, as we have put all our expection handling into the part of the code
  // where the file is loaded.

  if (index < lines.length) {

    int[] pieces = int(split(lines[index], ','));

    rect(pieces[0], pieces[1], pieces[2], pieces[3]);
 
    index = index + 1;  // Go to the next line for the next run through draw()
  }


}


