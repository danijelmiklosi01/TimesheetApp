/*A controller class that inserts all data from TimesheetCreatePage to the database*/
public class insertTimesheet {
    public Timesheet__c ts {get; private set;}
   
    
            /*A method that inserts a timesheet*/
            public insertTimesheet() {
            Id id = ApexPages.currentPage().getParameters().get('id');
            ts = (id == null) ? new Timesheet__c()  :
            [SELECT Project_Name__c, Employee__c, Task_Date__c, Total_Hours__c, Task_Description__c FROM Timesheet__c WHERE Id = :id ];
        }
            /*A method for a command button that performs an action to insert data into the database*/
           
            
            public PageReference save() {
            try{
                
                upsert(ts);
            } catch(System.DMLException e) {
                ApexPages.addMessages(e);
                return null;
            }
            /*After successful saving, creating a new page reference to redirect to TimesheetViewPage*/
            PageReference redirectSuccess = new PageReference('/apex/TimesheetViewPage?Id='+ts.Id);
            redirectSuccess.setRedirect(true);
            return (redirectSuccess);
        } 
}