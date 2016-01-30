byte bytes[]; 
int x = 0;
int y = 0;
int maxX = 50;
int maxY = 50;
int offsetX = 35;

void setup() {
  bytes = loadBytes("zaagsel-1MB.rgb");
  size(500, 800);
}

void draw() {
  background(0);
  x=0;
  y=0;
  for (int i=0; i<bytes.length-3; ) {
    char r = char(bytes[i++] & 255);
    char g = char(bytes[i++] & 255);
    char b = char(bytes[i++] & 255);
    set(x + offsetX, y, color(r, g, b));
    if (++x>maxX) {
      x=0;
      y++;
    }
    if (y%(maxY+20)==0) {
      y+=20;
    }
  }
  noStroke();
  for (int y=0; y<=height; y+=constrain(maxY/5,30,50)) {
     rect(5, y-4, 25, constrain(maxY/10,15,30), 2);
     rect(5+maxX+offsetX, y+24, 25, constrain(maxY/10,15,30), 2);
  }
  scale(1.2);
  text((maxX+1) + "x" + maxY + "     (use mouse or arrow keys to find resolution)",30,12);
}

void mouseMoved() {
  maxX = mouseX;
  maxY = mouseY;
}

void keyPressed() {
  if (keyCode==LEFT) maxX--;
  if (keyCode==RIGHT) maxX++;
  if (keyCode==UP) maxY--;
  if (keyCode==DOWN) maxY++;
  println(maxX, mouseY);
}