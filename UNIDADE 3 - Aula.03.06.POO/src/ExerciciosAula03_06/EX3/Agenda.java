package ExerciciosAula03_06.EX3;

//Crie uma classe Agenda com um método
//adicionarContato que receba o nome e o telefone de um contato e
//lance uma exceção IllegalArgumentException caso o nome ou o telefone sejam nulos ou vazios.

class MinhaExcecao extends RuntimeException {

    public MinhaExcecao() {
        super();
    }

    public MinhaExcecao(String message) {
        super(message);
    }
}

public class Agenda {
    public void adicionarContato(String nome, String telefone, String email) {
        if(telefone == null || nome == null || telefone == " " || nome == " "){
            throw new MinhaExcecao("nome ou telefone nulos ou vazios ! impossivel prosseguir");
        }
        else {
            System.out.println("Contato adicionado com sucesso!");
            System.out.println("Nome: " + nome);
            System.out.println("Telefone: " + telefone);
            System.out.println("Email: " + email);
        }
        }
}

