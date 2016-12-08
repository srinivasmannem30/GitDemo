public class empDetails {
	@AuraEnabled
    public static List<Employee__c> getEmployees(){
        return [SELECT Employee_Id__c,Employee_Name__c from  Employee__c];
    }
    
    @AuraEnabled
    public static Employee__c saveEmployees(Employee__c employee) {
       upsert employee;
        
        return employee;
	}
}