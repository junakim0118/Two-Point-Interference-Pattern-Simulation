class Scrollbar {
  float x, y, w, h;
  float min, max;
  float scrollbarX, scrollbarVal;
  String label;

  Scrollbar( float x, float y, float w, float h, float min, float max, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.min = min;
    this.max = max;
    scrollbarX = x + (w/2);
    scrollbarVal = map( scrollbarX, x, x+w, min, max);
  }

  void display() {
    backgroundLayer();
    fill(167, 214, 58, 255);
    rect( x, y, w, h, 255);   //scrollbar
textFont(font2);
    fill(255); //indicator circle
   text( int(scrollbarVal), scrollbarX-13, y-4);   //display the scrollbarValue
    ellipse( scrollbarX-2, y+15, 35, h + 6);
  }

  void backgroundLayer() {
    push();
    fill(50);
    rect( x-10, y-25, w+20, h+55);  //outer rectangle
    fill(255);
    textSize(25);
    textFont(font2);
    textAlign(LEFT);
    text(int(min), x, y+h+25);
    textAlign(RIGHT);
    text(int(max), x+w-10, y+h+25);
    textAlign(CENTER);
    textSize(25);
    text(label, x+(w/2), y+h +25);
    pop();
  }

  void setscrollbarVal( float scrollbarVal) {
    this.scrollbarVal = scrollbarVal;
    this.scrollbarX = map( scrollbarVal, min, max, x, x+w);
  }

  boolean checkPressed(int mx, int my) {
    boolean applied = false;
    if ( mx >= x && mx <= x+w && my> y && my< y +h) { //test for >= so endpoints are included
      applied = true;
      scrollbarX = mx;
      scrollbarVal = map( scrollbarX, x, x+w, min, max);
    }
    return applied;
  }
}
