trigger bookDiscount on Book__c (before insert) {

   Book__c[] book = trigger.new;
   
   SFDCBookinfo.applyDiscount(book);

}