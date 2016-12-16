class UI {
  int w = 150;
  int h = 100;
  int padding = 16;
  int fontSize = 16;
  PFont f;
  
  float p;
  float a;
  
  UI(float p, float a) {
    this.p = p;
    this.a = a;
    
    f = createFont("Arial",fontSize,true); 
    textFont(f);
  }
  
  void setP(float p) {
    this.p = p;
  }
  
  void setA(float a) {
    this.a = a;
  }
  
  void display() {
    fill(255);
    stroke(0);
    rect(width - w, 0, w, h);
    fill(0);
    text("P: " + p, width - w + padding, 2 * padding);
    text("A: " + a, width - w + padding, 3 * padding + fontSize);
  }
}