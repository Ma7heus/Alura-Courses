class contaCorrente {
    agencia
    #saldo = 0

    // sacar nada mais edo que o metodo do objeto contaCorrenteMatheus

    sacar(valor){
        if (this.#saldo>valor) {
            this.#saldo -= valor
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