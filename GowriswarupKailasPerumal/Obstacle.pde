public class Obstacle
{
  
  //variables
  private float xAxis;
  private float yAxis;
  private float diameter;
  private float speedX;
  private boolean obstacle;
  
  //constructor
  public Obstacle(float diameter, boolean obstacle)
  {
    setDiameter(diameter);
    resetObstacle();
    speedX = random(5,7);
    xAxis = width;
    yAxis= random(50,height-10);
    this.obstacle = obstacle;
  }
  //update Method
  public void update()
  {
    if(obstacle == true) //if obstacle boolean is true, the following affects obstacle characteristics.
    {           
      xAxis = xAxis - speedX;
      if(xAxis <0)
      {
        resetObstacle();
        score++;
      }
    }
    if(obstacle == false)   //if obstacle boolean is false, the following affects saves characteristics
    {        
      xAxis = xAxis - speedX;
      if(xAxis <0)
      {
        resetSaves();
        loss.play();
        lives--;
        player.addScore(score);
      }
    }
  }
  
  //display Method
  public void display()
  {
     if(obstacle == true)
     {
       stroke(255,0,0);                                      //Outer Hot Red Flame of Space Debris
       fill(190,0,0);                                   //Inner lesser red colour for style
       strokeWeight(2);
       ellipse(xAxis, yAxis, diameter, diameter);
     }
     if(obstacle==false)
     {     
       stroke(39, 25, 199);
       fill(39, 25, 110);                                   
       strokeWeight(2);
       ellipse(xAxis, yAxis, diameter, diameter);
     }
  }
  
  
  //getter methods
  
  public float getDiameter()
  {
    return diameter;
  }
  public float getXCoord()
  {
    return xAxis;
  }
  public float getYCoord()
  {
    return yAxis;
  }
  
  //setter methods
  public void setDiameter(float diameter)
  {
    if (diameter>=7 && diameter<=9)
    {
      this.diameter = diameter;
    }
    else
    {
      this.diameter = 8;
    }
  }
  //reset Obstacle method
  private void resetObstacle()
  {
    speedX = random(5,7);
    xAxis=width;
    yAxis= random(50,height-10);  
  }
  //reset Save method
  private void resetSaves()
  {
    speedX = random(5,7);
    xAxis=width;
    yAxis= random(50,height-10);   
  }
}
