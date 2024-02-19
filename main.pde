int windowWidth = 900;
int windowHeight = 700;
float w = windowWidth * 0.8;
float h = windowHeight * 0.1;
boolean alive = true;

// Color Palettes
color[] green = {#294B29, #50623A, #789461, #DBE7C9};
color[] green2 = {#12372A, #436850, #789461, #FBFADA};
color[] green3 = {#4F6F52, #739072, #86A789, #D2E3C8};
color[] fall = {#5F0F40, #FB8B24, #E36414, #9A031E};
color[] fall2 = {#6B240C, #994D1C, #E48F45, #F5CCA0};
color[] fall3 = {#820300, #B80000, #E36414, #FB8B24};
color[] spring = {#FFE4D6, #FACBEA, #D988B9, #B0578D};
color[] spring2 = {#863A6F, #975C8D, #D989B5, #FFADBC};
color[] spring3 = {#9A1663, #90A17D, #829460, #294B29};
color[][] palettes = {green, green2, green3, fall, fall2, fall3, spring, spring2, spring3};

Bonsai b = new Bonsai();

void settings() {
  size(windowWidth, windowHeight);
}


void draw() {
  
  if (alive) {
    push();
    translate(windowWidth*0.5, windowHeight*0.9);
    b.drawBonsai();
    pop();
  }
  
}