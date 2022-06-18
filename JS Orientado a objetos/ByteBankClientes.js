// Criando classes de clientes para Byte bank.

class Cliente {
    nome
    cpf
}

class contaCorente {
    agencia
    saldo

    // sacar nada mais edo que o metodo do objeto 

    sacar(valor){
        if (this.saldo>valor) {
            this.saldo -= valor
            console.log(`Novo saldo em conta: R$ ${this.saldo}`)
            console.log(`Valor do saque: R$ ${valor}.`)
        }else {
            console.log(`Voce nao possui em conta o valor solicitado!\n Saldo em conta: R$ ${this.saldo}`)
        }
    }

}

// obejto com dados do cliente
const cliente1 = new Cliente()
cliente1.nome = "Matheus"
cliente1.cpf = 12156879536

// objeto com dados da conta do cliente
const contaCorenteMatheus = new contaCorente()
contaCorenteMatheus.agencia = 1001
contaCorenteMatheus.saldo = 0

//Fazendo deposito na conta
contaCorenteMatheus.saldo = 100

//Realizando saque
let valor = 50




console.log(cliente1)
console.log(contaCorenteMatheus.saldo)







