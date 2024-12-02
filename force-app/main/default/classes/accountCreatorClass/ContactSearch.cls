public with sharing class ContactSearch {

    public static List<Contact> searchForContacts(String nome, String PostalCode){
    List<Contact> cts = new List<Contact>();
    cts =[SELECT id, Name FROM Contact WHERE LastName = :nome AND MailingPostalCode = :PostalCode];
    
    return cts;
    }


    public static List<Alocacao__c> getNewRecord( Funcionario__r.Name VariavelX, String VariavelY){
        
        String query = 'SELECT Allocation__c, Data_inicio_alocacao__c, Data_fim_alocacao__c, Funcionario__c, Funcionario__r.Name, Projeto__r.Name FROM Alocacao__c';
        String ultimosCaracteres;

            if (Allocation__c != null || Data_inicio_alocacao__c != null || Data_fim_alocacao__c != null || Funcionario__c != null || Funcionario__r.Name != null || Projeto__r.Name != null) {
                query += ' WHERE \'';

                if (AllocacaoId != null) {
                    query += 'Allocation__c = \'' + AllocacaoId + '\'';
                }
                if (funcionarioId != null) {
                    ultimosCaracteres = query.substring(query.length() - 9); // Obtém os últimos 5 caracteres
                    if (ultimosCaracteres != ' WHERE \'') { 
                        query += ' && \'';}
                query += 'Funcionario__c = \'' + funcionarioId + '\'';
                }
                if (Funcionario__r.Name != null) {
                    ultimosCaracteres = query.substring(query.length() - 9); // Obtém os últimos 5 caracteres
                    if (ultimosCaracteres != ' WHERE \'') { 
                        query += ' && \'';}
                    query += 'Funcionario__r.Name = \'' + funcionarioNome + '\'';
                }
                if (Projeto__r.Name != null) {
                    ultimosCaracteres = query.substring(query.length() - 9); // Obtém os últimos 5 caracteres
                    if (ultimosCaracteres != ' WHERE \'') {
                        query += ' && \'';}
                    query += 'Projeto__r.Name = \'' + projetoNome + '\'';
                }
            }
            return Database.query(query);
        }
    }


    // public with sharing class SelectorPerfilAlocacao {
    
    //     @AuraEnabled(cacheable = true)
    //     public static List<Alocacao__c> getRecords() {List<Alocacao__c> records = new List<Alocacao__c>();
    //             return [SELECT Allocation__c,
    //             Data_inicio_alocacao__c,
    //             Data_fim_alocacao__c,
    //             Funcionario__c,
    //             Funcionario__r.Name,
    //             Projeto__r.Name FROM Alocacao__c];
    //     }
    // }
    // @wire(getNewRecord)
    // detalhesFuncionario({ data, error }) {

    //   if (data) {
    //     this.dados_de_funcionarios(data);
    //   }
    //   if (error) {
    //     console.log(
    //       "Ocorreu um erro ao processar essa solicitação , verifique e tente novamente erro no apex" +
    //       error
    //     );
    //   }
    // }
