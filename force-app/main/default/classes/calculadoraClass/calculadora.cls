public with sharing class calculadora {
    public calculadora(Double num1, Double num2) {
        Double x = num1+num2; 
        Double y = num2-num1;
        Double z = num1*num2;
        Double w = num2/num1;
        Double H = (num1+(num1*num1)-num2)/2; 
        Double numeroFinal=H+x-y*z/w; 
        System.debug(numeroFinal);

    }
}