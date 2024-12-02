public with sharing class AccountHandler {
    public static Account insertNewAccount(String accountNome) {
try {
    Account nome = new Account(Name = accountNome);
    insert nome;
    return nome;
} catch (DmlException e) {
    System.debug('A DML exception has occurred: ' +
                e.getMessage());
    return null;

            }
    }
}