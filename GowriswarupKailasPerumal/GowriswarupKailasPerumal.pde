//Players please make sure that the Sound Library is installed in your version of Processing. This is an essential requirement to play this game. Wearing headphones improve audio playback quality.

import javax.swing.*;
import processing.sound.*;

//creating objects for the classes

Spaceship spaceship;
Obstacle obstacle;
Obstacle obstacle2;
Obstacle saves;
Player player;
SoundFile loss;
SoundFile win;
SoundFile bGMusic;

//variables
int score = 0;
int lives = 10;

//Setup Method
void setup()
{
  background(0);
  fullScreen();
  int red = (int) random(99,255);    //randomisation of color values create new colors for the spaceship every time it is displayed. Moreover, the setter methods have a validity test, to make sure the color is never set to black.
  int blue = (int) random(99,255);   //(int) turns the float output of random() to int
  int green = (int) random(99,255);
  spaceship = new Spaceship(red,blue,green); //spaceship variables are defined
  obstacle = new Obstacle(8, true);  //obstacle variables are defined, by using a simple boolean function to switch between obstacle and save with the same class
  obstacle2 = new Obstacle(8, true);  //obstacle variables are defined, by using a simple boolean function to switch between obstacle and save with the same class
  saves = new Obstacle(8, false);   //save variables are defined, by using a simple boolean function to switch between obstacle and save with the same class
  //The next line of code is a player name input field, but it also acts as a brief introduction to the game for players to know the basic how-to of the game
  player = new Player(JOptionPane.showInputDialog("WELCOME TO SPACECOLLISION GAME \n Developed by Gowriswarup Kailas Perumal \n\n Basic Instructions are: \n Use the Up/Down Arrows to Move the SpaceCraft Up or Down. \n Avoid the Red Obstacles to score points. Getting hit by one results in a life lost. \n Catch the Blue objects to score higher points. Missing one would result in a life lost. \n\n\n Enter the player name (max 6 chars): ", "Guest"));
 //soundfiles for background, wins and loss
  win = new SoundFile(this,"pointScored.mp3");
  loss = new SoundFile(this,"lifeLost.wav");
  bGMusic= new SoundFile(this,"Bgmusic.wav");
  bGMusic.play();
  bGMusic.amp(0.1);
  loss.amp(0.1);
  win.amp(0.1);
}

//Draw Method
void draw()
{
  spaceship.display();    //spaceship is displayed
  obstacle.display();   //obstacle is displayed
  obstacle2.display(); //obstacle2 is displayed
  saves.display();   //save is displayed
  obstacle.update(); // obstacle X coordinates are updated to mimic movement
  obstacle2.update();// obstacle2 X coordinates are updated to mimic movement
  saves.update();  //to save X coordinates are updated to mimic movement
  fill(255);
  textSize(25);
  text("Lives remaining: "+lives,width-300,60);  //Lives remaining is displayed on the top right
  boolean collision = hitSpaceship(spaceship, obstacle); //using Method HitSpaceship() to detect collision. Collision with obstacles loses lives.
  if(collision == true)
  {
    obstacle.resetObstacle();
    lives--;
    player.addScore(score);
    loss.play();
  }
  boolean collision2 = hitSpaceship2(spaceship, obstacle2); //using Method HitSpaceship2() to detect collision with second obstacle. Collision with obstacles loses lives.
  if(collision2 == true)
  {
    obstacle2.resetObstacle();
    lives--;
    player.addScore(score);
    loss.play();
  }
  boolean saveLives = saveLives(spaceship, saves);   //using Method saveLives() to detect collision. Collision with saves results in points scored.
  if(saveLives == true)
  {
    saves.resetSaves();
    score+=10;
    win.play();
  }
  
  
  if(lives<=0)  //Game over screen loads when number of lives remaining reaches 0
  {
     background(200);
     gameOver(); //loads gameover method  
  } 
  
  
  for (int i = 0; i < width; i = i+45)  //This creates a starry background. 
  {                        
     for (int j = 0; j < height; j = j+55)  //The diagonal arrangement is achieved by making the odd dots visible and the even dots merge with the background.
     {
         if((i+j+1)%2==0)
         {                                    
             noStroke();
         }
         else
         {
             stroke(255);
             strokeWeight(1);
         }
         point(i, j);
     }   
  }
  stroke(0);
  strokeWeight(1);
}
//Obstacle collision detection method
boolean hitSpaceship(Spaceship spaceship, Obstacle obstacle)
{
   if ((obstacle.getXCoord()>=spaceship.getXAxis()-50)&&(obstacle.getXCoord()<=spaceship.getXAxis()+50)&&(spaceship.getYAxis()>=(obstacle.getYCoord()-(obstacle.getDiameter()/2)))&&(spaceship.getYAxis()<=(obstacle.getYCoord()+(obstacle.getDiameter()/2))))
   {
     return true;
   }
   return false;
}
//Obstacle2 collision detection method
boolean hitSpaceship2(Spaceship spaceship, Obstacle obstacle2)
{
   if ((obstacle2.getXCoord()>=spaceship.getXAxis()-50)&&(obstacle2.getXCoord()<=spaceship.getXAxis()+50)&&(spaceship.getYAxis()>=(obstacle2.getYCoord()-(obstacle2.getDiameter()/2)))&&(spaceship.getYAxis()<=(obstacle2.getYCoord()+(obstacle2.getDiameter()/2))))
   {
     return true;
   }
   return false;
}
//saves collision detection method
boolean saveLives(Spaceship spaceship, Obstacle saves)
{
   if ((saves.getXCoord()>=spaceship.getXAxis()-50)&&(saves.getXCoord()<=spaceship.getXAxis()+50)&&(spaceship.getYAxis()>=(saves.getYCoord()-(saves.getDiameter()/2)))&&(spaceship.getYAxis()<=(saves.getYCoord()+(saves.getDiameter()/2))))
   {
     return true;
   }
   return false;
}

//GameOver Method
void gameOver()
{
   bGMusic.amp(0);
   JOptionPane.showMessageDialog(null,"This game is over!\n"+ player.getPlayerName()
                                 +", you played really well! \n\n"
                                 +"Player Stats: \n\n" 
                                 + player.details()
                                 +"\n\n Highest Score Streak: " + player.highestScore()
                                 + "\n\n Lowest Score Streak: " + player.lowestScore()
                                 + "\n\n Average Score Streak: " + player.averageScore());
    
   exit(); //exit method
}
