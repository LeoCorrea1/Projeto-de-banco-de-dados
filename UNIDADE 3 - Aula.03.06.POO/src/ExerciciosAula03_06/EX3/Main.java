package ExerciciosAula03_06.EX3;

public class Main {
    public static void main(String[] args) {
        Agenda agenda = new Agenda();

        try {
            agenda.adicionarContato("leonardo ","312321321312 ","dasdadasdsa@dsadasd.com");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }

        System.out.println("\n");
        try {
           agenda.adicionarContato(" "," ","dasdadasdsa@dsadasd.com");

        }catch (MinhaExcecao e) {
            System.out.println(e.getMessage());
        }
    }
}