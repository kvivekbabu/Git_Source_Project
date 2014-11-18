public class WebserviceCalling{

  public string FC {get;set;}
  public string CF {get;set;}
  
  public string FCResult{get;set;}
  public string CFResult{get;set;}
  
  
  public void getFCResluts(){
   
      wwwW3schoolsComWebservices.TempConvertSoap objFC = new wwwW3schoolsComWebservices.TempConvertSoap();
       System.debug('checkingFC'+ FC);
       if((FC !=null && FC !='') && (CF !=null && CF!='')){
         FCResult = objFC.FahrenheitToCelsius(FC);      
         CFResult = objFC.CelsiusToFahrenheit(CF);         
       }else if(FC!=null && FC!=''){
         FCResult = objFC.FahrenheitToCelsius(FC);             
       }else if(CF!=null && CF!='') {
         CFResult = objFC.CelsiusToFahrenheit(CF);         
       }
  }
  
  public void getClearAll(){
        
        FC ='';
        CF ='';
        FCResult ='';
        CFResult ='';
  
  }




}