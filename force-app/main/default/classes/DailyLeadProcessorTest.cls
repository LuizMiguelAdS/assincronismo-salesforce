@IsTest
public class DailyLeadProcessorTest {
    @IsTest
    static void testDailyLeadProcessor() {
        
        Test.startTest();

        List<Lead> testLeads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead lead = new Lead();
            lead.FirstName = 'Test';
            lead.LastName = 'Lead ' + i;
            lead.Company = 'Test Company ' + i; 
            testLeads.add(lead);
        }
        insert testLeads;
        
        
        String cronExpression = '0 0 0 * * ?'; 
        System.schedule('Daily Lead Processor', cronExpression, new DailyLeadProcessor());
        
        
        
        
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size());
        Test.stopTest();

    }
}