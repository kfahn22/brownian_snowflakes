// This code has been adapted from Daniel Shiffman's Brownian snowflake challenge

// Coding Challenge 127: Brownian Motion Snowflake
// Daniel Shiffman
// https://thecodingtrain.com/CodingChallenges/127-brownian-snowflake.html
// https://youtu.be/XUA8UREROYE
// https://editor.p5js.org/codingtrain/sketches/SJcAeCpgE


int snowflake_ct = 0;
float r = random(1,5);
int count = 0;
Particle current;
ArrayList<Particle> snowflake;

void setup() {
  size(1024, 1024);
  //r = int(random(3,8));
  colorMode(HSB, 360, 100, 100);
  current = new Particle(width/2, 0, 3);
  snowflake = new ArrayList<Particle>();
  
}

void draw() {
  translate(width/2, height/2);
  rotate(PI/6);
  background(360);

  count = 0;
  while (!current.finished() && !current.intersects(snowflake)) {
    current.update();
    count++;
  }

  snowflake.add(current);
  
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
        saveFrame("/snowflakes_blue/snowflake-###.png");
        // Reset the sketch to white background
        background(360);
        snowflake.clear();
        snowflake_ct += 1;
        if (snowflake_ct < 100) {
        // Add a new snowflake
        snowflake = new ArrayList<Particle>();
        }
      }
  }
}