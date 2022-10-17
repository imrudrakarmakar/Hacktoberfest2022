public with sharing class ShowContact {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> fetchContact( Id conId){
        try {
            List<Contact> conlist =[Select Name,Email,Phone from Contact where Id=:conId];
            if(conlist.size()> 0 && !conlist.isEmpty()){
            return conlist;
            }
            return null;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }


    @AuraEnabled
    public static Account saveAccount(Account obj){
        try {
            insert obj;
            return obj;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

/*
    @AuraEnabled
    public static string createAccount(String Name,String phone,String Rating){
        try {
            Account acc= new Account();
            acc.Name=Name;
            acc.Phone=phone;
            acc.Rating=Rating;
            insert acc;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
*/

}
