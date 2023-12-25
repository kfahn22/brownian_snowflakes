/ Coding Challenge 127: Brownian Motion Snowflake
// Daniel Shiffman
// https://thecodingtrain.com/CodingChallenges/127-brownian-snowflake.html
// https://youtu.be/XUA8UREROYE
// https://editor.p5js.org/codingtrain/sketches/SJcAeCpgE

color c1, c2, c3, c;
int Y_AXIS = 1;
int X_AXIS = 2;
float alph;

int snowflake_ct = 0;
float r = random(1,5);
int count = 0;
Particle current;
ArrayList<Particle> snowflake;

void setup() {
  size(1024, 1024);
  //r = int(random(3,8));
  c1 = color(255,255,255);
  c2 = color(7,17,8);
  c3 = color(12, 13, 245);
 
  current = new Particle(width/2, 0, 3);
  snowflake = new ArrayList<Particle>();
}

void draw() {
  translate(width/2, height/2);
  rotate(PI/6);
  // The gradient is a lot slower to render!
  //background(12, 13, 245);
  setGradient(-width,-height, 2*width, 2*height, c2, c3, X_AXIS);
  count = 0;
  while (!current.finished() && !current.intersects(snowflake)) {
    current.update();
    count++;
  }

  snowflake.add(current);
  //r = int(random(2, 6));
  current = new Particle(width/2, 0, int(random(2, 6)));

  for (int i = 0; i < 6; i++) {
    rotate(PI/3);
    current.show();
    for (Particle p : snowflake) {
      p.show();
    }

    pushMatrix();
    scale(1, -1);
    current.show();
    for (Particle p : snowflake) {
      p.show();
    }
    popMatrix();
  }
  saveSnowflake();
}

void saveSnowflake() {
  if (snowflake_ct < 100) {
      if (count == 0) {
        saveFrame("/Users/kathrynfahnline/snowflakes_white/snowflake-###.png");
        // Reset the sketch to white background
        background(360);
        snowflake.clear();
        snowflake_ct += 1;
        if (snowflake_ct < 100) {
        // Add a new snowflake
        //current = new Particle(width/2, 0);
        snowflake = new ArrayList<Particle>();
        }
      }
  }
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}