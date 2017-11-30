/*****************************************************
*                Quine Scarf Generator               *
*                   By Daniel Lytle                  *
*                   daniellytle.com                  *
*    An quine image generator that outputs a binary  *
* representation of itself as two-color TIFF file.   *
*          Created for a collaboration with          *
*             Fabienne Serriere & KnitYak            *
*****************************************************/

final int PX_WIDTH = 100; //scarf width
final int PX_HEIGHT = 1200; //scarf height
final color ON_COLOR = #FFFFFF; // logic 1/low color
final color OFF_COLOR = #000000; // logic 0/low color
final boolean BORDER = true; //false = no border; true = adds 1-pixel border to edge of frame

void setup() {
  size( 100, 1200); //set frame width, height
  //Set entire frame to logic 0 color. If enabled, the border will be this color
  background(OFF_COLOR);
}

void draw(){
  String metaStr = "/*****************************************************\n*                Quine Scarf Generator               *\n*                   By Daniel Lytle                  *\n*                   daniellytle.com                  *\n*    An quine image generator that outputs a binary  *\n* representation of itself as two-color TIFF file.   *\n*          Created for a collaboration with          *\n*             Fabienne Serriere & KnitYak            *\n*****************************************************/\n\nfinal int PX_WIDTH = 100; //scarf width\nfinal int PX_HEIGHT = 1200; //scarf height\nfinal color ON_COLOR = #FFFFFF; // logic 1/low color\nfinal color OFF_COLOR = #000000; // logic 0/low color\nfinal boolean BORDER = true; //false = no border; true = adds 1-pixel border to edge of frame\n\nvoid setup() {\n  size( 100, 1200); //set frame width, height\n  //Set entire frame to logic 0 color. If enabled, the border will be this color\n  background(OFF_COLOR);\n}\n\nvoid draw(){\n  String metaStr = \"\";\n  \n  //reduce \"printable\" area by 2 pixels in each dimension if the border is enabled, \n  //so data that would be written on the edges of the frame without a border isn't \n  //overwritten when one is added.\n  \n  int drawWidth = PX_WIDTH;\n  int drawHeight = PX_HEIGHT;\n  if(BORDER){\n    drawHeight -= 2;\n    drawWidth -= 2;\n  }\n  \n  \n  for(int pxNum = 0; (pxNum < drawWidth * drawHeight) && (pxNum < 16 * metaStr.length()); pxNum++){\n    int x = (pxNum % drawWidth); // x coordinate\n    int y = (pxNum / drawWidth); // y coordinate\n    \n    //skip first column and row when border is enabled.\n    if(BORDER){\n      x++;\n      y++;\n    }\n    char thisChar = metaStr.charAt(pxNum / 16); //character with bit corresponding to next pixel\n    char thisBit = char(1 << pxNum%16); //mask to exclude all but next pixel bit in thisChar\n    \n    //sets pixel if masked-in bit is a 1\n    if (((thisChar & thisBit) != 0)){\n        set(x, y, ON_COLOR); //sets pixel at x,y to ON_COLOR\n      }\n    }\n  \n  save(\"quine_scarf.tif\"); //saves frame as a .tif in the sketch directory\n}";
  
  //reduce "printable" area by 2 pixels in each dimension if the border is enabled, 
  //so data that would be written on the edges of the frame without a border isn't 
  //overwritten when one is added.
  
  int drawWidth = PX_WIDTH;
  int drawHeight = PX_HEIGHT;
  if(BORDER){
    drawHeight -= 2;
    drawWidth -= 2;
  }
  
  
  for(int pxNum = 0; (pxNum < drawWidth * drawHeight) && (pxNum < 16 * metaStr.length()); pxNum++){
    int x = (pxNum % drawWidth); // x coordinate
    int y = (pxNum / drawWidth); // y coordinate
    
    //skip first column and row when border is enabled.
    if(BORDER){
      x++;
      y++;
    }
    char thisChar = metaStr.charAt(pxNum / 16); //character with bit corresponding to next pixel
    char thisBit = char(1 << pxNum%16); //mask to exclude all but next pixel bit in thisChar
    
    //sets pixel if masked-in bit is a 1
    if (((thisChar & thisBit) != 0)){
        set(x, y, ON_COLOR); //sets pixel at x,y to ON_COLOR
      }
    }
  
  save("quine_scarf.tif"); //saves frame as a .tif in the sketch directory
}