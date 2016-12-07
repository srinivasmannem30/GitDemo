({
	getExpenses: function(component) {
        //Call the getExpenses Apex class method 
        var action = component.get("c.getExpenses");
        alert('action----->>>'+action);
        var self = this;
        action.setCallback(this, function(response) {
        	var state = response.getState();
        	if (state === "SUCCESS") {
        		component.set("v.expenses", response.getReturnValue());
        		self.updateTotal(component);
        	}
        });
        $A.enqueueAction(action);
    },
    
    updateTotal : function(component) {
		var expenses = component.get("v.expenses");
		var total = 0;
        for(var i=0; i<expenses.length; i++){
			var e = expenses[i];
            //If you’re using a namespace, use e.myNamespace__Amount__c instead
            total += e.Amount__c;
        }
        //Update counters
        component.set("v.total", total);
        component.set("v.exp", expenses.length);
        },
    
    createExpense: function(component, expense) {
        //Save the expense and updates the view
        this.upsertExpense(component, expense, function(a) {
            var expenses = component.get("v.expenses");
            expenses.push(a.getReturnValue());
            component.set("v.expenses", expenses);
            this.updateTotal(component);
        });
    },

    upsertExpense : function(component, expense, callback) {
        //Call the saveExpense Apex class method 
        var action = component.get("c.saveExpense");
        action.setParams({
        	"expense": expense
        });
        if (callback) {
        	action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    }
})