/*An email scheduling class with all the methods to execute an email at a specific date and time*/
global class Email implements Schedulable {
        /*A method that execute sendemail() method*/
        global void execute(SchedulableContext sc)
        {
                    sendmail();
        }
        /*sendemail() method that executes sending an email to a specific user with a specific template*/
        public static void sendmail()
        {
            /*making new "mailList" list for single email message*/
            list<Messaging.SingleEmailMessage> mailList = new list<Messaging.SingleEmailMessage>();
            /*Choosing the email template we use for the email we send to the employee*/
            EmailTemplate emailTemp = [SELECT Id,
                                      Subject,
                                      Body FROM EmailTemplate WHERE DeveloperName = 'Timesheet_Email_Template'];
            /*Selecting "employee" user who have the company name "Intermino" */
            User u = [SELECT Id,Email FROM User WHERE CompanyName = 'Intermino'];
                    /*Setting everything up and sending email*/
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setTemplateId(emailTemp.Id);
                    mail.setTargetObjectId(u.Id);
                    mail.setSaveAsActivity(false);
                    mailList.add(mail);

                    if(!mailList.isEmpty())
                    Messaging.sendEmail(mailList);
        }
}
