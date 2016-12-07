({
	doInit : function(component, event, helper) {
		helper.getExpenses(component);
	},
    createExpense : function(component, event, helper) {
        var amtField = component.find("amount");
        var amt = amtField.get("v.value");
        if (isNaN(amt)||amt==''){
            amtField.set("v.errors", [{message:"Enter an expense amount."}]);
        }
        else{
            amtField.set("v.errors", null);
            var newExpense = component.get("v.newExpense");
            helper.createExpense(component, newExpense);
        }
	},
    updateEvent : function(component, event, helper) {
		helper.upsertExpense(component, event.getParam("expense"));
	}//Delimiter for future code
})