({
	pageLoad : function(component, event, helper) {
		helper.getEmployee(component);	
	},
    
    createEmployee : function(component, event, helper) {    
        var newEmployee = component.get("v.newEmployee");
        helper.createEmployee(component, newEmployee);
    }
})