ArrayList<Firework> fireworks;
PVector gravity = new PVector(0, 0.2);
float xS, yS;

Ball ball;
int game=7;
Paddle left;
Paddle right;

//float leftscore = 0;
//float rightscore = 0;
String gameState;



// if ((x <= rLeft.x + (rLeft.w + w*1/2)) && ((y >= rLeft.y) && (y <= (rLeft.y + rLeft.h)))) {
//    xSpeed *= -1;
// }

void setup() {
  frameRate(60);
  fullScreen();
  gameState="START";
  ball = new Ball();
  left = new Paddle(true);
  right = new Paddle(false);
  //menu 
  //gamestate="start";
  fireworks = new ArrayList<Firework>();
}


void draw() {

  //if ( instructionsOn==true ) shapes.get(instructionElement).draw(); //Annonymous Class
  ////
  ////Arithmetic
  //if ( instructionsOn==false ) {
  //}




  if (gameState == "START") {
    
    startGame();
  } else if (gameState == "EASY") {
   
    playGame();
    if (random(1) < 0.08) {
      fireworks.add(new Firework());
    }
    if (gameState == "pauseGame") {
      background(0);
    }

    fill(51, 50);
    noStroke();
    rect(0, 0, width, height);
    for (int i = fireworks.size()-1; i >= 0; i--) {
      Firework f = fireworks.get(i);
      f.run();
      if (f.done()) {
        fireworks.remove(i);
      }
    }  /////sECREAT PRESS P 
  } if (gameState == "1START") {
    playGame1();
   if (random(1) < 0.08) {
      fireworks.add(new Firework());
   }  }    fill(51, 50);
    noStroke();
    rect(0, 0, width, height);
    for (int i = fireworks.size()-1; i >= 0; i--) {
      Firework f = fireworks.get(i);
      f.run();
      if (f.done()) {
        fireworks.remove(i);
      }
    }


  //FIREWORK
}
void playGame1() {

//background(0);
 
  ball.checkPaddleLeft(left);
  ball.checkPaddleRight(right);
 left.show();
  right.show();
 left.update();
  right.update();

  ball.update();
  ball.edges();
  ball.show();
  fill(255);
  textSize(32);
  text(leftscore, 90, 40);
  text(rightscore, width-64, 40);



}
void startGame() {
  
  background(0);
  textAlign(CENTER);
  textSize(18);
  fill(255, 0, 0);
  text("Pong WS YH to move, ", width/2, height/2-50);
  
  
  textSize(18);
  fill(255, 0, 0);
  text(" press q  to play easy,s for medium,and c for hard!", width/2, height/2);
  textSize(14);
  fill(0, 0, 255);
  text("first ball is always slow", width/2, height/2+30);
 

  if (key == 'q'||key == 'Q') {//EASY
    game=14;

    gameState = "EASY"; 
  } if (key == 'P'||key == 'p') {//SECREAT
    game=14;

    background(1);
    gameState = "1START";
  }  else if (key == 's'||key == 'S') {
 background(0);
    //MEDIUM
    gameState = "EASY";
    game=17;
  } else if (key == 'c'||key == 'C') {//HARD
    gameState = "EASY";
    game=20;
  } else if (key == 'i'||key == 'I') {
    gameState="pauseGame";
  } else if (key == 'm'||key == 'M') {

    if(random(1) < 0.08) {
       fireworks.add(new Firework());
        }
  }
}//end start 
float leftscore;
float rightscore;

void playGame() {

background(0);
 
  ball.checkPaddleLeft(left);
  ball.checkPaddleRight(right);
 left.show();
  right.show();
 left.update();
  right.update();

  ball.update();
  ball.edges();
  ball.show();
  fill(255);
  textSize(32);
  text(leftscore, 90, 40);
  text(rightscore, width-64, 40);



}



//void playGame1() {
////background(0);
// //if(random(1) < 0.08) {
// //      fireworks.add(new Firework());
// //       }

//  ball.checkPaddleLeft(left);
//  ball.checkPaddleRight(right);


//  left.show();
//  right.show();

//  left.update();
//  right.update();

//  ball.update();
//  ball.edges();
//  ball.show();
//  fill(255);
//  textSize(32);
//  text(leftscore, 90, 40);
//  text(rightscore, width-64, 40);

//}
 
 
 
 




  void update() {
    x = x + xsPeed;
    y = y + ysPeed;
  }


  //}
  class Ball {

    float x = width/4;
    float y = height/2;
    float xsPeed;
    float ysPeed;
    float rad = 12;


    Ball() {
      reset();
    }



    //  (y < p.y + p.h/2 && y > p.y - p.h/2 && x - rad < p.x + p.w/2)

void checkPaddleLeft(Paddle p) {
  if (y - rad < p.y + p.h/2 && y + rad > p.y - p.h/2 && x - rad < p.x + p.w/2) {
    if (x  >p.x) {
      float diff = y - (p.y - p.h/2);
      float rads = radians(45);
      float angle = map(diff, 0, p.h, -rads, rads);
      xsPeed = game * cos(angle);
      ysPeed = game * sin(angle);
      x = p.x + p.w/2 + rads;
    }
  }
}

void checkPaddleRight(Paddle p) {
  if (y - rad < p.y + p.h/2 && y + rad > p.y - p.h/2 && x + rad > p.x - p.w/2) {
    if (x < p.x) {
      //xsPeed *= -1;
      float diff = y - (p.y - p.h/2);
      float angle = map(diff, 0, p.h, radians(225), radians(135));
      xsPeed = game * cos(angle);
      ysPeed = game * sin(angle);
      // x = p.x - p.w/2 - rad;
    }
  }
}
    //failed PADDLE AI 
    //if (p.y>x){
    //x=p.y
    //}

    void update() {
      x = x + xsPeed;
      y = y + ysPeed;
    }

    void reset() {

      x = width/2;
      y = height/2;
      // float  game;

      float angle = random(-PI/4, PI/4);
      //angle = 0;
      //game=game+stupid;
      xsPeed = game * cos(angle); //speed 
      ysPeed = game * sin(angle);

      if (random(1) < 0.5) {
        xsPeed *= -1;
     
    }
    }

    void edges() {
      if (y < 0 || y > height) {
        ysPeed *= -1;
      }

      if (x - rad > width) {
         fireworks.add(new Firework());
         fireworks.add(new Firework());
         fireworks.add(new Firework());
        leftscore++;
        reset();
      

        
      }

      if (x + rad < 0) {
fireworks.add(new Firework());
fireworks.add(new Firework());
fireworks.add(new Firework());
        rightscore++;
        reset();
      }
  
  

}

    void show() {
      fill(255);
      ellipse(x, y, rad*2, rad*2);
    }
  }
  //String gameState;
  //if (gameState )
