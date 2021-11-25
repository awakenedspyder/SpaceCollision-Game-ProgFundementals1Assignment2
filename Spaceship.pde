public class Spaceship
{
  
 //variables
  private float xAxis;
  private float yAxis;
  private float spaceshipWidth;
  private float spaceshipHeight;
  private int spaceshipR;
  private int spaceshipG;
  private int spaceshipB;
  
  //constructor
  
  public Spaceship(int spaceshipR, int spaceshipG, int spaceshipB)
  {
    setSpaceshipR(spaceshipR);
    setSpaceshipG(spaceshipG);
    setSpaceshipB(spaceshipB);
    spaceshipWidth=30;
    spaceshipHeight=100;
    xAxis = 150;
    yAxis  = height/2;
  }
  //Display Method
  public void display()
  {
    background(0);
     fill(spaceshipR,spaceshipG,spaceshipB);
     stroke(spaceshipR,spaceshipG,spaceshipB);
       ellipse(xAxis, yAxis, spaceshipHeight, spaceshipWidth);           //Spaceship Main Body
       triangle(xAxis-45,yAxis-15,xAxis-80,yAxis-10,xAxis-45,yAxis-10);  //Spaceship base #1
       triangle(xAxis-45,yAxis+15,xAxis-80,yAxis+10,xAxis-45,yAxis+10);  //Spaceship base #2
     fill(227, 140, 45);
     stroke(227, 140, 45);
       triangle(xAxis-53,yAxis-7,xAxis-100,yAxis,xAxis-53,yAxis+7);     // Outer Orange Flame
     fill(255,0,0);
     stroke(255,0,0);
       triangle(xAxis-53,yAxis-5,xAxis-85,yAxis,xAxis-53,yAxis+5);      // Middle Red Fkame
     fill(255,150,80);
     stroke(255,150,80);
       triangle(xAxis-53,yAxis-1.5,xAxis-70,yAxis,xAxis-53,yAxis+1.5);  // Inner Flame
     fill(0,0,255);
     stroke(0,0,255);
       ellipse(xAxis+25,yAxis-1,14,10);                  //Blue Spaceship windows
       ellipse(xAxis,yAxis-1,14,10);
       ellipse(xAxis-25,yAxis-1,14,10);
     if (key == CODED)  //controls for the up/down movement
     {
         if (keyCode == UP)
         {   
             if (yAxis >20)  // spaceship reaches maximum height
               yAxis = yAxis - 7;
          }
         else if (keyCode == DOWN)
         {
             if (yAxis < height-20)  // spaceship reaches maximum depth
               yAxis = yAxis + 7;
          }
     }
  }
  
  //getter methods
  public float getXAxis()
   {
      return xAxis;
   }

   public float getYAxis()
   {
      return yAxis;
   }

   public int getSpaceshipR()
   {
      return spaceshipR;
   }

   public int getSpaceshipG()
   {
      return spaceshipG;
   }
   public int getSpaceshipB()
   {
      return spaceshipB;
   }
   public float getSpaceshipHeight()
   {
      return spaceshipHeight;
   }
   public float getSpaceshipWidth()
   {
      return spaceshipWidth;
   }
  
  
  //setter methods
  
    public void setSpaceshipR(int spaceshipR)
    {
      if(spaceshipR>99 && spaceshipR<=255)
      {
        this.spaceshipR = spaceshipR;
      }
      else
      {
        this.spaceshipR = 220;
      }
    }
    
    public void setSpaceshipG(int spaceshipG)
    {
      if(spaceshipG>99 && spaceshipG<=255)
      {
        this.spaceshipG = spaceshipG;
      }
      else
      {
        this.spaceshipG = 255;
      }
    }
    
    public void setSpaceshipB(int spaceshipB)
    {
      if(spaceshipB>99 && spaceshipB<=255)
      {
        this.spaceshipB = spaceshipB;
      }
      else
      {
        this.spaceshipB = 200;
      }
    }
}
