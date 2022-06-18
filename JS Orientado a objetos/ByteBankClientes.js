  // Criando classes de clientes para Byte bank.

 class Cliente{
    nome
    cpf
  }

class contaCorente{
    agencia
    saldo
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
let valorSacado = 50

if (contaCorenteMatheus.saldo>valorSacado){
    contaCorenteMatheus.saldo -= valorSacado
    console.log(`Novo saldo em conta: R$ ${contaCorenteMatheus.saldo}`)
    console.log(`Valor do saque: R$ ${valorSacado}.`)
}else {
    console.log(`Voce nao possui em conta o valor solicitado!\n Saldo em conta: R$ ${contaCorenteMatheus.saldo}`)
}



console.log(cliente1)
console.log(contaCorenteMatheus.saldo)







