public with sharing class MultiselectExampleController {

    public SelectOption[] selectedContacts { get; set; }
    public SelectOption[] allContacts { get; set; }
    
    public String message { get; set; }
    
    public MultiselectExampleController() {
        selectedContacts = new List<SelectOption>();
        
        List<Contact> contacts = [SELECT Name, Id,TechSoft__selected_values__c FROM Contact];    
        allContacts = new List<SelectOption>();
        for ( Contact c : contacts ) {
            allContacts.add(new SelectOption(c.Id, c.Name));
            if(c!=null && c.TechSoft__selected_values__c!=null){
                String[] s = c.TechSoft__selected_values__c.split(',');
                for(Integer i=0;i<s.size();i++)
                    selectedContacts.add(new SelectOption(c.Id, s[i]));
            }    
        }
        
    }

    public PageReference save() {
        message = '';
        Boolean first = true;
         Contact c = new Contact();
        for ( SelectOption so : selectedContacts ) {
           
            if (!first) {
                message += ', ';
            }
            //message += so.getLabel() + ' (' + so.getValue() + ')';
            message += so.getLabel();
            first = false;
            c.TechSoft__selected_values__c = message ;
        }        
        c.Id = '0032800000XybD8';
        update c;
        
        return null;       
    }
    public void incrementCounter(){
        system.debug('selectedContacts ------>>>'+selectedContacts );
    
    }
}