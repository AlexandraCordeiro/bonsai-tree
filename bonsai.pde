int windowWidth = 1000;
int windowHeight = 800;
float w = windowWidth * 0.8;
float h = windowHeight * 0.1;
boolean alive = true;

// Color Palettes

color[] green = {#294B29, #50623A, #789461, #DBE7C9};
color[] green2 = {#12372A, #436850, #789461, #FBFADA};
color[] fall = {#5F0F40, #FB8B24, #E36414, #9A031E};
color[] fall2 = {#6B240C, #994D1C, #E48F45, #F5CCA0};
color[] fall3 = {#820300, #B80000, #E36414, #FB8B24};
color[] spring = {#FFE4D6, #FACBEA, #D988B9, #B0578D};
color[] spring2 = {#863A6F, #975C8D, #D989B5, #FFADBC};
color[] spring3 = {#9A1663, #90A17D, #829460, #294B29};

color[][] palettes = {green, green2, fall, fall2, fall3, spring, spring2, spring3};

void settings() {
  size(windowWidth, windowHeight);
}

void setup() {
  
  // center canvas
  /*push();
  translate(windowWidth*0.5, windowHeight*0.9);
  drawBase();
  drawPot();
  drawTrunk();
  pop();
  save("bonsai.jpg");*/
  
}

void draw() {
  
  if (alive) {
    push();
    translate(windowWidth*0.5, windowHeight*0.9);
    drawBase();
    drawPot();
    drawTrunk();
    pop();
  }
  
}

// Utilities
float degreesToRadians(float a) {
  return (a * PI) / 180;
}

// angles in radians
float[] newPoint(float x, float y, float angle, float distance) {
  float[] newPoint = new float[2];
  
  newPoint[0] = x + distance * cos(angle);
  newPoint[1] = y + distance * sin(angle);
  
  return newPoint;
}


// Bonsai

void drawBase() {
  // base
  noStroke();
  int offset = 7;
  int r = 7;
  
  for (float x = -w*0.5; x < w*0.5; x+=offset) {
    float y;
    fill(#561C24, random(150, 255));
    //top
    y = -h*0.5;
    circle(x, y + r*0.5, r);
    //bottom
    y = h*0.5;
    circle(x, y, r);
    
    //sides
    if (x == -w*0.5 || x + offset >= w*0.5) {
      for (float i = -h*0.5 + r ; i < h*0.5; i+=offset) {
        circle(x, i, r);
      }
      
    }
  }
  
  // base 2
  float w2 = w / 8;
  float h2 = h / 6;
  
  for (float x = -w*0.5; x < w*0.5; x+=offset) {
    float y =  h*0.5 + h2;
    fill(#561C24, random(150, 255));
    //left
    if (x < (-w*0.5 +  w2)) {
      circle(x, y, r);
      circle(x, y + r, r);
      circle(x, y + r*2, r);
    }
    //right
    if (x > (w*0.5 -  w2)) {
      circle(x, y, r);
      circle(x, y + r, r);
      circle(x, y + r*2, r);
    }
    
  }
 
}

void drawPot() {
  float aux = w / 6;
  float a = w*0.5 - aux;
  int offset = 7;
  
  // y = x - a
  // y = x + a
  
  for (float x = -w*0.5; x < w*0.5; x += offset) {
    float y;
    float r = 7;
    
    noStroke();
    fill(1, 1, 1, random(150, 255));
    
    //bottom
    if (x > -a && x < a) circle(x, h*0.5 - h, r);
    //top
    circle(x, -h*0.5 - h, r);
    circle(x, -h*0.5 - h + r, r);
    //sides
    y = (x + a) - h*0.5;
    if ( (x < - a && y > -h*0.5 - h)) {
      circle(x, y , r);
    }
    
    y = -(x - a) - h*0.5;
    if ((x > a && y > -h*0.5 - h)) {
      circle(x, y , r);
    }
  }
}

void leaf(float x, float y, int maxLen, color[] colorPalette) {
  int n = int(random(0, maxLen));
  
  
  for (int i = 0; i < n; i++) {
    float r = random(10, 30);
    fill(colorPalette[int(random(0, colorPalette.length))], random(50, 150));
    // down
    circle(x, y + r, r);
    // up
    circle(x, y - r, r);
    y += r;
  }
}

void newBranch(float xi, float yi, int direction, int depth, color[] colorPalette) {

  int n = 1;
  int i;
  float branchDirection = random(-1,1);
  float branchInclination = random(10, 30);
  float branchLength = random(50, 150);
  float newY = branchDirection * branchInclination * sqrt(n) + yi;
  int offset = 12;
  float maxHeight = -h*7;
  
  if (depth <= 0 || yi < maxHeight || xi + branchLength > w*0.7 || xi - branchLength < - w*0.7) {
    alive = false;
    return;
  }
  
  for (i = int(xi); i < int(xi)+branchLength; i+=offset) {
    newY = branchDirection * branchInclination * sqrt(n) + yi;
    fill(#561C24, random(150, 200));
    circle(direction*i, newY, random(5, 15)); 
    leaf(direction * i, newY, 2, colorPalette);
    n++;
  }
  newBranch(i, newY, direction, depth-1, colorPalette);
}


void drawBranch(float xi, float yi, int direction, int depth, color[] colorPalette) {
  
  int n = 1;
  int i;
  float branchDirection = random(-1,1);
  float branchInclination = random(10, 30);
  float branchLength = random(50, 150);
  int offset = 12;
  float maxHeight = -h*7;
  float newY = branchDirection * branchInclination * sqrt(n) + yi;
  
  if (depth <= 0 || yi < maxHeight || xi + branchLength > w*0.7 || xi - branchLength < - w*0.7) {
    alive = false;
    return;
  }
  

  for (i = int(xi); i < int(xi)+branchLength; i+=offset) {
    newY = branchDirection * branchInclination * sqrt(n) + yi;
    fill(#561C24, random(150, 200));
    circle(direction*i, newY, random(5, 15));
    leaf(direction * i, newY, 3, colorPalette);
    if (i%5==0) {
      newBranch(i, newY, direction, 2, colorPalette);
    }    
    n++;
    
  }

  drawBranch(i, newY, direction, depth -1, colorPalette);
}


void drawTrunk() {
  
  float aux = w / 4;
  int a = int(w*0.5 - aux);
  int offset = 10;
  float maxY = -1.7*a;
  
  float leftX = -1;
  float rightX = -1;
  
  // left side of the trunk
  for (int x = -a; x < 0; x+=offset) {
    float y = -0.008*pow(x+a, 2) - h*1.5;
    if (y > maxY && y < -1.5*h) {
      noStroke();
      fill(#561C24, random(150, 200));
      circle(x, y, random(5, 15));
    }
    
  }
  
  
  // right side of the trunk
  for (int y = int(maxY); y < 0; y+=offset) {
    float x = 0.008*pow(y+a*0.9, 2);
    
    if (y - h > maxY && y - h < -1.5*h && x < a) {
      noStroke();
      fill(#561C24, random(150, 200));
      circle(x, y - h, random(5, 15));
      if (rightX == -1) rightX = x;
      
    }
  }
  
  //random color palette
  color[] colorPalette = palettes[int(random(0, palettes.length))];
  drawBranch(leftX, maxY, -1, 100, colorPalette);
  drawBranch(rightX, maxY, 1, 100, colorPalette);
  
}