float p = 0;
float a = 0;

FirstScene scene;
UI ui;

Level nextLevel;

void setup() {
  size(900, 900);
  smooth(4);
  scene = new FirstScene(15);
  ui = new UI(p, a);
  nextLevel = new Level1();
}

void keyPressed() {
  if(key == 'q' && a > 0) {
    a-= .3;
    if(a < 0)
      a = 0;
  }
  if(key == 'e' && a < 100) {
    a += .3;
    if(a > 100)
      a = 100;
  }
  if(key == 'a' && p > 0) {
    p-= .3;
    if(p < 0)
      p = 0;
  }
  if(key == 'd' && p < 100) {
    p += .3;
    if(p > 100)
      p = 100;
  }
  hadleLevel();
}

void hadleLevel() {
  ui.setP(p);
  ui.setA(a);
  if(nextLevel != null) {
    if(!nextLevel.isDone())
      nextLevel.setParam(a, p);
    else {
      scene.setRot1(nextLevel.getRot1());
      scene.setRot2(nextLevel.getRot2());
      scene.setRot3(nextLevel.getRot3());
      nextLevel = null;
    }
  }
}

void draw() {
  scene.display();
  ui.display();
}