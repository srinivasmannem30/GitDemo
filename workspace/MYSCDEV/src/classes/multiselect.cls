public class multiselect {
 
    Set<String> originalvalues = new Set<String>{'A','B','C','D','E','F','G'};
    Public List<string> leftselected{get;set;}
    Public List<string> rightselected{get;set;}
    Set<string> leftvalues = new Set<string>();
    Set<string> rightvalues = new Set<string>();
    public String abc {get;set;}
    
    public multiselect(){
        leftselected = new List<String>();
        rightselected = new List<String>();
        leftvalues.addAll(originalValues);
    }
     
    public PageReference selectclick(){
        rightselected.clear();
        for(String s : leftselected){
            leftvalues.remove(s);
            rightvalues.add(s);
        }
        return null;
    }
     
    public PageReference unselectclick(){
        leftselected.clear();
        for(String s : rightselected){
            rightvalues.remove(s);
            leftvalues.add(s);
        }
        return null;
    }
    
    public PageReference selectclick1(){    
        //rightselected.clear(); 
        List<String> lstnew = new List<String>(); 
        List<String> rightVal = new List<String>();        
        Set<String> TmpSet = new Set<String>();
        TmpSet.addAll(rightselected);
        rightVal.addAll(rightvalues);
        rightvalues.clear();    
        lstnew.addAll(rightVal);  
        for(Integer i=0;i<rightVal.size();i++){
            if(TmpSet.contains(rightVal[i])){
                if(i-1>=0){
                    lstnew.add(i-1,rightVal[i]);
                } 
            }else{    
                lstnew.add(rightVal[i]);
            }    
        }        
        rightvalues.addAll(lstnew);
        return null;
    }
    
    public PageReference selectclick2(){ 
        List<String> lstnew = new List<String>(); 
        List<String> rightVal = new List<String>();        
        Set<String> TmpSet = new Set<String>();
        TmpSet.addAll(rightselected);
        rightVal.addAll(rightvalues);
        rightvalues.clear();  
        lstnew.addAll(rightVal); 
        for(Integer i=0;i<rightVal.size();i++){
            if(!TmpSet.contains(rightVal[i])){
                 lstnew.add(rightVal[i]);
            }else{                
                 if(i+1<rightVal.size())
                     lstnew.add(i,rightVal[i+1]);
                 i++;
                 lstnew.add(i,rightVal[i-1]);
            }    
        }
        rightvalues.addAll(lstnew);
        return null;
    }
 
    public List<SelectOption> getunSelectedValues(){
        List<SelectOption> options = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(leftvalues);
        //tempList.sort();
        for(string s : tempList)
            options.add(new SelectOption(s,s));
        return options;
    }
 
    public List<SelectOption> getSelectedValues(){
        List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(rightvalues);
        //tempList.sort();
        for(String s : tempList)
            options1.add(new SelectOption(s,s));
        return options1;
    }
        
}