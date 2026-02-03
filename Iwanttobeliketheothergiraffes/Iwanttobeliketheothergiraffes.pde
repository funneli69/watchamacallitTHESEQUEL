float[] xPosition = new float[9];
float[] yPosition = new float[9];
boolean[] giraffeIsUp = new boolean[9];
PImage enclosure;
PImage giraffe;
int timer = 0;
int points = 0;
void setup(){
  size(600,600);
  enclosure = loadImage("enclosure.jpg");
  giraffe = loadImage("giraffe.jpg");
  int index = 0;
  for(int row = 0; row <3; row ++){
    for(int col=0; col<3; col++){
      xPosition[index] = 100 + col * 200;
      yPosition[index] = 100 + row * 200;
      giraffeIsUp[index] = false;
      index++;
    }
  }
}
void draw(){
image(enclosure,0,0,600,600);
for(int i = 0; i<9; i++){
  fill(102,51,0);
  ellipse(xPosition[i],yPosition[i], 120,60);
  if (giraffeIsUp[i]){
    image(giraffe,xPosition[i]-40,yPosition[i]-60,80,80);
  }
  }
  if (frameCount % 60 == 0){
    int randomIndex = (int) random(9);
    giraffeIsUp[randomIndex] = !giraffeIsUp[randomIndex];
  }
  fill(255,0,0);
  textSize(50);
  text("Score:" + points,200,575);
}
void mousePressed(){
  for(int i = 0; i<9; i++){
    float d = dist(mouseX,mouseY,xPosition[i],yPosition[i]);
    if(giraffeIsUp[i] && d<40){
      giraffeIsUp[i] = false;
      points ++;
    }
  }
}
