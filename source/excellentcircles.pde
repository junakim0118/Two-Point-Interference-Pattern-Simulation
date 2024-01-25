//Juna Kim
//Physics Major Project
//January 9, 2023

//draw
Scrollbar scrollbar1;
Scrollbar scrollbar2;
Scrollbar scrollbar3;
PFont font1, font2;

float wL;
float dis;
float wL1, wL2;
boolean start = false;
boolean pause = false; //pause button?
//scrollbar changes values

void setup() {
  fullScreen();
  textSize(25);
  scrollbar1 = new Scrollbar( width/2-200-450, 30, 400, 30, 100, 300, "Wavelength");
  scrollbar2 = new Scrollbar( width/2-200, 30, 400, 30, 250, 450, "Distance between sources");
  scrollbar3 = new Scrollbar( width/2-200+450, 30, 400, 30, 100, 300, "Frequency");

  wL1 = scrollbar1.scrollbarVal;
  dis = scrollbar2.scrollbarVal;
  wL2 = 400-scrollbar3.scrollbarVal;
  wL=(wL1+wL2)/2;
  font1 = loadFont("Consolas-Bold-50.vlw");
  font2 = loadFont("Dubai-Regular-25.vlw");
  
}

void draw() {
  if (start==false) {
  background(230);
  textSize(50);
 
  textAlign(CENTER);
  fill(0);
  textFont(font1);
  text("Two Point Interference Pattern Simulation", width/2, height/2-110);
  
  stroke(0);
  line(width/2-580,height/2-95,width/2+580,height/2-95);
  textSize(30);
  text("A crest from one point source and a trough from the other point source meet", width/2, height/2-60);
  text("to create nodal points and nodal lines from destructive interference, showing an", width/2, height/2-10);
  text("interference pattern depending on wavelength, distance between sources, and frequency.", width/2, height/2+40);
  line(width/2-580,height/2+70,width/2+580,height/2+70);
  
  textSize(50);
  fill(0);
  text("Click anywhere to start!", width/2, height/2+120);
  textSize(25);
    fill(210);
    rect(width-500-20,10,490,230);
    fill(0);
    text("NOTE:", width-250-20,50);
     textAlign(CENTER);
    text("use spacebar to pause",width-250-20,90);
    text("the simulation and", width-250-20,120);
    text("adjust the values of wavelength,",width-250-20,150);
    text("distance between sources,", width-250-20,180);
    text("and frequency using the scrollbars",width-250-20,210);
     
 textAlign(LEFT);
  textSize(25);
  text("SPH4U Juna Kim",20,50);
  text("January 19, 2023",20,80);
  
  
  }
  if (start==true) {

    background(255);
    fill(255, 0, 0);
    rect(x, y, w, h);
    

    if (pause == true) {
      frameCount--;
    }
    push();
    translate(width/2, (height+100)/2);
    strokeWeight(1.5);
    fill(100);
    ellipse(-dis, 0, 5, 5);
    ellipse(dis, 0, 5, 5);
    noFill();

    float mp = int(width/wL*2.5);

    stroke(0);

    float x1=-dis;
    float x2=dis;
    float y1=0;
    float y2=0;
    boolean smallW = false;


    if (frameCount*5%wL==0) {
      smallW=false;
    }
    if (smallW==false) {
      stroke(255);
      float d = 0*wL+frameCount*5%wL;
      ellipse(x1, y1, d, d);
      ellipse(x2, y2, d, d);
    }
    //black circles
    for (float i=0; i<mp; i+=2) {
      stroke(0);
      float d = i*wL+(frameCount*5)%(wL*2);
      ellipse(x1, y1, d, d);
      ellipse(x2, y2, d, d);
    }
    //white circles
    for (float i=1; i<mp; i+=2) {
      stroke(255);
      float d = i*wL+(frameCount*5)%(wL*2);
      ellipse(x1, y1, d, d);
      ellipse(x2, y2, d, d);
    }

    for (float i=1; i<mp; i+=2) {
      float r1 = (frameCount*5%wL)/2;
      float r2 = (i*wL+frameCount*5%(wL*1))/2;
      stroke(255, 0, 0);
      fill(255, 0, 0);
      ellipse((sq(dis*2)-sq(r2)+sq(r1))/4/dis-dis, sqrt((4*sq(2*dis)*sq(r1)-sq(sq(2*dis)-sq(r2)+sq(r1)))/4/sq(2*dis)), 8, 8);
      ellipse((sq(dis*2)-sq(r2)+sq(r1))/4/dis-dis, -sqrt((4*sq(2*dis)*sq(r1)-sq(sq(2*dis)-sq(r2)+sq(r1)))/4/sq(2*dis)), 8, 8);
      ellipse((sq(dis*2)-sq(r1)+sq(r2))/4/dis-dis, sqrt((4*sq(2*dis)*sq(r2)-sq(sq(2*dis)-sq(r1)+sq(r2)))/4/sq(2*dis)), 8, 8);
      ellipse((sq(dis*2)-sq(r1)+sq(r2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq(r2)-sq(sq(2*dis)-sq(r1)+sq(r2)))/4/sq(2*dis)), 8, 8);
    }

    for (int i=0; i<mp; i+=2) {
      for (int z=1; z<mp; z+=2) {
        float r1 = (i*wL+frameCount*5%(wL*2))/2;
        float r2 = (z*wL+frameCount*5%(wL*2))/2;
        stroke(255, 0, 0);
        fill(255, 0, 0);
        ellipse((sq(dis*2)-sq(r2)+sq(r1))/4/dis-dis, sqrt((4*sq(2*dis)*sq(r1)-sq(sq(2*dis)-sq(r2)+sq(r1)))/4/sq(2*dis)), 8, 8);
        ellipse((sq(dis*2)-sq(r2)+sq(r1))/4/dis-dis, -sqrt((4*sq(2*dis)*sq(r1)-sq(sq(2*dis)-sq(r2)+sq(r1)))/4/sq(2*dis)), 8, 8);
        ellipse((sq(dis*2)-sq(r1)+sq(r2))/4/dis-dis, sqrt((4*sq(2*dis)*sq(r2)-sq(sq(2*dis)-sq(r1)+sq(r2)))/4/sq(2*dis)), 8, 8);
        ellipse((sq(dis*2)-sq(r1)+sq(r2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq(r2)-sq(sq(2*dis)-sq(r1)+sq(r2)))/4/sq(2*dis)), 8, 8);
      }
    }
    stroke(0);
    strokeWeight(0.8);
    line(-width/2, 0, width/2, 0);
    line(0, -height/2, 0, height/2);
    stroke(255, 0, 0);
    strokeWeight(2.2);
    smooth();
    noFill();
    beginShape();
    for (float q=mp; q>0; q-=0.05) {
      float w=q+1;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(-1*wL/4, 0);
    curveVertex(-1*wL/4, 0);
    curveVertex(-1*wL/4, 0);
    curveVertex(-1*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.05) {
      float w=q+1;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    endShape();

    beginShape();
    for (float q=mp; q>0; q-=0.05) {
      float w=q+1;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(1*wL/4, 0);
    curveVertex(1*wL/4, 0);
    curveVertex(1*wL/4, 0);
    curveVertex(1*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.05) {
      float w=q+1;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    endShape();
    beginShape();
    for (float q=mp; q>0; q-=0.03) {
      float w=q+3;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(-3*wL/4, 0);
    curveVertex(-3*wL/4, 0);
    curveVertex(-3*wL/4, 0);
    curveVertex(-3*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.03) {
      float w=q+3;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    endShape();

    beginShape();
    for (float q=mp; q>0; q-=0.03) {
      float w=q+3;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(3*wL/4, 0);
    curveVertex(3*wL/4, 0);
    curveVertex(3*wL/4, 0);
    curveVertex(3*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.03) {
      float w=q+3;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    endShape();
    beginShape();
    for (float q=mp; q>0; q-=0.01) {
      float w=q+5;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(-5*wL/4, 0);
    curveVertex(-5*wL/4, 0);
    curveVertex(-5*wL/4, 0);
    curveVertex(-5*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.01) {
      float w=q+5;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    endShape();

    beginShape();
    for (float q=mp; q>0; q-=0.01) {
      float w=q+5;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(5*wL/4, 0);
    curveVertex(5*wL/4, 0);
    curveVertex(5*wL/4, 0);
    curveVertex(5*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.01) {
      float w=q+5;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    endShape();
    beginShape();
    for (float q=mp; q>0; q-=0.01) {
      float w=q+7;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(-7*wL/4, 0);
    curveVertex(-7*wL/4, 0);
    curveVertex(-7*wL/4, 0);
    curveVertex(-7*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.01) {
      float w=q+7;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    endShape();

    beginShape();
    for (float q=mp; q>0; q-=0.01) {
      float w=q+7;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(7*wL/4, 0);
    curveVertex(7*wL/4, 0);
    curveVertex(7*wL/4, 0);
    curveVertex(7*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.01) {
      float w=q+7;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    endShape();
    beginShape();
    for (float q=mp; q>0; q-=0.01) {
      float w=q+9;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(-9*wL/4, 0);
    curveVertex(-9*wL/4, 0);
    curveVertex(-9*wL/4, 0);
    curveVertex(-9*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.01) {
      float w=q+9;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    endShape();

    beginShape();
    for (float q=mp; q>0; q-=0.01) {
      float w=q+9;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(9*wL/4, 0);
    curveVertex(9*wL/4, 0);
    curveVertex(9*wL/4, 0);
    curveVertex(9*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.01) {
      float w=q+9;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    endShape();
    beginShape();
    for (float q=mp; q>0; q-=0.01) {
      float w=q+11;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(-11*wL/4, 0);
    curveVertex(-11*wL/4, 0);
    curveVertex(-11*wL/4, 0);
    curveVertex(-11*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.01) {
      float w=q+11;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    endShape();

    beginShape();
    for (float q=mp; q>0; q-=0.01) {
      float w=q+11;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(11*wL/4, 0);
    curveVertex(11*wL/4, 0);
    curveVertex(11*wL/4, 0);
    curveVertex(11*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.01) {
      float w=q+11;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    endShape();
    beginShape();
    for (float q=mp; q>0; q-=0.01) {
      float w=q+13;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(-13*wL/4, 0);
    curveVertex(-13*wL/4, 0);
    curveVertex(-13*wL/4, 0);
    curveVertex(-13*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.01) {
      float w=q+13;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    endShape();

    beginShape();
    for (float q=mp; q>0; q-=0.01) {
      float w=q+13;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(13*wL/4, 0);
    curveVertex(13*wL/4, 0);
    curveVertex(13*wL/4, 0);
    curveVertex(13*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.01) {
      float w=q+13;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    endShape();
    beginShape();
    for (float q=mp; q>0; q-=0.03) {
      float w=q+15;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(-15*wL/4, 0);
    curveVertex(-15*wL/4, 0);
    curveVertex(-15*wL/4, 0);
    curveVertex(-15*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.03) {
      float w=q+15;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    endShape();

    beginShape();
    for (float q=mp; q>0; q-=0.03) {
      float w=q+15;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(15*wL/4, 0);
    curveVertex(15*wL/4, 0);
    curveVertex(15*wL/4, 0);
    curveVertex(15*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.03) {
      float w=q+15;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    endShape();
    beginShape();
    for (float q=mp; q>0; q-=0.03) {
      float w=q+17;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(-17*wL/4, 0);
    curveVertex(-17*wL/4, 0);
    curveVertex(-17*wL/4, 0);
    curveVertex(-17*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.03) {
      float w=q+17;
      curveVertex((sq(dis*2)-sq((w*wL)/2)+sq((q*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((q*wL)/2)-sq(sq(2*dis)-sq((w*wL)/2)+sq((q*wL)/2)))/4/sq(2*dis)));
    }
    endShape();

    beginShape();
    for (float q=mp; q>0; q-=0.03) {
      float w=q+17;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    curveVertex(17*wL/4, 0);
    curveVertex(17*wL/4, 0);
    curveVertex(17*wL/4, 0);
    curveVertex(17*wL/4, 0);
    for (float q=0; q<mp+1; q+=0.03) {
      float w=q+17;
      curveVertex((sq(dis*2)-sq((q*wL)/2)+sq((w*wL)/2))/4/dis-dis, -sqrt((4*sq(2*dis)*sq((w*wL)/2)-sq(sq(2*dis)-sq((q*wL)/2)+sq((w*wL)/2)))/4/sq(2*dis)));
    }
    endShape();

    pop();

    fill(255);
    stroke(0);
    rect(0, 0, width, 100);

    textSize(25);
    if (mousePressed) {
      boolean applied1 = scrollbar1.checkPressed( mouseX, mouseY);
      boolean applied2 = scrollbar2.checkPressed( mouseX, mouseY);
      boolean applied3 = scrollbar3.checkPressed( mouseX, mouseY);

      if (applied1) {
        wL1 = scrollbar1.scrollbarVal;
        wL=(wL1+wL2)/2;
      }
      if (applied2) {
        dis = scrollbar2.scrollbarVal;
      }
      if (applied3) {
        wL2 = 400 - scrollbar3.scrollbarVal;
        wL=(wL1+wL2)/2;
      }
    }
    scrollbar1.display();
    scrollbar2.display();
    scrollbar3.display();

    fill(255, 0, 0);
    rect(x, y, w, h);
    fill(0);
    text("Pause", 20, 55);
    
 
  }
}
