public class MyTestController
{ 
  Public String clicked{get; set;}
  
  public MyTestController()
  {
    clicked='Yo have not Clicked';
   
  }

  public Pagereference clickme()
  {
    clicked='Yes Yo have Clicked the Apex Command Link !!';
    
    return null;
  }

}