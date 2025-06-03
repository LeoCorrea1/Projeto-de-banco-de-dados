package ExerciciosAula03_06.EX2;

public class Main {
    public static void main(String[] args) {
        Triangulo t = new Triangulo(3, 1, 9);

        try {
            t.validarTriangulo();
        } catch (MinhaExcecao e) {
            System.out.println(e.getMessage());
        }
    }
}