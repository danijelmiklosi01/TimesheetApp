/*A controller class that gets all the information from the database and displays it on the visualforce page*/
public class viewTimesheet {
        /*A list that gets all the timesheet information from the database and displays it*/
        List<Timesheet__c> ts = [select Project_Name__c, Employee__c, Task_Date__c, Total_Hours__c, Task_Description__c from Timesheet__c WHERE Employee__c = :UserInfo.getUserId() ORDER BY Task_Date__c DESC];
            public List<Timesheet__c> getts(){
            return ts;
            }
            /*A method for command button to redirect to the TimesheetCreatePage "New Entry button on the visualforce page"*/
        public PageReference back() {
            PageReference redirectSuccess = new PageReference('/apex/TimesheetCreatePage');
            redirectSuccess.setRedirect(true);
            return (redirectSuccess);
            }
}
