@IsTest
public class LeadProcessorTest {
    @IsTest
    static void testLeadProcessor() {
        Test.startTest();

        List<Lead> testLeads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead lead = new Lead();
            lead.FirstName = 'Test';
            lead.LastName = 'Lead ' + i;
            testLeads.add(lead);
        }
        insert testLeads;
        
        LeadProcessor batch = new LeadProcessor();
        Database.executeBatch(batch);
        
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size());
        Test.stopTest();

    }
}