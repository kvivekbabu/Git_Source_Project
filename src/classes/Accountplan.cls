global class Accountplan {

 Webservice String area;
 Webservice string region;
 
 global class Plan{
 
   Webservice String name;
   Webservice Integer PlanNumber;
   Webservice Date Planningperiod;
   Webservice Id PlanId; 
 
 }

  Webservice static Plan CreateAccountplan(Plan vPlan){
  
    Account acct = new Account();    
    acct.Name = vPlan.name;
    acct.AccountNumber = String.valueof(vPlan.PlanNumber);
    insert acct;
    
    vPlan.PlanId = acct.id;
    
    return vPlan;  
  }
  


}