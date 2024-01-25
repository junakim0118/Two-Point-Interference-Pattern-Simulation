
int x = 0;
int y = 0;
int w = 100;
int h = 100;

void keyPressed() {
  if (keyCode==ESC){
    exit();
  }
  if (keyCode == ' ') {
    pause = !pause;
  }
}

void mousePressed() {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    pause = !pause;
  }
}
