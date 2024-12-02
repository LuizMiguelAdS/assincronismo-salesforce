public class LeadProcessor implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id, LeadSource FROM Lead';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<sObject> scope) {
        List<Lead> leadsToUpdate = new List<Lead>();
        
        for (sObject record : scope) {
            Lead lead = (Lead)record;
            lead.LeadSource = 'Dreamforce';
            leadsToUpdate.add(lead);
        }
        
        update leadsToUpdate;
    }
    
    public void finish(Database.BatchableContext bc) {
    }
}