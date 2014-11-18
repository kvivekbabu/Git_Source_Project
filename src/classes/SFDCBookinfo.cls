public class SFDCBookinfo {


public static void applyDiscount(Book__c[] book){

   for(Book__c objbook: book){
    
      objbook.price__c *= 0.9;
     
   }


}


}