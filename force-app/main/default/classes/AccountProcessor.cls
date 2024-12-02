public with sharing class AccountProcessor {

@future
    public static void countContacts(List<Id> accountIds) { 

      List<Contact> numContacts = [SELECT IndividualId FROM Contact WHERE AccountId = :accountIds WITH SECURITY_ENFORCED];
      List<Account> contas = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id = :accountIds WITH SECURITY_ENFORCED];
      List<Account> contasAtualizadas = new List<Account>();
       Integer numContact = numContacts.size();
       for (Integer i = 0; i < contas.size(); i++) {
         Account conta = contas[i];
        conta.Number_Of_Contacts__c = numContact;
        contasAtualizadas.add(conta);
       }
       try {
        update contasAtualizadas;
        System.debug('Registro inserido com sucesso!');
    }catch (Exception e) {
      System.debug('Erro ao inserir o registro: ' + e.getMessage());
    }  
      List<Account> apresentar = [SELECT Id, Number_Of_Contacts__c FROM Account WITH SECURITY_ENFORCED]; 
    
  }
}