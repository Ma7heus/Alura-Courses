import { Cliente } from "./Cliente.js";
export class contaCorrente {
    agencia
    _Cliente

    //separando os atributoS publicos dos privados
    _saldo = 0

    // Ao inves de usarmosum metodo para pegar e atribuir cliente,
    // vamos estar usando os "metodos acessores", ou tmabem, "getters and setters".
    set cliente(novoValor) {
        if (novoValor instanceof Cliente){
            this._Cliente = novoValor
        }
    }    

    get cliente() {
        return this._Cliente
    }

    get saldo() {
        return this._saldo
    }

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