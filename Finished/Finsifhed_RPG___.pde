
//Ethan Assing
//Computer Science
//Final Homework
PFont myFont;
int attack=1;
int kirbyX=150;
int kirbyY=400;//350;
int kD=1;
int health=6000;
int magic=950;
int bossHP=25000;
int fire;
int cure;
int lazer;
color bossBody =#154614;
color bossEye=0;
color bossPupil =255;
int bossAlpha=255;


void settings(){
 size(800,600); 
}

void setup() {
  //(800,600)
  myFont = createFont("verdana", 12);
  frameRate(60);
}


void draw() {
  stroke(0);
  background(#07AD53);
  //Scene
  fill(#8E7121);
  ellipse(400, 400, 815, 250);
  fill(#433305);
  rect(25, 25, 50, 350);
  rect(100, 25, 50, 350);
  rect(175, -60, 50, 350);
  rect(250, -65, 50, 350);
  rect(325, -65, 50, 350);
  rect(400, -70, 50, 350);
  rect(475, -70, 50, 350);
  rect(550, -70, 50, 350);
  rect(625, -70, 50, 350);
  rect(725, -20, 50, 350);
  fill(#F0A9EF);
  noStroke();
  ellipse(25, 25, 100, 100);
  ellipse(100, 25, 100, 100);
  ellipse(125, 50, 100, 100);
  ellipse(175, 25, 100, 100);
  ellipse(225, 50, 100, 100);
  ellipse(260, 25, 100, 100);
  ellipse(300, 25, 100, 100);
  ellipse(300, 50, 100, 100);
  ellipse(350, 25, 100, 100);
  ellipse(350, 50, 100, 100);
  ellipse(400, 25, 100, 100);
  ellipse(450, 25, 100, 100);
  ellipse(500, 25, 100, 100);
  ellipse(550, 25, 100, 100);
  ellipse(600, 25, 100, 100);
  ellipse(650, 25, 100, 100);
  ellipse(700, 25, 100, 100);
  ellipse(750, 25, 100, 100);
  ellipse(600, 50, 100, 100);







  drawBoss();
  drawKirby();


  //Time for turn
  if (attack>1) {
    attack++;
    if (attack>80) {
      attack=1;
    }
  }


  //Time for Cure
  if (cure>0) {
    cure++;
    if (cure>60) {
      cure=0;
      attack=1;
    }
  }

  drawText();
}


void mousePressed() {
  if (mouseX>100 && mouseX<=100+125 && mouseY>535 && mouseY<535+20 && attack ==1 && kirbyX<150) {
    attack=2;
  }

  if (mouseX>100 && mouseX<=100+60 && mouseY>558 && mouseY<558+20 && attack ==1 && kirbyX<150) {
    fire=1;
  }

  if (mouseX>170 && mouseX<=170+60 && mouseY>558 && mouseY<558+20 && attack ==1 && kirbyX<150) {
    cure=1;
  }
}


void drawText() {
  textFont(myFont, 20);
  if (attack ==1 ) {
    strokeWeight(3);
    stroke(255);
    fill(#0000ff);
    rect(100, 500, 150, 100);
    fill(255);
    text("Player 1", 125, 525);
    text("Attack", 110, 550);
    text("Fire", 110, 575);
    text("Cure", 175, 575);
    noFill();
    rect(100, 535, 125, 20);
    rect(100, 558, 60, 20);
    rect(170, 558, 60, 20);
  }

  if (attack >1) {

    kirbyX+=10;
  }


  if (kirbyX>=150 && attack ==1) {
    kirbyX-=10;
    bossHP-=(int)random(100)+10;
  }

  if (kirbyX+55 >500 && attack>1) {
    kirbyX-=10;
  }


  //Fire

  if (fire ==0) {
    fireX=225;
    fireY=300;
  }


  if (fire ==1 && magic>0) {
    attack=0;
    drawFire();
    fireX+=10;
  }

  if (fireX>=500) {
    fire=0; 
    attack=1;
    bossHP-=(int)random(1000)+50;
    magic-=30;
  }




  //Cure



  if (cure>1 && magic>0) {
    attack=0;
    drawCure();
    magic-=1;
    health+=10;
  }
}
void drawBoss() {
  fill(bossBody, bossAlpha);
  noStroke();
  ellipse(500, 300, 100, 100);
  ellipse(550, 300, 100, 100);
  ellipse(600, 300, 100, 100);
  ellipse(650, 300, 100, 100);
  ellipse(650, 350, 100, 100);
  ellipse(500, 350, 100, 100);
  ellipse(550, 350, 100, 100);
  ellipse(550, 400, 100, 100);
  ellipse(600, 400, 100, 100);
  ellipse(550, 300, 100, 100);
  ellipse(550, 250, 100, 100);
  ellipse(600, 250, 100, 100);
  strokeWeight(15);
  stroke(bossBody, bossAlpha);
  line(500, 300, 500, 500);
  line(575, 300, 575, 550);
  line(650, 300, 650, 500);
  fill(bossPupil, bossAlpha);
  ellipse(575, 330, 120, 80);
  fill(bossEye, bossAlpha);
  noStroke();
  ellipse(575, 330, 50, 80);
  //boss attacks
  drawMet();
  drawLazer();
}


void drawKirby() {
  //Health 
  fill(0);
  text("Kirby HP", 0, 50);
  text(health, 100, 50);
  text("Kirby MP", 0, 75);
  text(magic, 100, 75);
  if (magic<=0) {
    magic=0;
  }

  //Win
  if (bossHP<=0) {
    health=1;
    bossHP=0;
    bossAlpha-=2;
    bossEye=#ff0000;
    bossPupil=#ff0000;
    bossBody=#ff0000;
    ultimate = -999999;
    lazer= -999999;
    textFont(myFont, 50);

    if (bossAlpha<=0) {
      bossAlpha=0; 
      text("You Win!", 300, 300); 
      attack=0;
      kirbyX+=5;
      if (kirbyX>850) {
        kirbyX=-50;
      }
    }
  }


  //Lose
  if (health<=0) {
    drawGameOver();
  }




  strokeWeight(1);
  stroke(0);
  //outline
  fill(0);
  //foot
  rect(kirbyX-40*kD, kirbyY-10, 10*kD, 10);
  rect(kirbyX-50*kD, kirbyY-10, 10*kD, 10);
  rect(kirbyX-60*kD, kirbyY-20, 10*kD, 10);
  rect(kirbyX-65*kD, kirbyY-30, 10*kD, 10);
  rect(kirbyX-65*kD, kirbyY-40, 10*kD, 10);
  rect(kirbyX-75*kD, kirbyY-50, 10*kD, 10);
  rect(kirbyX-75*kD, kirbyY-50, 10*kD, 10);
  rect(kirbyX-75*kD, kirbyY-60, 10*kD, 10);
  rect(kirbyX-65*kD, kirbyY-70, 10*kD, 10);
  rect(kirbyX-65*kD, kirbyY-80, 10*kD, 10);
  rect(kirbyX-55*kD, kirbyY-80, 10*kD, 10);
  rect(kirbyX-75*kD, kirbyY-90, 10*kD, 10);
  rect(kirbyX-75*kD, kirbyY-100, 10*kD, 10);
  rect(kirbyX-75*kD, kirbyY-110, 10*kD, 10);
  rect(kirbyX-65*kD, kirbyY-120, 10*kD, 10);
  rect(kirbyX-55*kD, kirbyY-120, 10*kD, 10);
  rect(kirbyX-45*kD, kirbyY-120, 10*kD, 10);
  rect(kirbyX-55*kD, kirbyY-130, 10*kD, 10);
  rect(kirbyX-45*kD, kirbyY-140, 10*kD, 10);
  rect(kirbyX-35*kD, kirbyY-140, 10*kD, 10);
  //top of head kirby
  rect(kirbyX-25*kD, kirbyY-150, 10*kD, 10);
  rect(kirbyX-15*kD, kirbyY-150, 10*kD, 10);
  rect(kirbyX-5*kD, kirbyY-150, 10*kD, 10);
  rect(kirbyX+5*kD, kirbyY-150, 10*kD, 10);
  rect(kirbyX+15*kD, kirbyY-150, 10*kD, 10);
  rect(kirbyX+25*kD, kirbyY-140, 10*kD, 10);
  rect(kirbyX+35*kD, kirbyY-140, 10*kD, 10);
  rect(kirbyX+45*kD, kirbyY-130, 10*kD, 10);
  rect(kirbyX+45*kD, kirbyY-120, 10*kD, 10);
  rect(kirbyX+55*kD, kirbyY-120, 10*kD, 10);
  rect(kirbyX+65*kD, kirbyY-110, 10*kD, 10);
  rect(kirbyX+65*kD, kirbyY-100, 10*kD, 10);
  rect(kirbyX+65*kD, kirbyY-90, 10*kD, 10);
  rect(kirbyX+65*kD, kirbyY-80, 10*kD, 10);
  rect(kirbyX+55*kD, kirbyY-70, 10*kD, 10);
  rect(kirbyX+45*kD, kirbyY-70, 10*kD, 10);
  rect(kirbyX+45*kD, kirbyY-80, 10*kD, 10);
  rect(kirbyX+45*kD, kirbyY-90, 10*kD, 10);
  rect(kirbyX+45*kD, kirbyY-100, 10*kD, 10);
  rect(kirbyX+45*kD, kirbyY-110, 10*kD, 10);
  rect(kirbyX+45*kD, kirbyY-60, 10*kD, 10);
  //Bottom of right hand
  rect(kirbyX+45*kD, kirbyY-50, 10*kD, 10);
  rect(kirbyX+55*kD, kirbyY-40, 10*kD, 10);
  rect(kirbyX+65*kD, kirbyY-30, 10*kD, 10);
  rect(kirbyX+55*kD, kirbyY-20, 10*kD, 10);
  rect(kirbyX+45*kD, kirbyY-20, 10*kD, 10);
  rect(kirbyX+35*kD, kirbyY-10, 10*kD, 10);
  rect(kirbyX+25*kD, kirbyY-10, 10*kD, 10);
  //bottome of right foot
  rect(kirbyX+15*kD, kirbyY-10, 10*kD, 10);
  rect(kirbyX+5*kD, kirbyY-20, 10*kD, 10);
  rect(kirbyX+15*kD, kirbyY-30, 10*kD, 10);
  rect(kirbyX+25*kD, kirbyY-30, 10*kD, 10);
  rect(kirbyX+35*kD, kirbyY-40, 10*kD, 10);
  //start of bottom body
  rect(kirbyX-5*kD, kirbyY-20, 10*kD, 10);
  rect(kirbyX-15*kD, kirbyY-20, 10*kD, 10);
  rect(kirbyX-25*kD, kirbyY-20, 10*kD, 10);
  rect(kirbyX-35*kD, kirbyY-20, 10*kD, 10);
  rect(kirbyX-45*kD, kirbyY-30, 10*kD, 10);
  rect(kirbyX-45*kD, kirbyY-40, 10*kD, 10);
  rect(kirbyX-55*kD, kirbyY-50, 10*kD, 10);
  rect(kirbyX-65*kD, kirbyY-60, 10*kD, 10);

  //Eyes
  rect(kirbyX, kirbyY-110, 10*kD, 30);
  rect(kirbyX+20*kD, kirbyY-110, 10*kD, 30);
  //mouth
  rect(kirbyX+10*kD, kirbyY-60, 10*kD, 10);

  //fill Dark Pink Shoes,left
  fill(#f579e0);
  noStroke();
  rect(kirbyX+15*kD, kirbyY-20, 10*kD, 10);
  rect(kirbyX+25*kD, kirbyY-20, 10*kD, 10);
  rect(kirbyX+35*kD, kirbyY-20, 10*kD, 10);
  rect(kirbyX+35*kD, kirbyY-30, 10*kD, 10);
  rect(kirbyX+45*kD, kirbyY-30, 10*kD, 10);
  rect(kirbyX+55*kD, kirbyY-30, 10*kD, 10);
  rect(kirbyX+45*kD, kirbyY-40, 10*kD, 10);
  //Start Outer
  rect(kirbyX+35*kD, kirbyY-50, 10*kD, 10);

  //blush
  rect(kirbyX+35*kD, kirbyY-70, 10*kD, 10);
  rect(kirbyX+25*kD, kirbyY-70, 10*kD, 10);
  rect(kirbyX+35*kD, kirbyY-130, 10*kD, 10);
  rect(kirbyX+15*kD, kirbyY-140, 10*kD, 10);
  rect(kirbyX-25*kD, kirbyY-140, 10*kD, 10);
  rect(kirbyX-45*kD, kirbyY-130, 10*kD, 10);
  rect(kirbyX-35*kD, kirbyY-110, 10*kD, 10);
  rect(kirbyX-65*kD, kirbyY-110, 10*kD, 10);
  rect(kirbyX-65*kD, kirbyY-90, 10*kD, 10);
  rect(kirbyX-45*kD, kirbyY-80, 10*kD, 10);
  rect(kirbyX-55*kD, kirbyY-70, 10*kD, 10);
  rect(kirbyX-55*kD, kirbyY-60, 10*kD, 10);
  rect(kirbyX-65*kD, kirbyY-50, 10*kD, 10);
  rect(kirbyX-55*kD, kirbyY-40, 10*kD, 10);
  rect(kirbyX-55*kD, kirbyY-30, 10*kD, 10);
  //odd
  rect(kirbyX-49*kD, kirbyY-20, 15*kD, 10);
  //blush left
  rect(kirbyX-15*kD, kirbyY-70, 10*kD, 10);
  rect(kirbyX-5*kD, kirbyY-70, 10*kD, 10);
  //color in light pink
  fill(#EDB4E4);
  rect(kirbyX-25*kD, kirbyY-30, 30*kD, 10);
  rect(kirbyX-35*kD, kirbyY-30, 10*kD, 10);
  rect(kirbyX+5*kD, kirbyY-30, 10*kD, 10);
  rect(kirbyX-35*kD, kirbyY-40, 10*kD, 10);
  rect(kirbyX-25*kD, kirbyY-40, 10*kD, 10);
  rect(kirbyX-15*kD, kirbyY-40, 10*kD, 10);
  rect(kirbyX-5*kD, kirbyY-40, 10*kD, 10);
  rect(kirbyX+5*kD, kirbyY-40, 10*kD, 10);
  rect(kirbyX+15*kD, kirbyY-40, 10*kD, 10);
  rect(kirbyX+25*kD, kirbyY-40, 10*kD, 10);
  rect(kirbyX+25*kD, kirbyY-50, 10*kD, 10);
  rect(kirbyX+15*kD, kirbyY-50, 10*kD, 10);
  rect(kirbyX+5*kD, kirbyY-50, 10*kD, 10);
  rect(kirbyX-5*kD, kirbyY-50, 10*kD, 10);
  rect(kirbyX-15*kD, kirbyY-50, 10*kD, 10);
  rect(kirbyX-25*kD, kirbyY-50, 10*kD, 10);
  rect(kirbyX-35*kD, kirbyY-50, 10*kD, 10);
  rect(kirbyX-45*kD, kirbyY-50, 10*kD, 10);
  rect(kirbyX-45*kD, kirbyY-60, 10*kD, 10);
  rect(kirbyX-35*kD, kirbyY-60, 10*kD, 10);
  rect(kirbyX-25*kD, kirbyY-60, 10*kD, 10);
  rect(kirbyX-15*kD, kirbyY-60, 10*kD, 10);
  rect(kirbyX-5*kD, kirbyY-60, 15*kD, 10);
  rect(kirbyX+21*kD, kirbyY-60, 24*kD, 10);
  rect(kirbyX-45*kD, kirbyY-70, 10*kD, 10);
  rect(kirbyX-35*kD, kirbyY-70, 10*kD, 10);
  rect(kirbyX-25*kD, kirbyY-70, 10*kD, 10);
  rect(kirbyX+5*kD, kirbyY-70, 10*kD, 10);
  rect(kirbyX+15*kD, kirbyY-70, 10*kD, 10);
  rect(kirbyX-35*kD, kirbyY-80, 10*kD, 10);
  rect(kirbyX-25*kD, kirbyY-80, 10*kD, 10);
  rect(kirbyX-15*kD, kirbyY-80, 10*kD, 10);
  rect(kirbyX-5*kD, kirbyY-80, 10*kD, 10);
  rect(kirbyX+5*kD, kirbyY-80, 10*kD, 10);
  rect(kirbyX+15*kD, kirbyY-80, 10*kD, 10);
  rect(kirbyX+25*kD, kirbyY-80, 10*kD, 10);
  rect(kirbyX+35*kD, kirbyY-80, 10*kD, 10);
  rect(kirbyX-55*kD, kirbyY-90, 10*kD, 10);
  rect(kirbyX-45*kD, kirbyY-90, 10*kD, 10);
  rect(kirbyX-35*kD, kirbyY-90, 10*kD, 10);
  rect(kirbyX-25*kD, kirbyY-90, 10*kD, 10);
  rect(kirbyX-15*kD, kirbyY-90, 15*kD, 10);
  rect(kirbyX+10*kD, kirbyY-90, 10*kD, 10);
  rect(kirbyX+30*kD, kirbyY-90, 15*kD, 10);
  rect(kirbyX-65*kD, kirbyY-100, 10*kD, 10);
  rect(kirbyX-55*kD, kirbyY-100, 10*kD, 10);
  rect(kirbyX-45*kD, kirbyY-100, 10*kD, 10);
  rect(kirbyX-35*kD, kirbyY-100, 10*kD, 10);
  rect(kirbyX-25*kD, kirbyY-100, 10*kD, 10);
  rect(kirbyX-15*kD, kirbyY-100, 15*kD, 10);
  rect(kirbyX+10*kD, kirbyY-100, 10*kD, 10);
  rect(kirbyX+30*kD, kirbyY-100, 15*kD, 10);
  rect(kirbyX-55*kD, kirbyY-110, 10*kD, 10);
  rect(kirbyX-45*kD, kirbyY-110, 10*kD, 10);
  rect(kirbyX-35*kD, kirbyY-110, 10*kD, 10);
  rect(kirbyX-35*kD, kirbyY-110, 10*kD, 10);
  rect(kirbyX-25*kD, kirbyY-110, 10*kD, 10);
  rect(kirbyX-15*kD, kirbyY-110, 15*kD, 10);
  rect(kirbyX+10*kD, kirbyY-110, 10*kD, 10);
  rect(kirbyX+30*kD, kirbyY-110, 15*kD, 10);
  rect(kirbyX-35*kD, kirbyY-120, 80*kD, 10);
  rect(kirbyX-35*kD, kirbyY-130, 70*kD, 10);
  rect(kirbyX-15*kD, kirbyY-140, 30*kD, 10);
  //hand
  rect(kirbyX+55*kD, kirbyY-110, 10*kD, 40);
}


void drawGameOver() {
  fill(0);
  rect(0, 0, 800, 600);
  fill(#ff0000);
  textFont(myFont, 50);
  text("Game Over", 250, 300);
  kirbyX=-1000;
  attack=0;
}