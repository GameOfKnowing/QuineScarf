/*
*                Quine Scarf Generator
*                   By Daniel Lytle
*                   daniellytle.com
*    Quine image generator. Outputs a binary
* representation of itself as two-color TIFF file.
*    Created for a potential collaboration with
*             Fabienne Serriere & KnitYak
*/

final int PX_WIDTH = 100; //scarf width
final int PX_HEIGHT = 1200; //scarf height
final color ON_COLOR = #000000; // logic 1/low color
final color OFF_COLOR = #FFFFFF; // logic 0/low color
final boolean BORDER = true; //false = no border; true = adds 1-pixel border to edge of frame

void setup() {
  size( 100, 1200); //set frame width, height
  //Set entire frame to logic 0 color. If enabled, the border will be this color
  background(OFF_COLOR);
}

void draw(){
  String metaStr = "/*\n*                Quine Scarf Generator\n*                   By Daniel Lytle\n*                   daniellytle.com\n*    Quine image generator. Outputs a binary\n* representation of itself as two-color TIFF file.\n*          Created for a collaboration with\n*             Fabienne Serriere & KnitYak\n*/\n\nfinal int PX_WIDTH = 100; //scarf width\nfinal int PX_HEIGHT = 1200; //scarf height\nfinal color ON_COLOR = #FFFFFF; // logic 1/low color\nfinal color OFF_COLOR = #000000; // logic 0/low color\nfinal boolean BORDER = true; //false = no border; true = adds 1-pixel border to edge of frame\n\nvoid setup() {\n  size( 100, 1200); //set frame width, height\n  //Set entire frame to logic 0 color. If enabled, the border will be this color\n  background(OFF_COLOR);\n}\n\nvoid draw(){\n  String metaStr = \"\";\n  \n  //reduce \"printable\" area by 2 pixels in each dimension if border is on\n  int drawWidth = PX_WIDTH;\n  int drawHeight = PX_HEIGHT;\n  if(BORDER){\n    drawHeight -= 2;\n    drawWidth -= 2;\n  }\n\n  int pxNum = 0; //the current pixel # \n  for(int charNum = 0; charNum < metaStr.length(); charNum ++){\n    char thisChar = metaStr.charAt(charNum); // next 16-bit character\n    char thisCharUpperASCII = hexExpand(true, thisChar); //expands hex representation of thisChar[7:4] to ASCII\n    char thisCharLowerASCII = hexExpand(false, thisChar); //expands hex representation of thisChar[3:0] to ASCII\n\n    //Draws 16-bit thisCharUpperASCII\n    for (int i = 0; i < 16; i++){\n      int x = (pxNum % drawWidth); // x coordinate\n      int y = (pxNum / drawWidth); // y coordinate\n      \n      if(BORDER){ //skip 1st column & row when border is on\n        x++;\n        y++;\n      }\n      \n      char thisBit = char(1 >> i); //mask to exclude all but next pixel bit in thisChar\n    \n      //sets pixel if masked-in bit is a 1\n      if (((thisCharUpperASCII & thisBit) != 0)){\n        set(x, y, ON_COLOR); //sets pixel at x,y to ON_COLOR\n      }\n      \n      pxNum++;\n    }\n    \n    //Draws 16-bit thisCharLowerASCII\n    for (int i = 0; i < 16; i++){      \n      int x = (pxNum % drawWidth); // x coord\n      int y = (pxNum / drawWidth); // y coord\n      \n      if(BORDER){ //skip first column & row when border is on\n        x++;\n        y++;\n      }\n      \n      char thisBit = char(1 >> i); //mask to exclude all but the next pixel bit in thisChar\n      \n      //sets pixel if masked-in bit is a 1\n      if (((thisCharLowerASCII & thisBit) != 0)){\n        set(x, y, ON_COLOR); //sets pixel at x,y to ON_COLOR\n      }\n \n      pxNum++;\n    }\n  }\n \n  save(\"quine_scarf.tif\"); // saves frame as TIFF in sketch directory\n}\n\n//converts the single-character hexadecimal representation of a 4-bit number to a character in ASCII format\nchar hexExpand(boolean isUpper, char inChar){\n  char maskedChar;\n  //puts bits inChar[7:4] or inChar[3:0] into maskedChar[3:0] & masks out maskedChar[15:4]\n  if (isUpper){ \n    maskedChar = char((inChar >> 4) & 0x000F);\n  }\n  else{\n    maskedChar = char(inChar & 0x000F);\n  }\n  \n  //returns ASCII character for hex representation of maskedChar[3:0]\n  if (maskedChar == 0){\n    return '0';\n  }\n  if (maskedChar == 1){\n    return '1';\n  }\n  if (maskedChar == 2){\n    return '2';\n  }\n  if (maskedChar == 3){\n    return '3';\n  }\n  if (maskedChar == 4){\n    return '4';\n  }\n  if (maskedChar == 5){\n    return '5';\n  }\n  if (maskedChar == 6){\n    return '6';\n  }\n  if (maskedChar == 7){\n    return '7';\n  }\n  if (maskedChar == 8){\n    return '8';\n  }\n  if (maskedChar == 9){\n    return '9';\n  }\n  if (maskedChar == 10){\n    return 'A';\n  }\n  if (maskedChar == 11){\n    return 'B';\n  }\n  if (maskedChar == 12){\n    return 'C';\n  }\n  if (maskedChar == 13){\n    return 'D';\n  }\n  if (maskedChar == 14){\n    return 'E';\n  }\n  else{\n    return 'F';\n  }\n}";
  
  //reduce "printable" area by 2 pixels in each dimension if border is on
  int drawWidth = PX_WIDTH;
  int drawHeight = PX_HEIGHT;
  if(BORDER){
    drawHeight -= 2;
    drawWidth -= 2;
  }

  int pxNum = 0; //the current pixel # 
  for(int charNum = 0; charNum < metaStr.length(); charNum ++){
    char thisChar = metaStr.charAt(charNum); // next 16-bit character
    char thisCharUpperASCII = hexExpand(true, thisChar); //expands hex representation of thisChar[7:4] to ASCII
    char thisCharLowerASCII = hexExpand(false, thisChar); //expands hex representation of thisChar[3:0] to ASCII

    //Draws 16-bit thisCharUpperASCII
    for (int i = 0; i < 16; i++){
      int x = (pxNum % drawWidth); // x coordinate
      int y = (pxNum / drawWidth); // y coordinate
      
      if(BORDER){ //skip 1st column & row when border is on
        x++;
        y++;
      }
      
      char thisBit = char(1 >> i); //mask to exclude all but next pixel bit in thisChar
    
      //sets pixel if masked-in bit is a 1
      if (((thisCharUpperASCII & thisBit) != 0)){
        set(x, y, ON_COLOR); //sets pixel at x,y to ON_COLOR
      }
      
      pxNum++;
    }
    
    //Draws 16-bit thisCharLowerASCII
    for (int i = 0; i < 16; i++){      
      int x = (pxNum % drawWidth); // x coord
      int y = (pxNum / drawWidth); // y coord
      
      if(BORDER){ //skip first column & row when border is on
        x++;
        y++;
      }
      
      char thisBit = char(1 >> i); //mask to exclude all but the next pixel bit in thisChar
      
      //sets pixel if masked-in bit is a 1
      if (((thisCharLowerASCII & thisBit) != 0)){
        set(x, y, ON_COLOR); //sets pixel at x,y to ON_COLOR
      }
 
      pxNum++;
    }
  }
 
  save("quine_scarf.tif"); // saves frame as TIFF in sketch directory
}

