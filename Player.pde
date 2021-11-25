public class Player
{
  //variables
  private String playerName;
  private int[] score;  //array
  private int count;
    
  //constructors
  public Player(String playerName)
  {
    if(playerName.length() < 6) //to make sure that if a string with less thab 6 characters is entered, the code still works.
    {
      this.playerName = playerName;
    } 
    else
    {
      this.playerName = playerName.substring(0, 6);//if a string with more than 6 characters is entered, only the first six will be stored.
    }
    score = new int[10];
    count = 0;
  }
    
  //getter methods
  public String getPlayerName()
  {
    return playerName;
  }
  public int[] getscore()
  {
    return score;
  }
  
  //setter methods
  public void setPlayerName(String playerName)
  {
    if(playerName.length() < 6) 
    {
      this.playerName = playerName;
    } 
    else
    {
      this.playerName = playerName.substring(0, 6);
    }
  }
  
  public void setscores(int[] score)
  {
    this.score = score;
  } 
  
  //array operations
  
  //adding score to each array
  public void addScore(int score)
  {
      int total = 0;
    for (int i = 1; i < count; i++) 
    {
      total = total +  this.score[i];
    } 
      this.score[count] = score-total;
      count++;
  }
  
  //calculating average score
  public float averageScore()
  {
    float total = 0;
    for (int i = 0; i < count; i++)
    {
      total = total +  score[i];
    }   
    return total / count;
  }
  
  //calculating high score
  public int highestScore()
  {
    int highestScore = score[0];
    for (int i = 1; i < count; i++) 
    {
      if (score[i] > highestScore) 
      {
        highestScore = score[i];
      }
    }   
    return highestScore;
  }
  
  //calculating lowest score
  public int lowestScore()
  {
    int lowestScore = score[0] ;
    for (int i = 1; i < count; i++) 
    {
      if (score[i] < lowestScore) 
      {
        lowestScore = score[i];
      }
    }   
    return lowestScore;
  }
  
  //details string method   
  public String details()
  {
    int total = 0;
    for (int i = 0; i < count; i++)
    {
      total = total +  score[i];
    }  
    String str = "Score Details for " + this.playerName + "\n\n Total Score: " + total;
    for (int i = 0; i < count; i++) 
    {
      str = str + "\n Score Streak for Life #" + (i+1) + ": " + score[i] + "\n";
    }      
    return str;
  }
}
