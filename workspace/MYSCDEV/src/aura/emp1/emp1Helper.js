({
    getEmployee: function(component){
        var action = component.get("TechSoft.getEmployee");
        action.setCallback(this,function(response)){
            var state = response.getState();
            if(component.isValid() && state=="SUCCESS"){
                component.set("v.Employees",response.getReturnValue());
            }
     	});
    	$A.enqueueAction(action);
    }
})