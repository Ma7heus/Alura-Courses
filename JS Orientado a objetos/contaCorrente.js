export class contaCorrente {
    agencia
    _saldo = 0

    // sacar nada mais edo que o metodo do objeto contaCorrenteMatheus

    sacar(valor){
        if (this._saldo>valor) {
            this._saldo -= valor
        }else {
            console.log(`Voce nao possui saldo em conta o valor solicitado!\n Saldo em conta: R$ ${this._saldo}`)
        }
    }

    mostraSaldo() {
        console.log(this._saldo)
    }

    //depositar valor na conta do cleinte

    depositar(valor) {
        if (valor >0) {
            this._saldo += valor
        }
    }

}