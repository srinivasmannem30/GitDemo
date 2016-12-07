public with sharing class ContactExt {

    public Date ContactDate {get;set;}
    public Contact cs{get;set;}
    public ApexPages.StandardController controller;
    public Contact Con = new Contact();
    
    
    public ContactExt(ApexPages.StandardController controller) {        
        cs = new Contact();        
        cs.Contact_Date__c = Date.Valueof('2016-10-10');
        Account Acct = [select Id, TechSoft__SLAExpirationDate__c from Account where Id='00128000006dXZR' limit 1];
        
    }
    
    public PageReference save(){
      //this.Con = (Contact)controller.getRecord();
      system.debug('cs------>>>>'+cs);
        
     return null;
    }
    

}