package QuestaoQuadro;

class MinhaExcecao extends Exception {
    public MinhaExcecao() {
        super();
    }

    public MinhaExcecao(String msg) {
        super(msg);
    }
}

public abstract class Conta {
    protected double saldo;
    protected double limite;

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public double getLimite() {
        return limite;
    }

    public void setLimite(double limite) {
        this.limite = limite;
    }

    public abstract void depositar(double valor) throws MinhaExcecao;

    public abstract void sacar(double valor) throws MinhaExcecao;
}

class ContaCorrente extends Conta {

    public void depositar(double valor) throws MinhaExcecao {
        if (valor <= 0) {
            throw new MinhaExcecao("Valor do depósito deve ser positivo.");
        }
        setSaldo(getSaldo() + valor);
    }


    public void sacar(double valor) throws MinhaExcecao {
        if (valor <= 0) {
            throw new MinhaExcecao("Valor do saque deve ser positivo.");
        }
        if (valor > getSaldo() + getLimite()) {
            throw new MinhaExcecao("Saldo insuficiente para o saque.");
        }
        setSaldo(getSaldo() - valor);
    }
}

class Main {
    public static void main(String[] args) {
        ContaCorrente conta = new ContaCorrente();
        conta.setSaldo(1000);
        conta.setLimite(500);

        try {
            conta.depositar(-5);
            conta.sacar(2000);
            System.out.println("Saldo final: " + conta.getSaldo());
            System.out.println("Limite: " + conta.getLimite());
        } catch (MinhaExcecao e) {
            System.out.println("Erro: " + e.getMessage());
        }

        try {
            conta.depositar(10000);
        } catch (MinhaExcecao e) {
            throw new RuntimeException(e);
        }
    }
}
