public with sharing class StringArrayTest {     
    public static List<String> generateStringArray(Integer linhasNum){
        
        List<String> Tests = new List<String>();

        for (Integer i = 0; i < linhasNum; i++) {
        Tests.add('Test '+ i);
        }
        
        return Tests;
    }


}