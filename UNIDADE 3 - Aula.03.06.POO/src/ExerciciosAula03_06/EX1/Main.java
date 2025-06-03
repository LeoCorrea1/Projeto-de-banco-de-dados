package ExerciciosAula03_06.EX1;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Pessoa p = new Pessoa("LEONARDO",19,"masculino");
        Scanner sc = new Scanner(System.in);

        System.out.println("confirme sua idade : ");
        int idade = sc.nextInt();

        try {
            p.ValidadarIdade(idade);
        }catch (MinhaExcecao e) {
            System.out.println(e.getMessage());
        }
    }
}
