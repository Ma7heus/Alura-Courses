import {Cliente} from "./Cliente.js"
import {contaCorrente} from "./contaCorrente.js"

// objetos com dados do cliente
const cliente1 = new Cliente()
cliente1.nome = "Matheus"
cliente1.cpf = 12156879536

const cliente2 = new Cliente()
cliente2.nome = "Amanda"
cliente2.cpf = 1316541651684

// objeto com dados da conta do cliente
const contaCorenteMatheus = new contaCorrente()
contaCorenteMatheus.agencia = 1001
contaCorenteMatheus.Cliente = cliente1

const contaCorenteAmanda = new contaCorrente()
contaCorenteAmanda.agencia = 1002
contaCorenteAmanda.Cliente = cliente2

contaCorenteMatheus.depositar(100)
console.log(contaCorenteMatheus)

contaCorenteMatheus.tranferir(1000,contaCorenteAmanda)
console.log(contaCorenteMatheus)
console.log(contaCorenteAmanda)

