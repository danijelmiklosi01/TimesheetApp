public class adminController {
    public List<Timesheet__c> ts { get; set; }
  
   
   public string SelectedTimesheetId { get; set; }
  
   public adminController() {
       
       LoadData();
   }
   private void LoadData() {
    ts = [select Project_Name__c, Employee__c, Task_Date__c, Total_Hours__c, Task_Description__c from Timesheet__c ORDER BY Task_Date__c DESC];
   }
            public void DeleteTimesheet()
   {
       
      if (SelectedTimesheetId == null) {
      
         return;
      }
     
      
      Timesheet__c tobeDeleted = null;
      for(Timesheet__c t : ts)
       if (t.Id == SelectedTimesheetId) {
          tobeDeleted = t;
          break;
       }
      
      
      if (tobeDeleted != null) {
       Delete tobeDeleted;
      }
     
      
      LoadData();
   }    
    
}
