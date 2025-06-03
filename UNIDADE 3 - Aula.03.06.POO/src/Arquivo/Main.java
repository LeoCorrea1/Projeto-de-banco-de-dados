package Arquivo;

import java.io.*;

// Classe Arquivo.Pessoa - Representa uma pessoa
class Pessoa {
    private String nome;
    private int idade;

    // Construtor
    public Pessoa(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    // Getters e Setters
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    // Método para exibir informações da pessoa
    public void exibirInformacoes() {
        System.out.println("Nome: " + nome + ", Idade: " + idade);
    }

    // Método para salvar pessoa no arquivo
    public String salvarNoArquivo() {
        return nome + "," + idade; // Formato CSV: "nome,idade"
    }

    // Método estático para criar uma pessoa a partir de uma linha do arquivo
    public static Pessoa lerDoArquivo(String linha) {
        String[] dados = linha.split(",");
        String nome = dados[0];
        int idade = Integer.parseInt(dados[1]);
        return new Pessoa(nome, idade);
    }
}

// Classe Arquivo.Cadastro - Responsável pelo gerenciamento de pessoas
class Cadastro {
    private Pessoa[] pessoas;
    private int contador;

    // Construtor
    public Cadastro(int capacidade) {
        pessoas = new Pessoa[capacidade];
        contador = 0;
    }

    // Método para cadastrar uma pessoa
    public void cadastrarPessoa(Pessoa pessoa) {
        if (contador < pessoas.length) {
            pessoas[contador] = pessoa;
            contador++;
            System.out.println("Arquivo.Pessoa cadastrada com sucesso!");
        } else {
            System.out.println("Arquivo.Cadastro cheio! Não é possível cadastrar mais pessoas.");
        }
    }

    // Método para exibir todas as pessoas cadastradas
    public void exibirCadastro() {
        if (contador == 0) {
            System.out.println("Nenhuma pessoa cadastrada.");
        } else {
            System.out.println("Arquivo.Cadastro de Pessoas:");
            for (int i = 0; i < contador; i++) {
                pessoas[i].exibirInformacoes();
            }
        }
    }

    // Método para salvar os dados das pessoas no arquivo
    public void salvarCadastroEmArquivo(String nomeArquivo) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(nomeArquivo))) {
            for (int i = 0; i < contador; i++) {
                writer.write(pessoas[i].salvarNoArquivo());
                writer.newLine();
            }
            System.out.println("Arquivo.Cadastro salvo no arquivo " + nomeArquivo);
        } catch (IOException e) {
            System.out.println("Erro ao salvar o arquivo: " + e.getMessage());
        }
    }

    // Método para carregar as pessoas a partir de um arquivo
    public void carregarCadastroDeArquivo(String nomeArquivo) {
        try (BufferedReader reader = new BufferedReader(new FileReader(nomeArquivo))) {
            String linha;
            while ((linha = reader.readLine()) != null) {
                Pessoa pessoa = Pessoa.lerDoArquivo(linha);
                cadastrarPessoa(pessoa);
            }
            System.out.println("Arquivo.Cadastro carregado do arquivo " + nomeArquivo);
        } catch (IOException e) {
            System.out.println("Erro ao carregar o arquivo: " + e.getMessage());
        }
    }
}

// Classe principal com o método main
public class Main {
    public static void main(String[] args) {
        // Criando o cadastro
        Cadastro cadastro = new Cadastro(3);

        // Tentando carregar os dados do arquivo
        cadastro.carregarCadastroDeArquivo("cadastro.txt");

        // Criando algumas pessoas
        Pessoa pessoa1 = new Pessoa("Alice", 30);
        Pessoa pessoa2 = new Pessoa("Bob", 25);
        Pessoa pessoa3 = new Pessoa("Carlos", 40);

        // Cadastrando as pessoas
        cadastro.cadastrarPessoa(pessoa1);
        cadastro.cadastrarPessoa(pessoa2);
        cadastro.cadastrarPessoa(pessoa3);

        // Exibindo as pessoas cadastradas
        cadastro.exibirCadastro();

        // Salvando os dados no arquivo
        cadastro.salvarCadastroEmArquivo("cadastro.txt");
    }
}
