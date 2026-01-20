import processing.sound.*;
SoundFile Alan;
import processing.sound.*;
SoundFile Candy;
import processing.sound.*;
SoundFile Potato;
import processing.sound.*;
SoundFile uhazwon;
import processing.sound.*;
SoundFile neigh;
import processing.sound.*;
SoundFile next;
import processing.sound.*;
SoundFile begin;
import processing.sound.*;
SoundFile pipe;
long current = millis();
long start;
long px = 25;
float volume =  map(mouseX, 0, width, 0.3, 1);
boolean splash = true;
int deadhorsex = 0;
int deadhorsey = 0;
PImage welcome;
PImage dead;
PImage starry;
PImage pills;
PImage spray;
PImage pot;
long starryx = 100000;
long starryy = 100000;
PImage dead2;
PImage dead3;
PImage yaya;
PImage spike;
int level = 1;
long newbx = 1001;
long newby = 5615;
long welcomex = 0;
boolean end = false;
long welcomey = 0;
long newnewbx = 1001;
long newnewby = 1001;
int deadhorse2x = 900;
int deadhorse2y = 900;
long py = 565;
int deadhorse3x = 900;
int deadhorse3y = 900;
int yayax = 900;
int yayay = 900;
long pillsx = 475;
long pillsy = 425;
long sprayx = 10000;
long sprayy = 10000;
long potx = 10000;
long poty = 10000;
boolean grav = true;
String text = "jajajaja you have not win";
int textsize = 25;
boolean okay = true;
boolean okay2 = true;
void setup(){
  size(600,600);
  start = millis();
  dead = loadImage("deadhorses.jpg");
  Alan = new SoundFile(this, "alanw.mp3");
    begin = new SoundFile(this,"begin.mp3");
  Alan.play();
  begin.play();
  Candy = new SoundFile(this,"candyland.mp3");
  Potato = new SoundFile(this,"potato.mp3");
  uhazwon = new SoundFile(this,"brr.mp3");
  neigh = new SoundFile(this,"neigh.mp3");
  next = new SoundFile(this,"cheering.mp3");
  pipe = new SoundFile(this,"pipe.mp3");
  pills = loadImage("pills.png");
  spray = loadImage("spray.png");
  pot = loadImage("potion.png");
  dead2 = loadImage("deadhorse2.jpg");
  dead3 = loadImage("deadhorse3.jpg");
  yaya = loadImage("winscreen.png");
  welcome = loadImage("DEAD.png");
  spike = loadImage("spike.png");
  starry = loadImage("starry.png");
}
void draw(){
  current = millis();
  Candy.amp(volume);
  background(255, 215,0);
  image(dead,deadhorsex,deadhorsey,600,600);
  image(dead2,deadhorse2x,deadhorse2y,600,600);
  image(dead3,deadhorse3x,deadhorse3y,600,600);
  fill(255);
  rect(300,550,500,100);
  fill(255,0,0);
  image(spike,50,565,50,50);
  image(spike,150,565,50,50);
  image(spike,newbx,newby,50,50);
  image(spike,newnewbx,newnewby,50,50);
  fill(0,255,0);
  image(pills,pillsx,pillsy,50,50);
  image(spray,sprayx,sprayy,50,50);
  image(pot,potx,poty,50,50);
  ellipse(px,py,50,50);
  fill(255,0,0);
  textSize(textsize);
    if(splash && current - start <= 5000){
    image(welcome,welcomex,welcomey,600,600);
  }
    
    image(yaya,yayax,yayay,600,600);
    image(starry,starryx, starryy, 50,50);
}
void keyPressed(){
  if(key == 'a' && okay){
    px-=50;
    okay = false;
  }
  if(key == 'd' && okay2){
    px+=50;
    okay2 = false;
  }
  // jump up
  if(key == 'w' &&(grav)){
    py-=50;
    grav = false;
    delay(100);
    } else if(key == 'w' && px >=300 && py <= 550){
    py-=90;
    grav = false;
    delay(100);
  } // else if circle is on the block jump 100
}
  //if(key == 'w'  && px <=300 && py >= 550);
  //py-=50;
  //delay(100);
void keyReleased(){
  // move down
  okay = true;
  okay2 = true;
  if(key == 'w' && px <=300 && py <= 550){
    py += 50;
    grav = true;
       // else if circle is on the block move down 50
       



  }
      if(px == 475 && py == 425 && newbx >= 250 && newby >= 565 && level == 1){
       text = "NEW LEVEL";
       textsize = 50;
       Alan.stop();
       Candy.play();
       px = 25;
       deadhorsex = 900;
       deadhorsey = 900;
       pillsx = 10000;
       pillsy = 10000;
       sprayx = 475;
       sprayy = 425;
       py = 565;
       deadhorse2x = 0;
       deadhorse2y = 0;
       newbx = 250;
       newby = 565;
       grav = true;
       level = 2;
       next.play();
    }
    if(px == 475 && level == 2 && py == 425 && newbx == 250 && newby == 565 && newnewbx >= 350 && newnewby >= 500){
       text = "LAST ONE";
       textsize = 50;
       Candy.stop();
       Potato.play();
       px = 25;
       py = 565;
       newnewbx = 350;
       newnewby = 500;
       deadhorse2x = 900;
       deadhorse2y = 900;
       deadhorse3x = 0;
       deadhorse3y = 0;
       sprayx = 10000;
       sprayy = 10000;
       potx = 475;
       poty = 425;
       level = 3;
       grav = true;
       next.play();
    }
    if(px == 475 && level == 3 && py == 425 && newnewbx == 350 && newnewby == 500){
       text = "your win!";
       textsize = 50;
       px = 1000000;
       py = 1000000;
       Potato.stop();
       deadhorse3x = 900;
       deadhorse3y = 900;
       yayax = 0;
       yayay = 0;
       newbx = 250;
       newby = 565;
       grav = true;
       end = true;
       pipe.play();
       uhazwon.loop();
    }
    if(px >= 50 && px <= 75 && py == 565){
       px = 25;
       py = 565;
       neigh.play();
       
    }
     if(px >= 150 && px <= 175 && py == 565){
       px = 25;
       py = 565;
       neigh.play();
       
       
    }   
    if(px >= 250 && px <= 275 && py == 565 && newbx == 250 && newby == 565){
       px = 25;
       py = 565;
       neigh.play();
    }   
    if(px >= 350 && px <= 375 && py == 515 && newnewbx == 350 && newnewby == 500){
       px = 25;
       py = 565;
       neigh.play();
       grav = true;
    }   
    if(px >= -100 && px <= 10000 && py >= 0 && py <= 400){
    px = 25;
    py = 565;
    neigh.play();
    grav = true;
    }
}
    void mousePressed(){
    if (end){
      starryx = mouseX;
      starryy = mouseY;
    }
    }
      
