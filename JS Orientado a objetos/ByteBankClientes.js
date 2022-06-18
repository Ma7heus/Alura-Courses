// Criando classes de clientes para Byte Bank.

class Cliente {
    nome
    cpf
}

// ADICONAR UMA HASHTAG (#) ANTES DA VARIAVEL TORNA ELA PRIVADA, APENAS A CLASSE DELA PODE MEXER NO VALOR DA VARIAVEL.
class contaCorrente {
    agencia
    #saldo

    // sacar nada mais edo que o metodo do objeto contaCorrenteMatheus

    sacar(valor){
        if (this.#saldo>valor) {
            this.#saldo -= valor
            console.log(`Novo saldo em conta: R$ ${this.#saldo}`)
            console.log(`Valor do saque: R$ ${valor}.`)
        }else {
            console.log(`Voce nao possui saldo em conta o valor solicitado!\n Saldo em conta: R$ ${this.#saldo}`)
        }
    }

    depositar(valor) {
        if (valor >0) {
            this.#saldo += valor
        }
    }

}

// obejto com dados do cliente
const cliente1 = new Cliente()
cliente1.nome = "Matheus"
cliente1.cpf = 12156879536

// objeto com dados da conta do cliente
const contaCorenteMatheus = new contaCorrente()
contaCorenteMatheus.agencia = 1001

//Fazendo deposito na conta
contaCorenteMatheus.depositar(100)

//Realizando saque
contaCorenteMatheus.sacar(50)




console.log(cliente1)








