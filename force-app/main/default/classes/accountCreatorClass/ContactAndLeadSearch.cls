public with sharing class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads( String searchword) 
        {
            String searchQuery = 'FIND \'' + searchword + '\' IN ALL FIELDS RETURNING Lead(FirstName,LastName ), Contact(FirstName,LastName )';
            List<List<sObject>> searchConLead = search.query(searchQuery);
            return searchConLead;
        
            
        }
 
        
}