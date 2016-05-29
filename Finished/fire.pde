int fireX=225, fireY=300;
int lazerX=480;
float metX=1000, metY=-1000;
float mT=0;
int ultimate;

void drawFire() {

  fill(#ff0000);
  ellipse(fireX, fireY, 50, 50);
  fill(#FCA117);
  triangle(fireX-15, fireY-25, fireX-15, fireY+25, fireX-60, fireY);
}

void drawCure() {
  fill(#1AFC17, 50);
  rect(70, 0, 150, 600);
}


void drawMet() {


  //Folllow

  if (ultimate >500 &&bossHP<=10000) {

    mT=atan2(kirbyY-metY, kirbyX-metX);
    metX+= 15* cos(mT);
    metY+= 15* sin(mT);
    //Text
    fill(#0000ff);
    rect(200, 0, 500, 50);
    fill(255);
    text("Meteor", 400, 40);
  }
  ultimate++;



  if (metX<=kirbyX) {
    metX=1000;
    metY=-1000; 
    health-=1000;
    ultimate=0;
  }



  fill(#462D0F);
  ellipse(metX, metY, 300, 300);
  fill(0);
  ellipse(metX-100, metY-75, 50, 50);
  ellipse(metX-50, metY+100, 50, 50);
  ellipse(metX+100, metY, 50, 50);
  ellipse(metX+75, metY-75, 50, 50);
  ellipse(metX, metY, 50, 50);
  fill(#ff0000);


  //noFill();
  strokeWeight(2);
  beginShape();
  stroke(#EAB00C);
  vertex(metX+100, metY-110); 
  vertex(metX+250, metY-200);            
  vertex(metX+190, metY-120); 
  vertex(metX+300, metY-120);          
  vertex(metX+200, metY-50);           
  vertex(metX+350, metY-50); 
  vertex(metX+250, metY);          
  vertex(metX+325, metY+50); 
  vertex(metX+225, metY+50); 
  vertex(metX+300, metY+100);           
  vertex(metX+120, metY+100);   




  endShape();
}

void drawLazer() {
  if (lazer>=150) {
    fill(#ff0000);
    rect(lazerX, 330, 100, 15);
    lazerX-=10;
    //Text
    fill(#0000ff);
    rect(200, 0, 500, 50);
    fill(255);
    text("Laser", 400, 40);
  }









  if (lazerX<kirbyX) {
    lazerX=480; 
    lazer=0;
    lazer++;
    health-=(int)random(500)+100;
  }
  lazer++;
}

