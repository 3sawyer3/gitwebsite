int ballcolor1 = color (255, 160, 0);
int ballcolor2 = color (0, 160, 0);
ArrayList<Ball> bouncingBalls ;
void setup() {
  size(640, 480);
  bouncingBalls=new ArrayList<Ball>();
  bouncingBalls.add(new Ball(100, 200, 2, 2, 25, color (ballcolor1)));
  bouncingBalls.add(new Ball(200, 200, 1, -1, 50, color (ballcolor2)));
}

void draw() {
  background(255);
  for (Ball ball : bouncingBalls) {
    ball.draw();
    ball.move();
    int colorUnderMouse = get(mouseX, mouseY);
    boolean touchingBall = (ball.colr == colorUnderMouse);
    //    boolean touchingBall2 = (ballcolor2 == colorUnderMouse);
    if (mousePressed && (mouseButton == LEFT) && touchingBall) {
      ball.touch1();
    } else {
      ball.notouch();
    }
  }
}

class Ball {
  float x, y, vx, vy, radius;
  int colr;
  float gravity=0.2;

  Ball (float x_, float y_, float vx_, float vy_, float radius_, int colr_) {
    x=x_;
    y=y_;
    vx=vx_;
    vy=vy_;
    radius=radius_;
    colr=colr_;
  }
  
//  boalean touching (Ball b) {
//    float d=dist(x, y, vx, vy);
//  boolean touching = d < (radius=radius);

  void draw() {
    fill (colr);
    ellipse(x, y, radius*2, radius*2);
  }
  void touch1() {
    vx=vx+2;
    vy=vx+1;
  }
  void notouch() {
    vx=vx;
    vy=vy;
  }
  void touching() {
    vx=vx+1;
    vy=vy+1;
  }
  void move() {
    x=x+vx;
    y=y+vy;
    if (y+vy>height-radius) {
      vy=-abs(vy);
    } else {
      vy=vy+gravity;
    }
    if (x>width-radius) {
      vx=-abs(vx);
    }
    if (y<radius) {
      vy=abs(vy);
    }
    if (x<radius) {
      vx=abs(vx);
    }
  }
}


