  float x;
  float y = height/2;
  float ysPeed,xsPeed;
  float rad;
  float reset;


void reset() {
    x = width/2;
    y = height/2;
    float angle = random(-PI/4, PI/4);
    //angle = 0;
    xsPeed = xS * cos(angle);
    ysPeed = yS * sin(angle);

    if (random(1) < 0.5) {
      xsPeed *= -1;
    }
  }

 //void edges() {
 //   if (y < 0 || y > height) {
 //     ysPeed *= -1;
 //   }

 //   if (x - rad > width) {

 //     leftscore++;
 //    reset();
 //   }

 //   if (x + rad < 0) {

 //     rightscore++;
 // // if(rightscore=15){
   
 //  }
 //    reset();
 //   }
 //// }
