package Excecoes;

import java.io.IOException;
import java.util.Scanner;

public class Principal {
    public static void main(String[] args) throws MinhaExcecao {
        Scanner sc = new Scanner(System.in);
        double n1 ,n2 ;
        System.out.println("Digite dois numeros inteiros: ");
        n1 = sc.nextDouble();
        n2 = sc.nextDouble();
        divide(n1,n2);
    }


public static void divide(double n1, double n2) throws MinhaExcecao {
    if ( n2 == 0 ){
        throw new MinhaExcecao("impossivel realizar divisao por 0" );
    }
    else {
        System.out.println("o resultado da divisao eh : " +n1/n2);
    }
}



}
