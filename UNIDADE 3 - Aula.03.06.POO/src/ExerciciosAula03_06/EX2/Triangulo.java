package ExerciciosAula03_06.EX2;

//Crie uma classe Triangulo com três atributos: lado1, lado2 e lado3. Crie um construtor que inicialize esses atributos
// e um método validarTriangulo que lance uma exceção
// IllegalArgumentException caso os valores informados não formem um triângulo válido (por exemplo, se a soma de dois lados for menor ou igual ao terceiro lado).

 class MinhaExcecao extends Exception {

    public MinhaExcecao(){

        super();
    }
    public MinhaExcecao(String msg) {

        super(msg);
    }
}

public class Triangulo {
    private int lado1, lado2, lado3;

    public Triangulo(int lado1, int lado2, int lado3) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }

    public void validarTriangulo() throws MinhaExcecao {
        if (lado1 + lado2 >= lado3) {
            throw new MinhaExcecao("triangulo invalido, soma dos lados é maior ou igual ao lado restante");
        }
        else {
            System.out.println("triangulo verificado, e confirmado ! ");
        }


    }
}