//converts the single-character hexadecimal representation of a 4-bit number to a character in ASCII format
char hexExpand(boolean isUpper, char inChar){
  char maskedChar;
  //puts bits inChar[7:4] or inChar[3:0] into maskedChar[3:0] & masks out maskedChar[15:4]
  if (isUpper){ 
    maskedChar = char((inChar >> 4) & 0x000F);
  }
  else{
    maskedChar = char(inChar & 0x000F);
  }
  
  //returns ASCII character for hex representation of maskedChar[3:0]
  if (maskedChar == 0){
    return '0';
  }
  if (maskedChar == 1){
    return '1';
  }
  if (maskedChar == 2){
    return '2';
  }
  if (maskedChar == 3){
    return '3';
  }
  if (maskedChar == 4){
    return '4';
  }
  if (maskedChar == 5){
    return '5';
  }
  if (maskedChar == 6){
    return '6';
  }
  if (maskedChar == 7){
    return '7';
  }
  if (maskedChar == 8){
    return '8';
  }
  if (maskedChar == 9){
    return '9';
  }
  if (maskedChar == 10){
    return 'A';
  }
  if (maskedChar == 11){
    return 'B';
  }
  if (maskedChar == 12){
    return 'C';
  }
  if (maskedChar == 13){
    return 'D';
  }
  if (maskedChar == 14){
    return 'E';
  }
  else{
    return 'F';
  }
}