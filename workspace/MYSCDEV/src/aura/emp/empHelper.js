({
      //Fetch the accounts from the Apex controller
      getEmployee: function(component) {
        var action = component.get("c.getEmployees");
    	//$A.log("Employee Datils are: " + action);
          $A.logger.subscribe("INFO", logCustom);
        //Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
            component.set("v.Employees", actionResult.getReturnValue());     
            
        });
       
        $A.enqueueAction(action);
        function logCustom(level, message, error) {
			console.log(getTimestamp(), "logCustom: ", arguments);
		}
		function getTimestamp() {
			return new Date().toJSON();
		}
      },    
	createEmployee: function(component, employee) {
        this.upsertEmployee(component, employee, function(actionResult) {
        var employees = component.get("v.newEmployee");   
        //alert('employees----->>>'+employees);
        //employees.push(actionResult.getReturnValue()); 	
        component.set("v.employees", employees);
    	});
    },
    upsertEmployee : function(component, employee, callback) {
        var action = component.get("c.saveEmployees");
        action.setParams({
        "employee": employee
    	});
        if (callback) {
            action.setCallback(this, callback);
        }
    	$A.enqueueAction(action);
    }    
})