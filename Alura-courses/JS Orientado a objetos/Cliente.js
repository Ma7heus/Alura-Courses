// clase de clientes do Byte bank

export class Cliente {
    _nome
    _cpf

    // usamos contrutores quando queremos criar um objeto e nao queremos permitir que os valores dos 
    // estados seja alterados.

    constructor (nome,cpf) {
        this._nome = nome
        this._cpf = cpf
    }
    
    get cpf() {
        return this._cpf
    }
    
    get nome(){
       return this._nome
    }
}


