class FirstScene {
  PGraphics layout0;
  PGraphics layout1;
  PImage circle1;
  PImage circle2;
  PImage circle3;
  
  int w;
  
  float rot1 = 0;
  float c_rot1 = 0;
  float rot2 = 0;
  float c_rot2 = 0;
  float rot3 = 0;
  float c_rot3 = 0;
  
  FirstScene(int w) {
    this.w = w;
    
    layout0 = createGraphics(width, height);
    layout0.beginDraw();
    for(int i = 0; i < width / w; ++i) {
      layout0.fill(i % 2 == 0? 0: 255);
      layout0.rect(i * w, 0, w, height); 
    }
    layout0.endDraw();
    
    layout1 = createGraphics(width, height);
    layout1.beginDraw();
    for(int i = 0; i < width / w; ++i) {
      layout1.fill(i % 2 != 0? 0: 255);
      layout1.rect(i * w, 0, w, height); 
    }
    layout1.endDraw();
   
    PGraphics circle1_layout = createGraphics(width, height);
    circle1_layout.beginDraw();
    circle1_layout.background(0, 0);
    circle1_layout.fill(255, 255);
    circle1_layout.noStroke();
    circle1_layout.ellipse(450, 450, 850, 850);
    circle1_layout.endDraw();
    
    PGraphics circle2_layout = createGraphics(width, height);
    circle2_layout.beginDraw();
    circle2_layout.background(0, 0);
    circle2_layout.fill(255, 255);
    circle2_layout.noStroke();
    circle2_layout.ellipse(450, 450, 550, 550);
    circle2_layout.endDraw();
    
    PGraphics circle3_layout = createGraphics(width, height);
    circle3_layout.beginDraw();
    circle3_layout.background(0, 0);
    circle3_layout.fill(255, 255);
    circle3_layout.noStroke();
    circle3_layout.ellipse(450, 450, 250, 250);
    circle3_layout.endDraw();
    
    circle1 = layout1.get();
    circle1.mask(circle1_layout.get());
    
    circle2 = layout0.get();
    circle2.mask(circle2_layout.get());
    
    circle3 = layout1.get();
    circle3.mask(circle3_layout.get());
    imageMode(CENTER);
  }
  
  void setRot(float rot) {
    rot1 = rot;
    rot2 = -rot;
    rot3 = rot;
  }
  
  void setRot1(float rot) {
    rot1 = rot;
  }
  
  void setRot2(float rot) {
    rot2 = -rot;
  }
  
  void setRot3(float rot) {
    rot3 = rot;
  }
  
  int delta = 0;
  int last_time = millis();
  
  float rot_speed = .0005;
  
  void display() {
    delta = millis() - last_time;
    last_time = millis();
    
    if(c_rot1 < rot1) {
      c_rot1 += rot_speed * delta;
      if(c_rot1 > rot1)
        c_rot1 = rot1;
    } else if(c_rot1 > rot1) {
      c_rot1 -= rot_speed * delta;
      if(c_rot1 < rot1)
        c_rot1 = rot1;
    }
    
    if(c_rot2 > rot2) {
      c_rot2 -= rot_speed * delta;
      if(c_rot2 < rot2)
        c_rot2 = rot2;
    } else if(c_rot2 < rot2) {
      c_rot2 += rot_speed * delta;
      if(c_rot2 > rot2)
        c_rot2 = rot2;
    }
    
    if(c_rot3 < rot3) {
      c_rot3 += rot_speed * delta;
      if(c_rot3 > rot3)
        c_rot3 = rot3;
    } else if(c_rot3 > rot3) {
      c_rot3 -= rot_speed * delta;
      if(c_rot3 < rot3)
        c_rot3 = rot3;
    }
    
    translate(width>>1, height>>1);
    image(layout0, 0, 0);
    rotate(c_rot1);
    image(circle1, 0, 0);
    rotate(c_rot2 - c_rot1);
    image(circle2, 0, 0);
    rotate(c_rot3 - c_rot2);
    image(circle3, 0, 0);
    rotate(-c_rot3);
    translate(-width>>1, -height>>1);
  }
}