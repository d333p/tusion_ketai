abstract class Level {
  protected float rot1 = 0;
  protected float rot2 = 0;
  protected float rot3 = 0;
  private boolean work = true;
  
  float getRot1() {
    return rot1;  
  }
  
  float getRot2() {
    return rot2;
  }
  float getRot3() {
    return rot3;
  }
  
  void finish() {
    work = false; 
  }
  
  boolean isDone() {
    return !work;
  }
  
  protected abstract void setParam(float a, float p);
    
}

class Level1 extends Level {
  Level1() {
   rot1 = radians(180);
   rot3 = radians(180);
  }
  
  protected void setParam(float a, float p) {
      if(a > 50)
        finish();
  }
}