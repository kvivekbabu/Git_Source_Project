public with sharing class FileUploader {
	
	public string nameFile{get;set;}
    public Blob contentFile{get;set;}
    String[] filelines = new String[]{};
    List<Opportunity> accstoupload;
    list<Opportunity> opptytoupload= new list<Opportunity>();
    set<string> singleName = new set<string>();
    
    public Pagereference ReadFile()
    {
        nameFile=contentFile.toString();
        filelines = nameFile.split('\n');
        accstoupload = new List<Opportunity>();
        
        for(Integer i=1;i<filelines.size();i++){
        	String[] inputvalues = new String[]{};
        	inputvalues = filelines[i].split(',');
        	singleName.add(inputvalues[0]);
        }
        
        system.debug('singleNamesingleName'+singleName);
        map<string,Id> getopptyid = new map<string,Id>();
        for(Opportunity objlist:[select id,Product_ID__c from Opportunity where Product_ID__c in:singleName]){
           getopptyid.put(objlist.Product_ID__c,objlist.Id);
        }         
           
        system.debug('accstouploadcheckinnggg'+accstoupload); 
                     
        for (Integer i=1;i<filelines.size();i++)
        {
            String[] inputvalues = new String[]{};
            inputvalues = filelines[i].split(',');
            
            Opportunity newactualvalue = new Opportunity();
            newactualvalue.id = getopptyid.get(inputvalues[0]);
            system.debug('inputvalues[1]'+inputvalues[1]);
            string actualvalue = inputvalues[1].trim();
            newactualvalue.Actual_Revenue__c = decimal.valueOf(actualvalue);
            opptytoupload.add(newactualvalue);   
        }
        try{
        update opptytoupload;
        }
        catch (Exception e)
        {
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. Please check the template or try again later');
            ApexPages.addMessage(errormsg);
        }    
        return null;
    }
    
    public List<Opportunity> getuploadedAccounts()
    {
        if (opptytoupload!= NULL)
            if (opptytoupload.size() > 0)
                return opptytoupload;
            else
                return null;                    
        else
            return null;
    }            

}