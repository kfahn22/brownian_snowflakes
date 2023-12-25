// Coding Challenge 127: Brownian Motion Snowflake
// Daniel Shiffman
// https://thecodingtrain.com/CodingChallenges/127-brownian-snowflake.html
// https://youtu.be/XUA8UREROYE
// https://editor.p5js.org/codingtrain/sketches/SJcAeCpgE

class Particle {

  PVector pos;
  float xOff;
  //float r;

  Particle(float radius, float angle, float r) {
    xOff = random(0, 10000);
    pos = PVector.fromAngle(angle);
    pos.mult(radius);
    //r = 5;
  }

  void update() {
    pos.x -= 1;
    int rg = int(random(15));
    pos.y += random(-rg, rg);

    float angle = pos.heading();
    angle = constrain(angle, 0, PI/6);
    float magnitude = pos.mag();
    pos = PVector.fromAngle(angle);
    pos.setMag(magnitude);
  }

  void show() {
    float d = dist(0,0,pos.x,pos.y);
    r = map(d, 0.0, width/3.0, 4.0, 2.0);
    int h = int(map(noise(xOff), 0, 1, 200, 240));
    noStroke();
    fill(h, 100, 100, 100);
    ellipse(pos.x, pos.y, r * 2, r *2);
  }

  boolean intersects(ArrayList<Particle> snowflake) {
    boolean result = false;
    for (Particle s : snowflake) {
      float d = dist(s.pos.x, s.pos.y, pos.x, pos.y); 
      if (d < r*2) {
        result = true;
        break;
      }
    }
    return result;
  }

  boolean finished() {
    return (pos.x < 1);
  }
}