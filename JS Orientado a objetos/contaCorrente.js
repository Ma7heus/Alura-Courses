export class contaCorrente {
    agencia
    Cliente

    //separando os atributoS publicos dos privados
    _saldo = 0

    // sacar nada mais e do que o metodo do objeto contaCorrenteMatheus

    sacar(valor){
        if (this._saldo>=valor) {
            this._saldo -= valor
            return valor
        }else {
            console.log(`Voce nao possui o valor solicitado!\n Saldo em conta: R$ ${this._saldo}`)
        }
    }

    mostraSaldo() {
        console.log(this._saldo)
    }

    //depositar valor na conta do cleinte

    depositar(valor) {
        if (valor >0) {
            this._saldo  += valor
        }
    }

    // transferindo valores entre contas
    tranferir(valor, conta) {
        const valorSacado = this.sacar(valor)
        conta.depositar(valorSacado)
          
        





    }


}