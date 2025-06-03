package ExerciciosAula03_06.EX1;

//Use uma classe Pessoa crie um construtor que inicialize esses atributos e um
// método validarIdade que lance uma exceção caso a idade informada seja menor que zero ou maior que 120.

public class Pessoa {
    private String nome;
    private int idade;
    private String sexo;

    public Pessoa(String nome, int idade, String sexo) {
        this.nome = nome;
        this.idade = idade;
        this.sexo = sexo;
    }

    public int getIdade() {
        return idade;
    }


    public void ValidadarIdade(int idade) throws MinhaExcecao {
        if (idade != getIdade() || idade > 120) {
            throw new MinhaExcecao("Idade nao confirmada, valor nao esta de acordo com 1 primeira informada");
        }
        else {
            System.out.println("idade confirmada !! ");
        }
    }


}
